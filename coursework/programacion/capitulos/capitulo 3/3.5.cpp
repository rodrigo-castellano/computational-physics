//calcular el valor de pi

#include <iostream>
#include <cmath>
using namespace std;

double calcularPi (int n)
{
    int i;
    double suma;
    suma = 0.0;
    for(i=1; i<=n;i++)
     suma = suma + (24.0/(i*i));
    return 0.5*sqrt(suma);

}

int main (void)
{
    long int n;
    cout <<"introduzca el parametro: ";cin>>n;
    cout <<"el resultado es: "<<calcularPi(n);
    return 0;
}
