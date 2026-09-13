#include <iostream>
using namespace std;

double digitos(int n)
{
    if (n<10) return 1;
    else return 1+digitos(n/10);
}
int main (void)
{
    int n;
    cout<<"introuduzca numero: ";
    cin>>n;
    cout<<digitos(n);
    return 0;
}
