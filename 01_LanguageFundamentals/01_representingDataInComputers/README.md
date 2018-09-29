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

