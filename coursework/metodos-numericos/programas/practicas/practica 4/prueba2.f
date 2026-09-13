              program prueba

       external imagen

       real a,b,c,p,m,f,g,h,solant
       integer i
       logical bool
       bool=.false.
       solant=100
       p=0.96727464
       m=0.004527594
       write(*,*)'introduce extr. inferior: '
       read(*,*)a
       write(*,*)'intoduce extr. superior: '
       read(*,*)b

       i=1
       do while(i.lt.17)
       write(*,*)'ITERACION ',i
       c=(a+b)*1.0/2
       h=c-m-p*sin(c)
       f=a-m-p*sin(a)
C       g=b-m-p*sin(b)
       write(*,*)'a ',a,'c ',c,'b ',b
       write(*,*)'b-a ',b-a
       write(*,*)'imagen de a ',f,'im de c ',h,'im. de b ',g
       write(*,*)'f(a).f(c)= ',f*h
       if (f*h.lt.0)then
         b=c
       else if (f*h.gt.0)then
         a=c
       else if (h.lt.-0.00005) then
         go to 38
       end if
       i=i+1
       end do

   38 write(*,*)' el cero esta en, y vale: '
       write(*,*)c, h

       pause
       stop
       end
