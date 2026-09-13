/*muestra los multiplos de 3 comprendidos entre 1 y 100*/
#include <iostream>
using namespace std;
int main (void)
{
    int i;
    cout << "los multiplos de 3 entre 1 y 100 son: "<< endl;

    for(i=1; i<100; i++)
        if((i%3)==0)
           cout << i << endl;


    return 0;

}
