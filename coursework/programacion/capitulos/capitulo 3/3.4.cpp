// realizar la funcion clotoide dados los valores del circulo y A
#include <iostream>
#include <cmath>
using namespace std;

double potencia (double x, double y)
{
    double z;
    z= exp(y*log(x));
    return z;
}

int factorial (int n)
{
    int i, prod;

    prod=1;
    for (i=1;i<=n;i++)
        prod=prod*i;
    return prod;
}

double clotoide(double a, double circulo)
{
    double z,prod,suma;
    int i,n;

    suma=1.0;
    z=a*sqrt (2*circulo);
    while (suma>1e-10)
    {
        for (i=0;i<=n;i++)
      {
        suma=suma +(potencia(-1,i)*potencia(circulo,2*i))/((4*i+1)*factorial(2*i));
      }
    }

    z=z*suma;
    return z;
}

int main (void)
{
    double a, circulo;
    cout<<"introduce A: "; cin >>a;
    cout << "introduce theta: " ; cin >> circulo;
    cout<<"clotoide es: ";
    cout<<clotoide(a,circulo);
    return 0;
}

