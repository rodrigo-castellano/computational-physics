#include <iostream>
using namespace std;

int main (void)
{
    int i;
    int suma;
    suma=0;
    int n;

    cout<<"escriba numero: ";
    cin>>n;

    cout<<"1";
    for (i=2;i<n;i++)
    {

        do{
         cout<<"*"<<i;
         n=n/i;
        }while(n%i==0);
        suma=suma+i;
    }
    return 0;
}


