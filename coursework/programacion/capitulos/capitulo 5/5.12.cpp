#include <iostream>
#include <cmath>
using namespace std;

void ecuacion(double a[][100], double c[], double x[], int n)
{

int i, j,numerador;
    for (i=0;i<n;i++)
        {
        numerador=c[i];
        for (j=0;j<n;j++)
          numerador=(numerador -a[i][j]*x[j]);
        x[i]= numerador/a[i][i];
        }
    return;
}
