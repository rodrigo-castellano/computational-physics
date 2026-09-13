#include <iostream>
using namespace std;

void rellenarArray(double x[],int n)
{
    int i;
    for (i=0;i<n;i++)
    {
        cout<<"introduzca elemento "<<i+1<<": ";
        cin>>x[i];
    }
    return;
}
double media(double x[], int n)
{
    int i;
    double suma;
    suma=0.0;
    for (i=0;i<n;i++)
        suma=suma+x[i];
    return suma/n;
}


int main (void)
{
    int i, n;

    do{
            cout<<"introduzca numero de elementos(100 maximo): ";
            cin>>n;
    }while((n<0)||(n>100));

    double x[n];

    rellenarArray(x,n);

    cout<<"la media es: "<<media(x,n);
    return 0;
}

