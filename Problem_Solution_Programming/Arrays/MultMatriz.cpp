/*Titulo: Multiplicación de Metrices
Descripción: Crear un agoritmo para multiplicar matrices
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 12-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int fa, ca, fb, cb, A[100][100], B[100][100], C[100][100], i, j, k;
	do
	{
	printf("Introduce el numero de filas de A: ");
	scanf_s("%d", &fa);
	}
	while(fa<0 || fa>100);
	do
	{
	printf("Introduce el numero de columnas de A: ");
	scanf_s("%d", &ca);
	}
	while(ca<0 || ca>100);
	do
	{
	printf("Introduce el numero de filas de B: ");
	scanf_s("%d", &fb);
	}
	while(fb<0 || fb>100);
	do
	{
	printf("Introduce el numero de columnas de B: ");
	scanf_s("%d", &cb);
	}
	while(cb<0 || cb>100);
	if(ca==fb)
	{
		printf("Introduce los valores de la matriz A:\n");
	for(i=0; i<fa; i++)
		for(j=0; j<ca; j++)
		{
			printf("El valor A[%d][%d]:", i+1, j+1);
			scanf_s("%d", &A[i][j]);
		}
	printf("Introduce los valores de la matriz B:\n");
	for(i=0; i<fb; i++)
		for(j=0; j<cb; j++)
		{
			printf("El valor B[%d][%d]:", i+1, j+1);
			scanf_s("%d", &B[i][j]);
		}
		for(i=0; i<fa;i++)
			for(j=0; j<cb; j++)
			{
				C[i][j]=0;
				for(k=0; k<ca; k++)
					C[i][j]+=A[i][k]*B[k][j];
			}
	printf("El resultado de la multiplicacion es: \n");
	for(i=0; i<fa; i++)
	{
		for(j=0; j<cb; j++)
			printf("%d\t", C[i][j]);
		printf("\n");
	}


	}
	else printf("Para realizar la multiplicacion de matrices, el numero de columnas de la matriz A debe ser igual al numero de filas de B");

	_getch();
}

