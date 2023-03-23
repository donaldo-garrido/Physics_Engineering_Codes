/*Titulo: Inversión de arreglos
Descripción: Almacene en un arreglo a, un conjunto de n elementos de tipo entero, almacene en arreglo b los elementos del arreglo a invertido.
Nombre: Donaldo Alfredo Garrido Islas
Matricula: A01275416
Fecha: 07-11-18*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void main()
{
	int a[9999], b[9999], i, k, n;
	printf("Introduzca la cantidad de datos a introducir en el arreglo: ");
	scanf_s("%d", &n);
	for(i=0; i<n; i++)
	{
		printf("Introduzca el elemento numero %d del arreglo: ", i+1);
		scanf_s("%d", &a[i]);
	}
	for(i=0, k=n-1; i<n && k>=0 ; i++, k--)
		b[k]=a[i];
	printf("\nLos elementos del arreglo 'a' son: ");
	for(i=0; i<n; i++)
		printf("\n\t%d", a[i]);
	printf("\n\nLos elementos del arreglo 'b' son: ");
	for(k=0; k<n; k++)
		printf("\n\t%d", b[k]);

	_getch();
}

