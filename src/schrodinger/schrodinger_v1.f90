program schrodinger
implicit none

real, parameter :: PI=3.1415926535, lambda=-0.5
integer, parameter :: N=1000, nci=100, tmax=2800
complex, parameter :: i=(0.0,1.0)

integer*8 j, t, pantalla, q, g
real*8 k0, s, norma, at, ai, trans, transfinal,g1
real*8 V(0:N), moduloo(0:N)
complex*16 phi(0:N), alpha(0:N-1), beta(0:N-1), b, xi(0:N)

open(unit=1,file="Datos",status="unknown")
open(unit=2,file="Norma",status="unknown") 
open(unit=3,file="Transmision",status="unknown") 

!------------------------------------------------
!Constantes y cálculo de otras constantes
!------------------------------------------------
transfinal=0.
pantalla=0
k0=(2.0*PI*nci)/N!nci es el nº de ciclos
s=1.0/(4.0*k0*k0)



!-------------------------------------------------
!Potencial (el que quieras. Ahora está puesto en pozo cuadrado)
!-------------------------------------------------
do j=0,N
	!if((j>=500)) then
		!V(j)=lambda*k0*k0
		!V(j)=(lambda*k0*k0/100)*(j-400)
	 if ((j>400).AND.(j<=600)) then
		V(j)=-lambda*k0*k0!-(lambda*k0*k0/100)*(j-500)
	else 
		V(j)=0
	endif
enddo


!------------------------------------------------
!Onda
!------------------------------------------------
do j=0,N
	phi(j)=exp(i*k0*j)*exp(-8.0*((4.0*j-N)**2)/(N**2))
enddo

!Ver amplitud máxima = ai al cuadrado
ai=abs(phi(0))
do j=0,N-1
	
	if(abs(phi(j+1))>=abs(phi(j))) then
		ai=abs(phi(j+1))
	endif
enddo
ai=ai*ai
print *,ai



	

!-----------------------------------------------
!Condiciones de contorno
!------------------------------------------------
phi(0)=(0,0)
phi(N)=(0,0)
alpha(N-1)=(0,0)
beta(N-1)=(0,0)
xi(0)=(0,0)
xi(N)=(0,0)


!------------------------------------------------
!Cálculo de las alphas con condición de contorno
!------------------------------------------------
!a-=1    a0=(-2-V)+i(2/s)   a+=1
do j=N-2,0,-1
	alpha(j)=(-2.0-V(j+1)+i*2/s)+alpha(j+1)
	alpha(j)=-1.0/alpha(j)
enddo	



!------------------------------------------------
!Empezamos los cálculos que dependen del tmax
!-----------------------------------------------
do t=1,tmax


!----------------------------
!Cálculo de las betas
!----------------------------
	do j=N-2,0,-1
		beta(j)=(-2.0-V(j+1)+i*2.0/s)+alpha(j+1)
		b=(0+i*4/s)*phi(j+1)
		beta(j)=(b-beta(j+1))/beta(j)
	enddo


!---------------------------
!Cálculo de las xi
!---------------------------
	do j=0,N-1
		xi(j+1)=alpha(j)*xi(j)+beta(j)
	enddo


!------------------------------------
!Cálculo de la onda para t+1
!------------------------------------
	do j=0, N
		phi(j)=xi(j)-phi(j)
	enddo



!--------------------------
!Cálculo de módulo y norma
!--------------------------
	norma=0.0
	do j=0,N
		moduloo(j)=(abs(phi(j)))**2
		norma=norma+moduloo(j)
	enddo
	
!Ver amplitud máxima transmitida at
at=abs(phi(601))
do q=601,N-1
	
	if(abs(phi(q+1))>=at) then
		at=abs(phi(q+1))
	endif
enddo
	

trans=at/ai
if(trans>=transfinal) then
transfinal=trans
endif
	
	if(pantalla==3)then  
			do j=0,N   
                g=mod(j,3)!esto lo hago para que haya menos iteraciones.
                !print*, g
                if(g==0)then
                    !if(moduloo(j)<=g1)then
                    !    moduloo(j)=0.0
                    !endif
                    write(1,*) j, moduloo(j), V(j)
                    !print*, g
                endif
			enddo
			pantalla=0
	endif
	pantalla=pantalla+1

	write(1,*)
	write(1,*)
	write(2,*) norma

enddo


transfinal=transfinal*transfinal

!print *, transfinal

!transfinal=transfinal/ai

!print *, transfinal

close(1)
close(2)
stop
end
















