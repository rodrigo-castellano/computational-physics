#include <iostream>
#include <fstream>
using namespace std;

int media(string nf)
{
    int i;i=0;
    double suma, n;suma=0.0;
    ifstream f;
    f.open(nf.c_str());
    while(!f.eof())
    {
        f>>n;
        suma=suma+n;
        i++;
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
