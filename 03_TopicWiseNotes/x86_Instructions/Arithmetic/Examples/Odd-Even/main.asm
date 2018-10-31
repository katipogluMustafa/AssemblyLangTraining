; Find if given digit is even or odd

data segment
    ; add your data here!
    even db "The number is even...$"
    odd  db "The number is odd...$"
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
    
    xor ax,ax            
    xor bx,bx
    
    ; Take input  
    mov ah, 01
    int 21h
    
    
    mov bh, al   
    mov bl,1
           
    and bh,bl
    
    cmp bh, 0
    jnz podd    
   
    ; print even        
          lea dx, even
          mov ah, 9
          int 21h        
    
    jmp theEND
    ; print odd
podd:    lea dx, odd 
         mov ah,9
         int 21h        
                   
theEND:                   
    
    ; Custom Code END               
            
    mov ah, 1
    int 21h
    
    mov ax, 4c00h
    int 21h    
ends

end start