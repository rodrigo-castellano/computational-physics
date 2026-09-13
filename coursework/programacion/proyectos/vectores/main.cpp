#include <iostream>
#include "mivectores.hpp"
#define MAX 100
using namespace std;
 int main (void)
 {
     int v[MAX];
     int num;
     double media, varianza, desviacion, mediageometrica;
     do{
        cout<<"Numero de elementos del vector: ";
        cin >>num;
     } while ((num<1) || (num>MAX));
     RellenarVector(v, num);
     media=CalcularMedia(v, num);
     varianza=CalcularVarianza(v, num, media);
     desviacion=CalcularDesviacion(varianza);
     mediageometrica=CalcularMediaGeometrica(v, num);

     cout <<"resultados"<<endl;
     cout<<"introdujo el siguiente vector: "<<endl;
     MostrarVector(v,num);

     cout << endl << endl;
     cout <<"Media: "<<media <<endl;
     cout << "Varianza: "<< varianza << endl;
     cout << "Desviacion tipica: "<<desviacion<<endl<<endl;
     cout <<"media geometrica: "<<mediageometrica<<endl;
     return 0;
 }
