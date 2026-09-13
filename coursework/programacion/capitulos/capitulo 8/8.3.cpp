#include <iostream>
using namespace std;

void copiarcadena(char x[], char y[])
{
    int i;
    i=0;
    while(x[i]!='\0')
    {
        y[i]=x[i];
        i++;
    }
    y[i]='\0';
    return;
}

int main(void)
{
    char x[100], y[100];
    cout<<"introuduzca una cadena: ";
    cin>>x;
    cout<<"introuduzca otra cadena: ";
    cin>>y;
    copiarcadena(x,y);
    cout<<endl<<y;
    return 0;
}
