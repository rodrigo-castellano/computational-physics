#include <iostream>
#include <cstdlib>
#include <cmath>
#include "mivectores.hpp"
double CalcularMedia(int v[], int n)
{
    int i;
    double suma;
    suma=0.0;
    for (i=0;i<n;i++)
        suma=suma+v[i];
    return suma/n;

}

double CalcularVarianza(int v[], int n, double media)
{
    int i;
    double suma;
    suma=0.0;
    for (i=0;i<n;i++)
        suma=suma+(media-v[i])*(media-v[i]);
    return suma/n;
}

double CalcularDesviacion(double varianza)
{
    return sqrt(varianza);
}

void RellenarVector (int v[], int n)
{
    int i;
    for(i=0;i<n;i++)
    {
        cout << "elemento v[" << i <<"] :";
        cin >>v[i];
    }
    return;
}



void MostrarVector(int v[], int n)
{
    int i;
    for (i=0;i<n;i++)
    {
        cout << "Elemento v["<<i<<"] : "<<v[i]<<endl;
        if ((i+1)%22==0)system ("pause");
    }
    return;
}

double  CalcularMediaGeometrica(int v[], int n)
{
    int i;
    double prod;

    prod=1.0;    for(i=0;i<n;i++)prod=prod*v[i];

    return pow(prod,(1.0/n));
}
