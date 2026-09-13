#include <iostream>
using namespace std;

void factoresprimos(int n)
{
    int i;
    double suma;
    suma=0;
    cout<<"1";
    for (i=2;i<n;i++)
    {
        while(n%i==0)
        {
         cout<<"*"<<i;
         n=n/i;
        }
        suma=suma+i;
    }
    return;
}

int main (void)
{
    int n;
    cout<<"escriba numero: ";
    cin>>n;
    cout<<"el numero es: "<<factoresprimos(n);
    return 0;
}
