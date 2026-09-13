           program ejer10
       real x
       integer i,j
       logical a
       a=.true.


       write(*,*)'escribe el valor primo a mostrar'
       read(*,*)i
       do 10 j=2,i/2
       if(mod(i,j).eq.0)then
          a=.false.
       endif
   10  continue
       write(*,*)a
       pause
       stop
       end
