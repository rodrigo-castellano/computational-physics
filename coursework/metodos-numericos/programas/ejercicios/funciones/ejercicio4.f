               program ejercicio4
       external factorial

       integer n,k
       write(*,*)'introduce n: '
       read(*,*) n
       k=factorial(n,z)
       write(*,*)'el factorial es : ',k

       pause
       stop
       end

       function factorial(n)
       integer i
       factorial=1

       do 8 i=1,n
       factorial=factorial*i
    8  continue

       return
       end


