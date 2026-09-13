/* tabla que escriba la tabla de multiplicar del 0 al 10 en pantalla. utilice ciclos for*/
#include <iostream>
#include <iomanip>
using namespace std;
int main (void)
{
 int i,j;

 //para la primera linea
 cout <<"  ";

 for (i=0;i<=10;i++)
    cout << setw(3) << " " << i;
 cout << endl;

 for (i=0;i<=10;i++)
  {
    //para los factores de la primera columna
    cout << setw(2) << i;

    //para las multiplicaciones
    for (j=0; j<=10; j++)
     cout <<" "<< setw(3)<< i*j;
    cout <<endl;
  }

 return 0;
}
