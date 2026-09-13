          program velocidades
          
      implicit none
      real*8 G
      real*8, dimension(10)::V
      real*8, dimension(10)::E
      real*8, dimension(10)::D
      real*8, dimension(10)::M
      real*8, dimension(10)::P
      !P es la distancia en perihelio y D dis media
      integer I,J
      
      G=6.67e-11
      
      M(1)=1.989e30
      M(2)=3.302e23
      M(3)=4.8690e24
      M(4)=5.9742e24
      M(5)=6.4191e23
      M(6)=1.8987e27
      M(7)=5.6851e26
      M(8)=8.6849e25
      M(9)=1.0244e26
      M(10)=1.25e22
      
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
      
      D(1)=0
      D(2)=5.7909175e10
      D(3)=1.08208930e11
      D(4)= 1.496e11
      D(5)=2.27936640e11
      D(6)=7.7841201e11
      D(7)=1.4267254e12
      D(8)=2.8709722e12
      D(9)=4.4982529e12
      D(10)=5.90638e12
      
      P(1)=0
      P(2)= 4.6001009e10
      P(3)=1.07476170e11
      P(4)=1.47098291e11
      P(5)=2.06645215e11
      P(6)=7.40679835e11
      P(7)=1.349823615e12
      P(8)=2.734998229e12
      P(9)=4.459753056e12
      P(10)=4.436756954e12
      
      
      do I=2,10
       !do J=1,10
       !if(J.ne.I)then
        ! edu: V(I)=sqrt(2*g*Ms*(1/rp(I)-1/(rp(I)-ra(I))))
        !V(I)=sqrt((E(I)+1)*G*M(J)/P(I))
        V(I)=sqrt((E(I)+1)*G*M(1)/P(I))
        !endif
        !end do
      end do
      open (unit=7, file='velocidades.dat', status='unknown')
      DO I=1,10
      WRITE (7,*)'R(',I,',)=',V(I)
      ENDDO
      close(7)

      
      
      pause
      end
