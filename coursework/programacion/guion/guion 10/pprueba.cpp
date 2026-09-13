//Programa que trata de resolver el problema
//del viajante de comercio.
//Se prueban varios algoritmos.

#include <iostream>
#include <cstdlib>
#include <string>
#include <ctime>
#include <fstream>
#include <cmath>
#define MAX 100
#define MAX_TIME 3600
using namespace std;

//La clase tMapa se utiliza para almacenar en memoria
//el nombre de las ciudades y las distancias entre las mismas
class tMapa
{
    public:
    int num_ciudades;
    string nombre_ciudad[MAX];
    int distancia[MAX][MAX];
    void LeerMapa(void);
};

//Método LeerMapa(): extrae los datos del fichero
void tMapa::LeerMapa(void)
{
    ifstream fichero;
    int i, j;
    fichero.open("distancias.txt");

    //Leer número de ciudades
    fichero >> num_ciudades;

    //Leer nombre de las ciudades
    for(i=0; i< num_ciudades; i++)
        fichero >> nombre_ciudad[i];

    //Leer la matriz de distancias
    for(i=0; i< num_ciudades; i++)
        {   for(j=0; j< num_ciudades; j++)
                fichero >> distancia[i][j];
        }
    fichero.close();

    return;
}

//La clase tRuta almacena un posible recorrido, es decir,
//el orden en que se pueden recorrer las ciudades.
//Al final se añade la ciudad de origen como un elemento más.
//También guarda la distancia que supone dicho recorrido.
class tRuta
{
    public:
    int num_ciudades;
    int recorrido[MAX+1];
    int distancia;
    void CalculaDistancia(tMapa mapa);
    void MuestraRuta(tMapa mapa);
};

//Método CalculaDistancia(): calcula la distancia total de un recorrido
void tRuta::CalculaDistancia(tMapa mapa)
{
    int i;
    distancia = 0;

    //Sumar la distancia entre cada dos ciudades del recorrido
    for(i=1; i<=num_ciudades; i++)
    distancia = distancia + mapa.distancia[recorrido[i-1]][recorrido[i]];
    return ;
}

//Método MuestraResultado(): muestra en pantalla la distancia de un recorrido y
//el orden en que hay que recorrer las ciudades, mostrando sus nombres.
void tRuta::MuestraRuta(tMapa mapa)
{
    int i;
    cout << "Distancia: " << distancia << " Kms" << endl;
    cout << "Recorrido propuesto: " << endl;

    //Ciudades intermedias, cada 5 hago un salto de línea
    for(i=0; i<=num_ciudades; i++)
    {
        cout << mapa.nombre_ciudad[recorrido[i]] << " > ";
        if(i%5==0) cout << endl;
    }
    cout << endl;
    return ;
}

tRuta Algoritmo1(tMapa mapa);
tRuta Algoritmo2(tMapa mapa);
tRuta Algoritmo3(tMapa mapa);
tRuta Algoritmo4(tMapa mapa);
tRuta Algoritmo5(tMapa mapa);
tRuta Algoritmo6(tMapa mapa);tRuta IntercambiaCiudades(tRuta ruta, tMapa mapa);
char EscogeAlgoritmo(void);
int PedirTiempoMaximo(void);


//Algoritmo 1: calcula la ruta por defecto. Se coge como
//recorrido el orden en que aparecen en el fichero original
tRuta Algoritmo1(tMapa mapa)
{
    tRuta ruta;
    int i;
    ruta.num_ciudades = mapa.num_ciudades;
    for(i=0; i< ruta.num_ciudades; i++)
    ruta.recorrido[i] = i;

    //Se añade la ciudad de partida al final del recorrido
    ruta.recorrido[ruta.num_ciudades] = 0;
    ruta.CalculaDistancia(mapa);
    return ruta;
}

//Algoritmo 2 (Greedy): se establece un recorrido consistente en
//escoger en primer lugar la ciudad más cercana a la ciudad de partida,
//después la más cercana a la escogida, y así sucesivamente.
//Este algoritmo es en el fondo un problema de encontrar N mínimos, teniendo
//en cuenta que las ciudades que ya se hayan escogido no hay que volver
//a considerarlas
tRuta Algoritmo2(tMapa mapa)
{
    tRuta ruta;
    int distanciamin;
    int i,j;
    int ciudad_mascercana, contador;
    bool ciudad_escogida[MAX];
    ruta.num_ciudades = mapa.num_ciudades;

    //Usamos un array que indique si una ciudad ya se ha incluído o no
    for(i=0; i<=ruta.num_ciudades; i++)
    ciudad_escogida[i] = false;

    //La primera ciudad es la de partida y la última es la misma
    ruta.recorrido[0] = ruta.recorrido[ruta.num_ciudades] = 0;
    ciudad_escogida[0] = ciudad_escogida[ruta.num_ciudades] = true;

    //i indica el número de ciudad a la que hay que buscar la más cercana
    i=0;

    //contador indica el número de mínimos que hay que buscar, uno por cada
    //ciudad a recorrer, menos la última intermedia, que retorna siempre a la de
    //partida
    contador=0;
    while(contador<(ruta.num_ciudades-1))
    {
        //Para cada ciudad del recorrido busco la ciudad más cercana
        distanciamin = 100000;
        for(j=0;j<ruta.num_ciudades; j++)
        {
            //Las ciudades que ya se han incluido en el recorrido no se cuentan
            //para evitar las repeticiones
            if(ciudad_escogida[j]==false)
            if(mapa.distancia[i][j]<distanciamin)
            {
                distanciamin=mapa.distancia[i][j];
                ciudad_mascercana=j;
                                                                                                                           }
            }

            //Escogemos la ciudad más cercana como siguiente en el recorrido
            //y la descartamos para las próximas búsquedas de mínimos
            i = ciudad_mascercana;
            ciudad_escogida[ciudad_mascercana] = true;
            contador++;
            ruta.recorrido[contador]=ciudad_mascercana;
        }
        ruta.CalculaDistancia(mapa);
        return ruta;
}

//Algoritmo 3: se genera una ruta al azar
tRuta Algoritmo3(tMapa mapa)
{
    tRuta ruta;
    bool ciudad_escogida[MAX];
    int i, azar;
    ruta.num_ciudades = mapa.num_ciudades;

    //La ciudad de origen y llegada es fija
    ruta.recorrido[0] = ruta.recorrido[ruta.num_ciudades] = 0;

    //Para controlar las ciudades ya escogidas previamente
    for(i=1; i<ruta.num_ciudades; i++)
    ciudad_escogida[i] = false;

    //Las ciudades intermedias se escogen al azar
    for(i=1; i<ruta.num_ciudades; i++)
    {
        //Genero número de ciudad intermedia al azar
        azar = rand()%(ruta.num_ciudades-1)+1;

        //Si ya está escogido reviso la siguiente no escogida aún
        while(ciudad_escogida[azar]==true)
        {
            //Si llego a la última intermedio, reviso desde la primera
            if(azar==(ruta.num_ciudades-1)) azar = 1;
            else azar++;
        }
        ruta.recorrido[i]=azar;
        ciudad_escogida[azar] = true;
    }
    ruta.CalculaDistancia(mapa);
    return ruta;
}
//Algoritmo 4 (búsqueda aleatoria). Se generan recorridos al azar y se
//escoge el que resulte una distancia menor.
//El usuario escogerá el tiempo en segundos que durará esta búsqueda.
//Este algoritmo llama al anterior para generar cada solución a probar.
tRuta Algoritmo4(tMapa mapa, int tiempo_maximo)
{
    tRuta RutaAleatoria, RutaMejor;
    clock_t tini, tfin;
    int numsecs;
    tini = clock();
    RutaMejor = Algoritmo3(mapa);
    do
    {
      RutaAleatoria = Algoritmo3(mapa);
      if(RutaAleatoria.distancia<RutaMejor.distancia)
          RutaMejor = RutaAleatoria;
      tfin = clock();
      numsecs = (int)(tfin-tini)/CLOCKS_PER_SEC;
    } while(numsecs<=tiempo_maximo);
    return RutaMejor;
}
//Algoritmo 5 (búsqueda aleatoria dirigida). Se generan recorridos al azar y se
//escoge el que resulte una distancia menor.
//Para generar la siguiente solución al azar se intercambia dos ciudades
//entre sí en la mejor solución encontrada hasta el momento.
//El usuario escogerá el tiempo en segundos que durará esta búsqueda.
tRuta Algoritmo5(tMapa mapa, int tiempo_maximo)
{
    tRuta RutaNueva, RutaMejor;
    clock_t tini, tfin;
    int numsecs;
    tini = clock();
//Solución inicial aleatoria
    RutaMejor = Algoritmo3(mapa);
    do
    {
//Cada solución aleatoria la genero intercambiando dos ciudades
//en la mejor solución encontrada hasta el momento
    RutaNueva = IntercambiaCiudades(RutaMejor, mapa);
    if(RutaNueva.distancia<RutaMejor.distancia)
     RutaMejor = RutaNueva;
     tfin = clock();
     numsecs = (int)(tfin-tini)/CLOCKS_PER_SEC;
    } while(numsecs<=tiempo_maximo);
    return RutaMejor;
}
tRuta IntercambiaCiudades(tRuta RutaOriginal, tMapa mapa)
{
    int p1, p2;
    tRuta ruta;
    ruta = RutaOriginal;
//Selecciono al azar dos posiciones del recorrido distintas de
//la primera y ultima
    p1 = rand()%(ruta.num_ciudades-1) + 1;
    p2 = rand()%(ruta.num_ciudades-1) + 1;
//Intercambio las ciudades escogidas entre sí
    ruta.recorrido[p1] = RutaOriginal.recorrido[p2];
    ruta.recorrido[p2] = RutaOriginal.recorrido[p1];
    ruta.CalculaDistancia(mapa);
    return ruta;
}

//Algoritmo 6 (Simulated Annealing). Se generan recorridos al azar y se
//escoge el que resulte una distancia menor. También se escogen soluciones
//peores con una probabilidad que disminuye a lo largo del tiempo.
tRuta Algoritmo6(tMapa mapa, int tiempo_maximo)
{
    tRuta RutaNueva, RutaMejor;
    clock_t tini, tfin;
    int numsecs, i;
    double azar, probabilidad, T;
    tini = clock();
//Solución inicial aleatoria
    RutaMejor = Algoritmo3(mapa);
//Valor inicial de la temperatura
    T = pow(tiempo_maximo,2);
    do
    {
      for(i=0; i<100; i++)
      {
//Cada solución aleatoria la genero intercambiando dos ciudades
//en la mejor solución encontrada hasta el momento
       RutaNueva = IntercambiaCiudades(RutaMejor, mapa);
       if(RutaNueva.distancia<=RutaMejor.distancia) RutaMejor = RutaNueva;
       else
       {
         probabilidad=exp((double)(RutaMejor.distancia - RutaNueva.distancia)
                          /(T*RutaMejor.distancia));
         azar = (double)rand()/RAND_MAX;
         if(probabilidad > azar) RutaMejor = RutaNueva;
       }
      }
      T = 0.995*T;
      tfin = clock();
      numsecs = (int)(tfin-tini)/CLOCKS_PER_SEC;
    } while(numsecs<=tiempo_maximo);
    return RutaMejor;
}

//EscogeAlgoritmo: pequeño menú para seleccionar el algoritmo a probar
char EscogeAlgoritmo(void)
{
    char eleccion;
    cout << "PROBLEMA DEL VIAJANTE DE COMERCIO " << endl << endl;
    cout << "1. Ruta por defecto" << endl;
    cout << "2. Algoritmo greedy de la ciudad más cercana" << endl;
    cout << "3. Ruta aleatoria" << endl;
    cout << "4. Busqueda completamente aleatoria" << endl;
    cout << "5. Busqueda aleatoria dirigida" << endl;
    cout << "6. Busqueda aleatoria dirigida con simulated annealing" << endl;

    do
    {
        cout << "Escoja algoritmo: ";
        cin >> eleccion;
    }while((eleccion<'1')||(eleccion>'6'));
    cout << endl;
    return eleccion;
}

//pedir tiempo maximo: solicita que el usuario introduzca el numero de
//segundps maximo para los algoritmos de busqueda
int PedirTiempoMaximo(void)
{
    int t;
    //se pide el numero de segundos maximo a emplear en la busqueda
    do
    {
        cout<<"Introduzca numero de segundos maximo para la busqueda: ";
        cin>>t;
    }while ((t<=0)&&(t>=MAX_TIME));
    return t;
}


//Función principal
int main(void)
{
    int suma,n,i;
    double RutaMejor,distancia;
    suma=0;
    cout<<"escoja numero de pruebas: ";cin>>n;
    tMapa mapa;
    tRuta ruta;
    int tiempo;
    char opcion;
    srand(time(NULL));
    mapa.LeerMapa();
    opcion = EscogeAlgoritmo();
    for(i=0;i<n;i++)
    {
      if(opcion=='1')
    {
    cout << "*** RUTA POR DEFECTO ***" << endl;
    cout << "Recorrido en el orden en el que aparecen las ciudades en el fichero" << endl << endl;
    ruta = Algoritmo1(mapa);
    ruta.MuestraRuta(mapa);
    suma=suma+RutaMejor;
    }
    else if(opcion=='2')
    {
    cout << "*** ALGORITMO DE DIJKSTRA ***" << endl;
    cout << "Recorrido escogiendo siempre la ciudad mas proxima a una dada" << endl << endl;
    ruta = Algoritmo2(mapa);
    ruta.MuestraRuta(mapa);
    suma=suma+RutaMejor;
    }
    else if(opcion=='3')
    {
    cout << "*** RUTA ALEATORIA ***" << endl;
    cout << "Se genera una solucion al azar" << endl << endl;
    ruta = Algoritmo3(mapa);
    ruta.MuestraRuta(mapa);    suma=suma+RutaMejor;
    }
    else if(opcion=='4')
    {
    cout << "*** BUSQUEDA COMPLETAMENTE ALEATORIA ***" << endl;
    cout << "Mejor recorrido de entre varias soluciones al azar" << endl<< endl;
    tiempo = PedirTiempoMaximo();
    ruta = Algoritmo4(mapa, tiempo);
    ruta.MuestraRuta(mapa);
    suma=suma+RutaMejor;
    }
    else if(opcion=='5')
    {
    cout << "*** BUSQUEDA ALEATORIA DIRIGIDA ***" << endl;
    cout << "Mejor recorrido de entre varias soluciones al azar mediante transformaciones de una solución dada" << endl << endl;
    tiempo = PedirTiempoMaximo();
    ruta = Algoritmo5(mapa, tiempo);
    ruta.MuestraRuta(mapa);
    suma=suma+RutaMejor;
    }
    else
    {
    cout << "*** BUSQUEDA CON SIMULATED ANNEALING ***" << endl;
     cout << "Busqueda aleatoria dirigida con enfriamiento simulado" <<endl << endl;
    tiempo = PedirTiempoMaximo();
    ruta = Algoritmo6(mapa, tiempo);
    ruta.MuestraRuta(mapa);    suma=suma+RutaMejor;
    }

    }

    cout<<"la media de las distancias es: "<<suma/i<<" km.";
    system("pause");
    return 0;
}
