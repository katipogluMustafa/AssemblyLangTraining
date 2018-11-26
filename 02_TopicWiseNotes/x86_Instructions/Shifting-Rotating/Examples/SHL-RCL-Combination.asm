; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    ; Code Start
    
    mov cx, 7

    xor bx,bx
    
    mov ax,-1

st: shl ax, 1
    rcl bx, 1
    
    loop st        
    
    
    ; Code END
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
