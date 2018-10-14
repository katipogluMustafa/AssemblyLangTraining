
; You may customize this and other start-up templates;
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

      mov cx, 4 ; n = 4
      mov ax, 0 ; T = 0
      mov SI, 1 ; i = 1

   LD:push cx
      push ax
      mov bx, SI; b = i

      mov DI, 2 ; j = 2

      ; ic dongunun donme sayisini belirle
      mov cx, SI
      inc cx
      sub cx, DI ; cx = i - j + 1

      cmp cx,1 ; donme sayisi 1 den kucuk ise
      JB ICSON ; ic donguye girme

      ; donme sayisi 1 den buyuk ise
ICBAS:mov ax, bx
      mul SI     ; b ile i yi carp
      mov bx, ax ; carpimi b'de tut
      inc DI     ; j++
      loop ICBAS

ICSON:pop ax
      add ax,bx  ; t += b

      INC SI     ; i++

      pop cx
      loop LD

ret




