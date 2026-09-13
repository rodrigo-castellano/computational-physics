#include <iostream>
#include <cmath>
using namespace std;
void rellenarMatriz(double x[][100], int nfils, int ncols);
void mostrarMatriz(double x[][100], int nfils, int ncols);


void mostrarMatriz(double x[][100], int nfils, int ncols)
{
    int i, j;
    for (i=0;i<nfils;i++)
      for (j=0;j<ncols;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cout<<x[i][j]<<endl;
      }
    return;
}

void rellenarMatriz(double x[][100], int nfils, int ncols)
{
    int i, j;
    for (i=0;i<nfils;i++)
      for (j=0;j<ncols;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cin>>x[i][j];
      }
    return;
}

int main (void)
{
    int i, nfils, ncols;
    cout<<"introduzca numero de filas: ";cin>>nfils;
    cout<<"introduzca numero de columnas: ";cin>>ncols;
    double x[nfils][100];
    rellenarMatriz(x,nfils,ncols);
    cout<<"esta es la matriz"<<endl;
    mostrarMatriz(x, nfils, ncols);
    return 0;
}
