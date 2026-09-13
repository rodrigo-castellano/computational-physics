       program sistema solar
       !se va a declarar la variable N para el numero de planetas orbitando, posteriormente se definiran las fuerzas entre estos y el sol(fijo).
       
       !en gnuplot decirle que no splotee un conjunto de datos producidos continuamente por el programa sistemasolar, queme da un programa .dat renovado continuamente
       !seria plot "sistemasolar.dat" u ...
       !      pause 1s
       !      reread
       integer*8 N
       
       real*8, dimension(1:N)::F,dimension(1:N)::Fs,dimension(1:N)::Fr
       !F es la fuerza total, Fs es la fuerza por la interaccion de los planetas con el sol,. y Fr es la interaccion de los planetas consigo mismos
       real*8 dimension(1:N)::r, dimension(1:N)::v,dimension(1:N)::a
       !vectores posicion velocidad y aceleracion
       real*8 h,t
       !h es el periodo de rotacion(1día) y t es el periodo tb
       h=24*3600
       t=0
       !le damos a t un valor inicial de 0 y h un periodo de un dia
       !r(t+h)=r(t)+hv(t)+h*h*a(t)/2
       !v(t+h)=v(t)+(h/2)*(a(t)+a(t+h))ç
       write(6,*)'Escoge N'
       read (5,*) N
       !do i=1,N
       !   a(i)=0
        !  v(i)=0
        !  r(i)=0
          
       !enddo
       
       write(6,*)'todo va bien'
    
    

    
       stop
       end
