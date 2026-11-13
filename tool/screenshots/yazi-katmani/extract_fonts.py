"""Extracts the single Bold faces the v4 text layers need from the Windows font
collections (Flutter's FontLoader wants single-face files).

  python tool/screenshots/yazi-katmani/extract_fonts.py outputs/BeTaller-Magaza-v4

Writes <out>/.fonts/<name>.ttf and prints which source/face each came from.
"""
import os
import sys
from fontTools.ttLib import TTCollection, TTFont

WIN = r"C:\Windows\Fonts"
# output name -> (source file, wanted face full-name fragment or None for single files)
JOBS = {
    "NirmalaUI-Bold": ("Nirmala.ttc", "Nirmala UI Bold"),
    "YuGothic-Bold": ("YuGothB.ttc", "Yu Gothic Bold"),
    "Meiryo-Bold": ("meiryob.ttc", "Meiryo Bold"),
    "YaHei-Bold": ("msyhbd.ttc", "Microsoft YaHei Bold"),
    "JhengHei-Bold": ("msjhbd.ttc", "Microsoft JhengHei Bold"),
    "SegoeUI-Bold": ("segoeuib.ttf", None),
    "Leelawadee-Bold": ("LeelaUIb.ttf", None),
    "Malgun-Bold": ("malgunbd.ttf", None),
}


def names(f):
    n = f["name"]
    return n.getDebugName(4) or "", n.getDebugName(1) or ""


def main():
    out = os.path.join(os.path.abspath(sys.argv[1]), ".fonts")
    os.makedirs(out, exist_ok=True)
    for dst, (src, want) in JOBS.items():
        path = os.path.join(WIN, src)
        if not os.path.exists(path):
            print(f"MISSING {src}")
            continue
        if want is None:
            f = TTFont(path)
            idx = "-"
        else:
            faces = TTCollection(path).fonts
            for i, f in enumerate(faces):
                print(f"   {src}[{i}] = {names(f)[0]}")
            idx = next((i for i, f in enumerate(faces) if names(f)[0] == want), None)
            if idx is None:
                print(f"NO FACE '{want}' in {src}")
                continue
            f = faces[idx]
        target = os.path.join(out, dst + ".ttf")
        f.save(target)
        print(f"OK {dst}.ttf <- {src}[{idx}] {names(f)[0]} ({os.path.getsize(target)//1024} KB)")


main()
