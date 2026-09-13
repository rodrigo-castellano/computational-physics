//programa que dibuje asteriscos con circulos

#include <iostream>
#include <cmath>
#include <conio.h>
using namespace std;
void circulo(int a, int b, int radio);


void circulo(int a, int b, int radio)
{
    int x, y;
    for (x=-radio;x=radio;x++)
    {
        y=(int) sqrt(radio*radio-x*x);
        gotoxy(x+a, b+y) ;cout<<"*";
        gotoxy(x+a, b-y) ;cout<<"*";
    }
    return;
}

