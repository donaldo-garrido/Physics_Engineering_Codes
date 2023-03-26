/*
Título: Aproximación del número Pi
Descripción: El número pi se calcula empleando la fórmula:

PI = 4 * (1 - 1/3 + 1/5 - 1/7 + 1/9 - 1/11 + 1/13 - 1/15 + …. )
Diseñe un algoritmo que dado el número de fracciones que integrarán la suma algebraica determine el valor de pi con dicha aproximación. El cálculo debe realizarse en una función que  regrese el resultado del cálculo al procedimiento principal, en el cual se imprimirá.
Aclaración: En la definición el número de fracciones sería 8 (1/1, 1/3, 1/5, 1/7, 1/9, 1/11,1/13, 1/15).
Si se introduce 4 el cálculo se realizaría como PI = 4 * (1/1 – 1/3 + 1/5 – 1/7)

Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
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

	printf("Ingrese el numero de fracciones a usar para la aproximación: ");
	scanf_s("%d", &n);

	aprox=aproximarpi(n);
	
	printf("La aproximación de pi con el las caracteristicas dadas es  %f", aprox);
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
