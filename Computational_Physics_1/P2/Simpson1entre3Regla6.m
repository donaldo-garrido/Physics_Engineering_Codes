% OPCION servirá para indicar si se quiere el
% algoritmo para un solo intervalo = (1) ó para
% más intervalos = (número de intervalos IMPAR)
opcion = 9;
f = @(x) x; %Función
%Dominio de la función
t = linspace(0,10,1001);
delta = t(2)-t(1); %Delta en variable independiente
int = 0;
if opcion == 1
    for i = 1:1:length(t)-2
        calc = delta*(f(t(i))+4*f(t(i+1))+f(t(i+2)))/6;
        int = int+calc;
    end
else
    impar = 0; par = 0;
     for i = 1:1:length(t)-1
        if mod(i,2) == 1
           impar = impar+f(t(i));
        elseif mod(i,2) == 0
            par = par+f(t(i));
        end
    end
    int1 = (f(t(1))+4*impar+2*par+f(t(end)))*delta/(3*length(t));
    %int = int + int1;
    %end
end
fprintf ('El resultado de la integral es: %f \n', int1);