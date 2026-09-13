#include <iostream>
#include <fstream>
using namespace std;

void pasarmatriz(int v[100][100],int nfils,int ncols)
{
  int i,j;
  ofstream fich;
  fich.open("matriz.dat");
  fich<<nfils<<" "<<ncols<<endl;
  for(i=0;i<nfils;i++)
  {
      for(j=0;j<ncols;j++)
        fich<<v[i][j];
  }
  fich.close();
  return;
}
int main(void)
{

    int i,j, nfils, ncols;
    int x[100][100];
    cout<<"introduzca numero de filas: ";
    cin>>i;
    cout<<"introduzca numero de columnas: ";
    cin>>j;

     for (i=0;i<nfils;i++)
      for (j=0;j<ncols;j++)
      {
        cout<<"elemento ["<<i+1<<","<<j+1<<"]: ";
        cin>>x[i][j];
      }

    pasarmatriz(x,i,j);
    return 0;
}
