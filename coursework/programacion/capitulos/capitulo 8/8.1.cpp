#include <iostream>
using namespace std;

char mayuscula(char minuscula)
{
    if ((minuscula>='a')&&(minuscula<='z'))

    return 'A'+(minuscula-'a');
}
int main(void)
{
    char x;
    cout<<"introuduzca un caracter para pasar a mayuscula: ";
    cin>>x;
    cout<<mayuscula(x);
    return 0;
}
