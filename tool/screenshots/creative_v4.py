"""The wide App Store creatives and a store preview, in the v4 design.

  python tool/screenshots/creative_v4.py --out outputs/BeTaller-Magaza-v4
        [--locale en] [--style violet]

Output  <out>/taslak/<style>/<locale>/search.png   3840x2560  search result image (3:2)
        <out>/taslak/<style>/<locale>/header.png   3840x1646  product page header (21:9)
        <out>/taslak/<style>/<locale>/_magaza_acik.jpg, _magaza_koyu.jpg
            how the set sits in a search result on the light and the dark
            App Store (a mock for judging contrast, not Apple's exact layout)

Apple's rules for the two creatives: one idea, real UI, no price, URL,
award or other-platform name, RGB without alpha. The header is shown
centre-cropped on some surfaces, so its headline and main phone stay
inside the centre half of the width; the side phones are decoration.
"""
import argparse
import json
import os
import sys

from PIL import Image, ImageDraw

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import compose as base  # noqa: E402
import compose_v4 as v4  # noqa: E402


def text_left(canvas, text, style, x, top, size, width):
    """Subline, left aligned, wrapped greedily inside [width]."""
    f = v4.font("SemiBold", size)
    d = ImageDraw.Draw(canvas)
    line, y = "", top
    for w in text.split():
        trial = (line + " " + w).strip()
        if f.getlength(trial) > width and line:
            d.text((x, y), line, font=f, fill=style["sub"])
            y += size * 1.26
            line = w
        else:
            line = trial
    d.text((x, y), line, font=f, fill=style["sub"])
    return round(y + size * 1.26)


def phone(canvas, raw_root, locale, shot, style, screen_w, x, y, lift=None, card_w=None,
          pad=0, drop=0, device="iphone"):
    """[device] names the raw folder: "iphone" (3x) or "iphone4x", the same
    screens drawn at 4x for these 3840 px wide images, so the lifted card
    is not an enlargement."""
    folder = device if os.path.isdir(os.path.join(raw_root, "raw", device, locale)) else "iphone"
    raw, meta = base.load_raw(raw_root, folder, locale, shot)
    dev = base.Device("iphone", raw, screen_w)
    w, h = dev.size
    base.shadow(canvas, (x, y, x + w, y + h), dev.radius + dev.bezel, 60,
                style["shadow"], (0, 44))
    dev.paste(canvas, x, y, shade=False)
    if lift:
        v4.lift(canvas, dev, meta, lift, style, pad, drop, cw=card_w, cx=x + w / 2)
    return dev


def text_block(canvas, out, slot, locale, copy, style, left, top, box, sizes, sub):
    """The headline block: Flutter's layer when render_test.dart has drawn
    one (every script), else Pillow (Latin only). Returns (size, rtl). An
    RTL layer is set against the right edge and the caller mirrors the phone."""
    layer = v4.text_layer(out, slot, locale, slot)
    W = canvas.width
    if layer:
        img, meta = layer
        rtl = bool(meta.get("rtl"))
        x = W - left - img.width if rtl else left
        canvas.paste(img, (x, top - int(meta.get("firstLineTop", 0))), img)
        if meta.get("overflow"):
            print(f"  ! {slot}/{locale}: headline overflows its box", file=sys.stderr)
        return meta.get("headlineSize"), rtl
    if locale in v4.NEEDS_SHAPING or locale in ("ja", "ko", "zh", "zh_Hant"):
        sys.exit(f"{slot}/{locale}: no text layer (run the SHOT_TEXT_V4 text tests first)")
    pair = copy.get(locale) or copy["en"]
    bottom, size = v4.draw_headline(canvas, pair[0].split("|"), style, top,
                                    box=(left, left + box), sizes=sizes, align="left")
    text_left(canvas, pair[1], style, left + sub[2], bottom + sub[0], sub[1], sub[3])
    return size, False


def search(raw_root, locale, copy, style, shots="iphone"):
    W, H = 3840, 2560
    canvas = Image.new("RGB", (W, H), style["bg"])
    size, rtl = text_block(canvas, raw_root, "search", locale, copy, style, 250, 430,
                           1710, (380, 230), (70, 118, 8, 1560))
    sw = 1420
    x = 2180 if not rtl else W - 2180 - (sw + 2 * round(sw * base.BEZEL_K["iphone"]))
    phone(canvas, raw_root, locale, "home", style, sw, x, 250,
          lift="_PotentialHero", card_w=1640, drop=44, device=shots)
    return canvas, size


def header(raw_root, locale, copy, style, shots="iphone"):
    W, H = 3840, 1646
    canvas = Image.new("RGB", (W, H), style["bg"])
    # Decoration outside the centre half: two more real screens, turned.
    for shot, cx, angle in (("progress", 470, 8), ("library_1", W - 470, -8)):
        raw, _ = base.load_raw(raw_root, "iphone", locale, shot)
        dev = base.Device("iphone", raw, 640)
        base.place_rotated(canvas, dev, (cx, 300 + dev.size[1] // 2), angle)
    size, rtl = text_block(canvas, raw_root, "header", locale, copy, style, 1000, 450,
                           990, (250, 150), (46, 70, 6, 900))
    sw = 760
    x = 2060 if not rtl else W - 2060 - (sw + 2 * round(sw * base.BEZEL_K["iphone"]))
    if rtl:
        # The text block moves to the right half of the centre.
        pass
    phone(canvas, raw_root, locale, "home", style, sw, x, 210,
          lift="_PotentialHero", card_w=840, drop=24, device=shots)
    return canvas, size


def rounded(img, radius):
    out = Image.new("RGBA", img.size, (0, 0, 0, 0))
    out.paste(img, (0, 0), base.rounded_mask(img.size, radius))
    return out


def store_mock(frames, search_img, icon, dark):
    """A search result as the App Store lays it out: app row, then either
    three portrait screenshots or the one wide search image."""
    page = (0, 0, 0) if dark else (242, 242, 247)
    card = (28, 28, 30) if dark else (255, 255, 255)
    ink = (255, 255, 255) if dark else (0, 0, 0)
    grey = (152, 152, 159) if dark else (138, 138, 142)
    pill = (44, 44, 46) if dark else (238, 238, 240)
    blue = (10, 132, 255) if dark else (0, 122, 255)
    cw, pad = 1080, 44
    tw = (cw - 2 * pad - 2 * 20) // 3
    th = round(frames[0].height * tw / frames[0].width)
    sh = round(search_img.height * (cw - 2 * pad) / search_img.width)
    row = 190

    def one(h, body):
        c = Image.new("RGB", (cw, row + h + pad), card)
        d = ImageDraw.Draw(c)
        c.paste(icon.resize((120, 120), Image.LANCZOS), (pad, 36),
                base.rounded_mask((120, 120), 27))
        d.text((pad + 148, 46), "BeTaller", font=v4.font("SemiBold", 40), fill=ink)
        d.text((pad + 148, 100), "Health & Fitness", font=v4.font("Regular", 30), fill=grey)
        d.rounded_rectangle((cw - pad - 170, 64, cw - pad, 132), radius=34, fill=pill)
        d.text((cw - pad - 85, 98), "Get", font=v4.font("Bold", 34), fill=blue, anchor="mm")
        body(c)
        return c

    def shots(c):
        for i, fr in enumerate(frames[:3]):
            t = rounded(fr.resize((tw, th), Image.LANCZOS), 30)
            c.paste(t, (pad + i * (tw + 20), row), t)

    def wide(c):
        t = rounded(search_img.resize((cw - 2 * pad, sh), Image.LANCZOS), 30)
        c.paste(t, (pad, row), t)

    a, b = one(th, shots), one(sh, wide)
    sheet = Image.new("RGB", (cw * 2 + 180, max(a.height, b.height) + 120), page)
    for i, c in enumerate((a, b)):
        sheet.paste(c, (60 + i * (cw + 60), 60), base.rounded_mask(c.size, 50))
    return sheet


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--locale", default="en")
    ap.add_argument("--style", default="violet")
    a = ap.parse_args()
    with open(os.path.join(v4.HERE, "copy_v4.json"), encoding="utf-8") as f:
        copy = json.load(f)
    style = v4.STYLES[a.style]
    folder = os.path.join(a.out, "taslak", a.style, a.locale)
    s_img, s_size = search(a.out, a.locale, copy["search"], style, "iphone4x")
    h_img, h_size = header(a.out, a.locale, copy["header"], style, "iphone4x")
    s_img.save(os.path.join(folder, "search.png"), optimize=True)
    h_img.save(os.path.join(folder, "header.png"), optimize=True)
    print("search headline", s_size, "| header headline", h_size)
    # The header's centre half on its own: what the tightest crop keeps.
    W = h_img.width
    h_img.crop((W // 4, 0, W - W // 4, h_img.height)).save(
        os.path.join(folder, "_header_orta_yari.jpg"), quality=88)
    frames = [Image.open(os.path.join(folder, fr["slug"] + ".png"))
              for fr in copy["frames"][:3]]
    icon = Image.open(os.path.join(v4.ROOT, "assets", "icon.png")).convert("RGB")
    for dark in (False, True):
        store_mock(frames, s_img, icon, dark).save(
            os.path.join(folder, "_magaza_koyu.jpg" if dark else "_magaza_acik.jpg"),
            quality=90)
    print(folder)


if __name__ == "__main__":
    main()
