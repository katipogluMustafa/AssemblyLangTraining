# Creating Executable by using NASM


## Create Object File

```bash

nasm -gstabs -f elf64 -o hello.o deneme.asm # deneme.asm is the source code, hello.o is the object file name.

```



## Create Executable From Object File

```bash

ld -o hello hello.o # hello -- executable name && hello.o -- object file

```

## Handle Error

If you get this kind of errors, use nasm -hf command and try any other compatible output format


`i386 architecture of input file 'hello.o' is incompatible with i386:x86-64 output`


```nasm -hf```

## Valid output formats

valid output formats for -f are (`*' denotes default):
`
  * bin       flat-form binary files (e.g. DOS .COM, .SYS)
    ith       Intel hex
    srec      Motorola S-records
    aout      Linux a.out object files
    aoutb     NetBSD/FreeBSD a.out object files
    coff      COFF (i386) object files (e.g. DJGPP for DOS)
    elf32     ELF32 (i386) object files (e.g. Linux)
    elf       ELF (short name for ELF32) 
    elf64     ELF64 (x86_64) object files (e.g. Linux)
    as86      Linux as86 (bin86 version 0.3) object files
    obj       MS-DOS 16-bit/32-bit OMF object files
    win32     Microsoft Win32 (i386) object files
    win64     Microsoft Win64 (x86-64) object files
    rdf       Relocatable Dynamic Object File Format v2.0
    ieee      IEEE-695 (LADsoft variant) object file format
    macho32   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (i386) object files
    macho     MACHO (short name for MACHO32)
    macho64   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (x86_64) object files
    dbg       Trace of all info passed to output stage
`    