//Realice una función recursiva para calcular el máximo común divisor de 2 números
//enteros a y b: el mcd de a y b es igual a b si a es divisible entre b; en caso contrario, el
//mcd de a y b es igual al mcd de b y el resto de la división de a con b.
#include<iostream>
using namespace std;

int mcd(int a ,int b)
{
    if (a%b==0) return b;
    else return mcd(b,a%b);
}


int main (void)
{
    int m,n;
    cout<<"introduzca dividendo: ";
    cin>>n;
    cout<<"introduzca divisor: ";
    cin>>m;
    cout<<mcd(n,m)<<endl;
    return 0;
}


