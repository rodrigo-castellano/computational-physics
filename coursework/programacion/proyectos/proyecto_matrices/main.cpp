#include <iostream>
#include "mimatriz.hpp"
using namespace std;

int main (void)
{

    double x[100][100], y[100][100], r[100][100], f[100][100];
    int nfils1, ncols1, ncols2, escalar;
    cout<<"introduzca numero de filas de primera matriz: ";
    cin >>nfils1;
    cout<<"introduzca numero de filas de segunda matriz: ";
    cin >>ncols1;
    cout<<"introduzca numero de columnas de segunda matriz: ";
    cin >>ncols2;

    cout<<"primera matriz"<<endl;
    rellenarMatriz(x,nfils1, ncols1);
    cout<<"segunda matriz"<<endl;
    rellenarMatriz(y,ncols1,ncols2);

    cout<<"primera matriz mostrada"<<endl;
    mostrarMatriz(x,nfils1,ncols1);
    cout<<"segunda matriz mostrada"<<endl;
    mostrarMatriz(x,nfils1,ncols1);

    cout<<"introduzca un escalar para multiplicar por la primera matriz matriz: ";
    cin>>escalar;
    escalarXmatriz(x, f, nfils1, ncols1, escalar);
    mostrarMatriz(f,nfils1, ncols1);

    cout<<"el resultado de la multiplicacion es: "<<endl;
    productoMatriz(x,y,r, nfils1,ncols1,ncols2);
    mostrarMatriz(r,nfils1, ncols2);


    if(nfils1==ncols2)
    {
       sumaMatriz(x,y,r, nfils1, ncols1);
       cout<<"el resultado de la suma es: "<<endl;
       mostrarMatriz(r,nfils1,ncols1);
       return 0;
    }
    else cout<<"No se pueden sumar matrices de distinto orden";




    return 0;
}

