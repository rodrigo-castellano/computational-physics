#include <iostream>
#include <cmath>
using namespace std;

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
