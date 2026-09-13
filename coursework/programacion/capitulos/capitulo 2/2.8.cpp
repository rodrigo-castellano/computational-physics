/*programa que cuenta enteros entre 1 y 1000 que son multiplos de 3 y 5, pero no de 6*/

#include <iostream>
using namespace std;
int main (void)
{
    int i;
    for (i=1; i<=1000; i++)

        if (((i%3)==0) && ((i%5)==0) && ((i%6!=0)))

            cout << i << endl;

    return 0;
}
