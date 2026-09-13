#include <iostream>
using namespace std;
int divspropios (int n);



int divspropios (int n)
{
    int i;
    double suma;
    suma=0;
    for (i=2;i<n;i++)
       if (n%i==0) suma=suma+i;
    if ((suma+1)<n) return -1;
    else  if ((suma+1)>n)return 1;

    else if ((suma+1)==n) return 0;

}

int main (void)
{
    int n;
    cout<<"escriba numero: ";
    cin >>n;
    cout <<"el numero es: "<<divspropios(n);
    return 0;
}
