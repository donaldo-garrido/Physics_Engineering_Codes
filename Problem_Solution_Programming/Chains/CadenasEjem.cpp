//Trabajo con cadenas (Tipo de Dato-String)


#include "stdafx.h"
//Libreria para que funcionen las cadenas
#include <string>
//Libreria para utilizar las funciones cout y cin
#include <iostream>
#include "conio.h"

//Especificar el nombre de espacio de dominio
using namespace std;


void main()
{
	string clave;
	cout << "Introduce tu clave de acceso: ";
	getline (cin, clave);
	if (clave.compare("TheScientist")==0)
	{

		//comparar solo un caracter
		//if(nombre_completo.at(5)=='x')
	string s1;
	s1= "Solucion de Problemas con Programacion";
		cout << "Esta materia es: "<< s1 <<endl;

	string s2("Segunda linea creada con cadenas");
	cout << "El contenido de s2 es: " << s2 << endl;

	string s3(s1, 10); //Colocate en el subindice 10 de s1 y dame todos los datos sigueintes
		cout << "El contenido de s3 es: " << s3 << endl;

	string s4(s1, 6, 4); // Se coloco en el subindice 6 y tomó los 4 siguientes caracteres
	cout << "El contenido de s4 es: " << s4 << endl;

	string s5(15, '*');
	cout << "El contenido de s5 es: " << s5 << endl;
	
	string s6 (s1.begin(), s1.end()-5); // Imprime desde el inicio quitando los últimos 5 caracteres
	cout << "El contenido de s6 es; " << s6 << endl;

	string nombre_completo;
	cout<< "Introduce tu nombre completo: "; //Para que elmusuerio introduzca una cadena de informacion por su propia cuenta
	getline (cin, nombre_completo);
	cout << "El nombre introducido es: " << nombre_completo << endl;

	string nombre_pila( nombre_completo, 0, nombre_completo.find(' '));
	nombre_pila.append("!!!");
	cout << "Tu primer nombre es: " << nombre_pila << endl;
	cout << "LA inicial de tu nombre es: " << nombre_pila.at(0) << endl;

	cout << "La longitud de la cadena es: " << nombre_completo.length() << endl;
	cout << "Tu nuombre escrito hacia abajo: " << endl;
	int i;
	for (i=0; i<nombre_completo.length(); i++)
		cout << nombre_completo.at(i) << endl;
	}
	else 
		cout <<"Lastima Margarito, no te andes metiendo en lo que no es tuyo!";

	_getch();
}

