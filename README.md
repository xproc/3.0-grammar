# XProc 3.0 grammar and step library

This repository contains the XProc 3.0 RELAX NG grammar.

Building this repository combines the the core XProc grammar with the
grammar fragments for each of the official step specifications. It
also produces `library.xpl`, a step library for the steps.

The resulting grammar will validate either XProc 1.0 or XProc 3.0.

## Circular dependency

The grammar is stored in a separate repository because the language
specification and the step specifications are in separate repositories
and they both depend on the grammar.

Unfortunately, the grammar also depends on the specifications, so
there’s an unavoidable circular dependency here.

1. If the core grammar changes, rebuild this repository then rebuild
   the language and step repositories so that the proper core grammar
   is reflected in the language and step specifications. (Pushing a change
   to this repository will automatically rebuild it.)
    
2. If a grammar fragment in the language specification or a
   `p:declare-step` template in a step specification changes, rebuild
   this grammar repository _after_ publishing the updated specification
   so that those changes are reflected in
   https://grammar.xproc.org/xproc-3.0/library.xpl
