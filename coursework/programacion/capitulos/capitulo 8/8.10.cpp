#include <iostream>
using namespace std;

int aparecen(string cad1, string cad2)
{
    int i,suma, pos;
    suma=0;
    pos=cad2.find(cad1[i]);
    for(i=0;i<cad1.length();i++)
    {
      pos=cad2.find(cad1[i]);
        if(pos != -1)
        {
           suma++;
           cad2.erase(pos,1);
        }
    }

    return suma;
}
int main(void)
{
    string cad1, cad2;
    cout<<"introuduzca cadena 1 :";
    cin >>cad1;
    cout<<"introuduzca cadena 2 :";
    cin >>cad2;
    cout<<aparecen(cad1,cad2);
    return 0;
}
