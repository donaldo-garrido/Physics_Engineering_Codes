/*
T�tulo: �reas Geom�tricas
Descripci�n:Escribir un algoritmo que determine el �rea de un cuadrado, un c�rculo o un tri�ngulo equil�tero seg�n la opci�n seleccionada por el usuario a trav�s de un men�. Los c�lculos deber�n hacerse en funciones a las cuales se le env�e el radio o longitud del lado (seg�n el caso) y �stas regresar�n el valor del �rea al procedimiento principal.
Nombre: Donaldo Alfredo Garrido Islas
Matr�cula: A01275416
Fecha: 14-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"
#include "math.h"

float circulo(float rad);
float cuadrado(float lad);
float trianguloeq(float lad);

void main()
{
	float r, l, area;
	int fig;

	printf("Puede calcular el area de un \n1)Circulo \n2)Cuadrado \n3)Triangulo equilatero \n\nIntroduzca el numero que corresponde a la figura deseada: ");
	scanf_s("%d", &fig);

	switch (fig)
	{
	case 1:
		printf("Introduzca la longitud del radio del circulo: ");
		scanf_s("%f", &r);
		area=circulo(r);
		break;
	case 2:
		printf("Introduzca la longitud del lado del cuadrado: ");
		scanf_s("%f", &l);
		area=cuadrado(l);
		break;
	case 3:
		printf("Introduzca la longitud del lado del triangulo equilatero: ");
		scanf_s("%f", &l);
		area=trianguloeq(l);
		break;
	default: printf("Fin");
		break;
	}
	printf("El area de la figura descrita es: %f unidades cuadradas", area);
	_getch();
}

#include "math.h"

float circulo(float rad)
{
	float a;
	a=3.1415926535*rad*rad;
	return a;
}

float cuadrado(float lad)
{
	float a;
	a=lad*lad;
	return a;
}

float trianguloeq(float lad)
{
	float a;
	a=(1.7320508075*lad*lad/4);
	return a;
}



