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


## Resources Used
[Inside the 8086 Central Processor Unit (CPU)](https://eclass.upatras.gr/modules/document/file.php/EE649/8086%20Registers.htm)