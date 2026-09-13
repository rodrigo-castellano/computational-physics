                       program practica02
         external factorial
         integer n,p
         real binomio(100)
         p=n+1
         write(*,*)'escriba numero: '
         read(*,*)n



         do j=0,n

         binomio(j)=factorial(n)/(factorial(j)*factorial(n-j))
         end do
         
         do i=0,n
         write(*,*)'el binomio ',i,' es: ',binomio(i)
         end do
         pause
         stop
         end
         
        function factorial(n)
        if(n.eq.0)then
             factorial=1
        else
            integer i
            factorial=1
            do 8 i=1,n
            factorial=factorial*i
    8       continue
        endif
        return
        end
