/*Titulo: Inserción de arreglos
Descripción: Almacene en un arreglo, n elementos e inserte un elemento (ni) en la posición pos (definida por el usuario), recorriendo los siguientes elementos una posición a la derecha.
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 07-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"



void main()
{
	int arreglo[100], i, n, ni,j;
	do
	{
		printf("Introduzca la cantidad de numeros a utilizar: ");
		scanf_s("%d", &n);
	}
	while(n<0||n>100);
	for(i=0;i<n;i++)
	{
		printf("Introduzca el digito de la posicion # %d: ", i+1);
		scanf_s("%d", &arreglo[i]);
	}
	for(i=0;i<n;i++)
	printf("\n%d", arreglo[i]);
	
	printf("\nIntroudzca el nuevo numero : ");
	scanf_s("%d", &ni);
	printf("\nIntroduzca la posicion del nuevo valor: ");
	scanf_s("%d", &j);

	for(i=n-1;i>=j-1;i--)
		arreglo[i]=arreglo[i-1];
    arreglo[j-1]=ni;
	
	for(i=0;i<n;i++)
    printf("\n %d", arreglo[i]);
	_getch();
}



