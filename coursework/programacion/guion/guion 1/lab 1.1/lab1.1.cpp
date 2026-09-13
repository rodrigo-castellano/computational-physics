/* Programa para calcular la hipotenusa de un triángulo rectángulo dada la longitud de sus lados.
 Entradas: la longitud de los lados (cateto1 y cateto2).
 Salida: la longitud de la hipotenusa (hipotenusa)
*/

#include <iostream>
#include <cmath>
using namespace std;

int main (void)
{
 // Declaracion de variables
 double cateto1, cateto2, hipotenusa;

 // Pedir la longitud de los lados del triángulo
 cout << "Introduzca el Cateto 1 : ";
 cin >> cateto1 ;

 cout << "Introduzca el Cateto 2 : ";
 cin >> cateto2;

 // Calcular la hipotenusa
 hipotenusa=sqrt (cateto1*cateto1+cateto2*cateto2);

 // Mostrar el resultado
 cout << "La hipotenusa mide: " << hipotenusa << endl;

 return 0;
}
