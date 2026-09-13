/*Programa que calcula las funciones trigonométricas del ángulo triple*/

#include <iostream>
#include <cmath>
#include <iomanip>
#define pi  3.1415926535
using namespace std;

int main (void)

{

 float angulo, seno, coseno, tangente;


 cout << "Introduzca un angulo en radianes: ";
 cin >> angulo;
 cout << endl;
 cout << setprecision (3);

//se va a mostrar en forma de tabla
 if (angulo!=3.14/2)
 {
  cout << "forma directa        forma alternativa                 resultado (direct y alt)" << endl << endl;


  cout << "sin (3a)             3sin(a)-4sin^3(a)                 "<<setprecision(4)<< sin (3*angulo) << " y " <<setprecision(4)<< 3*sin(angulo)-4*sin(angulo)*sin(angulo)*sin(angulo)<< endl ;

  cout << "cos (3a)             4cos^3(a)-3cos(a)                 "<<setprecision(4)<< cos(3*angulo) << " y " <<setprecision(4)<< 4*cos(angulo)*cos(angulo)*cos(angulo)-3*cos(angulo)  << endl;

  cout << "tan (3a)             (3tan(a)-tan^3(a))/(1-3tan^2(a))  "<<setw(4)<< tan (3*angulo) << " y " <<setw(4)<< (3*tan(angulo)-tan(angulo)*tan(angulo)*tan(angulo))/(1-3*tan(angulo)*tan(angulo)) << endl;
 }
 else
 {
     cout << "forma directa        forma alternativa                 resultado (direct y alt)" << endl << endl;


  cout << "sin (3a)             3sin(a)-4sin^3(a)                 "<<setprecision(4)<< sin (3*angulo) << " y " <<setprecision(4)<< 3*sin(angulo)-4*sin(angulo)*sin(angulo)*sin(angulo)<< endl ;

  cout << "cos (3a)             4cos^3(a)-3cos(a)                 "<<setprecision(4)<< cos(3*angulo) << " y " <<setprecision(4)<< 4*cos(angulo)*cos(angulo)*cos(angulo)-3*cos(angulo)  << endl;

  cout << "tan (3a)             (3tan(a)-tan^3(a))/(1-3tan^2(a))  "<<"Tiende a infinto";
 }
 return 0;
}

