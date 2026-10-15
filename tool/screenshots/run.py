"""Builds the App Store screenshot set end to end.

  python tool/screenshots/run.py [--out DIR] [--locales en,tr] [--devices iphone,ipad]
                                 [--only home,progress] [--compose-only]

1. Extracts Nirmala UI (Devanagari) from the Windows font collection, since
   Flutter's font loader wants single-face files.
2. Runs tool/screenshots/render_test.dart: real app screens with the demo
   user, plus the headline layers, into <out>/raw and <out>/text.
3. Runs compose.py: the final frames into <out>/screenshots/<locale>/<device>/
   and a contact sheet per locale.

Run from the repository root. The default output folder is
outputs/BeTaller-v3 under the repository root.
"""
import argparse
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
HERE = os.path.dirname(os.path.abspath(__file__))
ALL_LOCALES = "en,tr,de,fr,es,it,pt,hi"


def extract_fonts(out):
    dst = os.path.join(out, ".fonts")
    targets = {0: "NirmalaUI-Regular.ttf", 1: "NirmalaUI-Bold.ttf"}
    if all(os.path.exists(os.path.join(dst, n)) for n in targets.values()):
        return
    src = r"C:\Windows\Fonts\Nirmala.ttc"
    if not os.path.exists(src):
        print("Nirmala.ttc not found; Hindi falls back to the collection loader", file=sys.stderr)
        return
    from fontTools.ttLib import TTCollection
    os.makedirs(dst, exist_ok=True)
    fonts = TTCollection(src).fonts
    for index, name in targets.items():
        fonts[index].save(os.path.join(dst, name))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(ROOT, "outputs", "BeTaller-v3"))
    ap.add_argument("--locales", default=ALL_LOCALES)
    ap.add_argument("--devices", default="iphone,ipad")
    ap.add_argument("--only", default="", help="render only these shots (comma list)")
    ap.add_argument("--compose-only", action="store_true")
    args = ap.parse_args()
    out = os.path.abspath(args.out).replace("\\", "/")

    if not args.compose_only:
        extract_fonts(out)
        cmd = [
            "flutter", "test", "tool/screenshots/render_test.dart",
            "--timeout", "180s",
            f"--dart-define=SHOT_OUT={out}",
            f"--dart-define=SHOT_LOCALES={args.locales}",
            f"--dart-define=SHOT_DEVICES={args.devices}",
        ]
        if args.only:
            cmd.append(f"--dart-define=SHOT_ONLY={args.only}")
        print(" ".join(cmd))
        r = subprocess.run(cmd, cwd=ROOT, shell=(os.name == "nt"))
        if r.returncode != 0:
            sys.exit("render failed: see the test output above")

    r = subprocess.run([sys.executable, os.path.join(HERE, "compose.py"), "--out", out,
                        "--locales", args.locales, "--devices", args.devices])
    sys.exit(r.returncode)


if __name__ == "__main__":
    main()
