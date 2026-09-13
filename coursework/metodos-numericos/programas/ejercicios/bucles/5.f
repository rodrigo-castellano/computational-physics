             program ejer5
       real x
       integer i,j
       suma=0.0
       write(*,*)'escribe el numero de iteraciones'
       read(*,*)i
       do 8 j=1,i
       write(*,*)1
       if(i%2.gt.0)
       write(*,*)i
       else write(*,*) -i
       end if
       continue

       pause
       stop
       end
