;Array Sorting smallest to biggest
ortaksg  SEGMENT PARA 'kod'
         ORG 100H
	 ASSUME ss:ortaksg,ds:ortaksg,cs:ortaksg
Basla:   JMP ANA
	    dizi db -7,-14,1
            n dw 3
ANA      PROC NEAR
         XOR si,si
         XOR di,di
         MOV dx,0
 whilee: MOV cx,n
         DEC cx 
         CMP dx,cx 
         JGE bitir      
	 PUSH si
	 INC si
	 MOV di,si
	 POP si
	 MOV al,dizi[si]
	 SUB cx,si 
     L1: CMP al,dizi[di]
	 JGE degis
	 JMP son
  degis: XCHG al,dizi[di]
         MOV dizi[si],al
    son: INC di
         Loop L1
	 INC si 
	 ADD dx,1
	 JMP whilee  	
bitir:   RET

ANA      ENDP
ortaksg  ENDS
         END Basla
