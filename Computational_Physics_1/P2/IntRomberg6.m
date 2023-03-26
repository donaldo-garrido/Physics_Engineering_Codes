f = @(x) sin(x); %Función
n = 1000;
%Dominio de la función
liminf = 0;
limsup = 3*pi/8;
t = linspace(liminf,limsup,n);
h1 = t(2)-t(1); %Delta en variable independiente
%--------Cálculo de la integral----------
int1 = 0; int2 =0; %Inicilización valor de la integral
for i=1:1:length(t)-1
    calc1 = h1*(f(t(i))+f(t(i+1)))/2;
    int1 = int1 + calc1;
end
t = linspace(liminf,limsup,2*n);
h2 = t(2)-t(1);
for i = 1:1:length(t)-1
    calc2 = h2*(f(t(i))+f(t(i+1)))/2;
    int2 = int2 + calc2;
end

int = 4*int2/3-int1/3;
fprintf ('El resultado de la integral es: %f \n', int);