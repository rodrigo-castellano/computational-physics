#include <iostream>
#include <ctime>
bool es_primo(unsigned int n);
using namespace std;



bool es_primo (unsigned int n)
{
    unsigned int i;
    bool esprimo;

    esprimo=true;
    i=2;
    while((i<n)&&(esprimo==true))
    {
        if(n%i==0) esprimo=false;
        else i++;
    }
    return esprimo;
}


int main (void)
{
    unsigned int n, i;
    unsigned long int suma;
    clock_t t1, t2;
    double numsecs;

    cout << "introduzca un numero: ";
    cin >>n;

    t1=clock();
    suma=0;
    for (i=2;i<=n; i++)
        if  (es_primo (i)) suma = suma + i;
    t2=clock();

    cout <<"la suma de los primos menores o iguales que ";
    cout <<n <<": "<<suma<<endl;

    numsecs=(double) (t2-t1)/CLOCKS_PER_SEC;
    cout<<"tiempo: "<< numsecs<< " segundos"<<endl;

    return 0;
}
