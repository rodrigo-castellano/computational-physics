/* Programa ejemplo que muestra un número real por pantalla utilizando diferentes formatos.*/

#include <iostream>
#include <iomanip>
#define PI 3.1415927

using namespace std;

int main (void)

{
    double num = -PI;
    cout << "vamos a mostrar el numero " << " usando su valor " << endl << endl;

    //Mostramos el número con la forma por defecto con 3 cifras significativas
    cout << "Notacion por defecto (3 cifras significativas) : " << endl;
    cout << scientific;
    cout << setfill('.');
    cout << internal;
    cout << setprecision(3);
    cout << setw(15) << num << endl;

    //Mostramos en número en la forma fixed con 4 cifras significativas
    cout << "Notacion fixed (3 cifras significativas) : " << endl;
    cout << scientific;
    cout << setfill('.');
    cout << right;
    cout << setprecision(3);
    cout << setw(15) << num << endl;

    //Mostramos el número en la forma científica con 6 cifras significativas
    cout << "Notacion cientifica (3 cifras significativas) : " << endl;
    cout << scientific;
    cout << setfill('.');
    cout << setprecision(3);
    cout << left;
    cout << setw(15) << num <<endl;

    return 0 ;
}
