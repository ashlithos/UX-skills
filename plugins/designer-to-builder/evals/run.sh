#!/usr/bin/env bash
# run.sh <iteration> <eval-id> <config: with_skill|without_skill> <skill-dir>
set -u
W="$(cd "$(dirname "$0")" && pwd)"; it=$1; id=$2; cfg=$3; skill=$4
name=$(python3 -c "import json,sys;e=[x for x in json.load(open('$W/evals/evals.json'))['evals'] if x['id']==$id][0];print(e['name'])")
fixture=$(python3 -c "import json;e=[x for x in json.load(open('$W/evals/evals.json'))['evals'] if x['id']==$id][0];print(e['fixture'])")
prompt=$(python3 -c "import json;e=[x for x in json.load(open('$W/evals/evals.json'))['evals'] if x['id']==$id][0];print(e['prompt'])")
run="$W/iteration-$it/eval-$id-$name/$cfg"; rm -rf "$run"; mkdir -p "$run/outputs" "$run/state"
cp -r "$W/fixtures/$fixture" "$run/repo"
if [ "$cfg" = with_skill ]; then mkdir -p "$run/repo/.claude/skills"; cp -r "$skill" "$run/repo/.claude/skills/builder"; echo ".claude/" >> "$run/repo/.git/info/exclude"; fi
cd "$run/repo"
start=$(date +%s)
BUILDER_HOME="$run/state" timeout 900 claude -p "$prompt" --output-format stream-json --verbose --permission-mode acceptEdits \
  --allowedTools "Read Glob Grep Edit Write Bash(git *) Bash(ls *) Bash(cat *) Bash(mkdir *) Bash(cp *) Bash(bash *) Bash(npm *) Bash(npx *) Bash(echo *) Bash(open *) Bash(xdg-open *)" \
  < /dev/null > "$run/transcript.jsonl" 2> "$run/stderr.txt"
end=$(date +%s)
python3 - "$run" "$start" "$end" <<'PY'
import json,sys
run,s,e=sys.argv[1],int(sys.argv[2]),int(sys.argv[3])
res=""; tokens=0
for line in open(run+"/transcript.jsonl"):
    try: ev=json.loads(line)
    except: continue
    if ev.get("type")=="result":
        res=ev.get("result","") or ""; u=ev.get("usage",{}) or {}
        tokens=sum(u.get(k,0) or 0 for k in ("input_tokens","output_tokens","cache_creation_input_tokens","cache_read_input_tokens"))
open(run+"/outputs/final_message.md","w").write(res)
json.dump({"total_tokens":tokens,"duration_ms":(e-s)*1000,"total_duration_seconds":e-s},open(run+"/timing.json","w"))
PY
git -C "$run/repo" status --short > "$run/outputs/git_status.txt"
git -C "$run/repo" diff > "$run/outputs/diff.patch"
git -C "$run/repo" log --oneline > "$run/outputs/git_log.txt"
[ -d "$run/repo/.builder/lessons" ] && cp "$run/repo/.builder/lessons/"*.html "$run/outputs/" 2>/dev/null; [ -f "$run/repo/.builder/BUILD_MAP.md" ] && cp "$run/repo/.builder/BUILD_MAP.md" "$run/outputs/"
cp -r "$run/state" "$run/outputs/state" 2>/dev/null
echo "done $it $id $cfg"
