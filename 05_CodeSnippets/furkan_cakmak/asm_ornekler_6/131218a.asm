			EXTRN SAY: FAR
myss		SEGMENT PARA STACK 'stack'
			DW 20 DUP(?)
myss		ENDS
myds		SEGMENT PARA 'data'
dizi		DW 12, 12, 12, 12, 12, 12, 13, 14, 15, 16, 17
n			DW 11
aranan		DB 12
sonuc		DW ?
myds		ENDS
mycs		SEGMENT PARA PUBLIC 'code'
			ASSUME CS:mycs, DS: myds, SS: myss
MAIN		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, myds
			MOV DS, AX
			
			XOR AX, AX
			MOV AL, aranan
			PUSH AX
			
			LEA AX, dizi
			PUSH AX
			
			PUSH n
			
			CALL SAY

			MOV sonuc, AX
			RETF
MAIN		ENDP
mycs		ENDS
			END MAIN