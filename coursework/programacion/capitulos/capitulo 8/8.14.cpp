#include <iostream>
using namespace std;

string cambiar(string nombre,string cambiar, string cambio)
{
    int pos, i;

    for(i=0;i<cambiar.length();i++)
    {
        pos=nombre.find(cambiar[i]);
        while(pos!=-1)
        {
                nombre[pos]=cambio[i];
                pos=nombre.find(cambiar[i]);
        }
    }
    return nombre;
}

int main(void)
{
    string palabra,n,x;
    cout<<"introuduzca palabra: ";
    cin >>palabra;
    cout<<"introuduzca cadena: ";
    cin >>n;
    cout<<"introuduzca cambio: ";
    cin >>x;
    cout<<cambiar(palabra, n,x);
    return 0;
}
