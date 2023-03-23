// NumPrim2.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

void main()
{
	int n, k, aux=1,dp;
	printf("Introduzca el numero que desea analizar: ");
	scanf_s("%d", &n);
	if(n<2)
		printf("El numero NO es primo");
	else
	{
	for(k=2;k<n && aux!=0;k++)
		aux=n%k;
		if (aux==0)
			printf("El numero NO es primo");
		else printf("El numero es primo");
	
	}
	dp=(k-1);
	printf("\n\n%d",dp);
	_getch();
}

