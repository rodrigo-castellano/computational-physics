      program ising1
      use randomnumber
      implicit none


      real*8,dimension(:,:),allocatable::s
      real*8 T,x,y,p,AE,mag,rn,rm,En,C,E,E1,E2,E4, errorE1, errorE2
      integer I,J,K,L,F,u,v,z,D,n,m
      F=0
      T=1.3
      E=0.d0
      E2=0.d0
      E1=0.d0
      mag=0.d0 


      !con eso se me genera una lista de numeros aleatorios
      call dran_ini(17533)

      D=100
      write(6,*)'dimension(16,32,64,128):'
      read(5,*) D
      allocate (s(0:D+2,0:D+2))
      !inicializo s a 1 (lo supongo ordenado)
      S=1.d0
      E=0.d0
      E2=0.d0
      
       
      open (unit=8, file='datos.dat', status='unknown')
      open (unit=9, file='energia.dat', status='unknown')
      
      T=1.5
      !hago para cada una de las temperaturas 10.000 veces 100 PM para
      !poder calcular la energia cada 100 pM, pero antes relajo el sistema
      !hasta ver que la energia se relaje(ir probando para ver cuantos PM hacen falta)
      
      !do z=1,11
      !T=T+0.2  

      !como tengo que hacer 10000 medidas de E, E² , y para una medida 
      !de cada uno hacen falta 100 PM. En total 10⁶ PM
      do L=1,10000
      
      do F=1,100      
      do I=1,D**2!hay que hacerlo 10⁶ veces

      !(1)cojo un punto al alzar de la matriz nxn elementos(n,m)
      rn=dran_u()
      rm=dran_u()
      !el numero aleatorio pertenece [0,1]; para que pertenezca a [1,N]
      !y para que sean enteros
      !tengo que ver aparte el caso del 0
      if(rn.eq.0) then
      n=int(rn*(D+1))+1
      else if (rm.eq.0) then
      m=int(rm*(D+1))+1
      else
      n=int(rn*(D+1))
      m=int(rm*(D+1))
      endif

      !(2) cojo el minimo de (1,exp(-AE/T))
      AE=2*s(n,m)*(s(n+1,m)+s(n-1,m)+s(n,m+1)+s(n,m-1))

      if(1.lt.2.71828**(-AE/T))then
      p=1
      else
      p=2.71828**(-AE/T)
      endif

      !condiciones de contorno
      do K=1,D
      s(0,D)=s(D,K)
      s(D+1,K)=s(1,D)
      s(K,0)=s(K,D)
      s(K,D+1)=s(K,1)
      enddo

      !(3)aleatorio entre 0,1 si es menor que p,s(n,m)=-s(n,m)
      x=dran_u()
      if(x.lt.p) then
      s(n,m)=-s(n,m)
      endif
       
      enddo!termino el ciclo N² 
      enddo!termino los 100 pasos montecarlo
      
      !para calcular el promedio, en cada iteracion apunto E,E²  
      ! para despues sumar todos los elementos y hacer media
      do u=1,D
      do v=1,D
      E=-0.5*s(u,v)*(s(u,v+1)+s(u,v-1)+s(u+1,v)+s(u-1,v))
      enddo
      enddo
      
      E1=E1+E
      E2=E2+E**2
      
      
      !calcular magnetizacion      
      do u=1,D
      do v=1,D
      mag=mag+s(u,v)
      enddo
      enddo
      mag=mag/D**2
      write(9,*)mag
      
      enddo!termino los 10000 PM que requeria E
      mag=mag/10000
      E1=(E/10000)**2
      E2=(E2/10000)
      !LO QUE TENGO QUE DIVIDIRLOS ES POR EL NUMERO DE MEDIDAS TOTAL(nº DE PM)
      
      
        !voy a calcular la sigma de E y E²
        !El error del valor medio de E es 3*sigma/raiz(Nd) 
        !sigma²=Emedia²/D-(Emedia/D)²
      !errorE1=E2-E1
        !E2 y E1 las habia redefinido como se me requeria
      !errorE1=3*(errorE1)**0.5/(D**0.5)
        !ahora calculo el error de E2
      
      
      !voy a calcular ahora la energia 
      En=E/(2*D)

      C=(1/(D*D*T))*(E2-E1)      
      !write(8,*)T,mag,C,En,E2,E1
      E1=0
      E2=0
      !esto lo hago para que para la siguiente temperatura E sea cero
      !enddo !termino la temperatura actual
           

      close (8)
      close (9)

      stop
      end program

      
