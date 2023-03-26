// LlamRefEj2.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

void intercambio1(int, int);
void intercambio2(int &, int &);

void main()
{
  	int a, b;
	a = 10;
	b = 20;
	intercambio1(a, b);
	printf("a = %d b = %d", a, b);
	intercambio2(a, b);
	printf("a = %d b = %d", a, b);
	_getch();
}

void intercambio1(int primero, int segundo)
{
       int aux;
       aux = primero;
       primero = segundo;
       segundo = aux;
} 

void intercambio2(int &primero, int &segundo)
{
       int aux;
       aux = primero;
       primero = segundo;
       segundo = aux;
} 

