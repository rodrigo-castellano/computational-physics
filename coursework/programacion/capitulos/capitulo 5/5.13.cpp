#include <iostream>
#include <cmath>
using namespace std;
double sumatoriaf (double s, double x[], int n, int i)
{
    int j;
    double prod;
    prod=1.0;
    for (j=0;j<i;j++)
      prod=prod*((s-x[j]))/(x[i]-x[j]);
    for (j=i+1;j<n;j++)
      prod=prod*(s-x[j])/(x[i]-x[j]);

    return prod;

}

double sumatoriar (double x[], double y[], double s, int n)
{
    int i;
    double suma;
    suma=0.0;
    for (i=0;i<n;i++)
        suma=suma +sumatoriaf(s,x,n,i)*y[i];
    return suma;
}
