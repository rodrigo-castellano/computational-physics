// realizar la funcion que devuelva la expresion

#include <iostream>
#include <cmath>
using namespace std;
double fermat (int n)
{
    double i, prod;

    return pow(2,pow(2,n)) +1;




    return prod;
}
int main (void)
{
    int j;
    cout <<"introduzca un numero"<< endl;
    cin >>j;
    cout<<"el resultado es: "<< fermat(j);
    return 0;

}
