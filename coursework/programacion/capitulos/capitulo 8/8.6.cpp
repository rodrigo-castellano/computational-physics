#include <iostream>
using namespace std;

bool precursiva(string palabra)
{
    int longitud;
    longitud=palabra.length();
    if(longitud<=1)return true;
    else if (palabra[0]!=palabra[longitud-1])return false;
    else return precursiva(palabra.substr(1,longitud-2));
}
int main (void)
{
    string palabra;
    cout<<"introduzca palabra: ";
    cin>>palabra;
    cout<<precursiva(palabra);
    return 0;
}
