/* programa que calcula menos 1 elevado a n, siendo n un entero introducido desde el teclado*/

#include <iostream>
using namespace std;
int main (void)
{
    int numero;
    cout << "introduzca un exponente :";
    cin >> numero;
    cout << "(-1) elevado a " <<numero << " vale" << endl;

    if ((numero % 2) != 0) cout << "-1" << endl;
    else cout << 1;

    return 0 ;
}
