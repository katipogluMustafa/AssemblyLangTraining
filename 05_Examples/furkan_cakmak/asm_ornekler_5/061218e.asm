			PUBLIC SIRALI_MI
			EXTRN dizi: BYTE, n: WORD
mycode		SEGMENT PARA 'kod'
			ASSUME CS:mycode
SIRALI_MI	PROC FAR
			XOR AX, AX
			XOR SI, SI
			MOV CX, n
			DEC CX
don:		CMP SI, CX
			JGE sirali
			MOV AH, dizi[SI]
			CMP AH, dizi[SI+1]
			JLE devam
			JMP sirasiz
devam:		INC SI
			JMP don
sirasiz:	MOV AL, 1			
sirali:		RETF
SIRALI_MI	ENDP 
mycode 		ENDS
			END