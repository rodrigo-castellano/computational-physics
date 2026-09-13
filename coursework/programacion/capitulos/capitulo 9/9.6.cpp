#include <iostream>
#include <fstream>
using namespace std;

bool comparar(string nfich1, string nfich2)
{
  bool resultado;
  resultado=true;
  string linea1, linea2;
  ifstream fich1;
  ifstream fich2;
  fich1.open(nfich1.c_str());
  fich2.open(nfich2.c_str());
  while(!fich1.eof() && resultado && !fich2.eof())
  {
      getline(fich1,linea1);
      getline(fich2,linea2);
      if (linea1!=linea2) resultado=false;
  }
  fich1.close();
  fich2.close();
  return resultado;
}

int main(void)
{
    string x,y;
    cout<<"introduzca nombre de archivo: ";
    cin>>x;
    cout<<"introduzca nombre de archivo nuevo: "<<endl;
    cin>>y;
    cout<<comparar(x,y);
    return 0;
}
