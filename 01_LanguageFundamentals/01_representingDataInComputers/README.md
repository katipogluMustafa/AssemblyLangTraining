# Representing Data In Computers

## Unsigned and Signed Integers

So far we know how to represent numbers by using ASCII codes or by using binary integers (often expressed in hex). However, there are two problems with these methods: 
 
 1. the number of bits available for representing a number is limited
 2. it is not clear how to represent a negative number.


For the Intel 80x86 family, 8 bits, a byte; 16 bits, a word; 32 bits, a doubleword; and 64 bits, a quadword.

**The 2’s Complement** system allows representation of negative numbers. Numbers will be a fixed length, so that you might refer to the “doubleword-length 2’s complement representation” of a number. 
 
The 2’s complement representation for a non-negative number is, you represent the number in binary with enough leading zeros to fill up the desired length.
    
* For a positive number, the leftmost bit must be zero. This means, for example, that the most positive number that can be represented in word-size 2’s complement form is 0111111111111111<sub>2</sub> or 7FFF<sub>16</sub> or 32767<sub>10</sub>.  
* The leftmost bit is always 1 in the 2’s complement representation of a negative number.

* You cannot simply change the leading bit from 0 to 1 to get the negative version of a number.

![Example 1](img/example1.png)

![Example 2](img/Example2.png)

* Positive numbers written in hex can be identified by a leading hex digit of 0 through 7.

* Negative numbers are distinguished by a leading bit of 1, corresponding to hex digits of 8 through F.

## Integer Addition and Subtraction

One of the reasons that the 2’s complement representation scheme is commonly used to store signed integers in computers is that addition and subtraction operations for signed integers are identical to the corresponding operations for unsigned integers. This means that the CPU does not need separate circuitry for signed and unsigned addition or subtraction operations.

![Addition Example 1](img/addition1.jpg)

![Addition Example 2](img/addition2.jpg)

Each of the last two additions has a carry out of the usual high-order bit position into an extra bit. The remaining bits do not give the correct unsigned result. In fact, carry always indicates that the answer is wrong if the operands are interpreted as unsigned. Although in these examples the remaining bits gave the correct 2’s complement representation, this is not always the case, even for signed numbers. Consider the addition of the following two positive numbers:

![Addition Example 3](img/addition3.jpg)

There was no carry out of the high-order bit, but the signed interpretation is plainly incorrect since AC99 represents the negative number −21351. Intuitively what went wrong is that the decimal sum 44185 is bigger than the maximum value 32767 that can be stored in the 2 bytes of a word. (See Exercise 1.3.8.) However, when these numbers are interpreted as unsigned, the sum is correct.

Here is another example showing a “wrong” answer, this time resulting from adding two numbers that are negative in their signed interpretation.

![Addition Example 4](img/addition4.jpg)

This time there is a carry, but the remaining four hex digits 76EF cannot be the correct signed answer since they represent the positive number 30447. Again, intuition tells you that something had to go wrong because −32768 is the most negative number that can be stored in a word.

* In the previous examples with “incorrect” signed interpretations, **overflow** occurred.

* Computer hardware can detect overflow as it performs addition, and the signed sum will be correct if there is no overflow.

* The computer actually performs addition in binary, of course, and the process is logically a right-to-left pairwise addition of bits, very similar to the procedure that humans use for decimal addition. As the computer adds a pair of bits, sometimes there is a carry (of 1) into the next column to the left. This carry is added to the sum of these 2 bits, and so on. The column of particular interest is the leftmost one, the sign position. There may be a carry into this position and/or a carry out of this position into the “extra” bit. This “carry out” (into the extra bit) is what was called just “carry” earlier and was seen as the extra hex 1.

![Carry Table](img/carryTable.jpg)

*  The table can be summarized by saying that overflow occurs when the number of carries into the sign position is different from the number of carries out of the sign position.

### Overflow In Addition

![Overflow in addition Example 1](img/overflowInAddition1.png)

![Overflow in addition Example 2](img/overflowInAddition2.png)

![Overflow in addition Example 3](img/overflowInAddition3.png)

![Overflow in addition Example 4](img/overflowInAddition4.png)

![Overflow in addition Example 5](img/overflowInAddition5.png)

![Overflow in addition Example 6](img/overflowInAddition6.png)

![Overflow in addition Example 7](img/overflowInAddition7.png)

### Overflow In Subtraction

* A computer detects overflow in subtraction by determining whether overflow occurs in the corresponding addition problem.

* If overflow occurs in the addition problem, then it occurs in the original subtraction problem; if it does not occur in the addition, then it does not occur in the original subtraction.

![Overflow in Subtraction](img/overflowInSubtraction.png)

See [Exercises](Exercises/README.md)



