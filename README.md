# usign

usign provides public key signatures using the ed25519 algorithm.

## Build

Build requirements:
* A C99 Compiler
* GNU Make

When building for Windows NT, execute GNU Make within the *Native Tools Command Prompt*, provided by Visual Studio.

To build and install the package run:

```
make
make install
```

## About

The home page for the algorithm is http://ed25519.cr.yp.to/.
It is described in the following paper:

Daniel J. Bernstein, Niels Duif, Tanja Lange, Peter Schwabe, Bo-Yin Yang
High-speed high-security signatures
Journal of Cryptographic Engineering 2 (2012), 77-89
2011-09-26
http://ed25519.cr.yp.to/ed25519-20110926.pdf

Signatures and keys are compatible to OpenBSD's signify utility:
http://man.openbsd.org/OpenBSD-current/man1/signify.1
