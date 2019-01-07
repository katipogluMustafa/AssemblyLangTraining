			EXTRN ALAN_BUL: FAR
myss		SEGMENT PARA STACK 'yigin'
			DW 20 DUP(?)
myss		ENDS
myds		SEGMENT PARA 'veri'
kenarlar	DW 7, 8, 5, 9, 4, 7, 2, 3, 3
n			DW 3
enbykalan	DW 0
myds		ENDS
mycs		SEGMENT PARA 'kod'
			ASSUME CS:myss, DS:myds, CS:mycs
ANA 		PROC FAR
			PUSH DS
			XOR AX, AX
			PUSH AX
			MOV AX, myds
			MOV DS, AX	
			MOV CX, n
			XOR SI, SI
L1:			PUSH kenarlar[SI]
			PUSH kenarlar[SI+2]
			PUSH kenarlar[SI+4]
			CALL ALAN_BUL
			CMP AX, enbykalan
			JB kucuk
			MOV enbykalan, AX
kucuk:		ADD SI, 6
			LOOP L1
			RETF
ANA			ENDP
mycs		ENDS
			END ANA