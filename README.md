# XProc 3.0 grammar and step library

This repository contains the XProc 3.0 RELAX NG grammar.

Building this repository combines the the core XProc grammar with the
grammar fragments for each of the official step specifications. It
also produces `library.xpl`, a step library for the steps.

The resulting grammar will validate either XProc 1.0 or XProc 3.0.

Note: the files in the `/steps/` directory are published automatically
by the `3.0-steps` repository. Do not edit those files!

## Circular dependency

The grammar is stored in a separate repository because the language
specification and the step specifications are in separate repositories
and they both depend on the grammar.

There is a circular dependency here, but it’s managed as follows:

1. Updating this repository will republish the grammar and library.

2. When the `3.0-steps` repository is published, it automatically
   updates the files in `/steps/`, which republishes the grammar and
   the library.
