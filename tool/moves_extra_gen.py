"""Writes lib/utils/exercise_text_extra.dart from translated move text.

  python tool/moves_extra_gen.py

Reads tool/l10n_keys/moves_extra_en.json (the English source, produced by
test/_render/_dump_move_text_en_test.dart) and, for each language in LANGS,
tool/l10n_keys/moves_extra_<lang>.json (same shape, translated), and writes
the generated lib/utils/exercise_text_extra.dart. A missing language file is
skipped. An id that is missing, has a different number of steps/mistakes than
English, has an empty string, or contains an em/en dash is reported and left
out for that language (never partial text). Safe to run again.
"""
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
KEYS = os.path.join(ROOT, 'tool', 'l10n_keys')
OUT = os.path.join(ROOT, 'lib', 'utils', 'exercise_text_extra.dart')
LANGS = 'ru ar id ms ja ko zh zh_Hant th vi'.split()
DASHES = {'\u2014': 'em dash (U+2014)', '\u2013': 'en dash (U+2013)'}


def q(s):
    """A Dart double-quoted string literal."""
    bs = chr(92)
    s = s.replace(bs, bs + bs).replace('"', bs + '"').replace('$', bs + '$')
    s = s.replace('\n', bs + 'n').replace('\r', bs + 'r').replace('\t', bs + 't')
    return '"' + s + '"'


def strings_of(entry):
    out = []
    for k in ('title', 'desc', 'dose', 'tip'):
        if k in entry:
            out.append((k, entry[k]))
    for k in ('steps', 'mistakes'):
        for i, v in enumerate(entry.get(k) or []):
            out.append((f'{k}[{i}]', v))
    return out


def check(lang, mid, en, tr):
    """Returns a list of problems; empty means the entry is usable."""
    p = []
    if not isinstance(tr, dict):
        return ['not an object']
    arb = en.get('arb', False)
    if not arb:
        for k in ('title', 'desc'):
            if not isinstance(tr.get(k), str) or not tr[k].strip():
                p.append(f'missing or empty "{k}"')
    if 'dose' in tr and not isinstance(tr['dose'], str):
        p.append('"dose" is not a string')
    if 'steps' in en:
        for k in ('steps', 'mistakes'):
            v = tr.get(k)
            if not isinstance(v, list):
                p.append(f'missing "{k}"')
            elif len(v) != len(en[k]):
                p.append(f'{k}: {len(v)} items, English has {len(en[k])}')
            elif any(not isinstance(x, str) or not x.strip() for x in v):
                p.append(f'{k}: empty or non-string item')
        if not isinstance(tr.get('tip'), str) or not tr['tip'].strip():
            p.append('missing or empty "tip"')
    for name, val in strings_of(tr):
        if isinstance(val, str):
            for ch, label in DASHES.items():
                if ch in val:
                    p.append(f'{name}: contains {label}, not allowed')
    return p


def main():
    with open(os.path.join(KEYS, 'moves_extra_en.json'), encoding='utf-8') as f:
        en = json.load(f)
    rows, guides = {}, {}
    for lang in LANGS:
        path = os.path.join(KEYS, f'moves_extra_{lang}.json')
        if not os.path.exists(path):
            print(f'{lang}: no file, skipped')
            continue
        with open(path, encoding='utf-8') as f:
            tr = json.load(f)
        ok = 0
        for mid, e in en.items():
            if mid not in tr:
                print(f'{lang}/{mid}: missing, skipped')
                continue
            probs = check(lang, mid, e, tr[mid])
            if probs:
                print(f'{lang}/{mid}: skipped: ' + '; '.join(probs))
                continue
            t = tr[mid]
            if not e.get('arb'):
                row = [t['title'], t['desc']]
                if 'dose' in e:
                    row.append(t.get('dose') or e['dose'])
                rows.setdefault(lang, {})[mid] = row
            if 'steps' in e:
                guides.setdefault(lang, {})[mid] = (
                    t['steps'], t['mistakes'], t['tip'])
            ok += 1
        for mid in tr:
            if mid not in en:
                print(f'{lang}/{mid}: not in the English file, ignored')
        print(f'{lang}: {ok} of {len(en)} ids written')

    o = []
    o.append('// GENERATED FILE, DO NOT EDIT.\n')
    o.append('// Move text (title, description, steps, mistakes, tip) for the languages\n')
    o.append('// that have no hand-written rows in exercise_guides.dart.\n')
    o.append('// Source: tool/l10n_keys/moves_extra_<lang>.json. Regenerate from the repo\n')
    o.append('// root with:  python tool/moves_extra_gen.py\n\n')
    o.append("import 'exercise_guides.dart' show ExerciseGuide;\n\n")
    o.append('/// [title, description(, dose)] per language, then move id. Not for ARB moves.\n')
    if rows:
        o.append('const kMoveTextExtra = <String, Map<String, List<String>>>{\n')
        for lang in LANGS:
            if lang in rows:
                o.append(f'  {q(lang)}: {{\n')
                for mid, row in rows[lang].items():
                    o.append(f'    {q(mid)}: [{", ".join(q(x) for x in row)}],\n')
                o.append('  },\n')
        o.append('};\n\n')
    else:
        o.append('const kMoveTextExtra = <String, Map<String, List<String>>>{};\n\n')
    o.append('/// Steps, common mistakes and tip per language, then move id.\n')
    if guides:
        o.append('const kGuidesExtra = <String, Map<String, ExerciseGuide>>{\n')
        for lang in LANGS:
            if lang in guides:
                o.append(f'  {q(lang)}: {{\n')
                for mid, (s, m, t) in guides[lang].items():
                    o.append(f'    {q(mid)}: ExerciseGuide([{", ".join(q(x) for x in s)}], '
                             f'[{", ".join(q(x) for x in m)}], {q(t)}),\n')
                o.append('  },\n')
        o.append('};\n')
    else:
        o.append('const kGuidesExtra = <String, Map<String, ExerciseGuide>>{};\n')
    with open(OUT, 'w', encoding='utf-8', newline='\n') as f:
        f.write(''.join(o))
    print('wrote ' + os.path.relpath(OUT, ROOT))


if __name__ == '__main__':
    sys.exit(main())
