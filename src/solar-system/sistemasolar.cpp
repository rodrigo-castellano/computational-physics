#include <cstdio>
#include <iomanip>
#include <fstream>
#include <iostream>
#include <cmath>
using namespace std;

#define Ms  1.99e+30  //Definimos la masa del Sol
#define G   6.67e-11
#define d   1.496e+11 //Definimos la distancia Tierra-Sol
#define h   0.01 //En unas 628 iteraciones da un ciclo la tierra. Una unidad temporal son 58.1 dias.



//Función para calcular la aceleración de cada masa ¿HAY QUE METER EL VECTOR DE LA ACELERACIÓN?
void Aceleracion(double r[][2], double a[][2], double m[], bool eliminado[]);

//Función para calcular las nuevas posiciones
void NuevaPosicion (double r[][2], double v[][2], double a[][2], bool eliminado[]); //TENGO QUE METER H??? Y LAS OTRAS ESTÁN BIEN?

//Función para calcular el vector w
void VectorGuardado(double v[][2], double a[][2], double w[][2], bool eliminado[]);

//Función para calcular la nueva velocidad
void NuevaVelocidad(double w[][2], double a[][2], double v[][2], bool eliminado[]);
//Función para calcular la energía mecánica
double Energia(double v[][2], double r[][2], double  m[],bool eliminado[], double Emec []);

//Funcion para calcular el momento angular
double Momento(double v[][2], double r[][2], double  m[], bool eliminado[], double momentoprima[]);










int main()
{
        //Declaración de variables
        double m[10], r[10][2], v[10][2]; //Variables de entrada
        double a[10][2], w[10][2], rp[10][2], rg[10][2]; //Variable de la aceleración y del vector que guarda v(t)+(h/2)*a(t)
        double E, mom; //Energía del sistema
        double t, x, excent[10];
	double momentoprima[10], Emec[10], exc[10], cteexc;
        int i, j, k, cont10, c, contador, cont3;  //contadores
        int contperiodo[10];
        double sumperiodos[10], P[10][100000], tperiodo[10];
	bool eliminado[10];
	double modrad;
	
	cteexc=G*G*Ms*Ms*Ms*Ms*Ms;
	//cout << cteexc << endl;

	ifstream f1,f2,f3;
	ofstream f4, f5, f6,f7,f8,f9;
	ofstream sol("sol.txt"), mercurio("mercurio.txt"), venus("venus.txt"), tierra("tierra.txt"), marte("marte.txt"), jupiter("jupiter.txt"), saturno("saturno.txt"), urano("urano.txt"), neptuno("neptuno.txt"), pluton("pluton.txt"), tierrav("tierrav.txt"), tierrap("tierrap.txt");

        f4.open("Energia_sistema.txt");
        f5.open("Periodos.txt");
	f6.open("Momento_sistema.txt");
	f7.open("Energia_Planetas_Real.txt");
	f8.open("Momento_Planetas_Real.txt");
	f9.open("Excentricidad_Planetas.txt");

	m[0]=1.99*pow(10.0,30.0);
	m[1]=0.330*pow(10.0,24.0);
	m[2]=4.87*pow(10.0,24.0);
	m[3]=5.97*pow(10.0,24.0);
	m[4]=0.642*pow(10.0,24.0);
	m[5]=1899*pow(10.0,24.0);
	m[6]=568*pow(10.0,24.0);
	m[7]=86.8*pow(10.0,24.0);
	m[8]=102*pow(10.0,24.0);
	m[9]=0.0125*pow(10.0,24.0);	
	
	//Datos de perihelio
	r[0][0]=0.0;
	r[0][1]=0.0;
	r[1][0]=46.0*pow(10.0,9.0);
	r[1][1]=0.0;
	r[2][0]=-107.5*pow(10.0,9.0);
	r[2][1]=0.0;
	r[3][0]=147.1*pow(10.0,9.0);
	r[3][1]=0.0;
	r[4][0]=-206.6*pow(10.0,9.0);
	r[4][1]=0.0;
	r[5][0]=740.5*pow(10.0,9.0);
	r[5][1]=0.0;
	r[6][0]=-1352.6*pow(10.0,9.0);
	r[6][1]=0.0;
	r[7][0]=2741.3*pow(10.0,9.0);
	r[7][1]=0.0;
	r[8][0]=-4444.5*pow(10.0,9.0);
	r[8][1]=0.0;
	r[9][0]=5870.*pow(10.0,9.0);
	r[9][1]=0.0;

	v[0][0]=0.0;
	v[0][1]=0.0;
	v[1][0]=0.0;
	v[1][1]=47.9*pow(10.0,3.0);
	v[2][0]=0.0;
	v[2][1]=-35.0*pow(10.0,3.0);
	v[3][0]=0.0;
	v[3][1]=29.8*pow(10.0,3.0);
	v[4][0]=0.0;
	v[4][1]=-24.1*pow(10.0,3.0);
	v[5][0]=0.0;
	v[5][1]=13.1*pow(10.0,3.0);
	v[6][0]=0.0;
	v[6][1]=-9.7*pow(10.0,3.0);
	v[7][0]=0.0;
	v[7][1]=6.8*pow(10.0,3.0);
	v[8][0]=0.0;
	v[8][1]=-5.4*pow(10.0,3.0);
	v[9][0]=0.0;
	v[9][1]=4.7*pow(10.0,3.0);

	
	double R1,R2,R3,R4,R5,R6,R7; //Fases solares
	R1=1.575*(6.957*pow(10.0,8.0))/d;
	R2=2.3*(6.957*pow(10.0,8.0))/d;
	R3=9.5*(6.957*pow(10.0,8.0))/d;
	R4=166.0*(6.957*pow(10.0,8.0))/d;
	R5=20.*(6.957*pow(10.0,8.0))/d;
	R6=100.*(6.957*pow(10.0,8.0))/d;
	R7=0.058*(6.957*pow(10.0,8.0))/d;


        //Inicializamos a cero el array para la aceleración
        for(i=0;i<=9;i++)
        {
              a[i][0]=0.0;
              a[i][1]=0.0;
	      eliminado[i]=false;
        }


       //Reescalamiento de variables

       //Reescalamiento de la masa y la posición
       for(i=0;i<=9;i++)
       {
               m[i]=m[i]/Ms;
               r[i][0]=r[i][0]/d;
               r[i][1]=r[i][1]/d;
       }

       //Reescalamiento de la velocidad
       for(i=0;i<=9;i++)
       {
               v[i][0]=v[i][0]*sqrt(d/(G*Ms));
               v[i][1]=v[i][1]*sqrt(d/(G*Ms));
       }

     //Guardamos las posiciones inicales del eje x
      for(i=0;i<=9;i++)
      {
               rp[i][0]=r[i][0];
      }

        //Inicializamos el tiempo
        t=0.0;
        //Calculamos la aceleración inicial
         Aceleracion(r,a,m,eliminado);

        for(i=0;i<=9;i++)
              {
                    P[i][0]=0.0; // tiempo inicial para cada masa 0.0
                    contperiodo[i]=1; //Empezamos a contar a partir de un periodo
                    sumperiodos[i]=0.0; //Inicializamos la suma de periodos a cero
              }
































	cout << "Comienza el programa." << endl;

/****************************** COMIENZA EL PROGRAMA ******************************/


j=1;

         //Bucle principal del programa de iteraciones infinitas
do{
/********************************** ESCRITURA DE DATOS **************************************/

                //Bucle que muestra en pantalla para cada iteración la posición de cada masa
                 for(i=0;i<=9;i++)
                 {
			rg[i][0]=r[i][0];
			cont10=i;

			//Sacar a archivo
			if (cont10==0)
			{
				sol << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==1)&&(eliminado[1]==false))
			{
				mercurio << r[cont10][0] << " " << r[cont10][1] << " " << endl;
			}else if((cont10==2)&&(eliminado[2]==false))
			{
				venus << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==3)&&(eliminado[3]==false))
			{
				tierra << r[cont10][0] << " " << r[cont10][1] << " " << endl;
				tierrav << v[cont10][0] << " " << v[cont10][1] << endl;
			}else if((cont10==4)&&(eliminado[4]==false))
			{
				marte << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==5)&&(eliminado[5]==false))
			{
				jupiter << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==6)&&(eliminado[6]==false))
			{
				saturno << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==7)&&(eliminado[7]==false))
			{
				urano << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==8)&&(eliminado[8]==false))
			{
				neptuno << r[cont10][0] << " " << r[cont10][1] << endl;
			}else if((cont10==9)&&(eliminado[9]==false))
			{
				pluton << r[cont10][0] << " " << r[cont10][1] << endl;
			}

                 }


















/********************************** FASES SOLARES **************************************/

//plot "jupiter.txt" every ::150000::300000 u 1:2 w l lc 1, "" every ::300000::500000 w l lc 2, "" every ::500000::800000 w l lc 3, "" every ::800000::1100000 w l lc 4, "" every ::1100000::1400000 w l lc 5, "" every ::1400000::1700000 w l lc 6, "" every ::1700000::2000000 w l lc 7, "" every ::2000000::2150000 w l lc 8

		if((j>=100000)&&(j<300000))
		{
			if(j==100000) cout << "Se va consumiendo el Hidrogeno" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R1) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					cout << modrad << " " << R1 << " " << eliminado[contador] << endl;
				}
			} m[0]=1.;
		
		}else if ((j>=300000)&&(j<600000))
		{
			if(j==300000) cout << "Se va consumiendo el Hidrogeno" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R2) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					cout << modrad << " " << R2 << " " << eliminado[contador] << endl;
				}
			}m[0]=0.9998;
		
		} else if ((j>=600000)&&(j<900000))
		{
			
			if(j==600000) cout << "Continua el consumo de Hidrogeno" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R3) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					cout << modrad << " " << R3 << " " << eliminado[contador] << endl;
				}
			} m[0]=0.9935;
		} else if ((j>=900000)&&(j<1350000))
		{
			if (j==900000) cout << "Ignicion del helio" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R4) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					if(eliminado[contador]==true) cout << modrad << " " << R4 << " " << eliminado[contador] << endl;
				}
			}m[0]=0.7249;
		} else if ((j>=1350000)&&(j<1750000))
		{
			if (j==1350000) cout << "Se acaba el helio del núcleo" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R5) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					cout << modrad << " " << R5 << " " << eliminado[contador] << endl;
				}
			}
			m[0]=0.708;
		} else if ((j>=1750000)&&(j<2250000))
		{
			if (j==1750000) cout << "Pulsos inestables de la corteza de helio" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R6) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					cout << modrad << " " << R6 << " " << eliminado[contador] << endl;
				}
			}
			m[0]=0.591;
		} else if ((j>=2250000)&&(j<2650000))
		{
			if (j==2250000) cout << "Enana Blanca" << endl;

			for(contador=1;contador<=9;contador++)
        		{	
				modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
			
				if(modrad<=R7) //bien calculado
				{
					eliminado[contador]=true;
					m[contador]=0.;
					cout << modrad << " " << R7 << " " << eliminado[contador] << endl;
				}
			}
			m[0]=0.54137;
		} 

/* ------------------------------------------------------------- FIN FASES SOLARES ---------------------------------------*/


                 NuevaPosicion(r,v,a,eliminado);
               //Calcula el vector que guarda v(t)+/h/2)a(t)
                 VectorGuardado(v,a,w,eliminado);
               //Calcula la nueva aceleración
                 Aceleracion(r,a,m,eliminado);
               //Calcula la nueva velocidad
                 NuevaVelocidad(w,a,v,eliminado);
               //Calcula la energía mecánica del sistema
                 E=Energia(v,r,m,eliminado,Emec);
		//Calcula el momento del sistema
		mom=Momento(v,r,m,eliminado,momentoprima);


		//Saca la energia y el momento en las unidades correctas reales
		//f7 << Emec[1] << " " << Emec[2] << " " << Emec[3] << " " << Emec[4] << " " << Emec[5] << " " << Emec[6] << " " << Emec[7] << " " << Emec[8] << " " << Emec[9] << endl;
		//f8 << momentoprima[1] << " " << momentoprima[2] << " " << momentoprima[3] << " " << momentoprima[4] << " " << momentoprima[5] << " " << momentoprima[6] << " " << momentoprima[7] << " " << momentoprima[8] << " " << momentoprima[9] << endl;
		//Excentricidad
		/*for(cont3=1;cont3=9;cont3++)
		{
			exc[cont3]=1.+2.*Emec[cont3]*momentoprima[cont3]*momentoprima[cont3]/(m[cont3]*m[cont3]*m[cont3]);
			//cout << exc[cont3] << endl;
			exc[cont3]=sqrt(exc[cont3]);	
		}
		f9 << exc[1] << " " << exc[2] << " " << exc[3] << " " << exc[4] << " " << exc[5] << " " << exc[6] << " " << exc[7] << " " << exc[8] << " " << exc[9] << endl;*/ 
		
               //Calcula el tiempo
                 t=t+h;


                f4 << t << " " << setprecision(12) <<  E << endl;
		f6 << t << " " << setprecision(12) << mom << endl;

              //Bucles para calcular el periodo


              for(i=1;i<=9;i++)
              {
		if(eliminado[i]==false)
		{

                    if((rg[i][0]<0.0)&&(r[i][0]>0.0))
                    {
                        k=contperiodo[i];
                        P[i][k]=t;
                        sumperiodos[i]+=(P[i][k]-P[i][k-1]);

                        contperiodo[i] ++;
                    }

                   tperiodo[i]=sumperiodos[i]/contperiodo[i];
                   tperiodo[i]=tperiodo[i]*sqrt(pow(d,3)/(G*Ms));
                   tperiodo[i]=tperiodo[i]/86400.;
		}
              }

		for (c=1;c<=9;c++)
		{
			if (eliminado[c]==false)
			{
				if (tperiodo[c]==0.)
				{
					f5 << "- ";
				}else f5 << tperiodo[c] << " ";
			}else f5 << "- ";
			
		}f5 << endl;
	j++;
        }while(j<=2650000);//Fin del bucle principal

cout << "FIN DEL PROGRAMA" << endl;



        return 0;
}

void ElimPlan(double radio, double r[][2], double a[][2], double m[], double v[][2], double w[][2], bool eliminado[])
{
	double modrad;

	//Si modulo de la posición menor o igual a modrad
	//m=0 y eliminado[]
	int contador;
	for(contador=1;contador<=9;contador++)
        {	
			modrad=sqrt((r[contador][0]-r[0][0])*(r[contador][0]-r[0][0])+(r[contador][1]-r[0][1])*(r[contador][1]-r[0][1]));
		
			if(modrad<=radio) //bien calculado
			{
				eliminado[contador]==true;
				m[contador]=0.;
			}
	}
return;
}


void Aceleracion(double r[][2], double a[][2], double m[], bool eliminado[])
{
      int i, j;
      double x1, x2, mod, y1, y2;

      for(i=0;i<=9;i++)
       {
              a[i][0]=0.0;
              a[i][1]=0.0;
       }


      for(i=0;i<=9;i++)
      {
	if(eliminado[i]==false){
            for(j=0;j<=9;j++)
            {
		if(eliminado[i]==false){
                    if(i!=j)
                    {

                        x1=r[i][0]-r[j][0];
                        y1=x1*x1;
                        x2=r[i][1]-r[j][1];
                        y2=x2*x2;

                        mod=sqrt(y1+y2);


                        a[i][0]+=(m[j]*x1)/(pow(mod,3));
                        a[i][1]+=(m[j]*x2)/(pow(mod,3));

                    }
		}
             }


             a[i][0]=-a[i][0];
             a[i][1]=-a[i][1];
	}
       }

       return;

}



void NuevaPosicion (double r[][2], double v[][2], double a[][2], bool eliminado[])
{
         int i;


         for(i=0;i<=9;i++)
         {	
		if(eliminado[i]==false){
                 r[i][0]=r[i][0]+h*v[i][0]+((h*h)/2.)*a[i][0];

                 r[i][1]=r[i][1]+h*v[i][1]+((h*h)/2.)*a[i][1];
         	}else{
		r[i][0]=0.;
		r[i][1]=0.;
		}

	}


         return;
}


//Función para guardar los valores de v(t)+(h/2)*a(t)
void VectorGuardado(double v[][2], double a[][2], double w[][2], bool eliminado[])//¿HAY QUE PASAR LA H?
{
        int i;
        for(i=0;i<=9;i++)
        {
		if(eliminado[i]==false){

               w[i][0]=v[i][0]+(h/2.)*a[i][0];

               w[i][1]=v[i][1]+(h/2.)*a[i][1];
        	}
	}

        return;
}



void NuevaVelocidad(double w[][2], double a[][2], double v[][2], bool eliminado[])
{

         int i;//Variable contador

         //Bucle para calcular la velocidad de cada componente
         for(i=0;i<=9;i++)
         {
		if(eliminado[i]==false){
              //velocidad nueva para la componente i
              v[i][0]=w[i][0]+(h/2.)*a[i][0];
              //velocidad nueva para la componente j
              v[i][1]=w[i][1]+(h/2.)*a[i][1];
         	}else {
		v[i][0]=0.;
		v[i][1]=0.;
		}
	}

         return;

}

double Momento(double v[][2], double r[][2], double  m[], bool eliminado[], double momentoprima[])
{
        int i;
	double mom, cte; //momento

	cte=sqrt(G*Ms*Ms*Ms*d);

       mom=0.0;

       for(i=0;i<=9;i++)
       {
		
		momentoprima[i]=m[i]*(r[i][0]*v[i][1]-r[i][1]*v[i][0]);	
		mom+=m[i]*(r[i][0]*v[i][1]-r[i][1]*v[i][0]);
       }

       return mom;
}


//Función que te que calcula la energía mecánica de todo el sistema
double Energia(double v[][2], double r[][2], double  m[], bool eliminado[], double Emec [])
{
        int i, j;
        double Em, Ep, Ec, cte;
        double mod1;//Modulo de la distancia
        double mod2;//Modulo de la velocidad
        double x1, x2;
	
       cte=G*Ms*Ms/d;	

       Em=0.0;

       for(i=0;i<=9;i++)
       {
	if(eliminado[i]==false)
	{

            Ep=0.0;

            for(j=0;j<=9;j++) //Aquí se calcula la Ep
            {
	      if(eliminado[i]==false)
	     {
               if(i!=j)
               {
                  x1=r[i][0]-r[j][0];
                  x2=r[i][1]-r[j][1];

                  mod1=sqrt(x1*x1+x2*x2);


                  //Calculamos la energía potencial
                  Ep=Ep-(m[j]*m[i])/mod1;
               }
	     }
	    }
           

             mod2=v[i][0]*v[i][0]+v[i][1]*v[i][1];
             //Calculamos la energía cinética
             Ec=(0.5)*m[i]*mod2;
	    
	     //Energía mecanica real desreescalada
	     Emec[i]=cte*(Ec+Ep);

             //Va añadiendo la energía mecánica de cada cuerpo
             Em=Em+(Ep+Ec);
	}
	 

       }


       //Devuelve la energía mecánica total del sistema
       return Em;
}





