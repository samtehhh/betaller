"""Composes the App Store frames from the real screen captures.

Input  (written by render_test.dart):
  <out>/raw/<device>/<locale>/<shot>.png + .json   real app screens
  <out>/text/<device>/<locale>/<slug>.png + .json  headline layers
Output (all RGB, no alpha):
  <out>/screenshots/<locale>/<device>/<slug>.png    one per frame of FRAMES
      iphone 1320x2868, ipad 2064x2752, iphone63 1206x2622 (resized from
      the iphone frames), duo-outer 1398x2034, duo-inner 2007x2853
  <out>/screenshots/<locale>/header.png             3840x1646 product page header
  <out>/screenshots/<locale>/search.png             3840x2560 search result image
  <out>/screenshots/<locale>/contact_<locale>.jpg           iPhone set
  <out>/screenshots/<locale>/contact_<locale>_<device>.jpg  every other set
  <out>/screenshots/contact_header.jpg, contact_header_centre.jpg,
  <out>/screenshots/contact_search.jpg                      all locales

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

CANVAS = {"iphone": (1320, 2868), "ipad": (2064, 2752),
          "duo-outer": (1398, 2034), "duo-inner": (2007, 2853)}
# iPhone 6.3" (1206x2622) has the 6.9" aspect ratio to within a pixel, so
# it is a resize of the iphone frames rather than a layout of its own.
DERIVED = {"iphone63": ("iphone", (1206, 2622))}
# App Store creative assets; both reuse the iphone screens.
CREATIVE = {"header": (3840, 1646), "search": (3840, 2560)}
# Real display corner radius in points, and the capture scale.
SCREEN_RADIUS_PT = {"iphone": 55, "ipad": 30, "duo-outer": 44, "duo-inner": 30}
DPR = {"iphone": 3, "ipad": 2, "duo-outer": 3, "duo-inner": 3}
# Frame bezel as a share of the screen width.
BEZEL_K = {"iphone": 0.026, "ipad": 0.022, "duo-outer": 0.024, "duo-inner": 0.02}
TEXT_TOP = {"iphone": 170, "ipad": 150, "duo-outer": 130, "duo-inner": 150}
# Lime bar above the headline: width, height, space below it.
BAR = {"iphone": (110, 14, 44), "ipad": (150, 18, 52),
       "duo-outer": (104, 13, 38), "duo-inner": (140, 17, 48)}
# Space between the text and the device, and below the device.
GAP = {"iphone": 70, "ipad": 80, "duo-outer": 60, "duo-inner": 76}
BOTTOM = {"iphone": 70, "ipad": 60, "duo-outer": 60, "duo-inner": 70}
# Largest share of the canvas width a single screen may take.
SINGLE_W = {"iphone": 0.74, "ipad": 0.76, "duo-outer": 0.74, "duo-inner": 0.76}
# Screen width of a big() frame, as a share of the canvas width.
BIG_W = {"iphone": 0.88, "ipad": 0.84, "duo-outer": 0.86, "duo-inner": 0.84}
# Share of the top safe area (the status bar's place) trimmed off the capture,
# so the frame does not open on an empty band where no status bar is drawn.
SAFE_TRIM = 0.65
# Extra points around a breakout crop, per focus widget.
BREAKOUT_PAD_PT = {"PotentialChart": 16}
# Devices whose breakout cards grow downward from the element's top edge.
BREAKOUT_GROW_DOWN = {"duo-outer", "duo-inner"}


def single(shot, breakout=None):
    return {"kind": "single", "shot": shot, "breakout": breakout}


def duo(back, front):
    return {"kind": "duo", "back": back, "front": front}


def big(shot, breakout=None):
    """One phone much wider than [single] allows, running off the bottom
    edge: the top of the screen at a size that stays readable in the store's
    small thumbnails."""
    return {"kind": "big", "shot": shot, "breakout": breakout}


# The frame plan. First three are the search-result trio. The duo sets
# take the iPad plan (one screen per frame): their displays are wide in
# proportion, and two phones side by side would leave each one tiny.
PLAN_FROM = {"duo-outer": "ipad", "duo-inner": "ipad"}
FRAMES = [
    ("01-potential", {"iphone": big("home", "_PotentialHero"),
                      "ipad": single("home", "_PotentialHero")}),
    ("02-day", {"iphone": big("day"),
                "ipad": single("day")}),
    ("03-targets", {"iphone": big("nutrition", "NutritionTargetsHeader"),
                    "ipad": single("nutrition", "NutritionTargetsHeader")}),
    ("04-chart", {"iphone": big("progress", "PotentialChart"),
                  "ipad": single("progress", "PotentialChart")}),
    ("05-plan", {"iphone": duo("today", "player"),
                 "ipad": single("today", "_TodayHero")}),
    ("06-score", {"iphone": big("analysis", "_ScoreHero"),
                  "ipad": single("analysis", "_ScoreHero")}),
    ("07-program", {"iphone": big("program", "_JourneyHeader"),
                    "ipad": single("program", "_JourneyHeader")}),
    ("08-meals", {"iphone": duo("nutrition", "meals"),
                  "ipad": single("meals", "MealCard")}),
    ("09-posture", {"iphone": duo("weekly", "posture"),
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
        self.bezel = round(screen_w * BEZEL_K[device])
        self.radius = SCREEN_RADIUS_PT[device] * DPR[device] * self.k
        self.size = (self.screen[0] + 2 * self.bezel, self.screen[1] + 2 * self.bezel)

    @staticmethod
    def width_for_height(device, raw, height):
        """Screen width whose framed height is [height]."""
        ratio = raw.height / raw.width
        return int(height / (ratio + 2 * BEZEL_K[device]))

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

    def layer(self):
        """The framed device alone as RGBA, for placing it rotated."""
        w, h = self.size
        rgb = Image.new("RGB", (w, h), BG)
        self.paste(rgb, 0, 0, shade=False)
        img = Image.new("RGBA", (w, h), (0, 0, 0, 0))
        img.paste(rgb, (0, 0), rounded_mask((w, h), self.radius + self.bezel))
        return img

    def to_canvas(self, px, py):
        return self.origin[0] + px * self.k, self.origin[1] + py * self.k


def breakout(canvas, dev, meta, name, max_w, grow_down=False):
    rect = meta.get("focus", {}).get(name)
    if not rect:
        print(f"  ! no focus rect for {name}", file=sys.stderr)
        return
    # A chart paints its axis labels outside its own box, so it gets a margin.
    pad = int(BREAKOUT_PAD_PT.get(name, 0) * meta["dpr"])
    x0, y0, x1, y1 = [int(round(v)) for v in rect]
    x0, x1 = max(x0 - pad, 0), min(x1 + pad, dev.raw.width)
    y0, y1 = max(y0 - pad, 0), min(y1 + pad, dev.raw.height)
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
    # On the short duo displays a card right under a title would grow over
    # it and cut the title's letters; there it grows downward instead. A
    # card that opens at the top of the screen keeps growing both ways.
    if (grow_down or dev.device in BREAKOUT_GROW_DOWN) and y0 > 30 * meta["dpr"]:
        down = round(dev.to_canvas(0, y0)[1])
        if down + ch <= dev.origin[1] + dev.screen[1] - 20:
            top = down
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


def headline(canvas, text, top, bar):
    """The short lime bar (the one brand accent), then the text layer, both
    centred. Returns the bottom edge of the text."""
    W = canvas.width
    bar_w, bar_h, below = bar
    canvas.paste(Image.new("RGB", (bar_w, bar_h), LIME), ((W - bar_w) // 2, top),
                 rounded_mask((bar_w, bar_h), bar_h // 2))
    text_top = top + bar_h + below
    canvas.paste(text, ((W - text.width) // 2, text_top), text)
    return text_top + text.height


def check_text(text, limit, label):
    if text.width > limit + 2:
        print(f"  ! {label}: text {text.width}px wider than {limit:.0f}px", file=sys.stderr)


def compose(out, device, locale, slug, plan):
    W, H = CANVAS[device]
    canvas = Image.new("RGB", (W, H), BG)

    text = load_text(out, device, locale, slug)
    check_text(text, W * 0.8, f"{device}/{locale}/{slug}")
    text_bottom = headline(canvas, text, TEXT_TOP[device], BAR[device])

    gap = GAP[device]
    bottom_margin = BOTTOM[device]
    if plan["kind"] == "single":
        raw, meta = load_raw(out, device, locale, plan["shot"])
        avail = H - (text_bottom + gap) - bottom_margin
        sw = min(int(W * SINGLE_W[device]),
                 Device.width_for_height(device, raw, avail))
        dev = Device(device, raw, sw)
        x = (W - dev.size[0]) // 2
        y = H - bottom_margin - dev.size[1]
        glow(canvas, (W // 2, y + dev.size[1] // 3), int(W * 0.62), LIME, 34)
        dev.paste(canvas, x, y)
        if plan.get("breakout"):
            breakout(canvas, dev, meta, plan["breakout"], W * 0.86)
    elif plan["kind"] == "big":
        raw, meta = load_raw(out, device, locale, plan["shot"])
        dev = Device(device, raw, int(W * BIG_W[device]))
        x = (W - dev.size[0]) // 2
        y = text_bottom + gap
        glow(canvas, (W // 2, y + (H - y) // 2), int(W * 0.62), LIME, 34)
        dev.paste(canvas, x, y)
        if plan.get("breakout"):
            # Grows down from the card's top, so the tabs above stay whole.
            breakout(canvas, dev, meta, plan["breakout"], W * 0.96, grow_down=True)
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


def derive(img, size):
    """Resizes a frame to a slot of (almost) the same aspect ratio: scaled to
    the slot's height, then the few px of background left over cropped from
    the sides or padded, never stretched."""
    tw, th = size
    w = round(img.width * th / img.height)
    assert abs(w - tw) <= 4, f"aspect too far from {size}: {w}x{th}"
    scaled = img.resize((w, th), Image.LANCZOS)
    if w >= tw:
        x = (w - tw) // 2
        return scaled.crop((x, 0, x + tw, th))
    canvas = Image.new("RGB", (tw, th), BG)
    canvas.paste(scaled, ((tw - w) // 2, 0))
    return canvas


def place_rotated(canvas, dev, center, angle):
    """Pastes a framed device turned by [angle] degrees (counter-clockwise),
    centred on [center], with its drop shadow."""
    layer = dev.layer().rotate(angle, resample=Image.BICUBIC, expand=True)
    alpha = layer.getchannel("A")
    x, y = round(center[0] - layer.width / 2), round(center[1] - layer.height / 2)
    blur, pad = 40, 120
    sh = Image.new("L", (layer.width + 2 * pad, layer.height + 2 * pad), 0)
    sh.paste(alpha.point(lambda v: v * 170 // 255), (pad, pad))
    sh = sh.filter(ImageFilter.GaussianBlur(blur))
    canvas.paste(Image.new("RGB", sh.size, (0, 0, 0)), (x - pad, y - pad + 30), sh)
    canvas.paste(layer.convert("RGB"), (x, y), alpha)


def compose_header(out, locale):
    """Product page header, 21:9. Everything that matters sits in the centre
    half of the width, the part every crop of it keeps: the headline, and
    three real screens fanned around the middle (potential in front, the
    chart and the workout player behind it), running off the bottom edge."""
    W, H = CREATIVE["header"]
    canvas = Image.new("RGB", (W, H), BG)
    text = load_text(out, "header", locale, "header")
    check_text(text, W * 0.5, f"header/{locale}")
    glow(canvas, (W // 2, int(H * 0.8)), 1700, LIME, 40)
    text_bottom = headline(canvas, text, 92, (130, 16, 40))

    top = text_bottom + 72
    front = Device("iphone", load_raw(out, "iphone", locale, "home")[0], 660)
    sides = [("progress", -1, 7), ("player", 1, -7)]
    for shot, side, angle in sides:
        dev = Device("iphone", load_raw(out, "iphone", locale, shot)[0], 560)
        cx = W // 2 + side * 565
        cy = top + 120 + dev.size[1] // 2
        place_rotated(canvas, dev, (cx, cy), angle)
    front.paste(canvas, (W - front.size[0]) // 2, top)
    return canvas


def compose_search(out, locale):
    """Search result image, 3:2: what the app does in one line, then the
    three screens that show it (potential, chart, today's plan) side by side,
    each with its key card lifted out of the real pixels."""
    W, H = CREATIVE["search"]
    canvas = Image.new("RGB", (W, H), BG)
    text = load_text(out, "search", locale, "search")
    check_text(text, W * 0.88, f"search/{locale}")
    text_bottom = headline(canvas, text, 150, (170, 20, 56))

    shots = [("home", "_PotentialHero"), ("progress", "PotentialChart"),
             ("today", "_TodayHero")]
    raws = [load_raw(out, "iphone", locale, s) for s, _ in shots]
    top, bottom = text_bottom + 110, 100
    sw = min(860, Device.width_for_height("iphone", raws[0][0], H - top - bottom))
    devs = [Device("iphone", raw, sw) for raw, _ in raws]
    step = devs[0].size[0] + 250
    glow(canvas, (W // 2, top + devs[0].size[1] // 2), int(W * 0.5), LIME, 30)
    for i, (dev, (raw, meta), (_, focus)) in enumerate(zip(devs, raws, shots)):
        x = W // 2 + (i - 1) * step - dev.size[0] // 2
        dev.paste(canvas, x, top)
        breakout(canvas, dev, meta, focus, dev.size[0] * 1.16)
    return canvas


def contact(images, path, cols, thumb_w, labels=None):
    tw = thumb_w
    th = round(images[0].height * tw / images[0].width)
    pad = 24
    top = 44 if labels else 0
    rows = (len(images) + cols - 1) // cols
    sheet = Image.new("RGB", (cols * (tw + pad) + pad, rows * (th + pad + top) + pad),
                      (30, 28, 40))
    draw = ImageDraw.Draw(sheet)
    for i, im in enumerate(images):
        r, c = divmod(i, cols)
        x, y = pad + c * (tw + pad), pad + r * (th + pad + top)
        if labels:
            draw.text((x, y), labels[i], fill=(200, 200, 215), font_size=30)
        sheet.paste(im.resize((tw, th), Image.LANCZOS), (x, y + top))
    sheet.save(path, quality=88)


def save(img, size, *parts):
    assert img.size == size and img.mode == "RGB", (parts, img.size, img.mode)
    dst = os.path.join(*parts)
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    img.save(dst, optimize=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--locales", default="en,tr,de,fr,es,it,pt,hi")
    ap.add_argument("--devices", default="iphone,ipad")
    args = ap.parse_args()
    devices = args.devices.split(",")
    unknown = [d for d in devices if d not in CANVAS and d not in DERIVED and d not in CREATIVE]
    if unknown:
        sys.exit(f"unknown devices: {unknown}")
    shots_dir = os.path.join(args.out, "screenshots")
    creatives = {d: [] for d in devices if d in CREATIVE}

    for locale in args.locales.split(","):
        composed = {}

        def frames_for(device):
            if device not in composed:
                composed[device] = [
                    compose(args.out, device, locale, slug,
                            plans[PLAN_FROM.get(device, device)])
                    for slug, plans in FRAMES]
            return composed[device]

        for device in devices:
            if device in CREATIVE:
                img = (compose_header if device == "header" else compose_search)(args.out, locale)
                save(img, CREATIVE[device], shots_dir, locale, device + ".png")
                creatives[device].append((locale, img))
                print(f"{locale} {device}: {os.path.join(shots_dir, locale, device + '.png')}")
                continue
            if device in DERIVED:
                base, size = DERIVED[device]
                frames = [derive(img, size) for img in frames_for(base)]
            else:
                size = CANVAS[device]
                frames = frames_for(device)
            for (slug, _), img in zip(FRAMES, frames):
                save(img, size, shots_dir, locale, device, slug + ".png")
            suffix = "" if device == "iphone" else "_" + device
            sheet = os.path.join(shots_dir, locale, f"contact_{locale}{suffix}.jpg")
            contact(frames, sheet, cols=4 if device == "ipad" else 8,
                    thumb_w=480 if device == "ipad" else 330)
            print(f"{locale} {device}: {len(frames)} frames, {sheet}")

    # One sheet per creative across all locales, plus the header's centre
    # half on its own: what an iPhone crop of it keeps at the least.
    for device, items in creatives.items():
        labels = [loc for loc, _ in items]
        imgs = [img for _, img in items]
        contact(imgs, os.path.join(shots_dir, f"contact_{device}.jpg"), cols=2,
                thumb_w=1400 if device == "header" else 1100, labels=labels)
        if device == "header":
            W, H = CREATIVE["header"]
            centre = [im.crop((W // 4, 0, W - W // 4, H)) for im in imgs]
            contact(centre, os.path.join(shots_dir, "contact_header_centre.jpg"), cols=4,
                    thumb_w=700, labels=[f"{loc} centre 50%" for loc in labels])
        print(f"{device}: contact sheet for {len(items)} locales")


if __name__ == "__main__":
    main()
