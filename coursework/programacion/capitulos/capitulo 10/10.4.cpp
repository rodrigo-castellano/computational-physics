#include<iostream>
using namespace std;
class cPersona;


class cPersona
{
  public:
    string apellidos, nombre;
    cFecha fnac;
    string localidad;
    double sueldo;

};

int buscarpersona(cPersona p[],int n, string apellidos)
{
    bool encontrado;
    encontrado=false;
    int izda, drcha, centro;
    izda=0;drcha=n-1;

    while((izda<=drcha)&&(!encontrado))
    {
       centro=(izda+drcha)/2;
       if(p[centro].apellidos==apellidos)encontrado=true;
       else drcha=centro-1;
    }
    if(encontrado) return centro;
    else return -1;
}
