/* Programa que capte dos números enteros a y b y muestre
en pantalla el resultado de su suma, su resta, su producto,
su cociente entero y su resto entero.
Entradas: números a y b
Salidas: suma, resta, producto, cociente entero y esto entero
*/
#include <iostream>
#include <cmath>
using namespace std;

int main (void)

{
 // Declaracion de variables
 short int a, b;
 int suma, resta, producto, cociente, resto;


 // Pedir el valor de a
 cout <<"Introduzca a : ";
 cin >> a ;

 // Pedir el valor de b
 cout << "Introduzca b : ";
 cin >> b;

 // Calcular la suma
 suma= (a+b);

 // Calcular la resta
 resta= (a-b) ;

 // Calcular el producto
 producto= (a*b) ;

 // Calcular el cociente
 cociente= (a/b) ;

 // Calcular el resto
 resto= (a%b) ;


 // Mostrar el resultado
int num_entero;
 cout << "la suma vale: " <<suma << endl;
 cout << "el producto vale: " <<producto << endl;
 cout << "el cociente vale: " <<cociente << endl;
 cout << "el resto vale: " <<resto << endl;

 return 0 ;
}

