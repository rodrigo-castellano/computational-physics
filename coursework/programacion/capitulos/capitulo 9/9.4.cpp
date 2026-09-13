#include <iostream>
#include <fstream>
using namespace std;

int contarminusculas(string nombrefich)
{
    ifstream fich;
    char caracter;
    int i;i=0;
    fich.open(nombrefich.c_str());
    if(fich.is_open()==true)
    {
        while(!fich.eof())
        {
            fich>>caracter;
            if ((caracter<='z')&&(caracter>='a'))
                i++;
            else if (caracter=='ñ')i++;
        }
        fich.close();
    }
    else cout<<"error al abrir el fichero"<<endl;
    return i;
}
int main(void)
{
    string x;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    cout<<"numero de minusculas: "<<endl;
    cout<<contarminusculas(x);
    return 0;
}
