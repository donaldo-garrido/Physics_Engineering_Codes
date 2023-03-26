n=1000;
x=linspace(0,3*pi/8,n);
y=sin(x);
h=abs(x(2)-x(1));
%CON SUM SENCILLO
R1a=sum(y)*h
R1b=sum(y)*(h/2)
RombergSum=1


%CON TRAPECIO
R2a=trapz(x,y)
h=n*2;

%Analítico
x1=1;
x2=-1;
Analitico=x1^4-x1^3+x1^2/2-7*x1-(x2^4-x2^3+x2^2/2-7*x2)

%Cuadratura Gaussiana