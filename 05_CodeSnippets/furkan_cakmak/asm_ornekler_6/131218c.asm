			EXTRN SAYveBOL: NEAR
myss		SEGMENT PARA STACK 'stack'
			DW 20 DUP(?)
myss		ENDS
myds		SEGMENT PARA 'data'
dizi		DW 0FEh, 0A7h, 0B3h, 72h, 6Bh
n			DW 5
myds		ENDS
mycs		SEGMENT PARA PUBLIC 'code'
			ASSUME CS:mycs, DS: myds, SS: myss
MAIN		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, myds
			MOV DS, AX
			
			XOR SI, SI
			MOV CX, n
			
L1:			PUSH dizi[SI]	
		
			CALL SAYveBOL
			
			MOV dizi[SI], AX
			
			ADD SI, 2
			LOOP L1
			
			RETF
MAIN		ENDP
mycs		ENDS
			END MAIN