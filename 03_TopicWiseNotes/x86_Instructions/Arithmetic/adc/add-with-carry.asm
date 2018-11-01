; Add with carry

data segment
    a      dd -1
    b      dd -1
    toplam dt 0
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
   
    mov SI, a
    add ax, [SI] ; ax += a (first 16 bits of a) 
    
    mov SI, b
    add ax, [SI] ; ax += b (first 16 bits of b)
    
    add SI,2     
    add bx, [SI] ; bx += b (last 16 bits of b) 
    mov SI,a
    add SI,2
    add bx,[SI]  ; bx += a (last 16 bits of a)      

    lea SI,toplam
    
    add [ SI ],ax ; toplam = first 16 bits
    ADD SI, 2
    ADC [ SI ],bx ; toplam = 16-32 bits    
    
    ADC [SI], 0   ; toplam = 33 bit (if we have one)
                    
    ; Custom Code END             
              
              
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
