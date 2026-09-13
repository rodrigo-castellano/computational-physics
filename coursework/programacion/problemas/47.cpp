#include<iostream>
int digitos (int n);
using namespace std;



int main (void)
{
    int n;
    cout<<"introduzca numero: ";
    cin>>n;
    cout<<digitos(n)<<endl;
    return 0;
}

int digitos(int n)
{
    if (n<10) return 1;
    else return digitos(n/10)+1;
}
