/*Realizar un programa para calcular el logaritmo de un número en cualquier base.
El programa pedira al usuario que introduzca el número y la base del logaritmo,
y el programa mostrará el resultado.*/

#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;

int main (void)
{

    int base, numero;
    double logaritmo;

    cout << "Introduzca un numero: ";
    cin >> numero;

    cout <<endl << "Introduzca una base: ";
    cin >> base;
    cout << setprecision(3);
    cout << fixed;
    if((base>0) && (numero>0))
    {
        cout << "El logaritmo del numero en esa base es: ";
        cout << (log (numero)/log (base));
    }
    else cout <<"No se puede realizar la operacion";
    return 0 ;
}
