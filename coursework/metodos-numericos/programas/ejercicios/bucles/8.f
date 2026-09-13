                program ejer7
       real x
       integer i,j

       write(*,*)'escribe el numero de iteraciones'
       read(*,*)i
       x=i
       do 8 while(x.gt.0)
       x=x-1
       write(*,*)x
    8  continue

       pause
       stop
       end
