//programa que dibuje asteriscos

#include <iostream>
using namespace std;
void cuadrado(int n)
{
    int i, j;
    for (i=1;1<=n;i++) cout<<"*";
    cout<< endl;

    for (i=2;i<n; i++)
    {
        cout<<"*";
        for (j=2;j<n;j++) cout << " ";
        cout<<"*";
        cout<< endl;
    }

    for (i=1;1<=n;i++) cout<<"*";
    cout<< endl;
    return;
}
int main (void)
{
    int n;
    cout<<"pon n";
    cin>>n;
    cuadrado(n);
    return 0;
}
