#include <iostream>
using namespace std;

int buscar(int v[],int valor, int izda, int drcha)
{
    int centro;
    if(izda>drcha) return -1;
    else
    {
    centro= (drcha+izda)/2;
    if (v[centro]==valor)return centro;
    else if(v[centro]>valor) return buscar(v, valor, izda, drcha-1);
    else if(v[centro]<valor) return buscar(v, valor, izda+1, drcha);
    }
}
int main (void)
{
    int n, i, valor;
    cout<<"valor a buscar: ";
    cin>>valor;
    cout<<"numero de elementos: ";
    cin>>n;
    int v[n];
    cout<<"introduca matriz"<<endl;
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cin>>v[i];

    }
    cout<<"resultado: "<<endl;
    cout<<buscar(v,valor,0,n-1);



    return 0;
}
