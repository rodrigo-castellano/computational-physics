#include <iostream>
#include <cmath>
using namespace std;

int resto(int z, int k)
{
    if (z<k) return z;
    else return resto(z-k,k);
}
int cociente(int z, int k)
{
    if (z<k) return 0;
    else return 1+cociente(z-k,k);
}


int main (void)
{
    int z,k;
    cout<<"introuduzca numerador: ";
    cin>>z;
    cout<<"introuduzca divisor: ";
    cin>>k;
    cout<<"el resto es :"<<resto(z,k)<<endl;
    cout<<"el cociente es :"<<cociente(z,k);
    return 0;
}
