/* capta 2 numeros enteros y muestra su suma producto o resta*/

#include <iostream>
using namespace std;
int main (void)
{
   int op1, op2;
   int opcion;
   cout << "introduzca a: "; cin >> op1;

   cout << "Introduzca b: "; cin >> op2;

   cout << "escoja entre restar(2), sumar(1), multiplicar(3) o dividir (4): "; cin >> opcion;

   if (opcion==1) cout << op1+op2 << endl;
   else if (opcion==2) cout << "el resultado es: " << op1-op2 << endl;
   else if (opcion==3) cout << "el resultado es: " << op1*op2 << endl;
   else
   {
       if (op1!=0) cout << "el resultado es: " << 1.0*op1/op2;
       else cout << "no puedes entre cero, capullo";
   }
   return 0 ;
}
