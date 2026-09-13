/* que calcule esa expresion, con n y p enteros*/

#include <iostream>
using namespace std;
int main (void)
{
    int n, i, j, p;
    double suma, producto;

    cout<<"pon exponente: ";cin>>p;
    cout<<"numero de terminos: "; cin >>n;

    suma=0.0;
    for (i=1;i<=n;i++)
    {
        producto=1.0;
        producto=producto*i;
        for (j=1;j<=p;j++)
        producto/(producto+1);
        suma = suma + producto/(producto +1);

    }
    cout <<"el resultado es: "<<suma;
    return 0;
}

