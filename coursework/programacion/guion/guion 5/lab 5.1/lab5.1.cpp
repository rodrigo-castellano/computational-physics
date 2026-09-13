#include <iostream>
#define PI 3.1415926
double potencia(double x, int n);
double arcsen(double x, int b);
double arccos(double x, int b);
double grados(double x);
using namespace std;

int main (void)
{
    double num;
    double asenrad,acosrad;
    double asengra,acosgra;
    int n,b;

    //pedir numero
    cout<< "Introduzca un numero real: ";
    cin>> num;

    //pedir numero de veces
    cout<<"introduzca el numero de operaciones: ";
    cin>>b;


    //calcular arcocoseno y arcoseno en rads
    asenrad=arcsen(num,b);
    acosrad=arccos(num,b);

    //calcular arcoseno y arcocoseno en grad
    asengra=grados(asenrad);
    acosgra=grados(acosrad);

    //mostrar resultados
    cout<<"Arco seno: "<<asenrad<<" radianes\n";
    cout<<"Arco seno: "<<asengra<<" grados\n";
    cout<<"Arco coseno: "<<acosrad<<" radianes\n";
    cout<< "Arco coseno: "<< acosgra<<" grados\n";

    return 0;
}


double potencia(double x, int n)
{
    int i;
    double prod;
    prod=1;
    for (i=1;i<=n;i++) prod=prod*x;
    return prod;
}

double arcsen(double x, int b)
{
    double num, den, suma;
    int n,j;

    suma=x;
    //tomar b terminos
    for(n=1;n<=b;n++)
    {
       //reducir errores de precision
        num=1;
        den=1;
        for (j=1;j<=n;j++)
        {
            num=num*(2*j-1);
            den=den*2*j;
        }
        num=num*potencia(x,2*n+1);
        den=den*(2*n+1);

        //actualizo la suma
        suma=suma+num/den;
    }
    return suma;
}


double arccos(double x, int b)
{
    return PI/2-arcsen(x,b);
}


double grados(double x)
{
    return 180*x/PI;
}






