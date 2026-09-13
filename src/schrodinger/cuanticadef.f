      program schrodinger
      implicit none

      real, parameter :: PI=3.1415926535, lambda=0.7
      integer, parameter :: N=1000, nci=100, tmax=2800
      complex, parameter :: i=(0.0,1.0)
      !tmax es hasta donde llega el tiempo
      !N lo uso para ver hasta donde llega la posicion
      !nci es el numero de ciclos

      integer*8 j, t, pantalla, g
      !j es un contador
      !t se refiere a la iteracion t
      !g es una auxiliar para cuando se escribe en pantalla
      !pantalla es lo que se muestra en pantalla
      real*8 k0, s, norma
      !norma es el modulo al cuadrado
      real*8 V(0:N), moduloo(0:N)
      !modulo es el valor abs² de la f. onda 
      !norma es la suma de todos los modulos en una iteracion
      complex*8 phi(0:N), alpha(0:N-1), beta(0:N-1), b, xi(0:N)

      open(unit=1,file="Datos",status="unknown")
      open(unit=2,file="Norma",status="unknown")

      !Norma es la norma de phi
      
      !pantalla lo pongo cuando voy a indicar que algo salga en pantalla
      pantalla=0
      k0=(2.0*PI*nci)/N
      s=1.0/(4.0*k0*k0)

      !voy a calcular el potencial
      do j=0,N
       if ((j>400).AND.(j<=600)) then
        V(j)=lambda*k0*k0
       else 
        V(j)=0
       endif
      enddo
      
      !calculo la funcion de onda
      do j=0,N
	phi(j)=exp(i*k0*j)*exp(-8.0*((4.0*j-N)**2)/(N**2))
      enddo	

      !las condiciones
      phi(0)=(0,0)
      phi(N)=(0,0)
      alpha(N-1)=(0,0)
      beta(N-1)=(0,0)
      xi(0)=(0,0)
      xi(N)=(0,0)

      !vamos con alpha
      !a-=1    a0=(-2-V)+i(2/s)   a+=1
      do j=N-2,0,-1
	alpha(j)=(-2.0-V(j+1)+i*2/s)+alpha(j+1)
	alpha(j)=-1.0/alpha(j)
      enddo

      !comienza el ciclo
      do t=1,tmax

      !calculo beta
      do j=N-2,0,-1
        beta(j)=(-2.0-V(j+1)+i*2.0/s)+alpha(j+1)
        b=(0+i*4/s)*phi(j+1)
        beta(j)=(b-beta(j+1))/beta(j)
      enddo

      !ahora calculo xi
      do j=0,N-1
        xi(j+1)=alpha(j)*xi(j)+beta(j)
      enddo

      !calculo phi(j+1)
      do j=0, N
        phi(j)=xi(j)-phi(j)
      enddo

      !ahora calculo el modulo (lo voy escribiendo en un archivo)
      norma=0.0
      do j=0,N
        moduloo(j)=(abs(phi(j)))**2
        norma=norma+moduloo(j)
      enddo
    
        !lo que hago aqui es decirle que cada tres iteraciones del ciclo
        !(para que ocupe menos espacio el archivo)
        !que me entre en el bucle y que me escriba, para todas las
        !posiciones, el modulo de la respectiva phi y su potencial
      if(pantalla==3)then  
            do j=0,N   
            g=mod(j,3)!esto lo hago para que me muestre el modulo de cada 3 funciones de onda.
      !mod es la resta entera de j y 3. Cada multiplo de 3 que me haga el ciclo g=0        
            if(g==0)then
                write(1,*) j, moduloo(j), V(j)
            endif
            enddo
      !pongo a cero pantalla para que me empiece a contar de nuevo hasta 3
      pantalla=0
      endif  
      pantalla=pantalla+1
      !dejo espacio en blanco para que haya espacios y se pueda hacer el gift
      write(1,*)
      write(1,*)
      write(2,*) norma

      enddo

      close(1)
      close(2)
      
      stop
      end
