#include <iostream>
using namespace std;

void blanco(string& palabra)
{
    int i;
    i=0;
    while (i<palabra.length())
        if(palabra[i]==' ')palabra.erase(i,1);
        else i++;
    return ;
}
int main (void)
{
    string x;
    cout<<"introzuca palabra :";
    cin>>x;
    blanco(x);
    cout<<x;
    return 0;
}
