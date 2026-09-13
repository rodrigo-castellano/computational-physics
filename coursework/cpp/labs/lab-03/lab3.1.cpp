/*Programa que calcula las funciones trigonométricas del ángulo triple*/

#include <iostream>
#include <cmath>
#include <iomanip>
#define pi  3.1415926535
using namespace std;

int main (void)

{

 float angulo, seno, coseno, tangente;
 cout << setprecision (4);


 cout << "Introduzca un angulo en radianes: ";
 cin >> angulo;
 angulo=angulo*pi/180;


 cout << "Esta es la forma directa de calcular el angulo triple: " << endl;

 cout << "sin (3a)=";

 cout << sin (3*angulo) << endl;

 cout << "cos (3a)=";
 cout << cos(3*angulo) << endl;

 cout << "tan (3a)=";
 cout << tan (3*angulo) << endl << endl;

 cout << "Esta es la forma alternativa de calcular el angulo triple: " << endl;

 cout << "3sin(a)-4sin^3(a)=";
 cout << 3*sin(angulo)-4*sin(angulo)*sin(angulo)*sin(angulo) << endl;

 cout << "4cos^3(a)-3cos(a)=";
 cout << 4*cos(angulo)*cos(angulo)*cos(angulo)-3*cos(angulo) << endl;

 cout << "(3tan(a)-tan^3(a))/(1-3tan^2(a))=";
 cout << (3*tan(angulo)-tan(angulo)*tan(angulo)*tan(angulo))/(1-3*tan(angulo)*tan(angulo));

 return 0;
}


