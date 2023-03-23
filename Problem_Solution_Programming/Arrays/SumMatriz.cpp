/*Titulo: Suma de matrices
Descripción: Sumar matrices
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 08-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int A[20][20], B[20][20], R[20][20], fil, col, i, j;
	do
	{
		printf("Cuantas filas tienen A y B: ");
		scanf_s("%d", &fil);
	}
	while(fil<1 || fil>20);
	do
	{
		printf("Cuantas columnas tienen A y B: ");
		scanf_s("%d", &col);
	}
	while(col<1 || col>20);
	printf("Introduce los valores de la matriz A:\n");
	for(i=0; i<fil; i++)
		for(j=0; j<col; j++)
		{
			printf("El valor A[%d][%d]:", i+1, j+1);
			scanf_s("%d", &A[i][j]);
		}
	printf("Introduce los valores de la matriz B:\n");
	for(i=0; i<fil; i++)
		for(j=0; j<col; j++)
		{
			printf("El valor B[%d][%d]:", i+1, j+1);
			scanf_s("%d", &B[i][j]);
		}
	for(i=0; i<fil; i++)
		for(j=0; j<col; j++)
			R[i][j]=A[i][j]+B[i][j];

	printf("El resultado de la suma es: \n");
	for(i=0; i<fil; i++)
	{
		for(j=0; j<col; j++)
			printf("%d\t", R[i][j]);
		printf("\n");
	}
	_getch();

}

