// DupEleArr.cpp: define el punto de entrada de la aplicación de consola.
//

#include "stdafx.h"
#include "stdio.h"
#include "conio.h"


#include "stdafx.h"
#include "stdio.h"
#include "conio.h"

void main()
{
	int lista[100], i, n, ni,j;
	do
	{
		printf("Inserte los valores que necesite: ");
		scanf_s("%d", &n);
	}
	while(n<0||n>100);
	for(i=0;i<n;i++)
	{
			printf("Introduzca el valor %d: ", i+1);
			scanf_s("%d", &lista[i]);
	}
	for(i=0;i<n;i++)
	printf("\n%d en posición %d", lista[i], i+1);
	
	printf("\nIntroudzca el nuevo valor: ");
	scanf_s("%d", &ni);
	printf("\nIntroduzca la posición que quiera cambiar");
	scanf_s("%d", &j);

	for(i=n-1;i>=j-1;i--)
		lista[i]=lista[i-1];
    lista[j-1]=ni;
	
	for(i=0;i<n;i++)
    printf("\n %d", lista[i]);
	_getch();
}