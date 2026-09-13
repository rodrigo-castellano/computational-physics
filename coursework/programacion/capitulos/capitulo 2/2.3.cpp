/* capta 2 numeros enteros y muestra su suma producto o resta*/

#include <iostream>
using namespace std;
int main (void)
{
   int a, b;
   int opcion;
   cout << "introduzca a: "; cin >> a;

   cout << "Introduzca b: "; cin >> b;

   cout << "escoja entre restar(2), sumar(1) o multiplicar(3): "; cin >> opcion;

   if (opcion == 1) cout << a+b << endl;
   else if (opcion == 2) cout << a-b << endl;
   else cout << a*b;
   return 0 ;
}
