/*2.16*/
#include <iostream>
using namespace std;
int main (void)
{
    int i, num, a, b;
    double suma;

    cout <<"introduce intervalo a y b: " ;
    cin>> a;
    cout<<" y ";
    cin>>b;

    suma=0;
    while (num!=0)
    {


        cout <<"introduzca numero";
        cin>>num;
        suma=suma + num;

    }

    cout <<"la media es: "<< suma/b;

    return 0;
}
