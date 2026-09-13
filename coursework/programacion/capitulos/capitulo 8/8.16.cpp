#include <iostream>
using namespace std;

void ordenardato(string x[], int n)
{
   int i,j;
   string aux;
   for(i=1;i<n;i++)
    for(j<n-1;j>=i;j--)
     if(x[j]<x[j-1])
     {
         aux=x[j];
         x[j]=x[j-1];
         x[j-1]=x[j];
     }
     return;
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
    cout<<"ordenados: "<<endl;
    ordenardato(x,n);
    for(i=0;i<n;i++)
    {
       cout<<"elemento "<<i<<": ";
       cout<<x[i];
       cout<<endl;
    }
    return 0;
}
