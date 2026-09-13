/*Programa que genere 25 números enteros aleatorios comprendidos entre -100 y 100
y los muestre en pantalla. Además, deberá mostrar el valor máximo, el mínimo ,
el valor medio de los números generados.*/

#include <iostream>
#include <cstdlib>
#include  <ctime>
using namespace std;
int main (void)
{
   int i, j;
   double max, min, num, suma;
   max =-100 ;
   min=100;
   srand(time(NULL));
   suma=0.0;
   for (i=1; i<=25; i++)
    {
        j = rand() %200 + -100;
        cout << j<<endl;

        if (j>=max) max=j;
        else if (j<=min) min=j;
        suma = suma + j;

    }
    cout<<"El maximo es: "<<max<<endl;
    cout<<"El minimo es: "<<min<<endl;
    cout<<"La media es: "<<suma/25;

   return 0;
}

