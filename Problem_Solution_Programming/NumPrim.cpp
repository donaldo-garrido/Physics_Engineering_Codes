/*
Título: Número primo.
Descripción: Crear un programa para pedir un número e indicar si es un núumero primo o no.
Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
Fecha: 09-10-18
*/

#include "stdafx.h"
#include "math.h"
#include "conio.h"
#include "stdio.h"

void main()
{
	float res, prim=1, n=1, ult;
	int k=2, x;
	printf("Introduzca el numero que desea analizar: ");
	scanf_s("%f", &n);
	ult=sqrt(n);
	x=n;
	if(n<=1)
		printf("El numero NO es primo");
	else if(n==2)
		printf("El numero es primo");
	else
	{
	do
	{
		if (x%k==0)
			prim=0;
		else prim==1;
		k++;
	}
	while(k<=ult && prim!=0);
		if (prim==0)
			printf("El numero NO es primo");
		else printf("El numero es primo");
	}
_getch();

}

