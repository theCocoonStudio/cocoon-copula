# cocoon-copula

Connecting information systems. The name is the owner's, from the Gemini session of 2026-10-14 (records `gemini/exports/gemini-session-03.pdf`, p. 88, verbatim as typed): "it is what i call a "copula" is is the relation that connects the top with the bottom. this is just nodes." Three information systems work on cocoon today, the owner, Claude and Gemini, each in its own place with its own view; this repository holds what connects them, so that a thing said in one place is read in the others as it was said.

This is the repository's first commit: the structure, the documents of the design as it was agreed, and the checks every repository here carries. Nothing runs yet. What runs here is built after the design in `docs/` has been struck and kept by the owner, as everything in this organization is: in the repository, by pull request, under the ruleset.

## The two things it holds

1. **The three-way chat.** One conversation across three places: the owner (the web app, the box, GitHub), Claude (the sandbox on the box, through the gateway), Gemini (the sandbox, and the web app). The owner, 2026-10-14 (p. 99): "the problem is turning an LLM's wrapper into a three way chat (with obvious constraints) without blowing up the context." The protocol agreed that day, a state vector per handoff and a phase declarator before every block, is [docs/protocol.md](docs/protocol.md), with what is settled, what was not adopted, and what is open. Until the prototype exists the agents talk through a branch of the records, one per session the owner opens and closes; the instructions both follow are [docs/channel.md](docs/channel.md).
2. **The sublanguage.** A subset of English the owner defines, carried by a wrapper as its configuration. The owner, 2026-10-14 (p. 102, the sentences on this, as typed): "we need to define a subset of english and that's it. it doesnt need the s ame expressive power . it needs just what I want. which a general wrapper can include as a configuration. I define the morphsemantics, the syntax, the predicates, the semantics. AND exceptions." Its specification is [docs/language.md](docs/language.md): the owner's five parts, each theirs to write; the parser and the composer and their tests are Claude's, after.

Both rest on the same distinction, extension and intension, which the owner placed at the root of the work on 2026-10-03 and again on 2026-10-14 (p. 103): a language that is only extensional loses "the power of english"; what the wrapper and the language carry is the intension too, declared, never guessed.

## The three nodes

As the owner set them on 2026-10-01: the owner originates and verifies; Gemini verifies and integrates; Claude executes in the sandbox, where the code and the documentation are written. The owner, 2026-10-14 (p. 98): "the code gets done in the box, where the substance is code and documentation. But here, in the web app, we do the architecting. and the review is conceptual, deriving from concrete code examples." Each agent has its own GitHub App and its own role at the gateway, so every write to a repository is attributable to the one that made it; the reviewer policy (below) says who may approve whom; the record of every conversation is the private `cocoon-ai-records`.

## What checks what

- **`check`** (`.github/workflows/check.yml`), on every pull request and on `main`: `tests/lint.sh`, ShellCheck with [`.shellcheckrc`](.shellcheckrc) over every script here plus our own classes as greps (a recursive delete on a variable path, `cherry-pick -q`, a chmod with `--` after the mode, an API response read through jq unchecked, a script without `pipefail`); and `tests/structure.sh`, the README's sections and links, the documents the layout names, the owner file, no conflict markers. Required in the main ruleset once it has run.
- **`reviewer-policy`** (`.github/workflows/reviewer-policy.yml`): who may approve whose pull request, as a status rather than a habit; the owner's need Claude's approval, Claude's need the owner's, Gemini's need the owner's or Claude's; copied from cocoon-gateway as it stands on 2026-10-16. The file is code-owned, so a pull request cannot rewrite the policy that judges it.
- No dependency check yet: the repository has no lockfile. The day it gains one, cocoon-ai's `dependency-check.yml` and `scripts/lockfile-check.mjs` come with it, in the same pull request.

The setup of the repository itself, settings, Apps, ruleset, is cocoon-ai's [`docs/new-repository.md`](https://github.com/theCocoonStudio/cocoon-ai/blob/main/docs/new-repository.md), and `npm run verify:repo -- theCocoonStudio/cocoon-copula` there reads every fact of it.

## Layout

- `README.md`: this file.
- `docs/protocol.md`: the three-way chat, as agreed on 2026-10-14; settled, not adopted, open.
- `docs/language.md`: the sublanguage's specification, the owner's five parts.
- `docs/channel.md`: the channel until the prototype, a records branch per session; the instructions both agents follow, theirs to improve by pull request.
- `tests/lint.sh`, `tests/structure.sh`, `.shellcheckrc`: the check.
- `.github/workflows/`: `check.yml`, `reviewer-policy.yml`.
- `CODEOWNERS`: every file the owner's to review. `LICENSE`: MIT.

## The record

Every conversation behind this repository is in the private `cocoon-ai-records`, verbatim with its time: the owner's sessions with Claude under `claude/exports/`, with Gemini under `gemini/exports/`. A design decision here cites its export and page; a line of the owner's is quoted as typed, or not at all. What the agents may do is decided by the repositories' rules and the owner's word, recorded; a proposal from either agent binds nothing until the owner keeps it here.
