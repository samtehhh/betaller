"""Replace the value of existing l10n keys in all 11 arb files.

Usage: python tool/arb_set.py tool/l10n_keys/<file>.json
The json has the same shape as arb_add.py input. Only whole-line
`  "key": "value",` entries are rewritten; formatting and order are kept.
"""
import json
import sys

LANGS = ["en", "tr", "de", "fr", "es", "it", "pt", "hi", "nl", "pl", "sv"]
keys = json.load(open(sys.argv[1], encoding="utf-8"))
for lang in LANGS:
    p = f"lib/l10n/app_{lang}.arb"
    raw = open(p, "rb").read().decode("utf-8")
    nl = "\r\n" if "\r\n" in raw else "\n"
    lines = raw.split(nl)
    for k, tr in keys.items():
        prefix = f'  "{k}":'
        hit = [i for i, ln in enumerate(lines) if ln.startswith(prefix)]
        if not hit:
            print("missing", lang, k)
            continue
        i = hit[0]
        comma = "," if lines[i].rstrip().endswith(",") else ""
        lines[i] = f'{prefix} {json.dumps(tr.get(lang) or tr["en"], ensure_ascii=False)}{comma}'
    out = nl.join(lines)
    json.loads(out)
    open(p, "wb").write(out.encode("utf-8"))
print("ok")
