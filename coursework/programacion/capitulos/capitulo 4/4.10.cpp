#include <iostream>
using namespace std;

bool esprimo (int n)
{
    int i;
    bool encontrado;
    encontrado=true;

    for (i=2;i<n;i++)
        if (n%i==0) encontrado=false;
    return encontrado;

}

int main (void)
{
    int n;
    cout<<"escriba numero: ";
    cin >>n;
    cout <<"el numero es: "<<esprimo(n);
    return 0;
}
