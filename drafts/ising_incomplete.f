      program ising1
      use randomnumber
      implicit none
      

      real*8,dimension(:,:),allocatable::s
      real*8 T
      real*8 x,y,p,AE
      integer I,J,n,z


      call dran_ini(17533)
      x=dran_u()
         !x tiene que pertenecer a cero, uno
      write(6,*)'numero aleatorio',x

      
      
      
      write(6,*)'Escoge N'
      read (5,*) n
      allocate (S(n,n))
      write(6,*)'Escoge T'
      read (5,*) T
      
      S=1.d0
      

      do I=1,n
      WRITE (6,*) (s(I,J), J=1,N)
      enddo

      !hago la iteracion n² veces
      !tengo que aplicar z en el ciclo(ahora no sale)
      do z=1,n**2
  
      !(1)ahora cojo un punto al alzar de la matriz NxN (n,m)
      x=dran_u()
      y=x*n
      !(2) cojo el minimo de (1,exp(-AE/T))
       
      AE=2*s(n,m)*(s(n+1,m)+s(n-1,m)+s(n,m+1)+s(n,m-1))

      if(1.gt.e**(-AE/T))then
      p=AE
      else
      p=1
      endif

      !condiciones de contorno
      s(0,J)=S(n,J)
      s(n+1,J)=s(1,J)
      s(i,0)=s(i,n)
      s(i,n+1)=s(i,1)
 
      !(3)aleatorio enter 0,1 si es menor que p,s(n,m)=-s(n,m)
      
      x=dran_u()
      if(x.lt.p) then
      s(n,m)=-s(n,m)
      
      !termino el ciclo y lo hago de nuevo
      
      enddo
      
      
      
      
      
      !pause
      stop
      end program
      
      
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      
