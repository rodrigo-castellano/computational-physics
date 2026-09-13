#ifndef MIMATRIZ_HPP_INCLUDED
#define MIMATRIZ_HPP_INCLUDED

#include<iostream>
#include<cmath>
using namespace std;

void rellenarMatriz(double x[][100], int nfils, int ncols);
void productoMatriz(double x [][100], double y[][100], double r[][100],int nfils1, int ncols1,int ncols2);
void mostrarMatriz(double x[][100], int nfils, int ncols);
void sumaMatriz(double x[][100], double y[][100], double r[][100], int nfils, int ncols);
void escalarXmatriz(double x[][100], double f[][100], int nfils, int ncols, int escalar);

#endif // MIMATRIZ_HPP_INCLUDED
