#include <iostream>
using namespace std;

int posmax(double v[],int n)
{
    int i, max, posmax;
    max=0;
    posmax=0;
    for (i=0;i<n;i++)
        if(v[i]>max)
        {
          max=v[i];
          posmax=i+1;
        }
    return posmax;
}

int main(void)
{
    int n, i;
    cout<<"numero de elementos: ";
    cin>>n;
    double v[n];
    cout<<"rellenar el vector"<<endl;
    for (i=0;i<n;i++)
    {
        cout<<"vector "<<i+1<<" : ";
        cin>>v[i];
    }
    cout<<"la posicion del elemento mas grande es: "<<posmax(v,n);
    return 0;
}
