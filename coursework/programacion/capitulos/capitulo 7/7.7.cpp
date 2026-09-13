#include <iostream>
using namespace std;
void intercambiar(int& a, int& b);
void ordenar(int v[],int n,int x);

void ordenar(int v[],int n,int x)
{
    int i,j;
    int posmin;
    for (i=0;i<n-1;i++)
        posmin=i;
        for(j=i+1;j<n;j++)
         if((v[posmin]%x)>(v[j]%x)) posmin=j;
    intercambiar(v[i],v[posmin]);
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
    int n, i,x;
    cout<<"introduzca la x: ";
    cin>>x;
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
    ordenar(v,n,x);
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cout<<v[i]<<endl;

    }


    return 0;
}
