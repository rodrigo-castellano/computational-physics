// programa para calcular la cuota de la hipoteca

#include <iostream>
#include <cmath>
using namespace std;

double hipoteca (double x, double y, int n)
{
    double aux;
    aux=pow(1+x,n);
    return (x*y*aux)/(aux-1);

}
int main (void)
{
   double a,n;
   int g;
    cout <<"introduzca el parametro interes: "<<endl;cin>>a; cout <<"%"<<endl;
    cout <<"introduzca el parametro dinero prestado: ";cin>>n;
    cout <<"introduzca el parametro pagos mensuales: ";cin>>g;
    cout <<"cuota: "<<hipoteca(a,n,g);
    return 0;
}
