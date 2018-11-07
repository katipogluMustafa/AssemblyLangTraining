; Binary Search
; This code is organised according to com type standards.

MYSEG	SEGMENT PARA 'CODE'
	org 100h
	ASSUME CS:MYSEG, SS:MYSEG, DS:MYSEG

MYDATA:		jmp MAIN
; Define Variables

DIZI	DW	-21,-8,-3,-1,0,4,14,21,45,67
ELEMAN	DW	10
SAYI	DW	45
ADRES	DW	0FFFFH			; if nothing found, the return will be -1

MAIN	PROC NEAR

		xor SI, SI
		mov DI, ELEMAN

		SHL DI, 1
		SUB DI, 2			; The address of the last element will be first + 2 * ELEMAN - 2

		mov AX, SAYI
KONT:	CMP SI, DI
		JG SON

		mov BX, SI
		ADD BX, DI
		SHR AX, 1

		CMP AX,DIZI[BX]
		JE BULDU
		JG SAGDA
		
		MOV DI, BX
		SUB DI, 2

		JMP KONT

SAGDA:	MOV SI, BX
		ADD SI, 2a

		JMP KONT

BULDU:  MOV ADRES, BX
		MOV SI,DI
		ADD SI, 2	

		JMP KONT	
SON: RET
MAIN ENDP
MYSEG	ENDS
		END MYDATA
