# Bare Metal Dev

A collection of containers used to build embedded projects using:

* GCC arm-none-eabi Cross Compiler
* GCC Host Compiler 
* LLVM Host Compiler
* Doxygen for documentation generation
* Python for build shenannigans

## Finch

```bash
cd ../alpine
finch build . --tag bare-metal-dev-alpine
cd ../arch
finch biuld . --tag bare-metal-dev-arch
cd ../ubuntu
finch build . --tag bare-metal-dev-ubuntu
```



