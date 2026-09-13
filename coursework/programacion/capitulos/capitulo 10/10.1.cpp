#include <iostream>
class cFecha;
using namespace std;

class cFecha
{
public:
    int dia, mes, anio;
    string FormateaFecha(void);
    string DespliegaFecha(void);
    void operator ++ (void);
};

string cFecha::FormateaFecha(void)
{
    string cad, aux;
    aux=inttostr(anio);
    aux.erase(0,2);
    cad=inttostr(dia)+"-" + inttostr(mes)+"-" + aux;
    return cad;
}

string cFecha::DespliegaFecha(void)
{
   string cad;

   //insertar el día
   cad=inttostr(dia)+ "de";

   if(mes==1)cad=cad+ "Enero";
   else if(mes==2)cad=cad+ "Febrero";
   else if(mes==3)cad=cad+ "Marzo";
   else if(mes==4)cad=cad+ "Abril";
   else if(mes==5)cad=cad+ "Mayo";
   else if(mes==6)cad=cad+ "Junio";
   else if(mes==7)cad=cad+ "Julio";
   else if(mes==8)cad=cad+ "Agosto";
   else if(mes==9)cad=cad+ "Septiembre";
   else if(mes==10)cad=cad+ "Octubre";
   else if(mes==11)cad=cad+ "Noviembre";
   else if(mes==12)cad=cad+ "Diciembre";

   //insertar el año
   cad=cad + "de" +inttostr(anio);
   return cad;
}

void cFecha:: operator++(void)
{
    if((mes==1)||(mes==3)||(mes==5)||(mes==7)||(mes==8)||(mes==10)||(mes==12))
    {
        if (dia<31)dia=dia+1;
        else
        {
            dia=1;
            if (mes!=12)mes=mes+1;
            else
            {
                mes=1;
                anio=anio+1;
            }
        }
    }
    else if((mes==4)||(mes==6)||(mes==9)||(mes==11))
    {
        if(dia<30)dia=dia+1;
        else
        {
            dia=1;
            mes=mes+1;
        }
    }
    else if(mes==2)
    {
        if (dia<28) dia=dia+1;
        else
        {
            dia=1;
            mes=3;
        }
    }
    return;
}

int main(void)
{
    cFecha fecha;
    cout<<"dia: ";
    cin>>fecha.dia;
    cout<<"mes: ";
    cin>>fecha.mes;
    cout<<"año: ";
    cin>>fecha.anio;

    cout<<fecha.FormateaFecha();
    cout<<fecha.DespliegaFecha();
    return 0;
}
