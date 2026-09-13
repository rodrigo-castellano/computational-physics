#include <iostream>
#include <fstream>
using namespace std;

int main (void)
{
    int num;
    ifstream fich;
    fich.open("enteros.txt");
    if(fich.is_open()==true)
    {
        while(fich.eof()==false)
        {
            fich>>num;
            cout<<num<<endl;
        }
        fich.close();
    }
    else cout<<"error al abrir el fichero"<<endl;
    return 0;
}
