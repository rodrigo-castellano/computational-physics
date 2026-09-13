                 program ejer1
       real x,y
       integer i,j,k
       x=0.0
       y=0.0
       write(*,*)'escribe el valor maximo a sumar'
       read(*,*)i
       do 8 j=1,i
       x=x+j
    8  continue
       do 11 k=1,i
       y=y+i*(i+1)/2
   11  continue
       write(*,*)'x e y'
       write(*,*)x,y

       pause
       stop
       end
       
       
       
