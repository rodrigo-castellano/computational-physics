#include <iostream>
#include <cmath>
using namespace std;

double mcd(int a, int b)
{
    if (a%b==0)return b;
    else return mcd(b,a%b);
}
int main (void)
{
    int z,k;
    cout<<"introuduzca a: ";
    cin>>z;
    cout<<"introuduzca b: ";
    cin>>k;
    cout<<"el valor es :"<<mcd(z,k)<<endl;
    return 0;
}
