/* Programa para calcular la fuerza a partir de la masa y la aceleración.
Entradas: valor de masa y aceleración
Salida: valor de la fuerza
*/
#include <iostream>
#include <cmath>
using namespace std;

int main (void)
{
 // Declaracion de variables
 int masa, aceleracion, fuerza;

 // Pedir el valor de la fuerza
 cout <<"Introduzca Masa : ";
 cin >> masa ;

 // Pedir el valor de la aceleracion
 cout << "Introduzca aceleración  : ";
 cin >> aceleracion;

 // Calcular la fuerza
 fuerza= (masa*aceleracion);

 // Mostrar el resultado
 cout << "la fuerza vale: " <<fuerza << endl;

 return 0 ;
}
