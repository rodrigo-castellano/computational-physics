#include <iostream>
using namespace std;

double cuadrado(int n)
{
    if (n==0) return 0;
    else return  (2*n-1)+cuadrado(n-1);
}
int main (void)
{
    int n;
    cout<<"introuduzca valor: ";
    cin>>n;
    cout<<cuadrado(n);
    return 0;
}
