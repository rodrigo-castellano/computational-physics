#include "mimatriz.hpp"
using namespace std;
void rellenarMatriz(double x[][100], int nfils, int ncols);
void productoMatriz(double x [][100], double y[][100], double r[][100],int nfils1, int ncols1,int ncols2);
void mostrarMatriz(double x[][100], int nfils, int ncols);
void sumaMatriz(double x[][100], double y[][100], double r[][100], int nfils, int ncols);
void escalarXmatriz(double x[][100], double f[][100], int nfils, int ncols, int escalar);

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


void productoMatriz(double x [][100], double y[][100], double r[][100],int nfils1, int ncols1,int ncols2)
{
    for(int i=0; i<nfils1;i++)
        for(int j=0; j<ncols2;j++)
            for(int z=0; z<ncols1;z++)
                r[i][j] += x[i][z] * y[z][j];

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

void escalarXmatriz(double x[][100], double f[][100], int nfils, int ncols, int escalar)
{
    int i, j;
    for(i=0;i<nfils;i++)
    {
        for(j=0;j<ncols;j++)
            f[i][j]=x[i][j]*escalar;
    }

    return;


}

