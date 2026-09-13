#include <iostream>
#include <fstream>
using namespace std;

void mediaampl(string nf,double& mp, double& mn, double& ma)
{
    int i, j;i=0;j=0.0;
    mp=0.0;
    mn=0.0;
    ma=0.0;
    double n;
    ifstream f;
    f.open(nf.c_str());
    while(!f.eof())
    {
        f>>n;
        if(n>=0)
        {
          mp=mp+n;
          j++;
        }
          else if(n<=0)
        {
        mn=mn+n;
        i++;
        }
    }
    ma=(mp-mn)/(i+j);
    mp=mp/j;
    mn=mn/i;
    f.close();
    return ;
}
int main(void)
{
    string x;
    double mp,mn,ma;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    mediaampl(x, mp, mn, ma);
    cout<<"media positiva: ";
    cout<<mp<<endl;
    cout<<"media negativa: ";
    cout<<mn<<endl;
    cout<<"media absoluta: ";
    cout<<ma<<endl;
    return 0;
}
