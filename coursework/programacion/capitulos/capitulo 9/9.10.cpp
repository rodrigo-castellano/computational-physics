#include <iostream>
#include <fstream>
using namespace std;

#include <iostream>
#include <fstream>
using namespace std;

void veces(string nf)
{
    ifstream f;
    int i[101], j, n;
    for(j=0;j<101;j++)
    f.open(nf.c_str());
    while(!f.eof())
    {
        f>>n;
        i[n]++;
    }
    f.close();
    for(j=0;j<101;j++)
        cout<<"valor "<<i<<": "<<i[j]<<endl;
    return ;
}
int main(void)
{
    string x;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    veces(x);
    return 0;
}
