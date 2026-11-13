"""Builds the whole v4 App Store set, one folder per App Store Connect locale.

  python tool/screenshots/build_all_v4.py --out outputs/BeTaller-Magaza-v4
        [--locales en-US,tr] [--style violet]

Needs, under <out>: raw/iphone, raw/ipad (and raw/iphone4x for the wide
creatives) per app locale, and text_v4/<slot>/<text locale>/ layers, both
from render_test.dart.

Output  <out>/final/<asc locale>/iphone-6.9/NN-slug.png   1320x2868
        <out>/final/<asc locale>/ipad-13/NN-slug.png      2064x2752
        <out>/final/<asc locale>/search.png, header.png   3840x2560, 3840x1646
        <out>/final/_sayfalar/<asc locale>_iphone.jpg, _ipad.jpg, _genis.jpg
"""
import argparse
import json
import os
import sys

from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import compose as base  # noqa: E402
import compose_v4 as v4  # noqa: E402
import creative_v4 as cr  # noqa: E402

# App Store Connect locale -> (app locale the screens are in, text layer locale)
ASC = {
    "en-US": ("en", "en_US"), "en-GB": ("en", "en"), "en-CA": ("en", "en"),
    "en-AU": ("en", "en"), "tr": ("tr", "tr"), "de-DE": ("de", "de"),
    "fr-FR": ("fr", "fr"), "fr-CA": ("fr", "fr"), "es-ES": ("es", "es"),
    "es-MX": ("es", "es"), "it": ("it", "it"), "pt-BR": ("pt", "pt"),
    "pt-PT": ("pt", "pt"), "nl-NL": ("nl", "nl"), "pl": ("pl", "pl"),
    "sv": ("sv", "sv"), "ru": ("ru", "ru"), "ar-SA": ("ar", "ar"),
    "hi": ("hi", "hi"), "id": ("id", "id"), "ms": ("ms", "ms"),
    "ja": ("ja", "ja"), "ko": ("ko", "ko"), "zh-Hans": ("zh", "zh"),
    "zh-Hant": ("zh_Hant", "zh_Hant"), "th": ("th", "th"), "vi": ("vi", "vi"),
}
FOLDER = {"iphone": "iphone-6.9", "ipad": "ipad-13"}


class TextAs:
    """Makes the creatives read their text layer from another locale folder
    (en_US text over en screens)."""

    def __init__(self, text_locale, app_locale):
        self.t, self.a = text_locale, app_locale

    def __enter__(self):
        self.orig = v4.text_layer
        v4.text_layer = lambda out, slot, locale, slug: self.orig(
            out, slot, self.t if locale == self.a else locale, slug)

    def __exit__(self, *a):
        v4.text_layer = self.orig


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--locales", default=",".join(ASC))
    ap.add_argument("--style", default="violet")
    a = ap.parse_args()
    with open(os.path.join(v4.HERE, "copy_v4.json"), encoding="utf-8") as f:
        copy = json.load(f)
    style = v4.STYLES[a.style]
    sheets = os.path.join(a.out, "final", "_sayfalar")
    os.makedirs(sheets, exist_ok=True)
    problems = []
    for asc in a.locales.split(","):
        app, text = ASC[asc]
        root = os.path.join(a.out, "final", asc)
        for slot in ("iphone", "ipad"):
            folder = os.path.join(root, FOLDER[slot])
            os.makedirs(folder, exist_ok=True)
            frames = []
            for fr in copy["frames"]:
                img, info = v4.compose(a.out, app, fr, style, slot, text_root=a.out,
                                       text_locale=text)
                assert img.size == v4.SLOTS[slot]["size"] and img.mode == "RGB"
                img.save(os.path.join(folder, fr["slug"] + ".png"), optimize=True)
                frames.append(img)
            base.contact(frames, os.path.join(sheets, f"{asc}_{slot}.jpg"),
                         cols=len(frames), thumb_w=420 if slot == "iphone" else 520)
        with TextAs(text, app):
            s_img, _ = cr.search(a.out, app, copy["search"], style, "iphone4x")
            h_img, _ = cr.header(a.out, app, copy["header"], style, "iphone4x")
        assert s_img.size == (3840, 2560) and h_img.size == (3840, 1646)
        s_img.save(os.path.join(root, "search.png"), optimize=True)
        h_img.save(os.path.join(root, "header.png"), optimize=True)
        wide = Image.new("RGB", (1920, 1280 + 823 + 30), (30, 28, 40))
        wide.paste(s_img.resize((1920, 1280), Image.LANCZOS), (0, 0))
        wide.paste(h_img.resize((1920, 823), Image.LANCZOS), (0, 1310))
        wide.save(os.path.join(sheets, f"{asc}_genis.jpg"), quality=88)
        print(asc, "ok")
    if problems:
        print("\n".join(problems))


if __name__ == "__main__":
    main()
