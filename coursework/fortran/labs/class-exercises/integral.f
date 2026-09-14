        program integral
        real*8::a,b,dx,res
        integer*8::Nmax,N

       
        open (unit=7,file='integral.dat',status='old')
        read(7,*)Nmax
        read(7,*)a,b !dx se refiere a deltax
        close (unit=7)
       
        open(unit=8,file='resultados.dat',status='unknown')
        do N=10, Nmax, 10
        
        
        dx=(b-a)/dble(N)
        call sum(res)    !como he puesto contains no necesito pasarle argumentos
               
       
        write(8,*)N,res
        enddo
        close (unit=8)
        stop

        contains
             
        
        subroutine sum(res)
        real*8::sum0, xi, res
        integer*8::i
        sum0=0.d0
        
        do i=0,N-1
          xi=a+dx*dble(i)
          sum0=sum0+f(xi)
        enddo
        
        res=dx*(sum0+(f(b)-f(a))/2.d0)

        
        end subroutine sum
        
        function f(x)
        real*8::f,x
               f=x**2.d0
        end function f
        
        end
