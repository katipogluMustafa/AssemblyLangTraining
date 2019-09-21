#include<stdio.h>

C:\Users\Yukawa\Desktop\lena.pgm

int main(){
  int i,j;
  int temp;
  int dizi[9] = { 1,2,3 , 4,5,6 , 7,8,9 };
  int* p = dizi;

  int n = 3;

  for(i = 0; i < n-1; i++){
	for(j = i+1; j < n; j++){

	   temp = *(p + i*n + j);
  	   *(p + i*n + j) = *(p + j*n + i);
	   *(p + j*n + i) = temp;
        }
  }  	
  
 	/* SAGA ÇEVR */
  for(i = 0; i < n; i++){
  	for(j = 0; j < n/2; j++){
  		temp 		   = *(p + i*n + j);
  		// *(p + i*n + j) = *(p + (i)*n + n - j - 1);
1  		*(p + i*n + j) = *(p + (i)*(n+1) - j - 1);
  		*(p + (i+1)*n - j - 1) = temp;
  	}
  }
  
   	/* SOLA ÇEVR 	*/
  /*
  for(i = 0; i < n/2; i++){
  	for(j = 0; j < n; j++){
  		temp 		   = *(p + i*n + j);
  		*(p + i*n + j) = *(p + (n - i - 1)*n + j);
  		*(p + (n - i - 1)*n + j) = temp;
  	}
  }
  	*/
  for(i = 0; i < 9; i++){
  	printf("%d ", dizi[i]);
  }

return 0;
}

