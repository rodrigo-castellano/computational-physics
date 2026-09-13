/* programa que capta un numero entero y dice si es par o impar*/

#include <iostream>
using namespace std;

int maid (void)
{
    int numero;

    cout << "introduzca un numero entero:";
    cin >> numero;

    if ((numero % 2) == 0) cout << "el número es par" << endl;
    else  cout << "el número es impar" << endl;

    return 0;
}
