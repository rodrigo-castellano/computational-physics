#include <iostream>
#include <cmath>
using namespace std;
void rellenarArray(double x[],int n);
double media(double x[], int n);
int temperatura (double x[], int n);


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

int temperatura (double x[], int n)
{
    int i, z;
    double suma;
    suma=0;
    for (i=0;i<n;i++)
        if (x[i]>media(x,n)) suma=suma+1;
    return suma;
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
    cout <<"el resultado es: "<<temperatura(x,n);
    return 0;

}
