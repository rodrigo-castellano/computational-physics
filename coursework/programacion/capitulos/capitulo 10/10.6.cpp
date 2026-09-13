#include<iostream>
using namespace std;

class cMatriz
{
public:
    int filas;
    int columnas;
    double x[10][10];
    cMatriz(void);
    cMatriz operator +(cMatriz m2) ;
};

cMatriz::cMatriz(void)
{
    int i,j;
    filas=columnas=10;
    for(i=0;i<filas;i++)
        for(j=0;j<columnas;j++)
         x[i][j]=0.0;
}

cMatriz cMatriz::operator + (cMatriz m2)
{
   int i,j;
   cMatriz res;
   res.filas=filas;
   res.columnas=columnas;

   for(i=0;i<filas;i++)
        for(j=0;j<columnas;j++)
         res.x[i][j]=x[i][j]+m2.x[i][j];
   return res;
}

cMatriz sumar(cMatriz v[], int n, int filas ,int columnas)
{
    cMatriz msuma;
    int i;
    msuma.filas=filas;
    msuma.columnas=columnas;
    for(i=0;i<n;i++)
        if((v[i].filas==filas)&&(v[i].columnas=columnas))
        msuma=msuma+v[i];
    return msuma;
}
