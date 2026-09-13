#include <iostream>
using namespace std;

bool bisiesto(int n)
{
 if ((n%400)==0) return true;
 else if (((n%4)==0) || ((n%100)!=0)) return true;
 else return false;
}

int main (void)
{
    int n;
    cout << "introduzca n: ";
    cin >> n;
    cout<< "el resultado es: "<< bisiesto(n);
    return 0;

}
