#include<iostream>
using namespace std;

int division(int n ,int m)
{
    if (n<m) return 0;
    else return division(n-m,m)+1;
}


int main (void)
{
    int m,n;
    cout<<"introduzca dividendo: ";
    cin>>n;
    cout<<"introduzca divisor: ";
    cin>>m;
    cout<<division(n,m)<<endl;
    return 0;
}

