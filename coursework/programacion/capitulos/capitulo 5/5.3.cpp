#include <iostream>
#include <cmath>
using namespace std;
double medgeom(double x[], int n);
void rellenarArray(double x[],int n);

double medgeom(double x[], int n)
{
    int i;
    double prod;
    prod=1.0;

    for (i=0;i<n;i++)
        prod=prod*x[i];
    return pow(prod,(1.0/n));

}

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

int main (void)
{
    int i, n;

    do{
            cout<<"introduzca numero de elementos(100 maximo): ";
            cin>>n;
    }while((n<0)||(n>100));

    double x[n];

    rellenarArray(x,n);

    cout<<"la media geometrica es: "<<medgeom(x,n);
    return 0;
}
