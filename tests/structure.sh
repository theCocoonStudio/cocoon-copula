#!/bin/bash
# The structure: what a script can decide from the files alone, refused before a review reads them.
# The README's sections and the documents its layout names exist; every local link in the README
# resolves; the owner file owns every path; no conflict marker in any text file (cocoon-ai's README
# shipped with four on 2026-10-07). Exit 1 on anything, each problem on its own line.
set -euo pipefail
cd "$(dirname "$0")/.." || exit 1
TOOLS=(
  grep   # the sections, the links, the markers
  git    # the tracked files
)
for tool in "${TOOLS[@]}"; do
  command -v "$tool" >/dev/null || { echo "structure: '$tool' is required" >&2; exit 1; }
done
fail=0
for section in '## The two things it holds' '## The three nodes' '## What checks what' '## Layout' '## The record'; do
  grep -qF -- "$section" README.md || { echo "structure: README.md lacks the section '$section'"; fail=1; }
done
for doc in docs/protocol.md docs/language.md docs/channel.md LICENSE CODEOWNERS; do
  [ -f "$doc" ] || { echo "structure: $doc is missing; the README's layout names it"; fail=1; }
done
while IFS= read -r link; do
  [ -e "$link" ] || { echo "structure: README.md links to $link, which does not exist"; fail=1; }
done < <(grep -oE '\]\([^)#:]+\.(md|sh|yml)\)' README.md | sed -E 's/^\]\((.*)\)$/\1/')
grep -qE '^\*[[:space:]]+@theCocoonStudio' CODEOWNERS || { echo "structure: CODEOWNERS does not name the owner for every path (* @theCocoonStudio)"; fail=1; }
while IFS= read -r f; do
  if grep -nE '^(<<<<<<< |=======$|>>>>>>> )' -- "$f"; then echo "structure: $f carries a conflict marker"; fail=1; fi
done < <(git ls-files -- '*.md' '*.sh' '*.yml' 'CODEOWNERS' 'LICENSE')
[ $fail -eq 0 ] && echo "structure: clean"
exit $fail
