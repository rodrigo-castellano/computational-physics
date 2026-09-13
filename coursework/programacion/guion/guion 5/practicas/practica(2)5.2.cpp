#include <iostream>
#include <cmath>

double valorE(double x, int i);
double potencia(double x,int i);
double factorial (int n);
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


double factorial (int n)
{
    int i;
    double prod;

    prod=1;
    for (i=1;i<=n;i++)
        prod=prod*i;
    return prod;
}

double valorE(double x, int y)
{
    double suma;
    int i;
    suma=0.0;
    for (i=0;i<=y;i++)
        suma=suma+ potencia(x,i)/factorial(i);
    return suma;
}

int main (void)
{
    int x,y;
    cout <<"introduzca el exponente: ";cin>>x;
    cout <<"introduzca el numero de operaciones: ";cin>>y;
    cout<<setprecision(10);
    cout <<"el valor es: "<<valorE(x,y);
    return 0;

}
