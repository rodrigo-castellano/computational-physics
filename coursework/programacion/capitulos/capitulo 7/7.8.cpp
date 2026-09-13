#include <iostream>
using namespace std;
double media(double v[], int n);
void funcion(double v[], double x[], int n);
void intercambiar(int& a, int& b);
void ordenar(double v[], double x[], int n);

void intercambiar(double& a, double& b)
{
    double aux;
    aux=a;
    a=b;
    b=aux;
    return;
}


void ordenar(double v[], double x[], int n)
{
    int i, j;
    for(i=0;i<n-1;i++)
       for(j=n-1;j>=i;j--)
         if(x[j]<x[j-1])
         {
            intercambiar(x[j],x[j-1]);
            intercambiar(v[j],v[j-1]);
         }

    return;
}

double media(double v[], int n)
{
    int i;
    double suma;
    suma=0.0;
    for(i=0;i<n;i++)
        suma=suma+v[i];
    return 1.0*suma/n;
}
void funcion(double v[], double x[], int n)
{
    int i;
    int j;
    for (j=0;j<n;j++)
    {
      x[j]=0.0;
      for (i=0;i<n;i++)
        x[j]=((v[i]-v[j])*(v[i]-v[j]))/(((media(v,n)+v[j])*(media(v,n)+v[j])));
    }
    return;
}

int main (void)
{
    int n, i;
    cout<<"numero de elementos: ";
    cin>>n;
    double v[n], x[n];
    cout<<"introduca matriz"<<endl;
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cin>>v[i];

    }
    cout<<"la matriz nueva es: "<<endl;
    funcion(v,x,n);
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cout<<x[i]<<endl;

    }
    cout<<"y la otra: "<<endl;
    for(i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<" : ";
        cout<<v[i]<<endl;

    }


    return 0;
}
