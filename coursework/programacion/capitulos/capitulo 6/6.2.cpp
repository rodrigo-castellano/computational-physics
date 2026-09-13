#include <iostream>
using namespace std;

double legendre (double x, int n)
{
    if(n==0)return 1;
    else if (n==1) return x;
    else return ((2.0*n-1)/n)*x*legendre(x,n-1)-((n-1)/n)*legendre(x,n-2);
}

int main (void)
{
    int n;
    double x;
    cout<<"introuduzca valor: ";
    cin>>x;
    cout<<"introuduzca operaciones: ";
    cin>>n;
    cout<<legendre(x,n);
    return 0;
}
