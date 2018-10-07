# Elements Of Assembly Language

## Assembly Language Statements

### Statements

* An assembly language source code file consists of a collection of **statements**.
    * Most statements fit easily on an 80-character line, a good limit to observe so that source code can easily be printed or displayed in a window.
    * These can be extended over more than one physical line using backslash (\) characters at the end of each line except the last.

### Comments

* Because assembly language programs are far from self-documenting, it is important to use an adequate number of **comments**. 
    * A comment can be used on any line.    
    * A semicolon (;) begins the comment, and the comment then extends until the end of the line.
    * They are important for the human reader.
    * Comments are ignored by the assembler.

![Comments Example](img/commentsExample.jpg)

### Statement Types

* There are three types of functional assembly language statements
    * Instructions
    * Directives
    * Macros

#### Instructions

An **instruction** is translated by the assembler into 1 or more bytes of object code (machine code) that is executed at run time.

Each instruction corresponds to one of the operations that the 80x86 CPU can perform.

#### Directive

A directive tells the assembler to take some action.

 Such an action generally does not result in machine instructions and may or may not cause object code to be generated.
 
 #### Examples Of Directive
* The directive ".586" tells the assembler to recognize 80x86 instructions that use 32-bit operands. 
```asm
.586
```

* The directive ".MODEL FLAT" tells the assembler to generate code for flat memory model execution.

```asm
.MODEL FLAT
```

Our example program contains several other directives. 

* The directive ".STACK 4096" tells the assembler to generate a request to the operating system to reserve 4096 bytes for the system stack. The system stack is used at execution time for procedure calls and local storage. A stack containing 4096 bytes is large enough for most programs.

```asm
.STACK 4096
```

* The .DATA directive tells the assembler that data items are about to be defined in a data segment. 

```asm
.DATA
```

* Each DWORD directive tells the assembler to reserve a doubleword of memory for data, the first identified with the label number and initialized to FFFFFF97 (−105<sub>10</sub>), the second identified with the label sum and given the default initial value of 00000000.

```asm
.DATA
number DWORD -105
sum    DWORD   ? 
```

* The .CODE directive tells the assembler that the next statements are executable instructions in a code section. 
    * The PROC directive marks the beginning of a procedure.
    * The ENDP directive the end of a procedure.
        * The END directive on the last line tells the assembler to stop assembling statements. 
    * The label main on the PROC and END directives names the procedure.    
    * In the console32 environment you must call your procedure main.(We'll discuss later)
```
.CODE                    ; Start of main program
main PROC
     mov    eax, number  ; first number to EAX
     add    eax, 158     ; add 158
     mov    sum, eax     ; sum to memory 
     
     mov    eax, 0       ; exit with return code 0
     ret
main ENDP
```
