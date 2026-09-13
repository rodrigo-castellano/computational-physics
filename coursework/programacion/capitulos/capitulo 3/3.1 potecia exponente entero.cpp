//calcular la potencia n-esima de un numero real, con exponente entero. escribir funcion principal para comprobar el resultado

#include <iostream>
using namespace std;

double potencia (double x, int y)
{
    int i;
    double prod;
    prod=1.0;
    for (i=1; i<=y;i++)
        prod=prod*x;

    return prod;
}

int main (void)
{
    int b;
    double a;
    cout <<"introduzca base"<<endl;
    cin >> a;
    cout << "introduzca exponente"<<endl;
    cin>> b;
    cout << "la potencia es igual a: "<< potencia (a,b);
    return 0;
}
