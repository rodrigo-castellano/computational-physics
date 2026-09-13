#include <iostream>
#include <fstream>
using namespace std;

int main(void)
{
    ifstream fich;
    char caracter;
    fich.open("enteros.txt");
    if (fich.is_open()==true)
    {
        while(fich.eof()==false)
        {
            fich>>caracter;
            cout<<caracter<<endl;
        }
        fich.close();
    }
    else cout<<"error al abrir el fichero"<<endl;
    return 0;
}
