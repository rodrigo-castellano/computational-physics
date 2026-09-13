#include <iostream>
#include <cmath>
using namespace std;
void rellenarArray(double x[],int n);
void rellenarArray(double y[],int n);


double calcularprodescalar(double x[], double y[], int n)
{
    int i;
    double suma;
    suma=0.0;
    for (i=0;i<n;i++)
        suma=suma+x[i]*y[i];
    return suma;
}

void rellenarArrayx(double x[],int n)
{
    int i;
    for (i=0;i<n;i++)
    {
        cout<<"introduzca elemento "<<i+1<<": ";
        cin>>x[i];
    }
    return;
}
void rellenarArrayy(double y[],int n)
{
    int i;
    for (i=0;i<n;i++)
    {
        cout<<"introduzca elemento "<<i+1<<": ";
        cin>>y[i];
    }
    return;
}

int main (void)
{
    int i, n;

    do{
            cout<<"introduzca numero de elementos (100 maximo): ";
            cin>>n;
    }while((n<0)||(n>100));
    double x[n], y[n];

    cout<<"rellenar vector 1"<<endl;
    rellenarArrayx(x,n);
    cout <<"rellenar vector 2"<<endl;
    rellenarArrayy(y,n);

    cout <<"el resultado es: "<<calcularprodescalar(x,y,n);
    return 0;

}
