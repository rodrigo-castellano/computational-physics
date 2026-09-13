/* tabla que escriba la tabla de multiplicar del 0 al 10 en pantalla. utilice ciclos while*/
#include <iostream>
#include <iomanip>
using namespace std;
int main (void)
{
 int i,j;
 cout <<"  ";
 i=0;

 //primera linea
 while (i<=10)
 {
     cout << " " << setw(3)<< i;
     i++;
 }
 cout << endl;

 i=0;
 while (i<=10)
 {
     cout << setw(2) << i;
     j=0;
     while (j<=10)
     {
         cout << " " << setw(3) << i*j;
         j++;
     }
     cout << endl;
     i++;
 }

 return 0;
}
