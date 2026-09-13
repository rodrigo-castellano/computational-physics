/*Programa que genera 3 numeros aleaorios y los muestra en la pantalla, ordenados de menor a mayor*/
#include <iostream>
#include <cstdlib>
#include  <ctime>
using namespace std;
int main (void)
{
    int a, b, c;
    cout <<"Ordenados de menor a mayor"<<endl;
    srand(time(NULL));
    a=rand();
    b=rand();
    c=rand();
    if ((a>b) && (b>c)) cout << c << endl << b << endl<< a;
    if ((a>c) && (c>b)) cout << b << endl << c << endl<< a;
    if ((b>a) && (a>c)) cout << c << endl << a << endl<< b;
    if ((b>c) && (c>a)) cout << a << endl << c << endl<< b;
    if ((c>a) && (a>b)) cout << b << endl << a << endl<< c;
    if ((c>b) && (b>a)) cout << a << endl << b << endl<< c;



    return 0;


}
