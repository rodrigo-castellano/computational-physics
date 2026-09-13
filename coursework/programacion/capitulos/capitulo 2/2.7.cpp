/*numero multiplos a la vez de 3, 5 o 7 comprendidos entre 2 numero introducidos en el teclado*/
#include <iostream>
using namespace std;
int main (void)
{
    int i,a, b;

    cout << "introduzca los 2 numeros (intervalo desde el que se va a trabajar): ";
    cin >> a;
    cout <<"y ";
    cin >>b;

    for (i=a; i<=b; i++)

    {
        if (((i%3)==0) && ((i%5)==0) && ((i%7)==0)) cout << i << endl;
    }

    return 0;
}





