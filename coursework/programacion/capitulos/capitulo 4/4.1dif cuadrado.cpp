#include<iostream>
using namespace std;
int main()
{
int lado;
int i;
int i2;

cout<<"Escriba el lado del Cuadrado: ";
cin>>lado;

for(i = 0; i<lado; i++)
{
for(i2 = 0; i2<lado; i2++)
{
if((i2 > 0 && i2 < lado-1)&&(i>0&&i<lado-1))
{
cout<<' ';
}
else
cout<<'*';
}
cout<<' '<<endl;
}

cin.get();
cin.get();

}
