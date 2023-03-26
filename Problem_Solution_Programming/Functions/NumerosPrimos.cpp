/*
T�tulo: Numeros primos
Descripci�n: Realizar un algoritmo que detecte si un n�mero es primo, es decir, divisible solamente por si mismo y por 1. El an�lisis deber� hacerse en una funci�n a la cual se le env�a el n�mero y �sta regresar� 0 si es primo o el primer divisor que encuentre en caso contrario.
Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 14-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

int primidad(int n);

void main()
{
	int num, prim;
	printf("Introduzca el numero a analizar: ");
	scanf_s("%d", &num);
	prim=primidad(num);
	if (prim==0)
		printf("\nEl numero %d es primo", num);
	else printf("\nEl numero %d  NO es primo", num);
	_getch();
}

int primidad(int n)
{
	int k, aux=1,pd;
	if(n<2)
		return 1;
	else
	{
	for(k=2;k<n && aux!=0;k++)
		aux=n%k;
		if (aux==0)
		{
			pd=k-1;
			return pd;
		}
		return 0;
	
	}
}