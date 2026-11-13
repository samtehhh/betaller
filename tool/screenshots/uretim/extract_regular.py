import os, sys
from fontTools.ttLib import TTCollection
WIN = r"C:\Windows\Fonts"
OUT = os.path.join(sys.argv[1], ".fonts")
JOBS = {"NirmalaUI-Regular": ("Nirmala.ttc", "Nirmala UI"),
        "YuGothic-Regular": ("YuGothR.ttc", "Yu Gothic Regular"),
        "YaHei-Regular": ("msyh.ttc", "Microsoft YaHei"),
        "JhengHei-Regular": ("msjh.ttc", "Microsoft JhengHei")}
for dst, (src, want) in JOBS.items():
    faces = TTCollection(os.path.join(WIN, src)).fonts
    nm = [(f["name"].getDebugName(4)) for f in faces]
    print(src, nm)
    i = nm.index(want)
    faces[i].save(os.path.join(OUT, dst + ".ttf"))
    print("OK", dst, i)
