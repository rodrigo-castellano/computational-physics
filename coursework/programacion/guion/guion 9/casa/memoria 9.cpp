#include <iostream>
#include <fstream>
using namespace std;
bool copiarAarray(string v[],string nfich);
bool pasarAfichero(string v[], long int n, string nfich);
bool ordenarpalabras(string nf);
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


bool ordenarpalabras(string nf)
{
    long int n,j,i;
    n=0;
    string v[23000],aux;

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
      for(i=1;i<n;i++)
          for(j=n-1;j>=i;j--)
             if(v[j].length()>v[j-1].length())
             {
               aux=v[j];
               v[j]=v[j-1];
               v[j-1]=aux;
             }
      f2.open(nf.c_str());
      for(i=0;i<n;i++)
        f2<<v[i]<<endl;
      f2.close();
      return true;
    }

    else return false;
}

bool pasarAfichero(string v[], long int n, string nfich)
{
  int i;
  ofstream fich;
  fich.open(nfich.c_str());
  if(fich.is_open())
  {
    for(i=0;i<n;i++)
    {
        fich<<v[i]<<endl;
    }
    fich.close();
    return true;
  }
  else return false;
}

bool copiarAarray(string v[],string nfich)
{
    long int i,n;
    n=0;
    string palabra;
    ifstream fich;
    fich.open(nfich.c_str());
    if(fich.is_open())
    {
        while(!fich.eof())
        {
            getline(fich,palabra);
            v[n]=palabra;
            n++;
        }
    fich.close();
    //for(i=0;i<n;i++)
        //cout<<"palabra "<<i+1<<": "<<v[i]<<endl;
    return true;
    }
    else return false;
}

int main(void)
{
    long int i,n;
    string nombre,nombre2, nombre3;
    string v[30000],x[30000];

    cout<<"nombre del fichero del que copiar: ";
    cin>>nombre;

    cout<<"copiar de fichero a array"<<endl;
    cout<<copiarAarray(v,nombre)<<endl;

    cout<<"introduzca numero de elementos del array: ";
    cin>>n;
    for (i=0;i<n;i++)
    {
        cout<<"elemento "<<i+1<<": ";
        cin>>x[i];
    }

    cout<<"nombre del fichero a pasar array: ";
    cin>>nombre2;
    cout<<"pasar de array a fichero"<<endl;
    cout<<pasarAfichero(x,n,nombre2)<<endl;

    cout<<"nombre del fichero a ordenar: ";
    cin>>nombre3;
    cout<<"ordenar"<<endl;
    cout<<ordenarpalabras(nombre3);

    cout<<"ordenar linealmente"<<endl;
    cout<<ordenarpalabraslineal(nombre3);

    return 0;
}

