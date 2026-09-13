#include <iostream>
using namespace std;

double sumadig(int n)
{
    if (n<10) return n;
    else return n%10+sumadig(n/10);
}


int main (void)
{
    int n;
    cout<<"introuduzca numero: ";
    cin>>n;
    cout<<sumadig(n);
    return 0;
}
