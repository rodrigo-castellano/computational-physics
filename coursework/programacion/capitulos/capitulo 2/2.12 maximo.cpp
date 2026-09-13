/*programa que solicita al usuario que introduzca 10 numeros reales y al final muestre el mas grande*/
#include <iostream>
using namespace std;
int main (void)
{
    int i;
    double maximo, num;

    cout <<"introduzca el valor numero 1: ";cin>> num;

    maximo=num;

    for (i=2;i<=10;i++)
    {
        cout << "introduzca el valor numero"<<i<<": ";
        cin >>num;
        if (num>maximo) maximo=num;
    }

    cout << "el maximo es: "<< maximo;
    return 0;
}
