#include <iostream>
using namespace std;
bool esanagrama(string cad1, string cad2)
{
    int i, pos;
    i=0;
    bool resultado;
    resultado=true;
    if(cad1.length()!=cad2.length())resultado=false;
    while((resultado==true)&&(i<cad1.length()))
    {
        pos=cad2.find(cad1[i]);
        if (pos==-1)resultado=false;
        else cad2.erase(pos,1);
        i++;
    }
 return resultado;
}
int main(void)
{
    string cad1, cad2;
    cout<<"introuduzca cadena 1 :";
    cin >>cad1;
    cout<<"introuduzca cadena 2 :";
    cin >>cad2;
    cout<<esanagrama(cad1,cad2);
    return 0;
}
