#include<iostream>
using namespace std;

class cPais;
{
public:
    string nombrepais;
    int habitantes;
    int superficie;
    double PIB;
    double prima;

    void rellenar(void);
    void mostrar(void);
    double densidad(void);
};

void cPais:: rellenar(void)
{
    cout<<"introduzca nombrepais: ";
    getline(cin,nombrepais);
    cout<<"introduzca habitantes: ";          //hay que meterle el while para
    cin>>habitantes;                           //que el usuario no la lie
    cout<<"introduzca superficie: ";
    cin>>superficie;
    cout<<"introduzca PIB: ";
    cin>>PIB;
    cout<<"introduzca prima: ";
    cin>>prima;
    return;
}
void cPais:: rellenar(void)
{
    cout<<" nombrepais: ";
    cout<<nombrepais;
    cout<<" habitantes: ";
    cout<<habitantes;
    cout<<" superficie: ";
    cout<<superficie;
    cout<<" PIB: ";
    cout<<PIB;
    cout<<" prima: ";
    cout<<prima;
    return;
}

duoble cPais:: densidad(void)
{
    return 1.0*habitantes/superficie;
}
