%----El comando de Matlab es "trap"------
f = @(x) sin(x); %Función
%Dominio de la función
t = linspace(0,3*pi/8,1000);
delta = t(2)-t(1); %Delta en variable independiente
%--------Cálculo de la integral----------
int = 0; %Inicilización valor de la integral
for i=1:1:length(t)-1
    calc = delta*(f(t(i))+f(t(i+1)))/2;
    int = int + calc;
end
fprintf ('El resultado de la integral es: %f \n', int);