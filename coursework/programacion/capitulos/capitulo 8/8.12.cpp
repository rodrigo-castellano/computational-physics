#include <iostream>
using namespace std;

string tonteria(string palabra, char n)
{
    int i;
    for(i=0;i<palabra.length();i++)
    {
        palabra[i]=palabra[i]%n +32;
    }
    return palabra;
}
int main(void)
{
    string palabra;
    char n;
    cout<<"introuduzca palabra: ";
    cin >>palabra;
    cout<<"introuduzca numero: ";
    cin >>n;
    cout<<tonteria(palabra,n);
    return 0;
}
