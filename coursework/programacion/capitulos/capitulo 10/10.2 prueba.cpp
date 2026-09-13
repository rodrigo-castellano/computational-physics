#include<iostream>
using namespace std;

class cFecha;
int edad(cFecha fnac);
class cPersona;void intercambiapersonas(cPersona& p1,cPersona& p2);
void ordenarPersonas(cPersona p[], int n) ;





int main(void)
{
    //para cFecha

    int dia, mes,anio;
    cFecha fnac;
    fnac.fnacimiento();
    edad(fnac);

    //para cPersona

    int n,i;
    cPersona p[100];
    cout<<"numero de personas: ";
    cin>>n;
    for(i=0;i<n;i++)
    {
        cout<<"persona numero "<<i<<": "<<endl;
        cout<<"apellidos: ";
        getline(cin,p[i].apellidos);
        cout<<"nombre: ";
        getline(cin,p[i].nombre);
        cout<<"localidad: ";
        getline(cin,p[i].localidad);
        cout<<"fecha nacimiento: ";
        getline(cin,p[i].fnac);
        cout<<"sueldo: ";
        getline(cin,p[i].sueldo);
    }

    ordenarPersonas(p[],n);
    p[].mostrar();


     return 0;
}

class cPersona
{
  public:

    string apellidos, nombre;
    cFecha fnac;
    string localidad;
    double sueldo;
};



void intercambiapersonas(cPersona& p1,cPersona& p2)
{
    cPersona aux;
    aux=p1;
    p1=p2;
    p2=aux;
    return;
}

void ordenarPersonas(cPersona p[], int n)
{
    int i,j;
    for(i=1;i<n;i++)
        for(j=n-1;j>=i;j--)
            if (edad(p[j].fnac)<edad(p[j-1].fnac))
               intercambiapersonas(p[j],p[j-1]);
    return;
}



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
