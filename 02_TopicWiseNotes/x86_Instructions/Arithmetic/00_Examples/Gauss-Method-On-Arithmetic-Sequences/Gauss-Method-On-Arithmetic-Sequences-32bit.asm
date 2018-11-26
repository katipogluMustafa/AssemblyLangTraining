; Gauss Method on Arithmetic Sequences   
; N * (N + 1) / 2      
; Assuming result is 16bit.

data segment
    x         dw 100
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
    
    mov bx, x   
    inc bx      ; bx = x+1
    
    xor DX,DX
    mov ax, x   ; ax = x    
    
    mov cl, 2
    div cl      ; ax = x/2
       
    mul bx      ; dx:ax = (x/2) * (x+1)
      
       
    mov result, ax  ; assuming the result is 16bit length
    
    ; the result is approximately is stored inside "result" variable.
          
               
    ; Custom Code END   
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
