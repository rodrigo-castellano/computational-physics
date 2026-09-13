//problema 46
#include<iostream>
int fibonacci (int n);
using namespace std;


int main (void)
{
    int n;
    cout<<"introduzca numero";
    cin>>n;
    cout<<fibonacci(n)<<endl;
    return 0;
}

int fibonacci (int n)
{
    if ((n==0)||(n==1)) return 1;
    else if (n>1) return (fibonacci(n-1)+fibonacci(n-2));
}
