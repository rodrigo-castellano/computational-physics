       program practica2

       external factorial
       
       integer n,k
       write(*,*)'introduce n: '
       read(*,*) n
       k=factorial(n)
       write(*,*)'el factorial es : ',factorial(n)

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

