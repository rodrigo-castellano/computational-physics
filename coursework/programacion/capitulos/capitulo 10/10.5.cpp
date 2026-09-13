#include<iostream>
using namespace std;

class cAlumno
{
public:
    string nombre;
    string apellido1,apellido2;
    string nif;
    cFecha fnac;
    double calificacion;
};

void intercambiaAlumno(cAlumno& a1,cAlumno& a2)
{
    cAlumno aux;
    aux=a1;
    a1=a2;
    a2=aux;
    return;
}

void OrdenarAlumno(cAlumno a[],int n)
{
    int i,j;
    for(i=1;i<n;i++)
        for(j=n-1;j>=i;j--)
          if(a[j].fnac.anio<a[j-1].fnac.anio)
              intercambiaAlumno(a[j],a[j-1]);
          else if((a[j]fnac.anio==a[j-1].fnac.anio)&&(a[j].fnac.mes<a[j-1].fnac.mes))
              intercambiaAlumno(a[j],a[j-1]);
          else if((a[j]fnac.anio==a[j-1].fnac.anio)&&(a[j].fnac.mes=a[j-1].fnac.mes)&&(a[j].fnac.dia<a[j-1].fnac.dia))
              intercambiaAlumno(a[j],a[j-1]);
    return;
}


//otra propuesta

#include<iostream>
using namespace std;

class cAlumno
{
public:
    string nombre;
    string apellido1,apellido2;
    string nif;
    cFecha fnacimiento;
    double calificacion;
    bool operator <(cFecha op);
};


void cAlumno::operator <(cFecha op)
{

    if(anio<op.anio) return true;
    else if((anio<op.anio)&&(mes<mes.op))return true;
    else if((anio<op.anio)&&(mes<mes.op)&&(dia<op.dia))return true;
    else return false;
}

void OrdenarAlumno(cAlumno a[],int n)
{
    int i,j;
    for (i=1;i<n;i++)
        for(j=n-1;j>=i;j--)
          if (a[j].fnac<a[j-1].fnac) intercambiaAlumno(a[j],a[j-1]);
   return;
}

void intercambiaAlumno(cAlumno& a1,cAlumno& a2)
{
    cAlumno aux;
    aux=a1;
    a1=a2;
    a2=aux;
    return;
}
