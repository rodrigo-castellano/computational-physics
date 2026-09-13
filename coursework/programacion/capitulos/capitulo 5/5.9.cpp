#include <iostream>
#include <cmath>
using namespace std;
void rellenarMatrizx(double x[][100], int nfils, int ncols);
void rellenarMatrizy(double y[][100], int nfils, int ncols);
void productoMatriz(double x [][100], double y[][100], double r[][100],int nfils1, int ncols1,int ncols2);
void mostrarMatriz(double x[][100], int nfils, int ncols);

void mostrarMatriz(double r[][100], int nfils1, int ncols2)
{
    int i, j;
    for (i=0;i<nfils1;i++)
      for (j=0;j<ncols2;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cout<<r[i][j]<<endl;
      }
    return;
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

void productoMatriz(double x [][100], double y[][100], double r[][100],int nfils1, int ncols1,int ncols2)
{
    for(int i=0; i<nfils1; ++i)
        for(int j=0; j<ncols2; ++j)
            for(int z=0; z<ncols1; ++z)
                r[i][j] += x[i][z] * y[z][j];

    return;
}






int main (void)
{
    double x[100][100], y[100][100], r[100][100];
    int nfils1, ncols1, ncols2;
    cout<<"introduzca numero de filas de 1º matriz: ";
    cin >>nfils1;
    cout<<"introduzca numero de filas de 2º matriz: ";
    cin >>ncols1;
    cout<<"introduzca numero de columnas de 2ºmatriz: ";
    cin >>ncols2;

    cout<<"primera matriz"<<endl;
    rellenarMatrizx(x,nfils1, ncols1);
    cout<<"segunda matriz"<<endl;
    rellenarMatrizy(y,ncols1,ncols2);


    productoMatriz(x,y,r, nfils1,ncols1,ncols2);
    mostrarMatriz(r,nfils1, ncols2);

    return 0;
}
