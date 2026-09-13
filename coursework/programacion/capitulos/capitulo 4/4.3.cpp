//numeros romanos
#include <iostream>
using namespace std;
void romanos(int n, char p1, char p2, char p3);



void romanos(int n, char p1, char p2, char p3)
{
   int i;
   if (n<=3)
    for (i=0;i<n;i++) cout <<p1;

   else if (n=4) cout<<p1<<p2;

   else if ((n>=5) && (n<=9))
   {
     cout<<p2;
    for (i=0;i<n-5;i++) cout<<p1;
   }

   else if (n=10) cout<< p3;
   return;

}

int main (void)
{
    int n, miles, centenas, decenas, unidades;
    do{
        cout<<"Introduzca un valor entre 1 y 3000: ";
        cin>>n;
    }while ((n<1)||(n>3000));

    cout <<"ese numero romano se expresa como: ";

    // Escribir miles
    miles =n/1000;
    romanos(miles, 'M',' ', ' ');

    //centenas
    n=n%1000;
    centenas=n/100;
    romanos(centenas,'C','D', 'M');

    //decenas
    n=n%100;
    decenas=n/10;
    romanos(centenas,'X','L', 'C');

    //unidades
    n=n%10;
    decenas=n;
    romanos(centenas,'I','V', 'X');

    return 0;
}

