#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int num=0, par=0, impar;
	printf("Escriba un numero: ");
		scanf_s("%d", num);
	do
	{
		impar=par++;
		printf("\n%d \t&d", par, impar);
		par+=2;
	}
	while (par<=num && impar<=num);
	printf("Fin");
	_getch();
}