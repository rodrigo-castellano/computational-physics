/*programa que pide al usuario meter n mumeros reales(n entero, introducido por el usuario) y al final muestre su media aritmetica*/
#include <iostream>
using namespace std;
int main (void)
{
    int i, n;
    double num, suma, media;

    cout << "introducir numero de valores de los que se va a hacer la media: ";
    cin>>n;

    suma=0.0;
    for (i=1; i<=n; i++)
    {
        cout <<"introduzca numero "<<i<<": ";
        cin >>num;
        suma = suma+num;
    }

    cout << "la media es: "<< suma/n;


    return 0;
}
