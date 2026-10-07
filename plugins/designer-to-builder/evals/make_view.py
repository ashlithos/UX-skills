import json, os, shutil, sys, glob, re
W = os.path.dirname(os.path.abspath(__file__)); it = sys.argv[1]
src = f"{W}/iteration-{it}"; dst = f"{W}/view-{it}"; shutil.rmtree(dst, ignore_errors=True)
evals = {e["id"]: e for e in json.load(open(f"{W}/evals/evals.json"))["evals"]}
for ed in sorted(glob.glob(src + "/eval-*")):
    eid = int(re.search(r"eval-(\d+)", ed).group(1)); e = evals[eid]
    od = f"{dst}/{os.path.basename(ed)}"; os.makedirs(od)
    exps = []
    for cfg in ["with_skill", "without_skill"]:
        r = f"{ed}/{cfg}"
        if not os.path.exists(r + "/grading.json"): continue
        rd = f"{od}/{cfg}/run-1"; os.makedirs(rd)
        shutil.copytree(r + "/outputs", rd + "/outputs", ignore=shutil.ignore_patterns("state", "*.content.html"))
        for f in ["grading.json", "timing.json"]: shutil.copy(f"{r}/{f}", rd)
        exps = [x["text"] for x in json.load(open(r + "/grading.json"))["expectations"]]
    json.dump({"eval_id": eid, "eval_name": e["name"], "prompt": e["prompt"], "assertions": exps}, open(od + "/eval_metadata.json", "w"), indent=2)
print(dst)
