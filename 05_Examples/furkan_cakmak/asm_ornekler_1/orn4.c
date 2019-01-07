#include <stdio.h>
#include <stdlib.h>

int main1() {
	int d1[10], d2[10], n = 10, i;

	for (i = 0; i < n; i++) {
		d1[i] = i + 1;
		d2[i] = n - i;
	}

	__asm {
			MOV ECX, n
			XOR ESI, ESI
			LEA EDI, d2

	don:	MOV EAX, d1[ESI]
			XCHG EAX, [EDI]
			MOV d1[ESI], EAX

			ADD ESI, 4
			ADD EDI, 4
			LOOP don
	}

	for (i = 0; i < n-1; i++) 
		printf("%d, ", d1[i]);
	printf("%d\n", d1[n-1]);
	 
	system("PAUSE");
	return 0;
}