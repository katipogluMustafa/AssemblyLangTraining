# Registers

## General Purpose Registers
8086 CPU has 8 general purpose registers, each register has its own name: 

* **AX - the accumulator register** ( Divided Into AH / AL ):
    
    * Generates shortest machine code
    
    * Arithmetic, logic and data transfer
    
    * One number must be in AL or AX
    
    * Multiplication & Division
    
    * Input & Output
     

* **BX - the base address register** (divided into BH / BL).
 
* **CX - the count register** (divided into CH / CL):
    
    * Iterative code segments using the LOOP instruction
    
    * Repetitive operations on strings with the REP command
    
    * Count (in CL) of bits to shift and rotate
 

* **DX - the data register** (divided into DH / DL):
    
    * DX:AX concatenated into 32-bit register for some MUL and DIV operations
    
    * Specifying ports in some IN and OUT operations
 
* **SI - source index register**:
    
    * Can be used for pointer addressing of data
    
    * Used as source in some string processing instructions
    
    * Offset address relative to DS
 
* **DI - destination index register**:
    
    * Can be used for pointer addressing of data
    
    * Used as destination in some string processing instructions
    
    * Offset address relative to ES
 
* **BP - base pointer**:

    * Primarily used to access parameters passed via the stack
 
    * Offset address relative to SS
 
* **SP - stack pointer**:
    * Always points to top item on the stack
    * Offset address relative to SS
    * Always points to word (byte at even address)
    * An empty stack will had SP = FFFEh
    
## Segment Registers

* CS - points at the segment containing the current program.

* DS - generally points at segment where variables are defined.

* ES - extra segment register, it's up to a coder to define its usage.

* SS - points at the segment containing the stack.

Although it is possible to store any data in the segment registers, this is never a good idea.

The segment registers have a very special purpose - pointing at accessible blocks of memory. 

* Segment registers work together with general purpose register to access any memory value.     

    * For example if we would like to access memory at the physical address 12345h (hexadecimal), 
        * we should set the DS = 1230h and SI = 0045h.
    
    * This is good, since this way we can access much more memory than with a single register that is limited to 16 bit values.
    
    * CPU makes a calculation of physical address by multiplying the segment register by 10h and adding general purpose register to it (1230h * 10h + 45h = 12345h):

* The address formed with 2 registers is called an **effective address**. 

* By default BX, SI and DI registers work with DS segment register;
* BP and SP work with SS segment register.
* Other general purpose registers cannot form an effective address! 
* Also, although BX can form an effective address, BH and BL cannot! 



## Resources Used
[Inside the 8086 Central Processor Unit (CPU)](https://eclass.upatras.gr/modules/document/file.php/EE649/8086%20Registers.htm)