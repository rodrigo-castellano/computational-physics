#ifndef MIVECTORES_H_INCLUDED
#define MIVECTORES_H_INCLUDED

#include <iostream>
#include <cmath>
using namespace std;

double CalcularMedia(int v[], int n);
double CalcularVarianza(int v[], int n, double media);
double CalcularDesviacion(double varianza);
void RellenarVector (int v[], int n);
void MostrarVector(int v[], int n);
double CalcularMediaGeometrica(int v[], int n);


#endif // MIVECTORES_H_INCLUDED


