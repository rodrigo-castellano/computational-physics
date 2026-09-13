#include<iostream>
using namespace std;

class cPCodificada
{
public:
    string poriginal;
    string pcodificada;
    int valorcodigo;

    void codificarp(void);
    void descodificarp(void);
    void calcularcodigo(void);
};

void cPCodificada::codificarp(void)
{
   int i,l;
   l=poriginal.length();
   pcodificada=poriginal;
   for(i=0;i<l;i++)
   {
    if (pcodificada[i]=='a')pcodificada[i]='1';
    else if (pcodificada[i]=='e')pcodificada[i]='2';
    else if (pcodificada[i]=='i')pcodificada[i]='3';
    else if (pcodificada[i]=='o')pcodificada[i]='4';
    else if (pcodificada[i]=='u')pcodificada[i]='5';
   }
   return;
}
void cPCodificada::descodificarp(void)
{
   int i,l;
   l=poriginal.length();
   poriginal=pcodificada;
   for(i=0;i<l;i++)
   {
    if (pcodificada[i]=='1')pcodificada[i]='a';
    else if (pcodificada[i]=='2')pcodificada[i]='e';
    else if (pcodificada[i]=='3')pcodificada[i]='i';
    else if (pcodificada[i]=='4')pcodificada[i]='o';
    else if (pcodificada[i]=='5')pcodificada[i]='u';
   }
   return;
}
void cPCodificada::calcularcodigo(void)
{
   int i,l;
   valorcodigo=0;
   l=pcodificada.length();
   for(i=0;i<l;i++)
    if((pcodificada[i]>='1')&&(pcodificada[i]>='5'))
        valorcodigo=valorcodigo+pcodificada[i]-'0';
   return;
}
