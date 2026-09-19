#!/usr/bin/env python3
"""
App Store screenshot composer — "Kenko style" scaffold.
Soft gradient background, left-aligned dark headline (title case), two small
feature pills with simple vector icons, and the FULL device frame visible
(no bleed-off, no giant breakout card) — matching the reference layout the
user asked to copy, rendered with BeTaller's own brand colours.
"""
import argparse
import json
import os
from PIL import Image, ImageDraw, ImageFont

CANVAS_W, CANVAS_H = 1290, 2796

SKILL_DIR = r"C:\Users\samte\.claude\skills\aso-appstore-screenshots"
FRAME_PATH = os.path.join(SKILL_DIR, "assets", "device_frame.png")

APP_ROOT = r"C:\Users\samte\boyuzatmaapp"
LOGO_PATH = os.path.join(APP_ROOT, "assets", "icon.png")

# BeTaller's real brand typeface (pubspec.yaml -> fonts: Inter), not a system font
FONTS_DIR = os.path.join(APP_ROOT, "assets", "fonts")
FONT_BLACK = os.path.join(FONTS_DIR, "Inter-Black.ttf")        # headline
FONT_BOLD = os.path.join(FONTS_DIR, "Inter-ExtraBold.ttf")     # pill labels, logo wordmark
FONT_REGULAR = os.path.join(FONTS_DIR, "Inter-Medium.ttf")     # pill sub-labels

# Native device_frame.png dimensions (see generate_frame.py)
NATIVE_DEVICE_W = 1030
NATIVE_DEVICE_H = 2800
NATIVE_BEZEL = 15
NATIVE_SCREEN_W = NATIVE_DEVICE_W - 2 * NATIVE_BEZEL

MARGIN_X = 90


def hex_to_rgb(h):
    h = h.lstrip("#")
    return tuple(int(h[i:i + 2], 16) for i in (0, 2, 4))


def make_vertical_gradient(w, h, top_hex, bottom_hex):
    mask = Image.linear_gradient("L").resize((w, h))
    top_img = Image.new("RGB", (w, h), hex_to_rgb(top_hex))
    bottom_img = Image.new("RGB", (w, h), hex_to_rgb(bottom_hex))
    return Image.composite(bottom_img, top_img, mask)


def word_wrap(draw, text, font, max_w):
    words = text.split()
    lines, cur = [], ""
    for w in words:
        test = f"{cur} {w}".strip()
        if draw.textlength(test, font=font) <= max_w:
            cur = test
        else:
            if cur:
                lines.append(cur)
            cur = w
    if cur:
        lines.append(cur)
    return lines


def fit_font(draw, text, max_w, size_max, size_min, font_path, floor=36):
    for size in range(size_max, floor - 1, -2):
        font = ImageFont.truetype(font_path, size)
        lines = word_wrap(draw, text, font, max_w)
        if lines and all(draw.textlength(l, font=font) <= max_w for l in lines):
            return font, lines
    font = ImageFont.truetype(font_path, floor)
    return font, word_wrap(draw, text, font, max_w)


def draw_left_lines(draw, x, y, lines, font, color, line_gap_ratio=0.28):
    ascent, descent = font.getmetrics()
    line_h = ascent + descent
    gap = round(font.size * line_gap_ratio)
    for line in lines:
        draw.text((x, y), line, font=font, fill=color)
        y += line_h + gap
    return y


def draw_icon(draw, cx, cy, r, kind, color):
    """Simple vector glyph inside a colored circle badge (no external icon deps)."""
    draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=color)
    ic = "white"
    if kind == "chart":
        bw = r * 0.28
        heights = [r * 0.5, r * 0.85, r * 0.65]
        base_y = cy + r * 0.55
        start_x = cx - r * 0.55
        for i, h in enumerate(heights):
            x0 = start_x + i * (bw + r * 0.18)
            draw.rounded_rectangle([x0, base_y - h, x0 + bw, base_y], radius=bw * 0.3, fill=ic)
    elif kind == "target":
        for rr, w in [(r * 0.62, r * 0.14), (r * 0.34, r * 0.14)]:
            draw.ellipse([cx - rr, cy - rr, cx + rr, cy + rr], outline=ic, width=max(2, int(w)))
        dot = r * 0.14
        draw.ellipse([cx - dot, cy - dot, cx + dot, cy + dot], fill=ic)
    elif kind == "check":
        draw.line([(cx - r * 0.45, cy + r * 0.05), (cx - r * 0.1, cy + r * 0.4),
                   (cx + r * 0.5, cy - r * 0.35)], fill=ic, width=max(3, int(r * 0.16)), joint="curve")
    elif kind == "flame":
        draw.pieslice([cx - r * 0.5, cy - r * 0.6, cx + r * 0.5, cy + r * 0.6], 200, 340, fill=ic)
        draw.ellipse([cx - r * 0.22, cy - r * 0.15, cx + r * 0.22, cy + r * 0.35], fill=ic)
    elif kind == "trend":
        draw.line([(cx - r * 0.5, cy + r * 0.35), (cx - r * 0.1, cy - r * 0.15), (cx + r * 0.2, cy + r * 0.1),
                   (cx + r * 0.55, cy - r * 0.45)], fill=ic, width=max(3, int(r * 0.14)), joint="curve")
        ah = r * 0.28
        draw.polygon([(cx + r * 0.55, cy - r * 0.45), (cx + r * 0.55 - ah, cy - r * 0.45),
                       (cx + r * 0.55, cy - r * 0.45 + ah)], fill=ic)
    elif kind == "camera":
        draw.rounded_rectangle([cx - r * 0.55, cy - r * 0.35, cx + r * 0.55, cy + r * 0.4],
                                radius=r * 0.12, outline=ic, width=max(2, int(r * 0.12)))
        draw.ellipse([cx - r * 0.22, cy - r * 0.22, cx + r * 0.22, cy + r * 0.22], outline=ic, width=max(2, int(r * 0.1)))
    elif kind == "genetics":
        # Two overlapping circles (shared heritage / two parents) — simple, unambiguous
        rr = r * 0.42
        off = r * 0.26
        draw.ellipse([cx - off - rr, cy - rr, cx - off + rr, cy + rr], outline=ic, width=max(2, int(r * 0.1)))
        draw.ellipse([cx + off - rr, cy - rr, cx + off + rr, cy + rr], outline=ic, width=max(2, int(r * 0.1)))


def draw_pill(draw, x, y, w, h, icon_kind, icon_color, label, sublabel, font_bold, font_reg):
    draw.rounded_rectangle([x, y, x + w, y + h], radius=h / 2, fill="white")
    r = h * 0.32
    cx, cy = x + h / 2, y + h / 2
    draw_icon(draw, cx, cy, r, icon_kind, icon_color)
    tx = x + h * 0.95
    draw.text((tx, y + h * 0.16), label, font=font_bold, fill="#14122a")
    draw.text((tx, y + h * 0.52), sublabel, font=font_reg, fill="#6b6b80")
    return h


def compose(cfg, screenshot_path, output_path):
    bg = make_vertical_gradient(CANVAS_W, CANVAS_H, cfg["bg_top"], cfg["bg_bottom"])
    canvas = bg.convert("RGBA")
    draw = ImageDraw.Draw(canvas)

    text_color = hex_to_rgb(cfg.get("text_color", "#14122A"))

    # ── Logo lockup (top-left) — the app's real icon, not a redrawn one ──
    y = 90
    logo_size = 72
    logo = Image.open(LOGO_PATH).convert("RGBA").resize((logo_size, logo_size), Image.LANCZOS)
    canvas.paste(logo, (MARGIN_X, y), logo)
    logo_cy = y + logo_size // 2
    name_font = ImageFont.truetype(FONT_BOLD, 40)
    draw.text((MARGIN_X + logo_size + 22, logo_cy - 20), "BeTaller", font=name_font, fill=text_color)
    y = y + logo_size + 50

    # ── Headline (left-aligned, title case, dark) ────────────────────
    headline_font, lines = fit_font(draw, cfg["headline"], CANVAS_W - 2 * MARGIN_X, 92, 56, FONT_BLACK)
    y = draw_left_lines(draw, MARGIN_X, y, lines, headline_font, text_color, line_gap_ratio=0.22)
    y += 36

    # ── Feature pills ─────────────────────────────────────────────────
    pill_w = CANVAS_W - 2 * MARGIN_X
    pill_h = 130
    for pill in cfg["pills"]:
        draw_pill(draw, MARGIN_X, y, pill_w, pill_h, pill["icon"], hex_to_rgb(pill["icon_color"]),
                   pill["label"], pill["sub"], ImageFont.truetype(FONT_BOLD, 34), ImageFont.truetype(FONT_REGULAR, 28))
        y += pill_h + 22

    y += 30
    device_top = y

    # ── Device (scaled to the screenshot's OWN aspect ratio) ──────────
    # Deriving the device height from the screenshot's aspect ratio (at
    # native screen width) means the frame's screen cutout is an exact fit:
    # no black gap (content shorter than the cutout) and no left/right crop
    # (content forced into a narrower cutout via "cover" cropping cuts off
    # left-aligned titles). The device_frame.png asset is stretched to this
    # exact height — a small, generally imperceptible corner-radius
    # distortion is the trade-off, and it beats losing real UI content.
    shot = Image.open(screenshot_path).convert("RGBA")
    shot_ar = shot.height / shot.width
    needed_screen_h_native = round(NATIVE_SCREEN_W * shot_ar)
    needed_dev_h_native = needed_screen_h_native + 2 * NATIVE_BEZEL

    bottom_margin = 70
    available_h = CANVAS_H - device_top - bottom_margin
    scale = min(available_h / needed_dev_h_native, 0.95)
    dev_w = round(NATIVE_DEVICE_W * scale)
    dev_h = round(needed_dev_h_native * scale)
    dev_x = (CANVAS_W - dev_w) // 2

    bezel = round(NATIVE_BEZEL * scale)
    screen_w = dev_w - 2 * bezel
    screen_h = dev_h - 2 * bezel
    screen_x = dev_x + bezel
    screen_y = device_top + bezel
    screen_corner_r = round(62 * scale)

    shot = shot.resize((screen_w, screen_h), Image.LANCZOS)
    scr_mask = Image.new("L", canvas.size, 0)
    ImageDraw.Draw(scr_mask).rounded_rectangle(
        [screen_x, screen_y, screen_x + screen_w, screen_y + screen_h],
        radius=screen_corner_r, fill=255,
    )
    scr_layer = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    ImageDraw.Draw(scr_layer).rounded_rectangle(
        [screen_x, screen_y, screen_x + screen_w, screen_y + screen_h],
        radius=screen_corner_r, fill=(0, 0, 0, 255),
    )
    scr_layer.paste(shot, (screen_x, screen_y))
    scr_layer.putalpha(scr_mask)
    canvas = Image.alpha_composite(canvas, scr_layer)

    frame = Image.open(FRAME_PATH).convert("RGBA").resize((dev_w, dev_h), Image.LANCZOS)
    frame_layer = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    frame_layer.paste(frame, (dev_x, device_top))
    canvas = Image.alpha_composite(canvas, frame_layer)
    draw = ImageDraw.Draw(canvas)

    # ── Optional small floating metric chip (Kenko-style, subtle) ────
    if cfg.get("metric"):
        m = cfg["metric"]
        chip_w, chip_h = 430, 150
        side = m.get("side", "right")
        chip_y = device_top + round(dev_h * m.get("y_frac", 0.28))
        safe_margin = 36
        if side == "right":
            # Anchor to a safe on-canvas right margin rather than the device
            # edge — the device can be wide enough that "device edge - 70"
            # pushes the chip's far edge past the canvas entirely.
            chip_x = min(dev_x + dev_w - 70, CANVAS_W - chip_w - safe_margin)
        else:
            chip_x = max(dev_x - chip_w + 70, safe_margin)
        shadow = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
        ImageDraw.Draw(shadow).rounded_rectangle(
            [chip_x + 8, chip_y + 14, chip_x + chip_w + 8, chip_y + chip_h + 14],
            radius=28, fill=(20, 18, 42, 70),
        )
        shadow = shadow.filter(__import__("PIL.ImageFilter", fromlist=["ImageFilter"]).GaussianBlur(18))
        canvas = Image.alpha_composite(canvas, shadow)
        chip = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
        cdraw = ImageDraw.Draw(chip)
        cdraw.rounded_rectangle([chip_x, chip_y, chip_x + chip_w, chip_y + chip_h], radius=28, fill="white")
        cdraw.text((chip_x + 30, chip_y + 20), m["value"], font=ImageFont.truetype(FONT_BLACK, 56),
                    fill=hex_to_rgb(cfg["brand_accent"]))
        cdraw.text((chip_x + 30, chip_y + 92), m["label"], font=ImageFont.truetype(FONT_REGULAR, 26), fill="#6b6b80")
        canvas = Image.alpha_composite(canvas, chip)

    canvas.convert("RGB").save(output_path, "PNG")
    print(f"OK {output_path} ({CANVAS_W}x{CANVAS_H})")


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--config", required=True, help="Path to a JSON config file for this screen")
    p.add_argument("--screenshot", required=True)
    p.add_argument("--output", required=True)
    args = p.parse_args()
    with open(args.config, encoding="utf-8") as f:
        cfg = json.load(f)
    compose(cfg, args.screenshot, args.output)


if __name__ == "__main__":
    main()
