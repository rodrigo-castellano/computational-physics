#include <iostream>
int posmin(int v[],int n, int j);
double media(int v[], int n);
using namespace std;

int posmin(int v[],int n, int j)
{
    int i, min, posmin;
    double suma;
    min=0;
    posmin=0;
    for (i=0;i<n;i++)
    {
        suma=suma+((v[i]-v[j])*(v[i]-v[j]))/((media(v,n)+v[j])*(media(v,n)+v[j]));
        if(suma<min)
        {
          min=suma;
          posmin=i;
        }
    }
    return posmin;
}
double media(int v[], int n)
{
    int i;
    double suma;
    suma=0.0;
    for(i=0;i<n;i++)
        suma=suma+v[i];
    return 1.0*suma/n;
}




int main(void)
{
    int n, i, j;
    cout<<"numero de elementos: ";
    cin>>n;
    cout<<"numero a actuar: ";
    cin>>j;
    int v[n];
    cout<<"rellenar el vector"<<endl;
    for (i=0;i<n;i++)
    {
        cout<<"vector "<<i<<" : ";
        cin>>v[i];
    }
    cout<<posmin(v,n,j);
    return 0;
}
