/*problema que resuelve ecuacion de 2º grado*/

#include <iostream>
#include <cmath>
using namespace std;
int main (void)
{
    double a, b, c;
    double x1, x2, rad;
    cout << "introduce coeficiente a: "; cin >> a;
    cout <<"coeficiente b: "; cin >> b;
    cout << "coeficiente c: "; cin >> c;

    if (a!=0)
    {
       rad=b*b-4*a*c;
       if (rad>=0)
       {
        x1=(-b+sqrt(b*b-4*a*c))/(2*a);
        x2=(-b-sqrt(b*b-4*a*c))/(2*a);
        cout << "x1= " << x1 << endl;
        cout << "x2= " << x2 << endl;
       }
       else cout <<"sale la reiz negativa";

    }
    else
    {
        x1=-c/b;
        cout << "x=" <<x1;

    }
    return 0;

}
