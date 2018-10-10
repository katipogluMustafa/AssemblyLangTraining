# Basic Instructions

## mov
Java assignment statement
```java 
count = number
```
might correspond directly to the assembly language instruction

```asm
mov count, ecx  ; count := number
; assuming that the ECX register contains the value of number
```

* You cannot have both source and destination in memory.
```asm
mov count, number ; illegal for two memory operands
; is not allowed if both count and number reference memory locations.
```

* mov instructions with byte destination
    * ![mov instructions with byte destination](img/1.jpg)
    * look at the row of the table where the source and destination both say register 8. This row actually stands for mov instructions with 64 possible operand combinations—any of AL, AH, BL, BH, CL, CH, DL, or DH for the source or for the destination. The opcode for any of these possibilities is always 8A, and the second object code byte identifies the registers.
    
    * This byte, which Intel documentation refers to as the **ModR/M** byte, has many uses in encoding instructions.
    
    *  The ModR/M byte always has three fields, the first of which is a 2-bit Mod (“mode”) field in bits 7 and 6. The other two fields are each 3 bits long, and these fields have different meanings in different instructions. However, for instructions with two register operands, Mod=11 and the next field (called Reg for “register”) in bits 5, 4, and 3 encodes the destination, while the final field (called R/M for “register/memory”) in bits 2, 1, and 0 encodes the source register.
    * The 8-bit register encodings used are shown below
    * ![](img/2.jpg)
    *   
        ```asm
        mov ch, bl ; 8A EB
        ```
        * where the ModR/M byte EB is pieced together from 11 101 011; 
        * 11 for register to register
        * 101 for CH
        * 011 for BL.   
        
* The accumulator is still the register of choice because the object code is sometimes slightly more compact (takes fewer bytes) when the accumulator is used. AL is the 8-bit accumulator, and because it takes 5 bytes of object code instead of 6 to use the A0 opcode, this is the choice that the assembler makes for destination AL and memory direct source.        