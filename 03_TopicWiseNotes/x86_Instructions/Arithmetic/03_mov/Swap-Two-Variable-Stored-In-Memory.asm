; Swap two variable which stored inside memory.
; note: XCHG command does not accept XCHG mem,mem
;       we need to make this swap using 1 mem, 1 reg


data segment
    ; add data here
    x    dw 20
    y    dw 42
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
    
    
    ; Custom Code Start
      
    mov ax, x
    xchg y, ax
    mov x, ax
    
    
    ; Custom Code END
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
