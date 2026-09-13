// realizar la funcion que devuelva la expresion

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

double funcion( double a, double x, int n)
{
    double suma;
    int i;
    suma =0.0;
    for (i=0;i<=n;i++)

    {
        if (i%2==0) suma= suma + (pow(x,n-1)*factorial(n))/(pow(a,i)*(n-1));
        else suma= suma -(pow(x,n-1)*factorial(n))/(pow(a,i)*(n-1));
    }
    return suma;
}
