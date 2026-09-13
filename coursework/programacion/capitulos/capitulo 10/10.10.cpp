#include<iostream>
using namespace std;


int ordenar(cElemento v[],int n,int columnas)
{
   int i,j,contador,posmin;
   cElemento  elementoaux,vaux[20];
   contador=0.0;

   for(i=0;i<n;i++)
    if(v[i].getcolumna==columna)
    {
      v[contador]=v[i];
        contador ++;
    }

   for(i=0;i<contador-1;i++)
   {
       pormin=0;
       for(j=i+1;j<=contador;j++)
        if(vaux[j].getnumatom()<vaux[posmin].getnumatom())
          posmin=j;
       elementoaux=vaux[posmin];
       vaux[posmin]=vaux[i];
       vaux[i]=elementoaux;

   }
   contador=0;
   for(i=0;i<n;i++)
    if(v[i]==vaux[contador])
   {
       v[i]=vaux[contador];
       contador++;
   }
   return;

}
