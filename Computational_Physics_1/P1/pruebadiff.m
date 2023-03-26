function[]=pruebadiff(a)

x=linspace(-10,10,a); %Creamos el espacio de [-10,10]
h=x(2)-x(1); %Diferencial usado para nuestro método de centradas
y=diff(exp(-x.^2)); %Cálculo de la derivada con DIFF
y(a)=y(a-1); %Completamos el vector 
figure(1)
plot(x,y,'g');
title('Derivada obtenida a partir de la función DIFF')

for i=1:1:a 
    z(i)=exp(-x(i).^2); %Evaluamos la función en los a puntos
end
for i=2:1:a-1
    y(i)=(z(i+1)-z(i-1))/h*2; %Aplicamos la estrategia de CENTRADAS
end
figure(2)
plot(x,y,'r')
title('Derivada obtenida con el método CENTRADAS')
end