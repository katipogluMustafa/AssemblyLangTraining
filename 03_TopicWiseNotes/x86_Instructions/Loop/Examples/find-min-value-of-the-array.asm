; multi-segment executable file template.

data segment
    arr  db 7, 1, 5, 9
    min  db ?
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
    
    
    lea SI, arr
    mov bl, [SI]
    mov min, bl
    
    INC SI
    mov bl, [SI]
    
    mov cx, 4
    
st: cmp bl,min
    JNB en
     
    
    mov min, bl 
    
    
en: INC SI
    mov bl, [SI]
    
    loop st
            
            
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
