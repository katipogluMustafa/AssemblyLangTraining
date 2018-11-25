# Branching And Looping

Computers derive much of their power from their ability to
selectively execute code and from the speed at which they
execute repetitive algorithms. 

Programs in high-level languages like Java or C++ use **if–then**, **if–then–else**, and **case structures** to selectively execute code, and loop structures such
as while (pre-test) loops, until (post-test) loops, and for
(counter-controlled) loops to repetitively execute code. 

Some high-level languages have a goto statement for unconditional
branching. 

Somewhat more primitive languages (like older
versions of FORTRAN or BASIC) depend on fairly simple if
statements and an abundance of goto statements for both
selective execution and looping.

The 80x86 assembly language programmer’s job is similar to
the old FORTRAN or BASIC programmer’s job. The 80x86
microprocessor can execute some instructions that are roughly
comparable to for statements, but most branching and looping
is done with 80x86 statements that are similar to, but even
more primitive than, simple if and goto statements.

The
objective of this chapter is to describe the machine
implementation of design/language structures such as if–then,
if–then–else, while, until, and for. Loops are often used with
arrays, and addressing modes useful for array access are also
covered.