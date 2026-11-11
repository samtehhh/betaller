"""Add l10n keys to every lib/l10n/app_*.arb, or update their values.

Usage: python tool/arb_sync.py tool/l10n_keys/<file>.json [--set]

The json has the arb_add.py shape: {"key": {"en": "...", "tr": "...", ...,
"_types": {"n": "int"}}}. Unlike arb_add.py and arb_set.py, which know a
fixed list of 11 languages, this one walks every arb file in lib/l10n, so
a newly added language is never left behind. A language missing from an
entry gets the English text.

Without --set, keys that already exist are left alone. With --set, an
existing key whose value differs is rewritten in place (whole-line
`  "key": "value",` entries only); order and formatting are kept.
"""
import glob
import json
import os
import re
import sys

src = sys.argv[1]
do_set = "--set" in sys.argv[2:]
keys = json.load(open(src, encoding="utf-8"))

for path in sorted(glob.glob("lib/l10n/app_*.arb")):
    lang = os.path.basename(path)[4:-4]
    raw = open(path, "rb").read().decode("utf-8")
    nl = "\r\n" if "\r\n" in raw else "\n"
    data = json.loads(raw)
    lines = raw.split(nl)
    added, changed = [], 0
    for k, tr in keys.items():
        if k.startswith("_"):
            continue
        val = tr.get(lang) or tr["en"]
        if k in data:
            if do_set and data[k] != val:
                prefix = f'  "{k}":'
                hit = [i for i, ln in enumerate(lines) if ln.startswith(prefix)]
                if not hit:
                    print("cannot rewrite", lang, k)
                    continue
                i = hit[0]
                comma = "," if lines[i].rstrip().endswith(",") else ""
                lines[i] = f"{prefix} {json.dumps(val, ensure_ascii=False)}{comma}"
                changed += 1
            continue
        added.append(f"  {json.dumps(k)}: {json.dumps(val, ensure_ascii=False)}")
        ph = re.findall(r"\{(\w+)\}", tr["en"])
        if lang == "en" and ph:
            types = tr.get("_types", {})
            meta = {"placeholders": {x: {"type": types.get(x, "String")} for x in ph}}
            added.append(f'  {json.dumps("@" + k)}: {json.dumps(meta)}')
    if not added and not changed:
        continue
    out = nl.join(lines)
    if added:
        body = out.rstrip()
        assert body.endswith("}")
        body = body[:-1].rstrip()
        out = body + "," + nl + ("," + nl).join(added) + nl + "}" + nl
    json.loads(out)
    open(path, "wb").write(out.encode("utf-8"))
    print(lang, "added", len(added), "changed", changed)
