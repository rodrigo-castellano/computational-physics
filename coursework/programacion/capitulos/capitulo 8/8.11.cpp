#include <iostream>
using namespace std;

int buscarsubcadena(string cadena, string subcadena)
{
    int pos;
    pos=cadena.find(subcadena);
    if(pos==-1)return 0;
    else return 1 + buscarsubcadena(cadena.erase(0,pos+1), subcadena);
}
int main(void)
{
    string cad1, sub;
    cout<<"introuduzca cadena :";
    cin >>cad1;
    cout<<"introuduzca subcadena  :";
    cin >>sub;
    cout<<buscarsubcadena(cad1,sub);
    return 0;
}
