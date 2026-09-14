       Program circulo
       real*8::r, area
       write(6,*)'ponme el radio del area a calcular'
       read(5,*)r
       call circle(r,area)
       write(6,*)area
       
       stop
       contains
       
       subroutine circle(r,area)
       real*8::r,area,pi
       !normalmente pongo implicit none cuando la funcion esta aparte para que no haya lios con las variables 
       pi=4.d0*atan(1.d0)
       area=pi*r**2.d0
       return 
       end subroutine circle
  
       end
