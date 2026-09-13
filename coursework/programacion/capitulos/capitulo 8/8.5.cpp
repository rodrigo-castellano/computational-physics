#include <iostream>
using namespace std;

bool palindromo(string palabra)
{
    int i,longitud;
    i=0;
    bool resultado;
    resultado=true;
    longitud=palabra.length();
    while((resultado==true)&&(i<=longitud/2))
    {
        if(palabra[i]!=palabra[longitud-i-1])resultado=false;
        else i++;
    }
    return resultado;
}
int main (void)
{
    string palabra;
    cout<<"introduzca palabra: ";
    cin>>palabra;
    cout<<palindromo(palabra);
    return 0;
}
