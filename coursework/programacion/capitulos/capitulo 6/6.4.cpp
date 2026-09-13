#include <iostream>
using namespace std;

double fermat(int n)
{
    double aux;
    if (n==0)return 3;
    else
    {
      aux=fermat(n-1);
      return 2+(fermat(n-1)-2)*fermat(n-1);
    }
}

int main (void)
{
    int n;
    cout<<"introuduzca valor: ";
    cin>>n;
    cout<<fermat(n);
    return 0;
}
