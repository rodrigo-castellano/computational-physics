#include <iostream>
#include <cmath>
using namespace std;

void trianguloPascal(void)
{
    int i, j;
    double x[10][10];

    for (i=0;i<10;i++)
    {
       x[i][0]=x[i][i]=1;
       for(j=1;j<i;j++)
        x[i][j]=x[i-1][j-1]+x[i-1][j];

    }
    for (i=0;i<10;i++)
    {
      for (j=0;j<=i;j++) cout<<x[i][j]<<"  ";
      cout << endl;
    }
    return;
}

int main (void)
{
    trianguloPascal();
    return 0;
}

