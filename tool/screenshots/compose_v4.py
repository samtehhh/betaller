"""App Store frames, fourth design (November 2026): one promise per frame.

Why a new composer: the October set (compose.py) put two small phones in
three of its frames and sat on a near-black canvas, so in search results it
read as a dark blur next to rivals that show one big phone and one sentence.
Here every frame is one short headline set very large, one phone that runs
off the bottom edge, and at most one card of that screen lifted out and
enlarged to the width of the canvas.

  python tool/screenshots/compose_v4.py --out outputs/BeTaller-Magaza-v4
        [--raw DIR] [--locale en] [--style lime,violet] [--only 01,02]

Input   <raw>/raw/iphone/<locale>/<shot>.png + .json  (render_test.dart)
        tool/screenshots/copy_v4.json                 headlines
Output  <out>/taslak/<style>/<locale>/<slug>.png      1320x2868 RGB
        <out>/taslak/<style>/<locale>/_sayfa.jpg      contact sheet

Headlines are drawn here with Pillow, which has no complex-script shaping:
Latin, Cyrillic and CJK only. Hindi, Arabic and Thai need the Flutter text
layers of render_test.dart; this script refuses them.
"""
import argparse
import json
import os
import sys

from PIL import Image, ImageDraw, ImageFont

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import compose as base  # noqa: E402  (Device, masks, shadows, raw loader)

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
FONTS = os.path.join(ROOT, "assets", "fonts")
W, H = 1320, 2868
NEEDS_SHAPING = {"hi", "ar", "th", "he"}

# Two directions on the app's own colours (lib/utils/constants.dart):
# lime 22FF88 is the app's growth colour, violet 8B5CF6 its primary.
STYLES = {
    "lime": {"bg": (0x22, 0xFF, 0x88), "ink": (0x0B, 0x0A, 0x14),
             "sub": (0x0B, 0x3A, 0x22), "pill": (0x0B, 0x0A, 0x14),
             "pill_ink": (0x22, 0xFF, 0x88), "shadow": 120},
    "violet": {"bg": (0x6D, 0x34, 0xEE), "ink": (0xFF, 0xFF, 0xFF),
               "sub": (0xE4, 0xD9, 0xFF), "pill": (0x22, 0xFF, 0x88),
               "pill_ink": (0x0B, 0x0A, 0x14), "shadow": 150},
}

HEAD_MAX, HEAD_MIN = 196, 120
HEAD_BOX = 0.88          # widest headline line, share of the canvas
TRACK = -0.04            # headline letter spacing, em
LINE = 1.17              # headline line height (room for the pill)
TEXT_TOP = 132
SUB_SIZE, SUB_GAP = 56, 44
PHONE_TOP = 872          # top edge of the phone on every frame
DEVICE_GAP = 84          # between the text and the phone
PHONE_W = 0.86           # screen width, share of the canvas
CARD_W = 0.965           # lifted card width, share of the canvas


def font(weight, size):
    return ImageFont.truetype(os.path.join(FONTS, f"Inter-{weight}.ttf"), size)


def advances(text, f, track):
    """Pen positions with kerning (pair length minus the second glyph) and
    tracking, since Pillow cannot letter-space."""
    xs, x = [], 0.0
    for i, ch in enumerate(text):
        xs.append(x)
        nxt = text[i + 1] if i + 1 < len(text) else ""
        adv = f.getlength(ch + nxt) - f.getlength(nxt) if nxt else f.getlength(ch)
        x += adv + track
    return xs, x - track if text else 0


def parse(line):
    """'How tall will you *get?*' -> [(word, marked)], the marked run being
    the words between asterisks."""
    out, marked = [], False
    for part in line.split("*"):
        for w in part.split():
            out.append((w, marked))
        marked = not marked
    return out


def gaps(words, space, size):
    """Space after each word; wider where the pill starts or ends, so its
    padding never touches the neighbouring word."""
    return [space + (size * 0.16 if words[i][1] != words[i + 1][1] else 0)
            for i in range(len(words) - 1)]


def line_width(words, f, track, space):
    size = f.size
    pill = size * 0.14 * sum(1 for i in (0, -1) if words[i][1])
    return (sum(advances(w, f, track)[1] for w, _ in words)
            + sum(gaps(words, space, size)) + pill)


def draw_headline(canvas, lines, style, top, box=None, sizes=None, align="center"):
    """[box] = (left, right) the lines must fit in; [sizes] = (max, min)."""
    left, right = box or (W * (1 - HEAD_BOX) / 2, W * (1 + HEAD_BOX) / 2)
    hi, lo = sizes or (HEAD_MAX, HEAD_MIN)
    parsed = [parse(l) for l in lines]
    size = hi
    while size > lo:
        f = font("Black", size)
        if all(line_width(p, f, TRACK * size, size * 0.24) <= right - left for p in parsed):
            break
        size -= 2
    f = font("Black", size)
    track, space = TRACK * size, size * 0.24
    d = ImageDraw.Draw(canvas)
    asc, desc = f.getmetrics()
    y = top
    for words in parsed:
        lw = line_width(words, f, track, space)
        x = left if align == "left" else (left + right - lw) / 2
        # The marked run gets one pill behind it.
        run = [i for i, (_, m) in enumerate(words) if m]
        xs = []
        cx = x + (size * 0.14 if words[0][1] else 0)
        for (w, _), g in zip(words, gaps(words, space, size) + [0]):
            xs.append(cx)
            cx += advances(w, f, track)[1] + g
        if run:
            x0 = xs[run[0]] - size * 0.14
            x1 = xs[run[-1]] + advances(words[run[-1]][0], f, track)[1] + size * 0.14
            y0 = y + asc * 0.17
            y1 = y + asc + desc * 1.02
            d.rounded_rectangle((x0, y0, x1, y1), radius=size * 0.2, fill=style["pill"])
        for (w, marked), wx in zip(words, xs):
            pos, _ = advances(w, f, track)
            for ch, px in zip(w, pos):
                d.text((wx + px, y), ch, font=f,
                       fill=style["pill_ink"] if marked else style["ink"])
        y += size * LINE
    return round(y + size * 0.06), size


def draw_sub(canvas, text, style, top):
    if not text:
        return top
    f = font("SemiBold", SUB_SIZE)
    d = ImageDraw.Draw(canvas)
    # Balanced into at most two lines inside the headline box.
    words, lines = text.split(), [text]
    if f.getlength(text) > W * HEAD_BOX:
        best = None
        for i in range(1, len(words)):
            a, b = " ".join(words[:i]), " ".join(words[i:])
            wide = max(f.getlength(a), f.getlength(b))
            if best is None or wide < best[0]:
                best = (wide, [a, b])
        lines = best[1]
    y = top
    for l in lines:
        d.text(((W - f.getlength(l)) / 2, y), l, font=f, fill=style["sub"])
        y += SUB_SIZE * 1.26
    return round(y)


def lift(canvas, dev, meta, name, style, pad_pt=0, drop=0, cw=None, cx=None, rise_pt=None):
    """Lifts the focus widget [name] out of the capture and enlarges it to
    CARD_W of the canvas, centred on the place it came from and never above
    the phone's top edge. [rows] = (first, count) joins several stacked hits
    of a list-row widget into one card (their rects come as a list)."""
    rect = meta.get("focus", {}).get(name)
    if not rect:
        print(f"  ! no focus rect for {name}", file=sys.stderr)
        return
    pad = int(pad_pt * meta["dpr"])
    x0, y0, x1, y1 = [int(round(v)) for v in rect]
    x0, x1 = max(x0 - pad, 0), min(x1 + pad, dev.raw.width)
    y0, y1 = max(y0 - pad, 0), min(y1 + pad, dev.raw.height)
    crop = dev.raw.convert("RGB").crop((x0, y0, x1, y1))
    cw = cw or round(W * CARD_W)
    floor = canvas.height
    scale = cw / (x1 - x0)
    ch = round((y1 - y0) * scale)
    if scale > 1.1:
        print(f"  ! {name}: card enlarged {scale:.2f}x over the capture", file=sys.stderr)
    card = crop.resize((cw, ch), Image.LANCZOS)
    sx, sy = dev.origin
    # The lifted element leaves an empty slot behind: its place on the screen
    # is filled with the screen's own background (sampled beside it), so a
    # card that sits a little lower never shows its twin peeking out above.
    hx0, hy0 = dev.to_canvas(x0, y0)
    hx1, hy1 = dev.to_canvas(x1, y1)
    hole = (round(hx1 - hx0), round(hy1 - hy0))
    tone = dev.raw.convert("RGB").getpixel((6, min(y0 + 40, dev.raw.height - 1)))
    canvas.paste(Image.new("RGB", hole, tone), (round(hx0), round(hy0)),
                 base.rounded_mask(hole, 24 * meta["dpr"] * dev.k))
    scrim = base.rounded_mask(dev.screen, dev.radius).point(lambda v: v * 64 // 100)
    canvas.paste(Image.new("RGB", dev.screen, (4, 2, 12)), (sx, sy), scrim)
    _, cy = dev.to_canvas(0, (y0 + y1) / 2)
    left = round((cx if cx is not None else canvas.width / 2) - cw / 2)
    # The card grows downward from the element's own top edge, so the screen
    # title and tabs above it stay whole; a card that would then leave the
    # canvas by more than a sliver is pulled back up to the centred place.
    own_top = round(dev.to_canvas(0, y0)[1]) - round(10 * scale)
    top = max(round(cy - ch / 2), sy + round(56 * dev.k * meta["dpr"] / 3))
    if own_top + ch <= floor + 70:
        top = max(top, own_top)
    # [rise_pt]: the card's top edge sits this many points above the element's
    # own top on the screen, measured so that it covers the row above it
    # whole (a tab strip, the tail of a card) instead of slicing it.
    if rise_pt is not None:
        top = round(dev.to_canvas(0, y0 + pad - rise_pt * meta["dpr"])[1])
    # A few px by hand where the card's edge would cut a line of text behind it.
    top += drop
    radius = 24 * meta["dpr"] * scale
    base.shadow(canvas, (left, top, left + cw, top + ch), radius, 38, 215, (0, 30))
    canvas.paste(card, (left, top), base.rounded_mask((cw, ch), radius))
    edge = Image.new("L", (cw * 2, ch * 2), 0)
    ImageDraw.Draw(edge).rounded_rectangle(
        (0, 0, cw * 2 - 1, ch * 2 - 1), radius=radius * 2, outline=70, width=4)
    canvas.paste(Image.new("RGB", (cw, ch), (255, 255, 255)), (left, top),
                 edge.resize((cw, ch), Image.LANCZOS))
    return (left, top, left + cw, top + ch)


# The two screenshot slots. The iPad canvas is 3:4, so it gets its own
# proportions (a real iPad capture in an iPad frame), not a stretched phone.
SLOTS = {
    "iphone": {"size": (1320, 2868), "text_top": TEXT_TOP, "top": PHONE_TOP,
               "screen_w": PHONE_W, "card_w": CARD_W},
    "ipad": {"size": (2064, 2752), "text_top": 150, "top": 1060,
             "screen_w": 0.86, "card_w": 0.95},
}
# render_test.dart draws the iPad at 810x1080 pt.
base.DPR["ipad"] = 2064 / 810


def text_layer(out, slot, locale, slug):
    """The headline block drawn by Flutter's text engine (render_test.dart,
    SHOT_TEXT_V4): shaped scripts, CJK fonts, the pill. None when absent."""
    path = os.path.join(out, "text_v4", slot, locale, slug + ".png")
    if not os.path.exists(path):
        return None
    with open(path[:-4] + ".json", encoding="utf-8") as f:
        return Image.open(path).convert("RGBA"), json.load(f)


def compose(raw_root, locale, frame, style, slot="iphone", text_root=None,
            text_locale=None):
    cfg = SLOTS[slot]
    cw_, ch_ = cfg["size"]
    canvas = Image.new("RGB", (cw_, ch_), style["bg"])
    pair = frame.get(locale) or frame["en"]
    layer = text_layer(text_root or raw_root, slot, text_locale or locale, frame["slug"])
    if layer:
        img, tmeta = layer
        canvas.paste(img, ((cw_ - img.width) // 2,
                           cfg["text_top"] - int(tmeta.get("firstLineTop", 0))), img)
        bottom = cfg["text_top"] - int(tmeta.get("firstLineTop", 0)) + img.height
        size = tmeta.get("headlineSize")
        if tmeta.get("overflow"):
            print(f"  ! {slot}/{locale}/{frame['slug']}: headline overflows its box",
                  file=sys.stderr)
    else:
        if slot != "iphone" or locale in NEEDS_SHAPING:
            sys.exit(f"{slot}/{locale}/{frame['slug']}: no text layer (run the "
                     "SHOT_TEXT_V4 text tests first)")
        bottom, size = draw_headline(canvas, pair[0].split("|"), style, TEXT_TOP)
        bottom = draw_sub(canvas, pair[1], style, bottom + SUB_GAP)
    raw, meta = base.load_raw(raw_root, slot, locale, frame["shot"])
    dev = base.Device(slot, raw, int(cw_ * cfg["screen_w"]))
    # One device position for the whole set, whatever the subline's length,
    # so the frames line up when they sit side by side in the store.
    if bottom + 30 > cfg["top"]:
        print(f"  ! {slot}/{locale}/{frame['slug']}: text ends at {bottom}, "
              f"device starts at {cfg['top']}", file=sys.stderr)
    x, y = (cw_ - dev.size[0]) // 2, max(cfg["top"], bottom + 30)
    w, h = dev.size
    base.shadow(canvas, (x, y, x + w, y + h), dev.radius + dev.bezel, 46,
                style["shadow"], (0, 34))
    dev.paste(canvas, x, y, shade=False)
    card = None
    names = frame.get("lift")
    if isinstance(names, list):
        # Several stacked widgets lifted as one card: the union of their rects.
        rects = [meta["focus"][n] for n in names]
        meta["focus"]["+".join(names)] = [min(r[0] for r in rects), min(r[1] for r in rects),
                                          max(r[2] for r in rects), max(r[3] for r in rects)]
        frame = dict(frame, lift="+".join(names))
    if frame.get("lift"):
        drop = frame.get("drop", 0) if slot == "iphone" else frame.get("drop_" + slot, 0)
        card = lift(canvas, dev, meta, frame["lift"], style, frame.get("pad", 0),
                    drop, cw=round(cw_ * cfg["card_w"]), rise_pt=frame.get("rise_pt"))
    return canvas, {"headline_px": size, "phone_top": y, "card": card,
                    "screen_px_per_pt": round(dev.k * meta["dpr"], 3)}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--raw", default="")
    ap.add_argument("--locale", default="en")
    ap.add_argument("--style", default="violet")
    ap.add_argument("--slot", default="iphone")
    ap.add_argument("--only", default="")
    a = ap.parse_args()
    raw_root = a.raw or a.out
    with open(os.path.join(HERE, "copy_v4.json"), encoding="utf-8") as f:
        frames = json.load(f)["frames"]
    only = [s for s in a.only.split(",") if s]
    for name in a.style.split(","):
        style = STYLES[name]
        for slot in a.slot.split(","):
            folder = os.path.join(a.out, "taslak", name, a.locale)
            if slot != "iphone":
                folder = os.path.join(folder, slot)
            os.makedirs(folder, exist_ok=True)
            done = []
            for fr in frames:
                if only and fr["slug"][:2] not in only:
                    continue
                img, info = compose(raw_root, a.locale, fr, style, slot, text_root=a.out)
                assert img.size == SLOTS[slot]["size"] and img.mode == "RGB"
                img.save(os.path.join(folder, fr["slug"] + ".png"), optimize=True)
                done.append(img)
                print(name, slot, fr["slug"], info)
            if done:
                base.contact(done, os.path.join(folder, "_sayfa.jpg"), cols=len(done),
                             thumb_w=420)
                print(os.path.join(folder, "_sayfa.jpg"))


if __name__ == "__main__":
    main()
