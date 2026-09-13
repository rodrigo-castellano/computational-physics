// realizar la funcion que devuelva la expresion

#include <iostream>
#include <cmath>
using namespace std;
double funcion (int n, double x)
{
    int i;
    double suma;
    suma=0.0;

    for (i=0; i<=n; i++)
        suma=suma+pow(x,2*i+1)/(2*i+1);
    return suma;

}
