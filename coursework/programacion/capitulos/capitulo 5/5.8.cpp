#include <iostream>
#include <cmath>
using namespace std;
void rellenarMatrizx(double x[][100], int nfils, int ncols);
void rellenarMatrizy(double y[][100], int nfils, int ncols);
void sumaMatriz(double x[][100], double y[][100], double r[][100], int nfils, int ncols);
void mostrarMatriz(double x[][100], int nfils, int ncols);

void mostrarMatriz(double r[][100], int nfils, int ncols)
{
    int i, j;
    for (i=0;i<nfils;i++)
      for (j=0;j<ncols;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cout<<r[i][j]<<endl;
      }
    return;
}

void sumaMatriz(double x[][100], double y[][100], double r[][100], int nfils, int ncols)
{
   int i, j;


    for (i=0;i<nfils;i++)
        for (j=0;j<ncols;j++)
           r[i][j]=x[i][j]+y[i][j];
    return ;
}

void rellenarMatrizx(double x[][100], int nfils, int ncols)
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

void rellenarMatrizy(double y[][100], int nfils, int ncols)
{
    int i, j;
    for (i=0;i<nfils;i++)
      for (j=0;j<ncols;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cin>>y[i][j];
      }
    return;
}

int main (void)
{
    int i, nfils, ncols;
    cout<<"introduzca numero de filas: ";cin>>nfils;
    cout<<"introduzca numero de columnas: ";cin>>ncols;

    double x[nfils][100];
    double y[nfils][100];
    double r[nfils][100];

    cout<<"primera matriz"<<endl;
    rellenarMatrizx(x,nfils,ncols);
    cout<<"segunda matriz"<<endl;
    rellenarMatrizy(y,nfils,ncols);

    sumaMatriz(x,y,r, nfils, ncols);
    cout<<"el resultado de la suma es: "<<endl;
    mostrarMatriz(r,nfils,ncols);

    return 0;
}
