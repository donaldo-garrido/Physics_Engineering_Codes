/*
Título: Operaciones con Números Reales
Descripción:Escribir un algoritmo que determine sume, reste, multiplique o divida dos números reales según la opción seleccionada por el usuario a través de un menú. Los cálculos deberán hacerse en funciones las cuales reciben los números a operar y regresarán los valores correspondientes al procedimiento principal.
Incluya los siguientes análisis:
- En la resta siempre al número mayor quitar el menor
- En la división evitar las divisiones por 0

Nombre: Donaldo Alfredo Garrido Islas
Matrícula: A01275416
Fecha: 14-10-18
*/

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

float sumar (float x1, float x2);
float restar (float x1, float x2);
float multiplicar (float x1, float x2);
float dividir (float x1, float x2);

void main()
{
	float n1, n2, res;
	int op;
	printf("Introduzca el primer numero: ");
	scanf_s("%f", &n1);
	printf("Introduzca el segundo numero: ");
	scanf_s("%f", &n2);

	printf("\n\n1) Sumar \n2)Restar \n3)Multiplicar \n4)Dividir \n5)Salir");
	printf("\nIntroduzca el numero de la operacion a realizar segun el menu anterior: ");
	scanf_s("%d", &op);

	switch(op)
	{
		case 1:
				res=sumar(n1, n2);
				printf("El resultado de la suma es: %f ", res);
			break;
	
		case 2:
				res=restar(n1, n2);
				printf("El resultado de la resta es: %f ", res);
				break;
		case 3:
				res=multiplicar(n1, n2);
				printf("El resultado de la multiplicacion es: %f ", res);
				break;
		case 4:
				
			if(n2==0)
				printf("Es una indeterminación");
			else
				res=dividir(n1, n2);
				printf("El resultado de la division es: %f ", res);
				break;
		default: printf("Fin");
			break;
	}
	_getch();
}

float sumar (float x1, float x2)
{
	float sum;
	sum=x1+x2;
	return sum;
}


float restar (float x1, float x2)
{
	float rest;
	if (x1>x2)
	{
		rest=x1-x2;
		return rest;
	}
	else if (x2>x1)
	{
		rest=x2-x1;
		return rest;
	}
	return 0;
}


float multiplicar (float x1, float x2)
{
	float mult;
	mult=x1*x2;
	return mult;
}


float dividir (float x1, float x2)
{
	float div;
	div=x1/x2;
	return div;
}