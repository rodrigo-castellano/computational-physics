#include <iostream>
using namespace std;

double catalan(int n)
{
    if (n==0) return 1;
    else if (n>0)return (2*(2*n-1)*catalan(n-1))/(n+1);a
}

int main (void)
{
    int n;
    cout<<"introuduzca operaciones: ";
    cin>>n;
    cout<<catalan(n);
    return 0;
}
