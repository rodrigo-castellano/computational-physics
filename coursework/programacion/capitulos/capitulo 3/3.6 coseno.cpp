// funcion para calcular el coseno de un valor x real a partir del desarrollo de taylor
#include <iostream>
#include <cmath>
using namespace std;

int factorial (int n)
{
    int i, prod;

    prod=1;
    for (i=1;i<=n;i++)
        prod=prod*i;
    return prod;
}
double valorCoseno (int a, long int n)
{
    int i;
    double suma;
    suma = 0.0;
    for (i=0;i<=n;i++)
        suma =suma + pow(-1,n)*pow(a,2*i)/factorial(2*i);

    return suma;
}

int main (void)
{
    long int a,n;
    cout <<"introduzca el parametro numero: ";cin>>a;
    cout <<"introduzca el parametro veces: ";cin>>n;
    cout <<"el resultado es: "<<valorCoseno(a,n);
    return 0;
}
