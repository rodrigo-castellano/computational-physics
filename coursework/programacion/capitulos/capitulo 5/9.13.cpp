#include <iostream>
#include <fstream>
using namespace std;
void mostrarMatriz(int x[][100], int nfils, int ncols);
void rellenarMatrizx(int x[][100], int nfils, int ncols);
bool copiarmatriz(int v[][100],int& nfils,int& ncols);



int main(void)
{

    int i,j, nfils, ncols;
    int x[100][100],r;
    cout<<"introduzca numero de filas: ";
    cin>>i;
    cout<<"introduzca numero de columnas: ";
    cin>>j;
    cout<<"primera matriz"<<endl;
    rellenarMatrizx(x,nfils, ncols);
    mostrarMatriz(x,nfils, ncols);
    copiarmatriz(x,i,j);
    mostrarMatriz(x,nfils, ncols);
    return 0;
}
void mostrarMatriz(int x[][100], int nfils1, int ncols2)
{
    int i, j;
    for (i=0;i<nfils1;i++)
      for (j=0;j<ncols2;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cout<<x[i][j]<<endl;
      }
    return;
}


void rellenarMatrizx(int x[][100], int nfils, int ncols)
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

bool copiarmatriz(int v[][100],int& nfils,int& ncols)
{
  int i,j;
  ifstream fich;
  fich.open("matriz.dat");
  if (fich.is_open())
  {
    fich>>nfils>>ncols;
    for(i=0;i<nfils;i++)
      {
        for(j=0;j<ncols;j++)
          fich>>v[i][j];
      }
      fich.close();
      return true;
  }
  else return false;
}

