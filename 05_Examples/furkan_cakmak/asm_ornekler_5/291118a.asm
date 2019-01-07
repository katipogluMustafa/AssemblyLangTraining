myss		SEGMENT PARA STACK 'yigin'
			DW 20 DUP(?)
myss		ENDS
myds		SEGMENT PARA 'veri'
sayi		DW 2
ust			DW 10
sonuc		DW ?
myds		ENDS
mycs		SEGMENT PARA 'kod'
			ASSUME SS:myss, DS:myds, CS:mycs
ANA			PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, myds
			MOV DS, AX
			
			MOV BX, sayi
			MOV CX, ust
			
			CALL USTAL
			
			MOV sonuc, AX
			RETF
ANA			ENDP
USTAL		PROC NEAR
			MOV AX, 1
L1:			MUL BX
			LOOP L1			
			RET
USTAL		ENDP
mycs		ENDS
			END ANA