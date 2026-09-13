#include <iostream>
using namespace std;

int busqueda(char x[], char caracter)
{
    bool encontrado;
    encontrado=false;
    int i;
    i=0;
    while ((encontrado==false)&&(x[i]!='\0'))
    {
        if(x[i]==caracter) encontrado==true;
        else i++;
    }
    if(encontrado==true)return i;
    else return -1;
}
int main (void)
{
    char x[100], caracter;
    cout <<"introduzca cadena: ";
    cin>>x;
    cout <<"introduzca caracter: ";
    cin>>caracter;
    cout<< busqueda(x,caracter);
    return 0;
}
