# Basic Instructions

* The Intel 80x86 `mov` instruction is used to copy data from one location to another. All but a few combinations of source and destination locations are allowed. 

* The `xchg` instruction swaps the data stored at two locations.

* The 80x86 architecture has a full set of instructions for arithmetic with byte-length, word-length, doubleword-length, and quadword-length (in 64-bit mode) integers. 

* The add and sub instructions perform addition and subtraction; 

* inc and dec add and subtract 1, respectively. 

* The neg instruction negates its operand; that is, it takes the 2’s complement of the operand.

* There are two multiplication and two division mnemonics. 
    * The imul and idiv instructions assume that their operands are signed 2’s complement numbers; 
    * mul and div assume that their operands are unsigned. 
 
 * Many multiplication instructions start with single-length operands and produce double-length products; other formats form a product the same length as the factors. 
 
 * Division instructions always start with a double-length dividend and single-length divisor; 
 
 * The operation results in a single-length quotient and a single-length remainder. 
 
 * The cbw, cwd, cdq, and cqo instructions aid in producing a double-length dividend before signed division.
 
 * Flag settings indicate possible errors during multiplication; an error during division produces a hardware exception that invokes a procedure to handle the error.

* Instructions that have operands in registers are generally faster than those that reference memory locations. 

* **Multiplication and division instructions are slower than addition and subtraction instructions**.