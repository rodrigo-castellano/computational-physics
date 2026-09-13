#include <iostream>
using namespace std;

double raiz(double x, int n)
{
    if (n==0) return x;
    else return 0.5*(x/raiz(x,n-1)+raiz(x,n-1));
}

int main (void)
{
    int n;
    double x;
    cout<<"introuduzca valor: ";
    cin>>x;
    cout<<"introuduzca operaciones: ";
    cin>>n;
    cout<<raiz(x,n);
    return 0;
}
