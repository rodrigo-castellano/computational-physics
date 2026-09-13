#include<iostream>
#include <fstream>
using namespace std;


int volcar (cElemento v[],int n, int columnas,string nfich)
{
    ofstream fich;
    int i,contador;

    fich.open(nfich.c_str());
    if(fich.is_open())
    {
       for(i=0;i<n;i++)
        if (v[i].getcolumnas==columnas)
        {
            fich<<v[i].getnombre();<<endl;
            fich<<v[i].getsimbolo();<<endl;
            fich<<v[i].getnumatom();<<endl;
            fich<<v[i].getpero();<<endl;
            fich<<v[i].getnumcol();<<endl;
            contador++;
        }
        fich.close();
    }
    return contador;
}
