#include <iostream>
#include <cmath>
using namespace std;

double serie(int n)
{
    if (n==0) return 4;
    else return pow(-1,n)*4.0/(2*n+1);
}

int main (void)
{
    int n;
    cout<<"introuduzca valor: ";
    cin>>n;
    cout<<serie(n);
    return 0;
}
