# The sublanguage

A subset of English, the owner's, carried by a wrapper as its configuration. The owner, 2026-10-14 (records `gemini/exports/gemini-session-03.pdf`, p. 102, the sentences on this, verbatim as typed): "we need to define a subset of english and that's it. it doesnt need the s ame expressive power . it needs just what I want. which a general wrapper can include as a configuration. I define the morphsemantics, the syntax, the predicates, the semantics. AND exceptions."

The constraint on every part, from the same day (p. 103): the language is not maximally extensional. "that is not the power of english. to do that we dont touch english except for token shape. the alternative is to consider intension space. if i say "x has 5 children" does that mea x has 5 children? 6? 7?" So the specification below carries intension: a sentence's meaning depends on the phase it is read in, and the phase is declared ([protocol.md](protocol.md)), never guessed.

The division of jobs, from the owner's plan of 2026-10-07 (records, the export of that session): the owner originates the fragment; Claude verifies it, builds the parser and the composer, and writes the tests as sentences with their trees and logical forms; the construction classes come first, instructions are generated per class after ("you need the class to test").

## 1. Morphosemantics

The owner's to write: the units that carry meaning and their shapes (the token shape is the one thing touched in English).

## 2. Syntax

The owner's to write. The owner's plan of 2026-10-07: the syntax reduced to CPs, NPs and VPs; constructions as the unit of test.

## 3. Predicates

The owner's to write: the relations the language can state.

## 4. Semantics

The owner's to write: how meanings compose (the owner's plan of 2026-10-07 named Heim and Kratzer composition over Chomsky-style trees, narrowed to an abstraction layer where a sentence forms its trees deterministically), and the intension: what a sentence could have meant, by phase.

## 5. Exceptions

The owner's to write: what the language refuses, and how a node signals a gap it cannot express without inventing (Gemini's proposal for this, p. 103: a halt that names the opaque variable and where it sits; not yet the owner's).

## What Claude builds, after

The parser (a sentence to its trees), the composer (a tree to its logical form at a declared phase), and the tests: every construction class as sentences with the trees and forms the owner expects; a sentence outside the fragment refused, not guessed. Nothing is written until parts 1 to 5 are the owner's.
