#include <iostream>
using namespace std;

void division(int a, int b, int& cociente, int& resto)
{
    int j;
    j=0;

    while (a>=b)
    {
        j++;
        a=a-b;

    }
    cociente=j;
    resto=a;
    return;
}

int main (void)
{
    int n, i, cociente, resto, x,y;
    cout<<"escriba numeros: ";
    cin >>n>>i;
    cout <<"el numero es: "<<division(n, i, cociente, resto);
    cout<<cociente<<"es el cociente y el resto"<<resto;
    return 0;
}
