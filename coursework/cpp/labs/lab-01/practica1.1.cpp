/* Programa para calcular el área de un triángulo a partir de su base y su altura.
Entradas: valor de la base y la altura
Salida: valor de el área del triángulo
*/
#include <iostream>
#include <cmath>
using namespace std;

int main (void)
{
 // Declaracion de variables
 double base, altura, area;

 // Pedir el valor de la base
 cout <<"Introduzca base : ";
 cin >> base ;

 // Pedir el valor de la altura
 cout << "Introduzca altura  : ";
 cin >> altura;

 // Calcular el área
 area= (base*altura/2);

 // Mostrar el resultado
 cout << "el area vale: " <<area << endl;

 return 0 ;
}
