% OPCION servirá para indicar si se quiere el
% algoritmo para un solo intervalo = (1) ó para
% más intervalos = (número de intervalos)
opcion = 1;
f = @(x) x; %Función
%Dominio de la función
t = linspace(0,10,1000);
delta = t(2)-t(1); %Delta en variable independiente
int = 0;
if opcion == 1
    for i = 1:1:lenght(t)-2
        calc = delta*(f(t(i))+4*f(t(i+1))+f(t(i+2)))/6;
        int = int+calc;
    end
else
    f(t(1));
end