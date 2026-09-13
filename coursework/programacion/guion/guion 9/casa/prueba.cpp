
#include <iostream>
#include <fstream>
using namespace std;
bool ordenarpalabraslineal(string nf);


bool ordenarpalabraslineal(string nf)
{
    int n,j,i, pos;
    n=0;
    string length, length2;
    string palabra,v[1000],aux;
    ifstream f1;
    ofstream f2;
    f1.open(nf.c_str());
    if(f1.is_open())
    {
        while(!f1.eof())
      {
           f1>>v[n];
           n++;
      }
      f1.close();
        for(j=0;j<(n-1);j++)
      {
        pos=j;
        for (i=(j+1);i<n;i++)
          if (v[pos].length()<v[i].length()) pos=i;
          {
               aux=v[j];
               v[j]=v[j-1];
               v[j-1]=aux;
          }
      }
      f2.open(nf.c_str());
      for(i=0;i<n;i++)
        f2<<v[i]<<endl;
      f2.close();
      return true;
    }

    else return false;
}
int main(void)
{
    long int i,n;
    string nombre,nombre2, nombre3;
    string v[30000],x[30000];

    cout<<"nombre del fichero a ordenar: ";
    cin>>nombre3;

    cout<<"ordenar linealmente"<<endl;
    cout<<ordenarpalabraslineal(nombre3);

    return 0;
}




