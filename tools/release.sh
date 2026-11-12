#!/bin/sh
# Usage: tools/release.sh /path/to/game.html "What changed"
# Copies the new game in, bumps the build number, and writes the notes
# that players see in the "Update available" message.
set -e
cd "$(dirname "$0")/.."
cp "$1" www/game.html
python3 - "$2" <<'PY'
import json,sys
p='www/version.json';v=json.load(open(p))
v['build']=int(v.get('build',0))+1;v['notes']=sys.argv[1]
open(p,'w').write(json.dumps(v)+'\n');print('build',v['build'])
PY
