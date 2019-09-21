#include <stdio.h>
#include <stdlib.h>

int main() {
	short n = 6, x = 5, T, i, XK; //T = 3444 olmali
	T = 1;
	XK = x;
	for (i = 1; i <= n; i++) {
		T += ((int) XK / i);
		XK *= x;
		printf("T: %d\n", T);
	}
	system("PAUSE");
	return 0;
}