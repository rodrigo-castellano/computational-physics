//vector pesado?(elemento mitad=suma elementos izda)
#include <iostream>
using namespace std;

bool pesado(int v[],int n)
{
    int k;
    double suma;
    bool resultado;
    suma=0.0;
    k=0;
    resultado=false;
   while ((k<n)||(resultado=false))
   {
       if (v[k]==suma)resultado=true;
       else
       {
        suma=suma + v[k];
        k++;
       }
   }
    return resultado;
}

int main(void)
{
    int n, i;
    cout<<"numero de elementos: ";
    cin>>n;
    int v[n];
    cout<<"rellenar el vector"<<endl;
    for (i=0;i<n;i++)
    {
        cout<<"vector "<<i<<" : ";
        cin>>v[i];
    }
    cout<<pesado(v,n);
    return 0;
}
