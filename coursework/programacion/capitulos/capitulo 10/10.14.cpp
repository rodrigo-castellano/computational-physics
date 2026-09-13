#include<iostream>
using namespace std;


int ordenar(cPais v[],int n)
{
    int j,i;
    for (i=1;i<n;i++)
        for(j=n-1;j>=i;j--)
        {
            if(v[j].densidad()<v[j-1].densidad())
                intercambia(v[j],v[j-1]);

        }
   return;
}
