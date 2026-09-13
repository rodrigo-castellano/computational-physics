#include<iostream>
using namespace std;
class cMatriz;

class cMatriz
{
   private:
       int filas;
       int columnas;
       double m[100][100];
   public:
       cMatriz(void);
       int numfilas(void);
       int numcolumnas(void);
       bool escuadrada(void);
       void rellenar(void);
       void mostrar(void);
       cMatriz trasponer (void);
       cMatriz operator +(cMatriz);
       cMatriz operator *(cMatriz);
};

cMatriz :: cMatriz(void)
{
    int i,j;
    filas=columnas=100;
    for(i=0;i<filas;i++)
        for(j=0;j<columnas;j++)
         if(i==j)m[i][j]=1.0;
         else m[i][j]=0.0;
}

int cMatriz::numfilas(void)
{
    return filas;
}
int cMatriz::numcolumnas(void)
{
    return columnas;
}

bool cMatriz::escuadrada(void)
{
   return (filas==columnas);
}
void cMatriz::rellenar(void)
{
   int i,j;
   do{
    cout<<"numero de filas: ";
    cin>>filas;
   }while(filas>100 || filas<1);
   do{
    cout<<"numero de columnas: ";
    cin>>columnas;
   }while(columnas>100 || columnas<1);

   for(i=0;i<filas;i++)
    for(j=0;j<columnas;j++)
    {
        cout<<"elemento "<<i+1<<", "<<j+1<<" : ";
        cin>>m[i][j];
    }
    return;
}

void cMatriz::mostrar(void)
{
   int i,j;

   for(i=0;i<filas;i++)
   {
    for(j=0;j<columnas;j++)
    {
        cout.width(7);
        cout<<m[i][j]<<" ";
    }
    cout<<endl;
   }

    return;
}
cMatriz cMatriz::trasponer(void)
{
    cMatriz traspuesta;
    int i,j;
    traspuesta.filas=columnas;
    traspuesta.columnas=filas;
    for(i=0;i<traspuesta.filas;i++)
        for(j=0;j<traspuesta.columnas;j++)
        traspuesta.m[j][i]=m[i][j];
    return traspuesta;
}
cMatriz cMatriz::operator +(cMatriz mop)
{
    cMatriz mres;
    int i,j;
    if((filas==mop.filas)&&(columnas=mop.columnas))
    {
        mres.filas=filas;
        mres.columnas=columnas;
        for(i=0;i<filas;i++)
           for(j=0;j<columnas;j++)
            mres.m[i][j]=m[i][j]+mop.m[i][j];
    }
    else mres.filas=mres.columnas=0;
    return mres;
}

cMatriz cMatriz::operator *(cMatriz mop)
{
    int i,j,k;
    cMatriz mres;
    if(columnas==mop.filas)
    {
        mres.filas=filas;
        mres.columnas=mop.columnas;
        for(i=0;i<filas;i++)
           for(j=0;j<mop.columnas;j++)
           {
             mres.m[i][j]=0.0;
             for(k=0;k<columnas;k++)
              mres.m[i][j]=mres.m[i][j]+m[i][k]*mop.m[k][j];
           }

    }
    else mres.filas=mres.columnas=0;
    return mres;
}











