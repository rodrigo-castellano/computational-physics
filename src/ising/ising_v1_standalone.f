        program ising1
      !use randomnumber
      implicit none


      real*8,dimension(:,:),allocatable::s
      real*8 T,x,y,p,AE,m,n
      integer I,J,K,z,D

      !con eso se me genera una lista de numeros aleatorios
      !call dran_ini(17533)

      !voy a coger una matriz de 10x10
      D=100
      allocate (s(0:D+2,0:D+2))
      write(6,*)'Escoge T'
      read (5,*) T

      !inicializo s a 1 (lo supongo ordenado)
      S=1.d0


      !hago la iteracion n² veces
      !tengo que aplicar z en el ciclo(ahora no sale)
      do I=1,D**2

      !(1)cojo un punto al alzar de la matriz nxn elementos(n,m)
      n=0.39!dran_u()
      m=0.289!dran_u()
      !el numero aleatorio pertenece [0,1]; para que pertenezca a [1,N]
      !y para que sean enteros
      !tengo que ver aparte el caso del 0
      if(n.eq.0) then
      n=int(n*(D+1))+1
      else if (m.eq.0) then
      m=int(m*(D+1))+1
      else
      n=int(n*(D+1))
      m=int(m*(D+1))
      endif
      !write(6,*)'valor de n,m',n,m

      !(2) cojo el minimo de (1,exp(-AE/T))
      AE=2*s(n,m)*(s(n+1,m)+s(n-1,m)+s(n,m+1)+s(n,m-1))
      !write(6,*)'valor de AE',AE
      !write(6,*)'valor de e^(-AE/T)',2.71828**(-AE/T)

      if(1.lt.2.71828**(-AE/T))then
      p=1
      else
      p=2.71828**(-AE/T)
      endif
      !write(6,*)'valor de p',p

      !condiciones de contorno

      do K=1,100
      s(0,D)=s(D,K)
      s(D+1,K)=s(1,D)
      s(K,0)=s(K,D)
      s(K,D+1)=s(K,1)
      enddo

      !(3)aleatorio entre 0,1 si es menor que p,s(n,m)=-s(n,m)
      x=0.8753!dran_u()
      if(x.lt.p) then
      s(n,m)=-s(n,m)
      endif

      !termino el ciclo y lo hago de nuevo
      enddo

      !comprobamos si ha salido bien escribiendo en un archivo fuera
      open (unit=7, file='datos.dat', status='unknown')
      do z=1,D
      write(7,*)(s(z,J), J=1,D)
      enddo
      close(7)




      pause
      stop
      end program


      !*****************************************************************
      !*****************************************************************
      !*****************************************************************


