      program cuantica
      implicit none

    
      real*8 h,a
      integer J,L,N,nc,nt
      !N lo uso para la posicion y nt para el tiempo
      !nc es el numero de ciclos
      real*8,dimension(:),allocatable::k
      real*8,dimension(:),allocatable::s
      complex*8,dimension(:,:),allocatable::F
      real*8,dimension(:),allocatable::V
      complex*8,dimension(:,:),allocatable::b
      complex*8,dimension(:,:),allocatable::beta
      complex*8,dimension(:),allocatable::alpha
      complex*8,dimension(:,:),allocatable::chi

      complex*8 i,den
      i=(0,1)
      write(6,*)'escoge N(poscion)(divisible ente 4)'
      read(5,*)N
      write(6,*)'escoge n(tiempo)'
      read(5,*)nt
      nc=N/4
      N=nc
      !voy a renombrar N=nc=N/4
      allocate (k(0:N))
      allocate (s(0:N))
      allocate (V(0:N))
      allocate (b(0:N,0:nt))
      allocate (beta(0:N,0:nt))
      allocate (alpha(0:N))
      allocate (F(0:N,0:nt))
      allocate (chi(0:N,0:nt))
      F=0.d0
      V=0.d0
      b=0.d0
      beta=0.d0
      alpha=0.d0
      chi=0.d0
    
      !altura del potencial
      a=0.3
      !cte plank
      h=6.63e-34
      !numero ciclos:1,,,,N/4
    
       !(1)primero tengo que generar k,s,V,F
      do J=1,N
      k(J)=2*3.14159*nc/N
      s(J)=1/(4*k(J)**2)
      enddo
    
    
      do J=1,N
      if((J.ge.2*N/5).and.(J.le.3*N/5)) then
      V(J)=h*h*a*k(J)*k(J)
      else 
      V(J)=0
      endif
      enddo
    
       !calculo la funcion de onda
       !condicion de contorno que no se olvide
      do J=1,N
      F(J,0)=2.71828**(i*k(J)*J-((8*(4*J-N)**2)/N**2))
      enddo
      F(0,0)=0
      F(N,0)=0
     
       !calculo alpha
      alpha(N-1)=0
      do J=N-2,0,-1
      alpha(J)=-1/(-2+2*i/s(J+1)-V(J+1)+alpha(J+1))
      enddo

    
       !empiezo el algoritmo
      do L=1,nt
       !(2) calculo beta
      beta(N-1,L)=0
      do J=N,2,-1
      den=(-2+2*i/s(J-1)-V(J-1)+alpha(J-1))
      beta(J-2,L)=(4*i*V(J-1,L)/s(J)-beta(J-1,L))/den
      enddo
    
       !(3)calculo chi
      chi(0,L)=0
      chi(N,L)=0
    
      do J=1,N-1
      den=(-2+2*i/s(J)-V(J)+alpha(J))
      chi(J,L)=(-chi(J-1,L)+(4*i*V(J,L)/s(J)-beta(J,L)))/den
      enddo
    
       !(4)calculo la funcion de onda siguiente
      F(J,L+1)=chi(J,L)-F(J,L)
    
      enddo
       !termino el algoritmo
    
       !ahora le digo que me escriba la funcion de onda en un archivo 
      !open (unit=7, file='F.dat', status='unknown')
      !do K=1,N
      !(write(7,*) F(K,J),J=1,nt)
      !enddo
      !close(7)
    
      stop
        
      end program