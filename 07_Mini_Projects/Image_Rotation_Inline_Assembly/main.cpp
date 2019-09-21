#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <iostream>
#include "image_processing.cpp"

using namespace std;

void sagaDondur(short n, int resim);
void solaDondur(short n, int resim);

int main(void) {
	printf("\n\n 16011084 : Mustafa Katipoglu \n\n");
	int M, N, Q, i, j, k;
	bool type;
	int efile, islem;
	char resimadi[100], sonek[10];
	do {
		printf("Islem yapilacak resmin yolunu (path) giriniz:\n-> ");
		scanf("%s", &resimadi);
		system("CLS");
		efile = readImageHeader(resimadi, N, M, Q, type);
	} while (efile > 1);
	printf("%s\n", resimadi);
	int** resim = resimOku(resimadi);

	short *resimdizi;
	resimdizi = (short*)malloc(N*M * sizeof(short));

	for (i = 0; i < N; i++)
		for (j = 0; j < M; j++)
			resimdizi[i*N + j] = (short)resim[i][j];

	int resimadres = (int)resimdizi;

	do {
		system("CLS");
		printf("\t     ISLEMLER\n");
		printf("------------------------------------\n");
		printf("1)  Resmi saga dondur\n");
		printf("2)  Resmi sola dondur\n");
		printf("0)  Cikis\n\n");
		printf("\"%s\" yolundaki resim icin yapilacak islemi seciniz\n-> ", resimadi);
		scanf("%d", &islem);
	} while (islem > 2 || islem < 0);

	switch (islem) {
	case 0:
		exit(0);
	case 1:
		sagaDondur(N, resimadres);
		strcpy(sonek, "_sag.pgm");
		break;
	case 2:
		solaDondur(N, resimadres);
		strcpy(sonek, "_sol.pgm");
		break;
	default:
		strcpy(sonek, "_orj.pgm");
		break;
	}

	for (k = 0; k < N * M; k++) {
		j = k % N;
		i = k / N;
		resim[i][j] = (int)resimdizi[k];
	}

	string::size_type pos = string(resimadi).find_last_of(".");
	resimadi[pos] = '\0';
	strcat(resimadi, sonek);
	resimYaz(resimadi, resim, N, M, Q);
	printf("\nIslem basariyla tamamlandi :)\n\"%s\" yolunda resim olusturuldu.\n\n", resimadi);
	system("PAUSE");
	return 0;
}

void sagaDondur(short n, int resim) {
	//KODUNUZU BURADAN BASLAYARAK YAZINIZ

	// 1.Adım: Resim matrisini Asal Köşegenine göre elemanların yerlerini değiştir
		// For i := 0 to n-1(not included)
		// 		For j := i+1 to n(not included)
		// 			swap(a[i][j], a[j][i]) 

		// a11 a12 a13 			   a11 a21 a31
		// a21 a22 a23 		---->  a12 a22 a32
		// a31 a32 a33			   a13 a23 a33

	// 2.Adım: Resim matrisinin **sütünların** ilk yarısını, son yarısıyla yer değiştir.
		// For i := 0 to n(not included)
		// 		For j := 0 to n/2(included)
		// 			swap(a[i][j], a[i][n-j-1])						 
		//
		// 

		// a11 a21 a31 			   		 a31 a21 a11
		// a12 a22 a32 		----> 		 a32 a22 a12
		// a13 a23 a33			  		 a33 a23 a13

	//1.Adım : Resim matrisini Asal Köşegenine göre elemanların yerlerini değiştir.
	
	__asm {
		MOV EDI, resim 					; EDI = address of resim
		XOR ECX,ECX 					; ECX = 0
		
		MOV CX, n 						;  CX = n
		DEC CX 							; outer loop count = n - 1

		xor ESI, ESI					; ESI = 0
										; SI -> i = 0
										
		xor EBX, EBX					; EBX = 0
										; BX -> j = 0
		
		L2: 
			PUSH CX; save outer loop count
			MOV BX, SI					; BX -> j = i
			INC BX						; BX -> j = i + 1

		L1 :
			
			;CALCULATE **First Index** START
			
			; Calculate i*n + j
			XOR EDX, EDX
			XOR EAX, EAX

			MOV ax, n
			mul SI 					; dx:ax = n * i
			mov CL, 16
			SHL EDX, CL 			; Upper part of multiplication is inside upper 16bits of edx
			XOR EAX, EDX			; DX:AX from mul inside EAX from now on.

			add EAX, EBX 			; AX = n * i + j, here upper part of EBX is 0, lower = j
			mov ecx, 2
			mul ecx 				; assuming the answer is inside only EAX
			 						; EAX = 2 * (n * i + j)

			; Save 2 * (n * i + j) inside ECX
			MOV ECX, EAX			; ECX = (i*n + j) * 2
			
			;CALCULATE **First Index** END
			
			;CALCULATE **Second Index** START

			; Calculate j*n + i
			XOR EDX,EDX
			XOR EAX,EAX

			mov AX, n
			mul BX 					; DX:AX = j * n
			push ECX  				; Secure old value of ECX
			mov cl, 16
			SHL EDX,CL
			XOR EAX,EDX 			; EAX = DX:AX = j * n

			; Save j * n + i inside EDX
			add EAX, ESI; EAX = j * n + i
								; Upper 16 bit of ESI = 0, so ESI = SI indeed.
			mov ECX, 2
			mul ECX 			; Assuming the answer only inside EAX
								; EAX = (j * n + i) * 2
			mov EDX, EAX 
			pop ECX
			
			;CALCULATE **Second Index** END
			
			; START SWAP( resim[ i * n + j ], resim[ j * n + i ) ] )
			
			; Put Saved ECX and EDX into EBX and ESI
			; push the old values of SI = i, BX = j
			push ESI			; push i
			push EBX			; push j
			mov EBX, ECX 		; EBX = (i * n + j) * 2
			mov ESI, EDX 		; ESI = (j * n + i) * 2
			
			
			; Main Swapping between resim[ i * n + j ], resim[ j * n + i ]
			
			MOV AX, WORD PTR[EDI + EBX]   ; temp = [resim + 2 * ( i * n + j ) ]
			XCHG AX, WORD PTR[EDI + ESI]  ; temp <=> [resim + 2 * (j * n + i) ]
			mov WORD PTR[EDI + EBX], AX   ; [resim + 2 * ( i * n + j ) ] = temp
			
			; pop the old values from Stack, SI = i, BX = j
			XOR EBX,EBX
			pop EBX 			; BX = j
			pop ESI				; SI = i again.
			
			; END SWAP( resim[ i * n + j ], resim[ j * n + i) ] )
			
			INC BX						; j++
			cmp BX, n 		; while j < n
			JB L1 			; loop through L1

		INC SI 				; i++ 	
		xor ECX,ECX 		; clear the upper 16 bits of ECX 
		POP CX 				; take the loop count from stack
		LOOP L2				; loop through L2
			;	

	// 2.Adım: Resim matrisinin **sütünların** ilk yarısını, son yarısıyla yer değiştir.

		XOR ECX,ECX
		MOV CX, n 						; CX = n
										; outer loop count = n


		xor ESI, ESI				; ESI = 0
									; SI -> i = 0
			

		D2: PUSH CX; save outer loop count
			xor EBX, EBX				; BX -> j = 0

		D1 :
		
			;CALCULATE **First Index** START
			
			; Calculate i*n + j
			
			XOR EDX, EDX
			XOR EAX, EAX

			MOV ax, n
			mul SI 					; dx:ax = n * i
			mov CL, 16
			SHL EDX, CL 			; Upper part of multiplication is inside upper 16bits of edx
			XOR EAX, EDX			; DX:AX from mul inside EAX from now on.

			add EAX, EBX 			; AX = n * i + j, here upper part of EBX is 0, lower = j
			mov ecx, 2
			mul ecx 				; assuming the answer is inside only EAX
									; EAX = 2 * (n * i + j)

			; Save 2 * (n * i + j) inside ECX
			MOV ECX, EAX			; ECX = (i*n + j) * 2
			
			;CALCULATE **First Index** END
			
			;CALCULATE **Second Index** START
			
			; Calculate n*i + n - j - 1
			XOR EDX,EDX
			XOR EAX,EAX
			
			mov AX, n 				; AX = n
			mul SI 					; DX:AX = n*i
			push ECX  				; Secure old value of ECX
			mov cl, 16
			SHL EDX,CL
			XOR EAX,EDX 			; EAX = DX:AX = n*i
			ADD AX, n 				; EAX = n*i + n
			sub AX, BX 			; EAX = n*i + n - j
			DEC AX 				; EAX = n*i + n - j - 1
			
								; Upper 16 bit of EBX = 0, so EBX = BX indeed.
			mov ECX, 2
			mul ECX 			; Assuming the answer only inside EAX
								; EAX = ( n*i + n - j -1 ) * 2
			pop ECX 			; Get the old value of ECX
								; ECX = (i*n + j) * 2 
			; Save 2 * ( n*i + n - j  ) inside EDX 
			mov EDX, EAX 
			
			;CALCULATE **Second Index** END
			
			; START SWAP( resim[ i * n + j ], resim[ n*i + (n-1) - j ) ] )
			
			; Current Values
			; EDX = ( n*i + n - j  ) * 2
			; ECX = ( i * n + j) * 2 

			; Put Saved ECX and EDX into EBX and ESI
			; push the old values of SI = i, BX = j
			push ESI			; push i
			push EBX			; push j
			mov EBX, ECX 		; EBX = ( i * n + j) * 2 
			mov ESI, EDX 		; ESI = ( n*i + n - j - 1 ) * 2
	
			; exhange values of *(resim + 2 * ( i * n + j) ) with *(resim + 2 *( n*i + n - j -1 )	)
			
			MOV AX, WORD PTR[EDI + EBX]   ; temp = [resim + 2 * ( i * n + j ) ]
			XCHG AX, WORD PTR[EDI + ESI]  ; temp <=> [resim + 2 * ( n*i + n - j - 1 ) ]
			mov WORD PTR[EDI + EBX], AX   ; [resim + 2 * ( i * n + j ) ] = temp
			
			; pop the old values from Stack, SI = i, BX = j
			XOR EBX,EBX
			pop EBX 			; BX = j
			pop ESI				; SI = i again.
			
			; END SWAP( resim[ i * n + j ], resim[ n*i + (n-1) - j ) ] )
			
			INC BX						; j++
			
			mov cx, n
			shr cx, 1 		; CX = n / 2
			cmp BX, cx 		; while j <= n/2
			JBE D1 			; loop through D1

		INC SI 				; i++ 	
		xor ECX,ECX 		; clear the upper 16 bits of ECX 
		POP CX 				; take the loop count from stack
		LOOP D2				; loop through D2
			;	
		}
	
	//KODUNUZU YAZMAYI BURADA BITIRINIZ
}

void solaDondur(short n, int resim) {

	// 1.Adım: Resim matrisini Asal Köşegenine göre elemanların yerlerini değiştir.
		// For i := 0 to n-1(not included)
		// 		For j := i+1 to n(not included)
		// 			swap(a[i][j], a[j][i]) 

		// a11 a12 a13 			   		a11 a21 a31
		// a21 a22 a23 		---->  		a12 a22 a32
		// a31 a32 a33			   		a13 a23 a33

	// 2.Adım: Resim matrisinin **satırlarının**  ilk yarısını, son yarısıyla yer değiştir.
		// For i := 0 to n/2(included)
		// 		For j := 0 to n(not included)
		// 			swap(a[i][j],a[n - i - 1][j]) 
		//

		// a11 a21 a31 			   		a13 a23 a33
		// a12 a22 a32 		---->  		a12 a22 a32
		// a13 a23 a33			   		a11 a21 a31

	//KODUNUZU BURADAN BASLAYARAK YAZINIZ

	
	//1.Adım: Resim matrisini Asal Köşegenine göre elemanların yerlerini değiştir.
	
	__asm {
		MOV EDI, resim 					; EDI = address of resim
		XOR ECX,ECX 					; ECX = 0
		
		MOV CX, n 						;  CX = n
		DEC CX 							; outer loop count = n - 1

		xor ESI, ESI					; ESI = 0
										; SI -> i = 0
										
		xor EBX, EBX					; EBX = 0
										; BX -> j = 0
		
		L2: 
			PUSH CX; save outer loop count
			MOV BX, SI					; BX -> j = i
			INC BX						; BX -> j = i + 1

		L1 :
			
			;CALCULATE **First Index** START
			
			; Calculate i*n + j
			XOR EDX, EDX
			XOR EAX, EAX

			MOV ax, n
			mul SI 					; dx:ax = n * i
			mov CL, 16
			SHL EDX, CL 			; Upper part of multiplication is inside upper 16bits of edx
			XOR EAX, EDX			; DX:AX from mul inside EAX from now on.

			add EAX, EBX 			; AX = n * i + j, here upper part of EBX is 0, lower = j
			mov ecx, 2
			mul ecx 				; assuming the answer is inside only EAX
			 						; EAX = 2 * (n * i + j)

			; Save 2 * (n * i + j) inside ECX
			MOV ECX, EAX			; ECX = (i*n + j) * 2
			
			;CALCULATE **First Index** END
			
			;CALCULATE **Second Index** START

			; Calculate j*n + i
			XOR EDX,EDX
			XOR EAX,EAX

			mov AX, n
			mul BX 					; DX:AX = j * n
			push ECX  				; Secure old value of ECX
			mov cl, 16
			SHL EDX,CL
			XOR EAX,EDX 			; EAX = DX:AX = j * n

			; Save j * n + i inside EDX
			add EAX, ESI; EAX = j * n + i
								; Upper 16 bit of ESI = 0, so ESI = SI indeed.
			mov ECX, 2
			mul ECX 			; Assuming the answer only inside EAX
								; EAX = (j * n + i) * 2
			mov EDX, EAX 
			pop ECX
			
			;CALCULATE **Second Index** END
			
			; START SWAP( resim[ i * n + j ], resim[ j * n + i ] )

			; Current Values
			; ECX = (i * n + j) * 2 
			; EDX = (j * n + i) * 2			
	
			; Put Saved ECX and EDX into EBX and ESI
			; push the old values of SI = i, BX = j
			push ESI			; push i
			push EBX			; push j
			mov EBX, ECX 		; EBX = (i * n + j) * 2
			mov ESI, EDX 		; ESI = (j * n + i) * 2
			
			
			; Main Swapping between resim[i * n + j], resim[j * n +i]
			
			MOV AX, WORD PTR[EDI + EBX]   ; emp = [resim + 2 * ( i * n + j ) ]
			XCHG AX, WORD PTR[EDI + ESI]  ; temp <=> [resim + 2 * ( j * n + i ) ]
			mov WORD PTR[EDI + EBX], AX   ; [resim + 2 * ( i * n + j ) ] = temp
			
			
			; pop the old values from Stack, SI = i, BX = j
			XOR EBX,EBX
			pop EBX 			; BX = j
			pop ESI				; SI = i again.
			
			; END SWAP( resim[ i * n + j ], resim[ j * n + i) ] )
			
			INC BX						; j++
			cmp BX, n 		; while j < n
			JB L1 			; loop through L1

		INC SI 				; i++ 	
		xor ECX,ECX 		; clear the upper 16 bits of ECX 
		POP CX 				; take the loop count from stack
		LOOP L2				; loop through L2
			;	

	// 2.Adım: Resim matrisinin **satırlarının**  ilk yarısını, son yarısıyla yer değiştir.

		XOR ECX,ECX
		MOV CX, n 						; CX = n
		SHR CX, 1 						; CX = n / 2
		INC CX
										; outer loop count = n / 2 + 1

		xor ESI, ESI					; ESI = 0
										; SI -> i = 0
			

		D2: PUSH CX; save outer loop count
			xor EBX, EBX				; BX -> j = 0
			mov cx, n
			
		D1 :
			push cx
			
			;CALCULATE **First Index** START
			
			; Calculate i*n + j
			XOR EDX, EDX
			XOR EAX, EAX

			MOV ax, n
			mul SI 					; dx:ax = n * i
			mov CL, 16
			SHL EDX, CL 			; Upper part of multiplication is inside upper 16bits of edx
			XOR EAX, EDX			; DX:AX from mul inside EAX from now on.

			add EAX, EBX 			; AX = n * i + j, here upper part of EBX is 0, lower = j
			mov ecx, 2
			mul ecx 				; assuming the answer is inside only EAX
									; EAX = 2 * (n * i + j)

			; Save 2 * (n * i + j) inside ECX
			MOV ECX, EAX			; ECX = (i*n + j) * 2
			
			;CALCULATE **First Index** END
			
			;CALCULATE **Second Index** START
			
			; Calculate n * (n - i - 1) - j
			XOR EDX,EDX
			XOR EAX,EAX
			
			mov AX, n 				; AX = n
			SUB AX, SI 				; AX = n - i
			DEC AX 					; AX = n - i - 1
			mov DX, n
			mul DX 					; DX:AX = n * (n - i - 1)
			push ECX  				; Secure old value of ECX
			mov cl, 16
			SHL EDX,CL
			XOR EAX,EDX 			; EAX = DX:AX = n * (n - i - 1)
			ADD AX, BX 				; EAX = n * (n - i - 1) + j
			
								; Upper 16 bit of EBX = 0, so EBX = BX indeed.
			mov ECX, 2
			mul ECX 			; Assuming the answer only inside EAX
								; EAX = ( n * (n - i - 1) + j ) * 2
			pop ECX 			; Get the old value of ECX
								; ECX = (i*n + j) * 2 
								
			; Save 2 * ( n * (n - i - 1) + j ) inside EDX 
			mov EDX, EAX 
			
			;CALCULATE **Second Index** END
			
			; START SWAP( resim[ i * n + j ], resim[ n * (n - i - 1) + j )
			
			; Current Values
			; ECX = ( i * n + j) * 2 
			; EDX = ( n * (n - i - 1) + j ) * 2
			

			; Put Saved ECX and EDX into EBX and ESI
			; push the old values of SI = i, BX = j
			push ESI			; push i
			push EBX			; push j
			mov EBX, ECX 		; EBX = ( i * n + j) * 2 
			mov ESI, EDX 		; ESI = ( (n -1 - i) * n - j ) * 2
			
			; Main Swapping between resim[ i * n + j ], resim[ (n -1 - i) * n - j ) ]
			
			MOV AX, WORD PTR[EDI + EBX]   ; temp = [resim + 2 * ( i * n + j ) ]
			XCHG AX, WORD PTR[EDI + ESI]  ; AX = [resim + 2 * ( (n -1 - i) * n - j )]
			mov WORD PTR[EDI + EBX], AX   ; [resim + 2 * ( j * n + i ) ] = temp
			
			; pop the old values from Stack, SI = i, BX = j
			XOR EBX,EBX
			pop EBX 			; BX = j
			pop ESI				; SI = i again.
			
			; END SWAP( resim[ i * n + j ], resim[ n*i + (n-1) - j ) ] )
			
			INC BX						; j++
			
			xor ECX,ECX 		; clear the upper 16 bits of ECX 
			pop cx
			loop D1 			; loop through D1

		INC SI 				; i++ 	
		POP CX 				; take the loop count from stack
		LOOP D2				; loop through D2
			;	
		
		}
	
	

	//KODUNUZU YAZMAYI BURADA BITIRINIZ
}