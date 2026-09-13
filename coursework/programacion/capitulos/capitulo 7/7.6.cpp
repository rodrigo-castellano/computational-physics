//ordenar descendientemente
#include <iostream>
using namespace std;
void intercambiar(int& a, int& b);
void decr(int v[], int n);



void decre(int v[], int n)
{
    int i, j,pos;
    for(j=0;j<(n-1);j++)
    {
      pos=j;
      for (i=(j+1);i<n;i++)
        if (v[pos]<v[i]) pos=i;
      intercambiar(v[j],v[pos]);
    }

    return;
}
void decr(int v[], int n)
{
    int i, j;
    for (i=1;i<n;i++)
        for(j=n-1;j>=i;j--)
           if (v[j]>v[j-1]) intercambiar(v[j],v[j-1]);
    return;
}
void intercambiar(int& a, int& b)
{
    int aux;
    aux=a;
    a=b;
    b=aux;
    return;
}
int main (void)
{
    int n, i;
    cout<<"numero de elementos: ";
    cin>>n;
    int v[n];
    cout<<"introduca matriz"<<endl;
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cin>>v[i];

    }
    cout<<"la matriz ordenada es: "<<endl;
    decr(v,n);
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cout<<v[i]<<endl;

    }


    return 0;
}
