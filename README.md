# Bare Metal Dev

A collection of containers used to build embedded projects using:

* GCC arm-none-eabi Cross Compiler (13.x or later series)
* GCC Host Compiler (13.x or later series)
* LLVM Host Compiler (19.x or 20.x series)
* Doxygen for documentation generation
* GCOV for code coverage analysis
* CMake for build system management
* Make for build orchestration
* Ninja for build orchestration
* GDB for debugging (both host and target)
* OpenOCD for on-chip debugging
* Python for build shenanigans

## Version Matching

Internally to each distro, the cross compiler version and the host compiler version should match, as this helps with compatibility between the two. The LLVM version is less important, but should be as recent as possible to ensure good support for the latest C++ standards and features.

## Note on Vendor Tools

Vendor specific tools will have to be added by *you* as there's normally an EULA preventing redistribution.

## Finch

```bash
# Docker or Finch will do

# Smallest, has musl libc and overly simple linker
finch build . --file Containerfile.alpine --tag bare-metal-dev-alpine
# Very hard to build on ARM64 right now
finch build . --file Containerfile.arch --tag bare-metal-dev-arch
# Full featured, Debian based
finch build . --file Containerfile.debian --tag bare-metal-dev-debian
# Full featured, Ubuntu based (still Debian under the hood)
finch build . --file Containerfile.ubuntu --tag bare-metal-dev-ubuntu
```

## TODO

* Add SBOM generation for each image (SPDX and/or CycloneDX), likely via Syft or Docker Scout, and export artifacts under `build/`.
