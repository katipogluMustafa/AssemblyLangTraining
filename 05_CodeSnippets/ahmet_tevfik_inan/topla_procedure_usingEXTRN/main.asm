; Toplama isimli yardımcı yordamın çağırılması

	 EXTRN Toplama:FAR
SSEG SEGMENT PARA STACK 'STACK'
	DW 10 dup(?)
SSEG ENDS

DSEG SEGMENT PARA 'DATA'
	SAYI1 DB 12h
	SAYI2 DB 78H
	SONUC DW 0H
DSEG ENDS

CSEG SEGMENT PARA 'CODE'
		ASSUME CS:CSEG, DS:DSEG, SS:SSEG
MAIN PROC FAR		
	push ds
	xor ax,ax
	push ax
	
	mov ax, DSEG
	mov ds, ax
	
	mov bh, SAYI1
	mov bl, SAYI2
	CALL Toplama
	mov SONUC, ax
	
	RETF
MAIN ENDP	
CSEG ENDS
	 END MAIN