Codesg SEGMENT PARA 'CODE
        ORG 100h
        ASSUME CS:Codesg, DS:Codesg, SS:Codesg, ES: Codesg
Bilgi:  jmp MAIN
    ; Data Definitions
Sayib db ?
Sayiw dw ?
    MAIN PROC NEAR

            ; code


            RET
    MAIN ENDP
Codesg   ENDS
         END Bilgi