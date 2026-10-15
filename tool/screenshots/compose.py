"""Composes the App Store frames from the real screen captures.

Input  (written by render_test.dart):
  <out>/raw/<device>/<locale>/<shot>.png + .json   real app screens
  <out>/text/<device>/<locale>/<slug>.png + .json  headline layers
Output:
  <out>/screenshots/<locale>/<device>/<slug>.png    1320x2868 / 2064x2752 RGB
  <out>/screenshots/<locale>/contact_<locale>.jpg       iPhone set
  <out>/screenshots/<locale>/contact_<locale>_ipad.jpg  iPad set

Nothing is drawn over the app pixels: the screen goes into a plain rounded
frame (no notch, island or status bar), and a breakout is a crop of the same
capture, enlarged over the element it shows.
"""
import argparse
import json
import os
import sys

from PIL import Image, ImageDraw, ImageFilter

BG = (0x14, 0x0C, 0x2E)
LIME = (0xB6, 0xF2, 0x3A)
EDGE = (0x3B, 0x35, 0x52)
BEZEL = (0x07, 0x06, 0x0C)

CANVAS = {"iphone": (1320, 2868), "ipad": (2064, 2752)}
# Real display corner radius in points, and the capture scale.
SCREEN_RADIUS_PT = {"iphone": 55, "ipad": 30}
DPR = {"iphone": 3, "ipad": 2}
TEXT_TOP = {"iphone": 170, "ipad": 150}
# Share of the top safe area (the status bar's place) trimmed off the capture,
# so the frame does not open on an empty band where no status bar is drawn.
SAFE_TRIM = 0.65


def single(shot, breakout=None):
    return {"kind": "single", "shot": shot, "breakout": breakout}


def duo(back, front):
    return {"kind": "duo", "back": back, "front": front}


# The frame plan. First three are the search-result trio.
FRAMES = [
    ("01-potential", {"iphone": single("home", "_PotentialHero"),
                      "ipad": single("home", "_PotentialHero")}),
    ("02-chart", {"iphone": single("progress", "PotentialChart"),
                  "ipad": single("progress", "PotentialChart")}),
    ("03-plan", {"iphone": duo("today", "player"),
                 "ipad": single("today", "_TodayHero")}),
    ("04-score", {"iphone": single("analysis", "_ScoreHero"),
                  "ipad": single("analysis", "_ScoreHero")}),
    ("05-program", {"iphone": single("program", "_JourneyHeader"),
                    "ipad": single("program", "_JourneyHeader")}),
    ("06-nutrition", {"iphone": duo("nutrition", "meals"),
                      "ipad": single("nutrition")}),
    ("07-photos", {"iphone": single("photos"), "ipad": single("photos")}),
    ("08-posture", {"iphone": duo("weekly", "posture"),
                    "ipad": single("posture", "_ScoreCard")}),
]

SS = 2  # supersampling for anti-aliased masks


def rounded_mask(size, radius):
    w, h = size
    big = Image.new("L", (w * SS, h * SS), 0)
    ImageDraw.Draw(big).rounded_rectangle(
        (0, 0, w * SS - 1, h * SS - 1), radius=radius * SS, fill=255)
    return big.resize((w, h), Image.LANCZOS)


def shadow(canvas, box, radius, blur, alpha, offset=(0, 0)):
    x0, y0, x1, y1 = box
    pad = blur * 3
    layer = Image.new("L", (x1 - x0 + 2 * pad, y1 - y0 + 2 * pad), 0)
    ImageDraw.Draw(layer).rounded_rectangle(
        (pad, pad, pad + x1 - x0, pad + y1 - y0), radius=radius, fill=alpha)
    layer = layer.filter(ImageFilter.GaussianBlur(blur))
    black = Image.new("RGB", layer.size, (0, 0, 0))
    canvas.paste(black, (x0 - pad + offset[0], y0 - pad + offset[1]), layer)


def glow(canvas, center, radius, color, alpha):
    """One soft accent behind the hero device, not a gradient wash."""
    cx, cy = center
    size = radius * 2
    layer = Image.new("L", (size, size), 0)
    ImageDraw.Draw(layer).ellipse((size * 0.25, size * 0.25, size * 0.75, size * 0.75), fill=alpha)
    layer = layer.filter(ImageFilter.GaussianBlur(radius * 0.22))
    canvas.paste(Image.new("RGB", layer.size, color), (cx - radius, cy - radius), layer)


class Device:
    """A capture placed in a plain rounded frame."""

    def __init__(self, device, raw, screen_w):
        self.device = device
        self.raw = raw
        self.k = screen_w / raw.width
        self.screen = (screen_w, round(raw.height * self.k))
        self.bezel = round(screen_w * (0.026 if device == "iphone" else 0.022))
        self.radius = SCREEN_RADIUS_PT[device] * DPR[device] * self.k
        self.size = (self.screen[0] + 2 * self.bezel, self.screen[1] + 2 * self.bezel)

    @staticmethod
    def width_for_height(device, raw, height):
        """Screen width whose framed height is [height]."""
        ratio = raw.height / raw.width
        b = 0.026 if device == "iphone" else 0.022
        return int(height / (ratio + 2 * b))

    def paste(self, canvas, x, y, shade=True):
        w, h = self.size
        outer_r = self.radius + self.bezel
        if shade:
            shadow(canvas, (x, y, x + w, y + h), outer_r, 40, 170, (0, 30))
        # Titanium edge, then the black bezel, then the real screen.
        canvas.paste(Image.new("RGB", (w, h), EDGE), (x, y), rounded_mask((w, h), outer_r))
        e = max(3, self.bezel // 6)
        canvas.paste(Image.new("RGB", (w - 2 * e, h - 2 * e), BEZEL), (x + e, y + e),
                     rounded_mask((w - 2 * e, h - 2 * e), outer_r - e))
        screen = self.raw.convert("RGB").resize(self.screen, Image.LANCZOS)
        canvas.paste(screen, (x + self.bezel, y + self.bezel),
                     rounded_mask(self.screen, self.radius))
        self.origin = (x + self.bezel, y + self.bezel)

    def to_canvas(self, px, py):
        return self.origin[0] + px * self.k, self.origin[1] + py * self.k


def breakout(canvas, dev, meta, name, max_w):
    rect = meta.get("focus", {}).get(name)
    if not rect:
        print(f"  ! no focus rect for {name}", file=sys.stderr)
        return
    x0, y0, x1, y1 = [int(round(v)) for v in rect]
    y0 = max(y0, 0)
    y1 = min(y1, dev.raw.height)
    crop = dev.raw.convert("RGB").crop((x0, y0, x1, y1))
    on_device_w = (x1 - x0) * dev.k
    scale = min(1.16, max_w / on_device_w)
    if scale < 1.04:
        # Not enough room to enlarge it visibly; leave the screen alone.
        return
    cw, ch = round((x1 - x0) * dev.k * scale), round((y1 - y0) * dev.k * scale)
    card = crop.resize((cw, ch), Image.LANCZOS)
    # Dim the screen behind the card so the rows it overlaps (cut by its
    # edge) recede instead of reading as clipped text.
    sx, sy = dev.origin
    scrim = rounded_mask(dev.screen, dev.radius).point(lambda v: v * 46 // 100)
    canvas.paste(Image.new("RGB", dev.screen, (4, 2, 12)), (sx, sy), scrim)
    cx, cy = dev.to_canvas((x0 + x1) / 2, (y0 + y1) / 2)
    left, top = round(cx - cw / 2), round(cy - ch / 2)
    radius = 24 * meta["dpr"] * dev.k * scale
    shadow(canvas, (left, top, left + cw, top + ch), radius, 34, 200, (0, 26))
    canvas.paste(card, (left, top), rounded_mask((cw, ch), radius))
    # Hairline edge, as the app's own cards have.
    edge = Image.new("L", (cw * SS, ch * SS), 0)
    ImageDraw.Draw(edge).rounded_rectangle(
        (0, 0, cw * SS - 1, ch * SS - 1), radius=radius * SS, outline=60, width=2 * SS)
    edge = edge.resize((cw, ch), Image.LANCZOS)
    canvas.paste(Image.new("RGB", (cw, ch), (255, 255, 255)), (left, top), edge)


def load_text(out, device, locale, slug):
    path = os.path.join(out, "text", device, locale, slug + ".png")
    layer = Image.open(path).convert("RGBA")
    bbox = layer.getchannel("A").getbbox()
    return layer.crop(bbox) if bbox else layer


def load_raw(out, device, locale, shot):
    base = os.path.join(out, "raw", device, locale, shot)
    img = Image.open(base + ".png")
    with open(base + ".json", encoding="utf-8") as f:
        meta = json.load(f)
    trim = int(meta["safeTop"] * SAFE_TRIM)
    img = img.crop((0, trim, img.width, img.height))
    meta["focus"] = {k: [r[0], r[1] - trim, r[2], r[3] - trim]
                     for k, r in meta.get("focus", {}).items()}
    if meta.get("errors"):
        print(f"  ! {device}/{locale}/{shot} had Flutter errors: {meta['errors']}", file=sys.stderr)
    return img, meta


def compose(out, device, locale, slug, plan):
    W, H = CANVAS[device]
    canvas = Image.new("RGB", (W, H), BG)

    text = load_text(out, device, locale, slug)
    if text.width > W * 0.8 + 2:
        print(f"  ! {device}/{locale}/{slug}: text {text.width}px wider than 80%", file=sys.stderr)
    # Short lime bar: the one brand accent above the words.
    top = TEXT_TOP[device]
    bar_w, bar_h = (110, 14) if device == "iphone" else (150, 18)
    bar = Image.new("RGB", (bar_w, bar_h), LIME)
    canvas.paste(bar, ((W - bar_w) // 2, top), rounded_mask((bar_w, bar_h), bar_h // 2))
    text_top = top + bar_h + (44 if device == "iphone" else 52)
    canvas.paste(text, ((W - text.width) // 2, text_top), text)
    text_bottom = text_top + text.height

    gap = 70 if device == "iphone" else 80
    bottom_margin = 70 if device == "iphone" else 60
    if plan["kind"] == "single":
        raw, meta = load_raw(out, device, locale, plan["shot"])
        avail = H - (text_bottom + gap) - bottom_margin
        sw = min(int(W * (0.74 if device == "iphone" else 0.76)),
                 Device.width_for_height(device, raw, avail))
        dev = Device(device, raw, sw)
        x = (W - dev.size[0]) // 2
        y = H - bottom_margin - dev.size[1]
        glow(canvas, (W // 2, y + dev.size[1] // 3), int(W * 0.62), LIME, 34)
        dev.paste(canvas, x, y)
        if plan.get("breakout"):
            breakout(canvas, dev, meta, plan["breakout"], W * 0.86)
    else:
        back_raw, _ = load_raw(out, device, locale, plan["back"])
        front_raw, _ = load_raw(out, device, locale, plan["front"])
        drop = 230
        avail = H - (text_bottom + gap) - bottom_margin - drop
        sw = min(int(W * 0.66), Device.width_for_height(device, back_raw, avail))
        back = Device(device, back_raw, sw)
        front = Device(device, front_raw, sw)
        margin = int(W * 0.045)
        by = text_bottom + gap
        fy = by + drop
        glow(canvas, (W // 2, by + back.size[1] // 2), int(W * 0.62), LIME, 34)
        back.paste(canvas, margin, by)
        front.paste(canvas, W - margin - front.size[0], fy)

    return canvas


def contact(images, path, cols, thumb_w, label=None):
    tw = thumb_w
    th = round(images[0].height * tw / images[0].width)
    pad = 24
    rows = (len(images) + cols - 1) // cols
    sheet = Image.new("RGB", (cols * (tw + pad) + pad, rows * (th + pad) + pad), (30, 28, 40))
    for i, im in enumerate(images):
        r, c = divmod(i, cols)
        sheet.paste(im.resize((tw, th), Image.LANCZOS), (pad + c * (tw + pad), pad + r * (th + pad)))
    sheet.save(path, quality=88)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--locales", default="en,tr,de,fr,es,it,pt,hi")
    ap.add_argument("--devices", default="iphone,ipad")
    args = ap.parse_args()

    for locale in args.locales.split(","):
        for device in args.devices.split(","):
            frames = []
            for slug, plans in FRAMES:
                img = compose(args.out, device, locale, slug, plans[device])
                assert img.size == CANVAS[device] and img.mode == "RGB"
                dst = os.path.join(args.out, "screenshots", locale, device, slug + ".png")
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                img.save(dst, optimize=True)
                frames.append(img)
            suffix = "" if device == "iphone" else "_" + device
            sheet = os.path.join(args.out, "screenshots", locale, f"contact_{locale}{suffix}.jpg")
            contact(frames, sheet, cols=8 if device == "iphone" else 4,
                    thumb_w=330 if device == "iphone" else 480)
            print(f"{locale} {device}: {len(frames)} frames, {sheet}")


if __name__ == "__main__":
    main()
