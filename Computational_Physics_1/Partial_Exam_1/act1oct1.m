n=1000;
x=linspace(0,3*pi/8,n);
y=sin(x);
h=abs(x(2)-x(1));
%CON SUM
R1=sum(y)*h

%MÉTODO DEL TRAPECIO
R2=trapz(x,y)

%TRAPECIO DESARROLLADO
ff=2*sum(y)-y(end)-y(1);
R3=((x(2)-x(1))*ff)/(2*n)