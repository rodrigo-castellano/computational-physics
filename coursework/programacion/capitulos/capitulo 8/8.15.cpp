#include <iostream>
using namespace std;

int buscardato(string x[], int n, string nombre)
{
    int centro,izda,drcha;
    centro=(izda+drcha)/2;
    izda=0;drcha=n-1;
    bool encontrado;
    encontrado=false;
    while((izda<=drcha)&&(encontrado==false))
    {
        if(x[centro]==nombre)encontrado=true;
        else if (x[centro]>nombre)drcha=centro-1;
        else  izda=centro+1;
    }
    if (encontrado)return centro;
    else return -1;
}
int main (void)
{
    string nombre;
    int n,i;
    cout<<"numero de elementos: ";cin>>n;
    string x[n];
    cout<<"introduzca array: "<<endl;
    for(i=0;i<n;i++)
    {
       cout<<"introduzca elemento "<<i<<": ";
       cin>>x[i];
       cout<<endl;
    }
    cout<<"elemento a buscar: ";
    cin>>nombre;
    cout<<"posicion : ";
    cout<<buscardato(x,n,nombre);
    return 0;
}
