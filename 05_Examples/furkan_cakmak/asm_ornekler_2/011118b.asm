datasg		SEGMENT PARA 'veri'
dizi		DB 1, 2, 3, 4, 5, 6, 7, 6, 9, 10
n			DW 10
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
			
			MOV BX, 0
			XOR SI, SI
			MOV CX, n
			DEC CX
			
don:		CMP BX, 0
			JNE son_if
			CMP SI, CX
			JAE son_if
			MOV AL, dizi[SI]
			CMP AL, dizi[SI+1]
			JLE artir
			MOV BX, 1
artir:		INC SI
			JMP don
			
son_if:		CMP BX, 0
			JNE sirasiz
			MOV tip, 1
			JMP son
sirasiz:	MOV tip, 0

son:		RETF
ANA			ENDP
codesg		ENDS
			END ANA