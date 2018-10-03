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