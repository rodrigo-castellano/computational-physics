                 program ejer7
       real x
       integer i,j
       x=0.0
       write(*,*)'escribe el numero de iteraciones'
       read(*,*)i
       do 8 j=1,i

       if(i%2.eq.0)
       x=x+1/i
       else x=x-1/i
       end if
       continue

       pause
       stop
       end
