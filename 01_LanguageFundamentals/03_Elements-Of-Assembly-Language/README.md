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
```asm
.CODE                    ; Start of main program
main PROC
     mov    eax, number  ; first number to EAX
     add    eax, 158     ; add 158
     mov    sum, eax     ; sum to memory 
     
     mov    eax, 0       ; exit with return code 0
     ret
main ENDP
```
---

A **macro** is “shorthand” for a sequence of other statements—instructions, directives, or even other macros.

A statement that is more than just a comment almost always contains a mnemonic that identifies the purpose of the statement, and may have three other fields: name, operand, and comment. 

`name mnemonic operand(s) ; comment`

```asm
zeroCount: mov ecx, 0 ; initialize count to zero
```

* The name field ends with a colon (:) when used with an instruction. 
    * However, when used with a directive, the name field has no colon. 

* The mnemonic in a statement indicates a specific instruction, directive, or macro.

* Some statements have no operand, others have one, others have more. 
    * If there is more than one, operands are separated by commas; spaces can also be added. 
    * Sometimes a single operand has components with spaces between them, making it look like more than one operand.
      
* One use for the name field is symbolically to reference an instruction’s address in memory. Other instructions can then easily refer to the labeled instruction.

* If the add instruction in the sample program needed to be repeatedly executed in a program loop, then it could be coded 
```asm
addLoop: add eax, 158
```

* The instruction can then be the destination of a jmp (jump) instruction, the assembly language version of a goto:
    * Notice that the colon does not appear at the end of the name addLoop in the jmp instruction.
```asm
jmp addLoop ; repeat addition
```

* High-level language loop structures like while or for are not available in machine language. However, they can be implemented using jmp or other instructions.

* It is often useful to have a line of source code consisting of just a name, for example    

```asm
endWhile1:
```    

* Such a label might mark the end of a while loop.
    * Such a label might mark the end of a while loop. Technically it references the address of whatever instruction follows the loop, but you don’t have to know what that next statement is to complete coding of the while loop.

---

* Names and other identifiers used in assembly language are formed from letters, digits, and special characters.
    * The allowable special characters are underscore (_), question mark (?), dollar sign ($), and at sign (@). 
    
* A name may not begin with a digit. An identifier may have up to 247 characters, so that it is easy to form meaningful names.
    *  The assembler does not allow instruction mnemonics, directive mnemonics, register designations, and other words that have a special meaning to the assembler to be used as names.

* **Assembly language statements can be entered using either uppercase or lowercase letters**.            
    * Normally the assembler does not distinguish between uppercase and lowercase.
    * It can be instructed to distinguish within identifiers, but this is only needed when you are linking to a program written in a language that is case-sensitive.

* The assembler accepts code that is almost impossible for a person to read.
    * However, since your programs will also be read by other people, you should make your code as readable as possible. Good program formatting and use of lowercase letters will help.

* Blank lines are allowed in an assembly language source file; they visually separate sections of assembly language code, just like breaking a written narrative into paragraphs.        