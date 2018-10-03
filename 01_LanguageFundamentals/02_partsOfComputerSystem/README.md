# Parts of a Computer System

A practical computer system consists of hardware and software.

* The major hardware components of a typical microcomputer system are 
    * a central processing unit (CPU)
    * memory circuits
    * a keyboard for input
    * a visual display
    * specialized input/output devices like a mouse or a network card
    * one or more disk drives to store programs and data.

* Software refers to the programs that the hardware executes, including system software and application software.

## PC Hardware: Memory
 
 The memory in a computer is logically a collection of “slots,” each of which can store 1 byte of instructions or data.    
 * Each memory byte has a numeric label called its physical address. 
 * The 32-bit processors such as the Pentium use 32-bit labels, each of which can be expressed as 8 hex digits. The first address is 00000000<sub>16</sub> and the last address can be as large as the unsigned number FFFFFFFF<sub>16</sub>   
 * Since FFFFFFFF<sub>16</sub> = 4,294,967,295, a 32-bit PC can contain up to 4,294,967,296 bytes of memory, or 4 GB.
    * Remember that
        * 2<sup>10</sup> = 1 KB (kilobyte)
        * 2<sup>20</sup> = 1 MB (megabyte)
        * 2<sup>30</sup>= 1 GB (gigabyte)
        * 2<sup>40</sup> = 1 TB (terabyte)
 * Physically a PC’s memory consists of integrated circuits (ICs). Many of these chips provide random access memory (RAM) that can be written to or read from by program instructions. The contents of RAM chips are lost when the computer’s power is turned off. Other ICs are read only memory (ROM) chips that permanently retain their contents, and which can be read from but not written to.
 
 * The assembly language programs in this text use a **flat memory model**. This means that the programs actually encode 32-bit or 64-bit addresses logically to reference locations in a single memory space where data and instructions are stored.
 
 ![Segmented Memory & Logical picture of PC memory in 32-bit system](img/segmentedMemory.png)
 
 ## PC Hardware: The CPU
 
 The 8086/8088 CPU can execute over 200 different instructions.
 
 This instruction set has been expanded significantly as the 80x86 processor family has grown.
 
 There are other processor families that execute different instruction sets. However, many have a similar architecture, so that the basic principles you learn about 80x86 CPUs also apply to these systems.
 
 An 80x86 CPU contains **registers**, each an internal storage location that can be accessed much more rapidly than a location in RAM.
 
  * **The application registers** are of most concern to the programmer.
    * These are the basic program execution registers, as well as floating point registers, MMX, and XMM registers in some of the processors.
    * A 32-bit 80x86 CPU (from 80386 on) has 16 basic program execution registers.
    * Typical instructions transfer data between these registers and memory or perform operations on data stored in the registers or in memory. 
    * All of these registers have names, and some of them have special purposes.
        * The **EAX**, **EBX**, **ECX**, and **EDX** registers are called data registers or general registers.
        * The EAX register is sometimes known as the accumulator because it is the destination for many arithmetic results. An example of an instruction using the EAX register is
          ```asm
          add eax, 158    
          ```
  ![Register Image Numbering](img/registerBitNumbering.png)
  ![](img/separatelyUsingAX.png)
  ![](img/usingAL-AH.png)
  ![](img/note1.png)
  
  The 8086 through 80286 processors have four 16-bit general registers called AX, BX, CX, and DX. The “E” was added for “extended” with the 32-bit 80386 registers. The 80386 and later architectures effectively include the original 16-bit architecture.
  
  * There are four additional 32-bit registers that Intel also calls general registers: ESI, EDI, ESP, and EBP. In fact, you can use these registers for operations like arithmetic, but normally you should save them for their special purposes.
   * The ESI and EDI registers are index registers, where SI stands for “source index” and DI stands for “destination index.”
        * One of their uses is to indicate memory addresses of the source and destination when strings of characters are copied from one place to another in memory. 
        * They can also be used to implement array indexes.
        * The names SI and DI can be used for the low-order words of ESI and EDI, respectively, but we have no occasion to do this.
   * The ESP register is the stack pointer for the system stack.
        * It is sometimes changed directly by a program, but is more frequently changed automatically when data is pushed onto the stack or popped from the stack.
        *  The address of the instruction following the procedure call instruction is stored on the stack. When it is time to return, this address is retrieved from the stack.          
##  PC Hardware: Input/Output Devices

An assembly language programmer has multiple ways to look at I/O devices. 

* At the lowest level, each device uses a collection of addresses or ports in the I/O address space.
    * There are 64-KB port addresses in the 80x86 architecture, and a typical I/O device uses three to eight ports.
        * These addresses are distinct from ordinary memory addresses. The programmer uses instructions that output data or commands to these ports, or input data or status information from them. Such programming is very tedious and the resulting programs are difficult to reuse with different computer systems.
        * Instead of using separate port addresses, a computer system can be designed to use addresses in the regular memory address space for I/O device access. Such a design is said to use **memory-mapped input/output**. Although memory-mapped I/O is possible with the 80x86, **it is not used with most PCs**.
        * Many operating systems, including Windows XP and later Windows versions, **put the CPU in a protected mode** that does **not allow ordinary application programs directly to access I/O ports**. They provide a variety of input and output procedures that are much easier to use than is port-level I/O.           
        
## PC Software

Without software, computer hardware is virtually useless. Software refers to the programs or procedures that are executed by the hardware.

### PC Software: The Operating System

A general-purpose computer system needs an operating system to enable it to run other programs.

 DOS stands for disk operating system.
 
 * The DOS operating systems provide the user a command line interface. 
 
 * Many users prefer a graphical user interface that displays icons representing tasks or files, so that the user can make a selection by clicking on an icon with a mouse. 
 
 ### PC Software: Text Editors
 
 A **text editor** is a program that allows the user to create or modify text files that are stored on secondary storage like a hard disk.
 
 * A text file is a collection of ASCII codes.
 
**Word processors** are text editors that provide extra services for formatting and printing documents.

### PC Software: Language Translators and the Linker

Language translators are programs that translate a programmer’s source code into a form that can be executed by the computer.

* These are usually not provided with an operating system. Language translators can be classified as **interpreters**, **compilers**, or **assemblers**.

* **Interpreters** directly decipher a source program. To execute a program, an interpreter looks at a line of source code and follows the instructions of that line. 
    * Programs written in the Basic or Lisp languages are often executed by an interpreter. 
    * Although the interpreter itself may be a very efficient program, interpreted programs often execute relatively slowly. 
    * An interpreter is generally convenient because it allows a program to be quickly changed and run. 
    * The interpreter itself is sometimes a large program.

* **Compilers** start with source code and produce object code that consists mostly of instructions to be executed by the intended CPU. 
    * High-level languages such as Fortran, Cobol, C, and C++ are commonly compiled. 
    * The object code produced by a compiler must often be linked or combined with other object code to make a program that can be loaded and executed. 
        * This requires a utility called a **linker**, usually provided with a compiler.       * Instead of producing code for a particular CPU, some compilers produce an intermediate code that can be very efficiently interpreted; this is common with **Java** compilers.    

* An **assembler** is used much like a compiler, but it translates assembly language rather than a high-level language into machine code. 
    * The resulting files must normally be linked to prepare them for execution. Because assembly language is closer to machine code than a high-level language, the job of an assembler is somewhat simpler than the job of a compiler. 
    * Assemblers historically existed before compilers.        
    * add eax, 158 is translated by the assembler into the 5 **object code** bytes
        
            05 00 00 00 9E
            
        * The first byte 05 is the op code (operation code) that says to add the number contained in the next 4 bytes to the doubleword already in the EAX register.        
        *  The doubleword 00 00 00 9E is the 2’s complement representation of 158<sub>10</sub>.

* A **debugger** allows a programmer to control execution of a program, stepping through instructions one at a time, or pausing at a preset breakpoint. 
    * the programmer can examine the contents of variables in a high-level language, or registers or memory in assembly language. 
    * A debugger is useful both to find errors and to “see inside” a computer to find out how it executes programs.       

* **Integrated development environments** use a single interface to access an editor, a compiler, an assembler, and a linker.      

## Summary

The CPU executes instructions and uses its internal registers for instruction operands and results, and to determine addresses of data and instructions stored in memory. 

Input/output at the hardware level uses a separate collection of addresses called “ports.” Input/output is usually done through operating systems procedure calls.

An operating system is a vital software component. Through a command line or a graphical user interface, it interprets the user’s requests to carry out commands, or to load and execute programs.

