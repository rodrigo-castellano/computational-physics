//funcion para calcular potencia de un numero real, siendo el exponente otro numero real


#include <iostream>
#include <cmath>
using namespace std;

double potencia (double x, double y)
{
    double z;
    z= exp(y*log(x));
    return z;
}

int main (void)
{
    double b;
    double a;
    cout <<"introduzca base"<<endl;
    cin >> a;
    cout << "introduzca exponente"<<endl;
    cin>> b;
    cout << "la potencia es igual a: "<< potencia (a,b);
    return 0;
}
