#include <iostream>
class cFecha;
int edad(cFecha fnac);
using namespace std;


class cFecha
{
public:
    int dia, mes, anio ;
    cFecha(void);
    void FechaActual(void);
    void fnacimiento(void);
};

cFecha::cFecha(void)
{
    dia=18;
    mes=1;
    anio=1997;
}

//se obtiene la fecha actual
void cFecha:: FechaActual(void)
{
    cFecha fhoy;
    cout<<"fecha actual. dia: ";
    cin>>dia;
    cout<<"mes: ";
    cin>>mes;
    cout<<"año: ";
    cin>>anio;
    return;
}

void cFecha::fnacimiento(void)
{
    cFecha fnac;
    cout<<"fecha de nacimiento"<<endl;
    cout<<"dia: ";
    cin>>dia;
    cout<<"mes: ";
    cin>>mes;
    cout<<"año: ";
    cin>>anio;
    return;
}



int edad(cFecha fnac)
{
    cFecha fhoy;    int num;
    fhoy.FechaActual();
    num=fhoy.anio-fnac.anio;
    if((fhoy.mes<fnac.mes)||((fhoy.mes==fnac.mes)&&(fhoy.dia<fnac.dia))) num--;
    return num;
}


int main(void)
{
    int dia, mes,anio;
    cFecha fnac;
    fnac.fnacimiento();
    cout <<edad(fnac);
    return 0;
}
