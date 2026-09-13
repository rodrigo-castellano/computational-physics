#include<iostream>
using namespace std;
class cElemento;

class cElemento
{
private:
    string nombre;
    string simbolo;
    int numeroatomico;
    double peso;
    int columna;
public:
    string getnombre(void);
    string getsimbolo(void);
    int getnumeroatomico(void);
    double getpeso(void);
    int getcolumna(void);
};

string getnombre(void)
{
    return nombre;
}
string getsimbolo(void)
{
    return simbolo;
}
int getnumeroatomico(void)
{
    return numeroatomico;
}
double getpeso(void)
{
    return peso;
}
int getcolumna(void)
{
    return columna;
}



