#include <iostream>
using namespace std;

double raiz(double n, double precision)
{
    double y;
    y=0.0;
    while (y*y<n)
        y=y+precision;
    return y;
}

int main(void)
{
    double n,x;
    cout<<"introduzca valor :";
    cin>>n;
    cout<<"introduzca precision :";
    cin>>x;
    cout<<raiz(n,x);
    return 0;
}
