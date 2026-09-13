#include <iostream>
using namespace std;

bool guay(int n)
{
    int i, j;
    double suma;
    bool encontrado;
    encontrado=false;

    i=1;


    while ((i<(n/2))&& (encontrado==false))
    {
     suma = i;
     j=i+1;
     while ((suma<(n)&& (encontrado==false)))
     {
        suma=suma+j;
        if (suma==n) encontrado=true;
        else j++;
     }
     i++;
    }
    return encontrado;
}

int main (void)
{
    int n;
    cout<<"escriba numero: ";
    cin >>n;
    cout <<"el numero es: "<<guay(n);
    return 0;
}

