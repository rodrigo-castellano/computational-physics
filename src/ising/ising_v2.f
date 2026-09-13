        program ising1
      use randomnumber
      implicit none


      real*8,dimension(:,:),allocatable::s
      real*8 T,x,y,p,AE,mag,rn,rm
      integer I,J,K,L,F,u,v,z,D,n,m
      F=0
      T=0

      !con eso se me genera una lista de numeros aleatorios
      call dran_ini(17533)

      !voy a coger una matriz de 10x10
      D=100
      allocate (s(0:D+2,0:D+2))
      !inicializo s a 1 (lo supongo ordenado)
      S=1.d0
      
      open (unit=8, file='repre.dat', status='unknown')
      do L=1,50
      if(L.gt.24) then
      T=T+0.2
      endif
      
      
      do F=1,100
      
      
      
      do I=1,D**2

      !(1)cojo un punto al alzar de la matriz nxn elementos(n,m)
      rn=dran_u()
      rm=dran_u()
      !write(6,*)'rn,rm',rn,rm
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
      !write(6,*)'valor de n,m,s(n,m)',n,m,s(n,m)

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

      do K=1,D
      s(0,D)=s(D,K)
      s(D+1,K)=s(1,D)
      s(K,0)=s(K,D)
      s(K,D+1)=s(K,1)
      enddo

      !(3)aleatorio entre 0,1 si es menor que p,s(n,m)=-s(n,m)
      x=dran_u()
      !write(6,*)'aleat entre 0 y 1 a comparar con p',x
      if(x.lt.p) then
      s(n,m)=-s(n,m)
      endif

      !termino el ciclo y lo hago de nuevo
        
      enddo
       
      enddo
      !calcular magnetizacion
        mag=0.d0 
        do u=1,D
        do v=1,D
        mag=mag+s(u,v)
        enddo
        enddo
        mag=mag/D**2

      write(8,*)T,mag
      enddo
      close (8)
       
      !comprobamos si ha salido bien escribiendo en un archivo fuera
      open (unit=7, file='datos.dat', status='unknown')
      
      
      do z=1,D
      write(7,*)(s(z,J), J=1,D)
      enddo
      close(7)
      
      
      
        !lo ultimo que me queda es hacer otro ciclo que lo haga para T
        !desde 1 hasta 5 y representar mag frente a T
        !quizas sea mejor hacerlo con mas valores dentro del rango ese



      !pause
      stop
      end program


      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      
