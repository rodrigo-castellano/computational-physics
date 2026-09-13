#include<iostream>
using namespace std;

int resto(int n ,int m)
{
    if (n<m) return n;
    else return resto(n-m,m);
}


int main (void)
{
    int m,n;
    cout<<"introduzca dividendo: ";
    cin>>n;
    cout<<"introduzca divisor: ";
    cin>>m;
    cout<<resto(n,m)<<endl;
    return 0;
}

