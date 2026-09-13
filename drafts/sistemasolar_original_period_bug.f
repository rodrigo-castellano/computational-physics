      program sistema solar

      implicit none
      real*8 h,c,G, modulo
      integer*8 I,J,u
      real*8 Ms, Mme, Mv, Mt, Mma,Mj, Msa, Mu, Mn, Mp
      ! h es el incremento de tiempo en cada periodo t, lo defino yo.
      !Mt masa tierra, Ms masa solar
      !c=cte para redefinir valores(distacia tierra sol)
      !I,J,u son contadores
      
      !defino matrices: r para posicion, v para velocidad, a para aceleracion,w para omega
      !la matriz M me guarda los valores de las masas, E de la excentricidad
      ! L el momento angular, En energia

      REAL*8, DIMENSION(10,2):: r
      REAL*8, DIMENSION(10,2):: v
      real*8, dimension(10,2)::a
      real*8, dimension(10,2)::w
      real*8, dimension(10)::M
      real*8, dimension(10)::E
      real*8, dimension(10)::L
      real*8, dimension(10)::En
      real*8, dimension(10)::P
      !las inicializo
      L=0.d0
      En=0.d0
      P=0.d0

      !vamos a ver la excentricidad
      E(1)=0
      E(2)=0.2056
      E(3)=0.0068
      E(4)=0.0167
      E(5)=0.0934
      E(6)=0.0483
      E(7)=0.0560
      E(8)=0.0461
      E(9)=0.0097
      E(10)=0.249
      !masas
      Ms=1.989e30
      Mme=3.302e23
      Mv=4.8690e24
      Mt=5.9742e24
      Mma=6.4191e23
      Mj=1.8987e27
      Msa=5.6851e26
      Mu=8.6849e25
      Mn=1.0244e26
      Mp=1.25e22
      M(1)=Ms
      M(2)=Mme/Ms
      M(3)=Mv/Ms
      M(4)=Mt/Ms
      M(5)=Mma/Ms
      M(6)=Mj/Ms
      M(7)=Msa/Ms
      M(8)=Mu/Ms
      M(9)=Mn/Ms
      M(10)=Mp/Ms
      !despues tengo que redefinir la masa del sol, ya que en las veloci
      !dades iniciales tengo que usar el valor original


      !darle valores iniciales a h ,ve probando
      !voy a redefinir las constantes para que no haya problemas(M,r,t)
      c=1.496e11
      G=6.67e-11
      h=0.1

      !voy a definir la pos y vel inicial de los planetas
      !la fila (i,) se refiere al planeta
      !la columna (,ji=x) (,j2=y) se refiere a eje x o y.
      !las posiciones y velocidades tienen q estar reescalados

      !mirar unidades y poner todo en sistema internacional
      !primero los inicializo
      r=0.d0
      v=0.d0
      a=0.d0
      w=0.d0

      !mercurio
      r(2,1)=0
      r(2,2)=46e9/c
      v(2,1)=-58965.535959555949/(sqrt(G*M(1)/c))
      v(2,2)=0

      !venus
      r(3,1)=0
      r(3,2)=-107.5e9/c!1.08208930e11/c
      v(3,1)=35252.978493919400/(sqrt(G*M(1)/c))
      v(3,2)=0

      !tierra
      r(4,1)=147.1e9/c!1.496e11/c
      r(4,2)=0
      v(4,1)=0
      v(4,2)=30281.188132831841/(sqrt(G*M(1)/c))

      !marte
      r(5,1)=-206.6e9/c!2.27936640e11/c
      r(5,2)=0
      v(5,1)=0
      v(5,2)=-26494.587800159334/(sqrt(G*M(1)/c))

      !jupiter
      r(6,1)=0
      r(6,2)=740.5e9/c!7.7841201e11/c
      v(6,1)=-13702.753610906146 /(sqrt(G*M(1)/c))
      v(6,2)=0

      !saturno
      r(7,1)=0
      r(7,2)=-1352.6e9/c!1.4267254e12/c
      v(7,1)=10187.643887025743/(sqrt(G*M(1)/c))
      v(7,2)=0

      !urano
      r(8,1)=2741.3e9/c!2.8709722e12/c
      r(8,2)=0
      v(8,1)=0
      v(8,2)=7123.4173752133493/(sqrt(G*M(1)/c))

      !neptuno
      r(9,1)=-4444.5e9/c!4.4982529e12/c
      r(9,2)=0
      v(9,1)=0
      v(9,2)=-5480.5113140548965 /(sqrt(G*M(1)/c))

      !pluton
      r(10,1)=0
      r(10,2)=4435e9/c!5.90638e12/c
      v(10,1)=-6111.2312317503447/(sqrt(G*M(1)/c))
      v(10,2)=0
      do I=1,10
      write(6,*)'la ac inicial es',a(I,1),a(I,2)
      enddo

      M(1)=1
      !he redefinido la masa del sol
      !ahora vamos con la aceleracion
      !llamo a una subrutina que me calcule la aceleracion

      call aceleracion(M,r,a)

      write(6,*)' la matriz de las condiciones iniciales es:'
      write(6,*)'posicion'
      DO I=1,10
      WRITE (6,*) (r(I,J), J=1,2)
      ENDDO
      write(6,*)'velocidad'
      DO I=1,10
      WRITE (6,*) (v(I,J), J=1,2)
      ENDDO
      write(6,*)'aceleracion'
      DO I=1,10
      WRITE (6,*) (a(I,J), J=1,2)
      ENDDO
      
      !lo que tengo que hacer es un bucle do que me
      !llame a la subrutina tantas veces como iteraciones
      !abro el archivo donde escribo los datos
      open (unit=7, file='sol.dat', status='unknown')
      open (unit=8, file='mercurio.dat', status='unknown')
      open (unit=9, file='venus.dat', status='unknown')
      open (unit=10, file='tierra.dat', status='unknown')
      open (unit=11, file='marte.dat', status='unknown')
      open (unit=12, file='jupiter.dat', status='unknown')
      open (unit=13, file='saturno.dat', status='unknown')
      open (unit=14, file='urano.dat', status='unknown')
      open (unit=15, file='neptuno.dat', status='unknown')
      open (unit=16, file='pluton.dat', status='unknown')
      open (unit=17, file='periodo.dat', status='unknown')
      !hago tantas iteraciones como para completar el periodo de pluton,
      !que es el mas largo
      do I=1,30000
      !evaluo la posicion en x,y. Tambien w,a,v
      call posicion(h,M,r,v,a)

      !Para el periodo digo que si la posicion y cambia de signo entonces es que
      !ha pasado medio ciclo, multiplico h por iteraciones y por 2
      !termino rereescalando h y mostrandolo en pantalla.
      
      !periodo de la tierra

      if(P(10).ne.1)then
      if (r(4,2).lt.0)then
      P(10)=1
      write(6,*)'h antigua',h
      h=h/(sqrt(G*1.989e30/(c*c*c)))
      write(6,*)'I',I,'h reesc',h
      h=h*I*2
      write(6,*)'periodo (dias)',h/86400
      h=0.1
      endif
      endif

      !periodo
      do u=2,9
      if(P(u).ne.1)then
      if (r(u,1).gt.0)then
      P(u)=1
      !write(6,*)'h antigua',h
      h=h/(sqrt(G*1.989e30/(c*c*c)))
      !write(6,*)'k',k,'h reesc',h
      h=h*I*2
      !write(6,*)'periodo (dias)',h/86400
      write(17,*)h/86400
      h=0.1
      endif
      endif
      enddo
      
      h=0.1

      call velangular(h,M,v,a,w)
      call aceleracion(M,r,a)
      call velocidad(h,M,w,a,v)
      call momangular(r,v,M,L)
      call energia(E,M,L,En)
      
      !para que me escriba los datos en los archivos
      do J=1,10
      WRITE (J+6,*)r(J,1),r(J,2),v(J,1),v(J,2),a(J,1),a(J,2),L(J),En(J)
      enddo
      
      enddo

      close(7)
      close(8)
      close(9)
      close(10)
      close(11)
      close(12)
      close(13)
      close(14)
      close(15)
      close(16)
      close(17)
      !ya he hecho las iteraciones y las he representado. Ahora me queda
      !calcular E,l y sacar con ellos la excentricidad, and check result
      !voy a hacerlo en la misma subrutina de antes
      write(6,*)'aparcao'
      pause
      stop



      end
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      subroutine aceleracion(M,r,a)
      implicit none
      real*8, dimension(10,2)::a
      real*8, dimension(10,2)::r
      real*8, dimension(10)::M
      real*8 modulo
      integer I,J
      !Inicializo la aceleracion a cero para que cuando haga una nueva iteracion
      !no se sume por ej en mercurio la aceleracion de todos los planetas
      !debido a la anterior iteracion, la ac. inicial de cada planeta debe ser nula

      a=0.d0

      do I=2,10
        do J=1,10
         if(J.NE.I) then
          modulo=((r(I,1)-r(J,1))**2+(r(I,2)-r(J,2))**2)**1.5
          a(I,1)=a(I,1)-M(J)*(r(I,1)-r(J,1))/modulo
          a(I,2)=a(I,2)-M(J)*(r(I,2)-r(J,2))/modulo
         endif
        enddo
      enddo
      return
      end subroutine aceleracion
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      subroutine posicion(h,M,r,v,a)
      implicit none
      real*8, dimension(10,2)::a
      real*8, dimension(10,2)::v
      real*8, dimension(10,2)::r
      real*8, dimension(10)::M
      real*8 h
      integer I,J

      do I=2,10
          r(I,1)=r(I,1)+h*v(I,1)+h*h*0.5*a(I,1)
          r(I,2)=r(I,2)+h*v(I,2)+h*h*0.5*a(I,2)
      enddo

      return
      end subroutine posicion
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      subroutine velangular(h,M,v,a,w)
      implicit none
      real*8, dimension(10,2)::a
      real*8, dimension(10,2)::v
      real*8, dimension(10,2)::w
      real*8, dimension(10)::M
      real*8 h
      integer I,J

      do I=2,10
      w(I,1)=v(I,1)+h*0.5*a(I,1)
      w(I,2)=v(I,2)+h*0.5*a(I,2)
      enddo
      return
      end subroutine velangular
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      subroutine velocidad(h,M,w,a,v)
      implicit none
      real*8, dimension(10,2)::a
      real*8, dimension(10,2)::v
      real*8, dimension(10,2)::w
      real*8, dimension(10)::M
      real*8 h
      integer I,J

      do I=2,10
      v(I,1)=w(I,1)+h*0.5*a(I,1)
      v(I,2)=w(I,2)+h*0.5*a(I,2)
      enddo
      return
      end subroutine velocidad
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      subroutine momangular(r,v,M,L)
      implicit none
      real*8, dimension(10,2)::r
      real*8, dimension(10,2)::v
      real*8, dimension(10)::M
      real*8, dimension(10)::L
      integer I,J

      do I=2,10
      L(I)=r(I,1)*v(I,2)-r(I,2)*v(I,1)
      enddo
      return
      end subroutine momangular
      !*****************************************************************
      !*****************************************************************
      !*****************************************************************
      subroutine energia(E,M,L,En)
      implicit none
      real*8, dimension(10)::E
      real*8, dimension(10)::M
      real*8, dimension(10)::L
      real*8, dimension(10)::En
      real*8 G
      integer I,J
      G=6.67e-11
      do I=2,10
      En(I)=(E(I)**2-1)*(G**2)*(M(1)**2)*(M(I)**3)/(2*L(I)**2)
      enddo
      return
      end subroutine energia
