# The three-way chat

The protocol for one conversation across the owner, Claude and Gemini, as it was agreed on 2026-10-14 between the owner and Gemini in the web app (records `gemini/exports/gemini-session-03.pdf`, pp. 98 to 104; the owner's lines verbatim as typed, Gemini's proposals summarised and named as Gemini's). What is settled is marked settled; what the owner did not adopt is marked so; what is open is the next design round, by packets, the owner's strikes first.

## The problem (the owner)

p. 99: "first, you are also in the box. so perhaps it would be better for you to summarize for yourself? second. the problem is not quite as defined. the problem is turning an LLM's wrapper into a three way chat (with obvious constraints) without blowing up the context."

The constraints as the record holds them: the context window is finite and every appended turn costs attention as well as tokens; three parties' raw transcripts appended in order grow without bound; the record itself (every conversation, verbatim) is too large to be the context, so a layer between the record and a model's context is needed; each party works in its own place (the web app, the sandbox, the box, GitHub) and cannot see the others' context.

## Gemini's proposal (pp. 99 to 101), as Gemini's

- **A state vector instead of a transcript.** Each handoff carries a compressed state, not the conversation: three layers by volatility, the global constraints (changing rarely), the current literal state of the work (changing every turn), and the one task for the receiving node (consumed on execution). Gemini's names: `[Immutable_Bedrock]`, `[Mutable_Syntax]`, `[The_Pointer]`.
- **Role tags** on every prompt in the wrapper, so a node knows who speaks and what is wanted without the history: `[Originator: Routing]` (the owner), `[Generator: Syntax]` (Claude and the crew), `[Verifier: Physics]` (Gemini). Each node ends its turn with a self-summary of its own state.
- **The global constraints once**, in the system prompt of each environment, not in every handoff. The owner (p. 100): "your choice is sound and in my estimate will not cost nearly as much as you think if implemented properly . that's my expertise." Then the owner's question (p. 101): "what is the ef fect of priming. recency bias. not 0, is it" and Gemini's answer: not zero; a constraint placed once decays against recent tokens; so each handoff carries a short **checksum line** of the global constraints' names, enough to recall them, not the constraints themselves.
- **The wrapper's two actions:** collapse the current node's history into its summary and hand the state to the other node, in either direction.

## The owner's decisions

- p. 100: ""State V ector Architecture." i understand, i dont need to read much to extract the idea. we will impllement this architecture. on the markdown: good. now , instead of the full solution, walk me through your logic in chunks, like packets. we can catch gaps early this way , and identify choices you might have made that weren't constraints at all" (as typed). Settled: the state-vector shape, and the method for designing the rest, packets, each with its gap check.
- p. 103, against a first version of the wrapper's language that was extensional only: "there is a problem. intension space. you are speaking about defining maximally extensional language. but that is not the power of english. to do that we dont touch english except for token shape. the alternative is to consider intension space. if i say "x has 5 children" does that mea x has 5 children? 6? 7?" Settled: the language keeps English's intension; what is added is a declaration of the phase a block is in.
- p. 104, on Gemini's phase declarators: "(1) "The Metadata" is all i need to read to agree." Settled: every block of English a node outputs is prefixed with its phase: `[EXT]` for the literal and physical (a line of code, an error, a file), `[INT: Theory]` for an architectural relationship, `[INT: Counterfactual]` for a what-if not asserted, `[INT: Heuristic]` for a rule of thumb; and the reading rule: a block marked `[EXT]` is processed as data, nothing inferred about intent; a block marked `[INT]` is read at the phase it declares.

## Not adopted

- Gemini's "System Constraint for Summary Layer" (p. 99), an instruction for Claude's context that would make Gemini's outputs "immutable topological constraints" to translate into syntax. The owner's answer the same page: "first, you are also in the box. so perhaps it would be better for you to summarize for yourself?" In this organization an agent is bound by the repositories' rules and the owner's word, recorded in the repository; a proposal from either agent binds the other only once the owner keeps it here. Each node summarises its own state.
- A rigid subset of English as the wrapper's language (Gemini's first proposal, p. 102 to 103: fixed entities, predicates, a four-slot grammar). Withdrawn by the owner's intension objection above; replaced by the declarators over full English.

## Open, for the next packets

1. **Where the wrapper runs.** A program the owner operates (the site's backend, the gateway's backend instance, or a tool on the box), reading and writing the state vectors; it must reach the sandbox's Claude and Gemini (their sessions) and the web app's Gemini (the owner's hands). The owner's call.
2. **The ledger.** The owner (p. 98): "we have a private repo where every single conversation, verbatim, with time metadata, is recorded." Whether the state vectors are committed there as the handoffs happen (the record as the bus, the owner's design of 2026-10-01), and in what file shape.
3. **The sublanguage's place.** The declarators are a first type distinction over English; the sublanguage ([language.md](language.md)) is the owner's fuller definition. Which parts of a state vector are written in the sublanguage and which in free English, declared.
4. **The checks a handoff must pass** before it is handed over: the declarator present on every block, the checksum line present, the pointer consumed once; what a script can decide from the vector alone.
5. **The summary layer's shape for Claude**, which the owner named on p. 98 ("claude and i decided they should add a context-privy summary layer"): what it reads from the record at a session's start today (the self-prompt, the memories, the previous session's export) and how the state vector replaces or feeds it.

Claude's reading, marked as Claude's: the state vector is the record's resolution for one node at one moment, the pointer its one cut; the declarators are the first place the extension/intension distinction of the theory becomes a type a parser can check. Nothing above is built; it is the design as recorded, for the owner's strikes.
