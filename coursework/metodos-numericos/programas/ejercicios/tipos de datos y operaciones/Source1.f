      PROGRAM EJEMPLO1
      real x,y,PI, num, denom
      PARAMETER (PI=3.1415)
      write(*,*)'mete x e y'
      read(*,*)x,y
      num=(x/y)+PI
      denom=PI-(y/x)
      write(*,*)num/denom
      write(*,*)'el valor de x es:',x,'y el valor de y es',y
      pause
      stop
      end
      
