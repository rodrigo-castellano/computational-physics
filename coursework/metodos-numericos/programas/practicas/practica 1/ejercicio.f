              program practica1bprueba
        external interpolar
        real v(200),l(100),p(100),s,q,y, f(300),g(300),h
        integer m(200),n,t
        n=7
        t=1
        z=0.0

        open (1,file='practica1.txt')
        do i=t,n
        read(1,*)m(i),v(i)
        end do
        close(1)

         do i=t,n
         write(*,*)m(i),v(i)
         end do

         write (*,*)'numero a interpolar'
         read(*,*)s
         h=interpolar(s,m,v,n,t,z)
         write(*,*)'el resutado para ',s,' es ',z
         
         write(*,*)'vamos a trabajar con los 200 datos '
         f(1)=30
         do i=2,200
         f(i)=f(i-1)+0.1
         end do
         do i=1,200
         h=interpolar(f(i),m,v,n,t,g(i))
         end do
         open (2,file='resultados.txt')
         do i=1,200
         write(2,*)f(i),g(i)
         end do
         close(2)

         pause
         stop
         end

         function interpolar(s,m,v,n,t,z)
         real v(200),s,y,z
         integer m(200),n,t
         
         z=0.0
         do i=t,n
         y=1.0
         do j=t,n
         if(j.ne.i) y=y*((s-m(j))/(m(i)-m(j)))
         end do
         z=z+1.0*y*v(i)
         end do
         
         return
         end
