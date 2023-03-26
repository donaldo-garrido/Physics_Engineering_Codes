// LlamRefeEj1.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


void cubo(long &x);
void main()
{
  	long entrada;
	printf("Introduzca un valor entero: ");
 	scanf_s("%ld", &entrada);
	cubo(entrada);
	printf("El cubo es %ld", entrada);

	_getch();
}


void cubo(long &x)
{
       x = x * x* x;
} 
