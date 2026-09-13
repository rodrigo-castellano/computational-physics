              program prac4b
              
       external imagen

       real a,b,c,p,m,f,g,h
       integer i
       p=0.96727464
       m=0.004527594
       write(*,*)'introduce extr. inferior: '
       read(*,*)a
       write(*,*)'intoduce extr. superior: '
       read(*,*)b

       i=1
       do while(i.lt.27)
       write(*,*)'ITERACION ',i
       c=(a+b)*1.0/2
       h=c-m-p*sin(c)
       f=a-m-p*sin(a)
C       g=b-m-p*sin(b)
       write(*,*)'a ',a,'c ',c,'b ',b
       write(*,*)'r-c ',abs(0.1280230-c)
       write(*,*)'imagen de a ',f,'im de c ',h,'im. de b ',g
       write(*,*)'f(a).f(c)= ',f*h
       if (abs(h).lt.0.000005) then
         go to 35
       end if
       if (f*h.lt.0)then
         b=c
       else if (f*h.gt.0)then
         a=c

       end if
       i=i+1
       end do

   35 write(*,*)' el cero esta en, y vale: '
       write(*,*)c, h

       pause
       stop
       end

