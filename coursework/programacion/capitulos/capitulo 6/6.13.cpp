#include <iostream>
using namespace std;

double fibonacci(int n)
{
    int j,P1,P2,P;
    P=P1=P2=1;
    for(j=3;j<=n;j++)
        P=P1+P2;
        P1=P;
        P2=P1;
    return P;
}

int main (void)
{
    int n;
    cout<<"introuduzca numero: ";
    cin>>n;
    cout<<fibonacci(n);
    return 0;
}
