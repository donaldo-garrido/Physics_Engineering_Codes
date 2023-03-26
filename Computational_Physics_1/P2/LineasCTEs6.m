%----El comando de Matlab es "sum"------
f = @(x) sin(x); %Función
%Dominio de la función
t = linspace(0,3*pi/8,10000000);
delta = t(2)-t(1); %Delta en variable independiente
%--------Cálculo de la integral----------
y = f(t)*delta;
int = sum(y);
fprintf ('El resultado de la integral es: %f \n', int);