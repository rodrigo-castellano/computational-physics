#include <iostream>
#include <fstream>
using namespace std;

void ordenarenteros(string nf)
{
    int n,v[1000],j,i, aux,pos;
    ifstream f1;
    ofstream f2;
    n=0;
    f1.open(nf.c_str());
    while(!f1.eof())
    {
        f1>>v[n];
        n++;
    }
    f1.close();
    for(i=0;i<(n-1);i++)
      {
        pos=i;
        for (j=(i+1);j<n;j++)
          if (v[j]<v[pos]) pos=j;
          {
               aux=v[i];
               v[i]=v[pos];
               v[pos]=aux;
          }
      }
    f2.open(nf.c_str());
    for(i=0;i<n;i++)
        f2<<v[i]<<endl;
    return;
}
int main(void)
{
    string x;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    ordenarenteros(x);
    return 0;
}
