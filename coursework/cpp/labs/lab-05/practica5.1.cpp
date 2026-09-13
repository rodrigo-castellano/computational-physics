/*programa que calcula el valor del número PI, en función de los valores que se le de*/

#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;
double PI (int n)
{
    int i;
    double suma;
    suma=0.0;
    for (i=0;i<=n;i++) suma= suma + pow(-1,i)/(2.0*i+1);
    return 4*suma;
}

int main (void)
{
    int n;
    cout <<"introduzca n: ";
    cin >> n;
    cout <<setprecision(10);
    cout <<"PI vale: "<<PI(n);
    return 0;
}
