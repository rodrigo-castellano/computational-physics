//funcion para calcular el factorial de un numero

#include <iostream>
using namespace std;

int factorial (int n)
{
    int i, prod;

    prod=1;
    for (i=1;i<=n;i++)
        prod=prod*i;
    return prod;
}
int main (void)
{
    int j;
    cout <<"introduzca un numero"<< endl;
    cin >>j;
    cout<<"el factorial de este numero es: "<< factorial(j);
    return 0;

}
