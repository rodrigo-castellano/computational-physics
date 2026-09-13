                 program prueba

       external imagen

       real a,b,c,p,m,f,g,h,hant
       integer i
       hant=50
       p=0.96727464
       m=0.004527594
       write(*,*)'introduce extr. inferior(-1): '
       read(*,*)a
       write(*,*)'intoduce extr. superior(1): '
       read(*,*)b

       i=1
       do while(i.lt.50) !en caso de que entre en bucle
       write(*,*)'ITERACION ',i
       c=(a+b)*1.0/2
       h=c-m-p*sin(c)
       f=a-m-p*sin(a)

       write(*,*)'a ',a,'c ',c,'b ',b

       write(*,*)'imagen de a ',f,'im de c ',h,'im. de b ',g
       write(*,*)'f(a).f(c)= ',f*h
       if (abs(h-hant).lt.0.00005) then
         go to 38
       end if
       if (f*h.lt.0)then
         b=c
       else if (f*h.gt.0)then
         a=c
       end if
       hant=h
       i=i+1
       end do

   38 write(*,*)' el cero esta en, y vale: '
       write(*,*)c, h

       pause
       stop
       end



