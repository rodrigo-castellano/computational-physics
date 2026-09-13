/*programa que solicita al usuareio que introduzca un numero entre 1 y 10 y lo mustre en pantalla*/
#include <iostream>
using namespace std;
int main (void)
{
    int i;

    do {
            cout<<"introduzca un numero del 1 al 10: ";
            cin >>i;

    } while ((i>10) || (i<1));
    cout <<"ha introducido: "<< i<<endl;




    return 0;
}
