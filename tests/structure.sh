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
for doc in docs/protocol.md docs/language.md docs/channel.md LICENSE CODEOWNERS .github/workflows/records-guard.yml; do
  [ -f "$doc" ] || { echo "structure: $doc is missing; the README's layout names it"; fail=1; }
done
while IFS= read -r link; do
  [ -e "$link" ] || { echo "structure: README.md links to $link, which does not exist"; fail=1; }
done < <(grep -oE '\]\([^)#:]+\.(md|sh|yml)\)' README.md | sed -E 's/^\]\((.*)\)$/\1/')
grep -qE '^\*[[:space:]]+@theCocoonStudio' CODEOWNERS || { echo "structure: CODEOWNERS does not name the owner for every path (* @theCocoonStudio)"; fail=1; }
while IFS= read -r f; do
  if grep -nE '^(<<<<<<< |=======$|>>>>>>> )' -- "$f"; then echo "structure: $f carries a conflict marker"; fail=1; fi
done < <(git ls-files -- '*.md' '*.sh' '*.yml' 'CODEOWNERS' 'LICENSE')
# 2026-10-19: no record of a session or a chat is ever tracked here (a private session reached a public branch
# on 2026-10-17 and nothing refused it), and no project .npmrc (npm reads it over the user's config and it would
# switch install scripts back on at the sandbox's start); the records-guard workflow refuses the same at the push
if git ls-files | grep -nE '^(records|chat|exports)/|(^|/)export-(claude|gemini)\.md$|(^|/)[0-9]{4}-[0-9]{2}-[0-9]{2}-session-[0-9a-f]{8}\.(md|jsonl)$|(^|/)\.npmrc$'; then echo "structure: a record or an .npmrc is tracked; neither ever belongs in a public repository"; fail=1; fi
[ $fail -eq 0 ] && echo "structure: clean"
exit $fail
