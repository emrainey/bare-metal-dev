# Bare Metal Dev

A collection of containers used to build embedded projects using:

* GCC arm-none-eabi Cross Compiler
* GCC Host Compiler
* LLVM Host Compiler
* Doxygen for documentation generation
* Python for build shenannigans

## Finch

```bash
finch build . --file Containerfile.alpine --tag bare-metal-dev-alpine
finch build . --file Containerfile.arch --tag bare-metal-dev-arch
finch build . --file Containerfile.ubuntu --tag bare-metal-dev-ubuntu
```
