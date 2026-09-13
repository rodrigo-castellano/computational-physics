#include <iostream>
#include <fstream>
using namespace std;

void copiarfichero(string nfich1, string nfich2)
{
    ifstream fich1;
    ofstream fich2;
    string linea;
    char caracter;
    fich1.open(nfich1.c_str());
    fich2.open(nfich2.c_str());
    if(fich1.is_open())
    {
        while(!fich1.eof())
        {
            getline(fich1,linea);
            fich2<<linea<<endl;
        }
        fich1.close();
        fich2.close();
    }
    else cout<<"error al abrir el fichero"<<endl;
    return;
}
int main(void)
{
    string x,y;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    cout<<"introduzca nombre de archivo nuevo: "<<endl;
    cin>>y;
    copiarfichero(x,y);
    return 0;
}
