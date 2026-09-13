           program ejer4
       real x
       integer i,j,k
       x=0.0
       write(*,*)'escribe el valor maximo a mostrar'
       read(*,*)i
       do 8 j=1,i
       x=x+3
       write(*,*)x,' '
       continue

       pause
       stop
       end
