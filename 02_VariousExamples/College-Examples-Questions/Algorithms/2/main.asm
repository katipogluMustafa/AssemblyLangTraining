; Find Factorial of a number
; change assign the number to box to find factorial of the number

org 100h

mov bx,5 ; assign here
mov ax,1
mov SI, 1

;find loop iteration count
mov cx, bx
sub cx, SI
INC cx ; cx = n - i + 1

L: mul SI
   INC SI
   loop L


ret

; Run this code on emu8086