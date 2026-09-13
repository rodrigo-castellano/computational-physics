#include <iostream>
#include <ctime>
#include <cmath>
bool es_primo(unsigned int n);
using namespace std;



bool es_primo (unsigned int n)
{
    unsigned int i,p;
    bool esprimo;
    if(n==2) esprimo=true;
    else if (n&2==0) esprimo=false;
    else
    {
       esprimo=true;
       p=(unsigned int)sqrt(n);
       i=3;
       while((i<=p)&&(esprimo==true))
       {
           if(n&i==0) esprimo=false;
           else i=i+2;
       }

    }
    return esprimo;
}


int main (void)
{
    unsigned int n, i,r;
    unsigned long int suma;
    clock_t t1, t2;
    double numsecs;

    cout << "introduzca un numero: ";
    cin >>n;

    t1=clock();
    suma=0;
    for (r=1;r<=100;r++)

        for (i=2;i<=n; i++)
           if  (es_primo (i)) suma = suma + i;
    t2=clock();


    cout <<"la suma de los primos menores o iguales que ";
    cout <<n <<": "<<suma<<endl;

    numsecs=(double) (t2-t1)/(CLOCKS_PER_SEC*100);
    cout<<"tiempo: "<< numsecs<< " segundos"<<endl;

    return 0;
}
