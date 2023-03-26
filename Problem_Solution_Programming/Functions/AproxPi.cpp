/*
T�tulo: Aproximaci�n del n�mero Pi
Descripci�n: El n�mero pi se calcula empleando la f�rmula:

PI = 4 * (1 - 1/3 + 1/5 - 1/7 + 1/9 - 1/11 + 1/13 - 1/15 + �. )
Dise�e un algoritmo que dado el n�mero de fracciones que integrar�n la suma algebraica determine el valor de pi con dicha aproximaci�n. El c�lculo debe realizarse en una funci�n que  regrese el resultado del c�lculo al procedimiento principal, en el cual se imprimir�.
Aclaraci�n: En la definici�n el n�mero de fracciones ser�a 8 (1/1, 1/3, 1/5, 1/7, 1/9, 1/11,1/13, 1/15).
Si se introduce 4 el c�lculo se realizar�a como PI = 4 * (1/1 � 1/3 + 1/5 � 1/7)

Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 11-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

float aproximarpi(int x);

void main()
{
	int n;
	float aprox;

	printf("Ingrese el numero de fracciones a usar para la aproximaci�n: ");
	scanf_s("%d", &n);

	aprox=aproximarpi(n);
	
	printf("La aproximaci�n de pi con el las caracteristicas dadas es  %f", aprox);
	_getch();
}

float aproximarpi(int x)
{
	int i; 
	float res=0, sumpar, sumimpar, back;
	for(i=1; i<=x; i++)
	{
		if(i%2!=0)
		{
			sumimpar=(1/(2*i-1));
			res+=sumimpar;
		}
		else if(i%2==0)
		{
			sumpar=(1/(2*i-1));
			res-=sumpar;
		}
	}
	back=4*res;
	return back;
}
