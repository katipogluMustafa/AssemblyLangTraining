datasg		SEGMENT PARA 'veri'
a			DB 1
b			DB 1
c			DB 1
tip			DB ?
datasg		ENDS
stacksg		SEGMENT PARA STACK 'yigin'
			DW 20 DUP(?)
stacksg		ENDS
codesg		SEGMENT PARA 'kod'
			ASSUME DS:datasg, CS: codesg, SS:stacksg
ANA			PROC FAR
			
			PUSH DS
			XOR AX, AX
			PUSH AX
			
			MOV AX, datasg
			MOV DS, AX
			
			MOV AL, a
			MOV BL, b
			MOV CL, c
			
			CMP AL, BL
			JE J1
			CMP BL, CL
			JE J2
			CMP AL, CL
			JE J2
			MOV tip, 3
			JMP SON
J1:			CMP AL, CL
			JNE J2
			MOV tip, 1
			JMP SON
J2:			MOV tip, 2

SON:		RETF
ANA			ENDP
codesg		ENDS
			END ANA