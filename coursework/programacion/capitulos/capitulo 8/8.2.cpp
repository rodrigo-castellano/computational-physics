#include <iostream>
using namespace std;

int numcaracteres(char cadena[])
{
    int i;
    i=0;
    while(cadena[i]!='\0')
        i++;
    return i;
}
int main(void)
{
    char x[100];
    cout<<"introuduzca una cadena: ";
    cin>>x;
    cout<<numcaracteres(x);
    return 0;
}
