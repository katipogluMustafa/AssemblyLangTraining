; Take Square of given unsigned number


data segment
    ; add data here
    x         dw 20
    result    dw ?
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
    
    ; Custom Code Start
      
    xor DX,DX
         
    mov ax, x     
    mul x
    mov result, ax 
    
    ; the result is stored inside "result" variable    
     
    ; Custom Code END   
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
