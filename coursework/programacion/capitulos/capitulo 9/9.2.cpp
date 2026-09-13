#include <iostream>
#include <fstream>
using namespace std;

int main (void)
{
    int num;
    ofstream fich;
    fich.open("enteros.txt");
    if(fich.is_open()==true)
    {
            cout<<"introduzca numero (0 para acabar): ";
            cin>> num;
            while(num!=0)
            {
               fich<<num<<endl;
               cout<<"introduzca numero(0 para acabar): ";
               cin>>num;
            }
            fich.close();
    }
    else cout<<"error al abrir el fichero"<<endl;
    return 0;
}
