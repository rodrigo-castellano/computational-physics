#include <iostream>
#include <fstream>
using namespace std;

int media(string nf)
{
    ifstream f;
    int i;i=0;
    string palabra;
    double suma;suma=0.0;
    f.open(nf.c_str());
    while(!f.eof())
    {
        f>>palabra;
        i++;
        suma=suma+palabra.length();

    }
    f.close();
    return suma/i;
}
int main(void)
{
    string x;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    cout<<media(x);
    return 0;
}
