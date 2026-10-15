"""Add l10n keys to all 8 arb files. Usage: python arb_add.py keys.json
keys.json: {"key": {"en": "...", "tr": "...", ...}, ...}; "{x}" placeholders get String metadata in en."""
import json, re, sys
LANGS=["en","tr","de","fr","es","it","pt","hi"]
keys=json.load(open(sys.argv[1],encoding="utf-8"))
for lang in LANGS:
    p=f"lib/l10n/app_{lang}.arb"
    raw=open(p,"rb").read().decode("utf-8")
    nl="\r\n" if "\r\n" in raw else "\n"
    data=json.loads(raw)
    body=raw.rstrip()
    assert body.endswith("}")
    body=body[:-1].rstrip()
    lines=[]
    for k,tr in keys.items():
        if k in data: continue
        val=tr.get(lang) or tr["en"]
        if k.startswith("_"): continue
        lines.append(f'  {json.dumps(k)}: {json.dumps(val, ensure_ascii=False)}')
        ph=re.findall(r"\{(\w+)\}", tr["en"])
        if lang=="en" and ph:
            types=tr.get("_types",{})
            meta={"placeholders":{x:{"type":types.get(x,"String")} for x in ph}}
            lines.append(f'  {json.dumps("@"+k)}: {json.dumps(meta)}')
    if not lines: continue
    out=body+","+nl+(","+nl).join(lines)+nl+"}"+nl
    json.loads(out)
    open(p,"wb").write(out.encode("utf-8"))
    print(lang, len(lines))
