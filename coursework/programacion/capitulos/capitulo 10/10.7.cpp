#include<iostream>
using namespace std;
class cMatriz;

class cMatriz
{
private:

   int filas;
   int columnas;
   double x[100][100];
public:
    cMatriz(void);
    int numfilas(void);
    int numcolumnas(void);
    bool escuadrada(void);

};

cMatriz::cMatriz(void)
{
    int i,j;
    filas=columnas=100;
    for(i=0;i<filas;i++)
        for(j=0;j<columnas;j++)
         if(i==j)x[i][j]=1.0;
         else x[i][j]=0.0;
}
int cMatriz::numfilas (void)
{
    return filas;
}
int cMatriz::numcolumnas(void)
{
    return columnas;
}

bool cMatriz::escuadrada(void)
{
   return (filas==columnas);
}
