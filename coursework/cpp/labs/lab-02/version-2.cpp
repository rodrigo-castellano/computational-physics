/* Programa ejemplo que muestra un número real por pantalla utilizando diferentes formatos.*/

#include <iostream>
#include <iomanip>

using namespace std;

int main (void)

{
    int num ;
    cout << " Introduzca un numero : " ;
    cin >> num;

    cout << " En base decimal el numero es : " ;
    cout << showbase;
    cout << dec;
    cout << num;
    cout << endl;

    cout << " En base hexadecimal el numero es : " ;
    cout << showbase;
    cout << hex;
    cout << num;
    cout << endl;


    cout << " En base octal el numero es : " ;
    cout << showbase;
    cout << oct;
    cout << num;
    cout << endl;


    return 0 ;
}
