#include <iostream>
using namespace std;

double f(int n)
{
    if (n==0)return 0;
    if (n==1)return 1;
    if (n==2)return 2;
    else return f(n-3)+2*f(n-2)+f(n-1);
}

double fn(int n)
{
    int i, p, p1, p2, p3;
    p3=0;
    p2=1;
    p1=2;
    for (i=3;i<=n;i++)
      {
        p=p1+2*p2+p1;
        p3=p2;
        p2=p1;
        p1=p;
      }
      return p;
}

int main (void)
{
    int z;
    cout<<"introuduzca a: ";
    cin>>z;
    cout<<" recursiva el valor es :"<<f(z)<<endl;
    cout<<"iterativa el valor es :"<<fn(z)<<endl;
    return 0;
}
