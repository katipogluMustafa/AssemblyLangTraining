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
        