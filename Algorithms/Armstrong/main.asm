; Find if the given number is Armstrong Number
; Assign any number you want to try to CX

org 100h

    mov CX, 1506 ; assign here
    mov SP, CX
    XOR bx,bx
    ; While Starting
 LD:cmp cx,0
    JZ LDSON

    ; Before going into inner loop


    xor ax,ax
    xor DX,DX
    mov ax,cx
    mov DI,10
    DIV DI
    xor SI,SI
    mov SI,DX
    mov cx, ax

    ; Inner Loop Start

    mov ax,SI
    mul ax
    mul ax
    add bx,ax

    ; Inner Loop End

    ; Before going out of inner loop

    jmp LD

LDSON:   mov ax,1
         cmp SP,bx
         je LAST
         mov ax,0
LAST:


ret