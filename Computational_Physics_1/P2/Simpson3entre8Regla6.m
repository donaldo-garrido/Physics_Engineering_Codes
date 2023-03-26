f = @(x) sin(x); %Función
%Dominio de la función
t = linspace(0,3/8*pi,100000);
delta = t(2)-t(1); %Delta en variable independiente
int = 0;
    for i = 1:1:length(t)-3
        calc = delta*(f(t(i))+3*f(t(i+1))+3*f(t(i+2))+f(t(i+3)))/8;
        int = int+calc;
    end
fprintf ('El resultado de la integral es: %f \n', int);