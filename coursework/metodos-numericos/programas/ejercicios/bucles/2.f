                 program ejer2
       real x,y
       integer i,j,k
       x=0.0
       y=0.0
       write(*,*)'escribe el valor maximo a sumar'
       read(*,*)i
       do 8 j=1,i
       x=x+j*j
   8   continue
       do 11 k=1,i
       y=y+k*(k+1)*(2*k+1)/6
   11  continue
       write(*,*)'x e y'
       write(*,*)x,y

       pause
       stop
       end
