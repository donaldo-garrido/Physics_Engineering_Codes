function []= tarea3B %La importancia de una derivada numérica
w=-0.1+(rand(1,10000))/5; %Creamos el vector con valores aleatorios [-0.1, 0.1]
x=linspace(-pi,pi,10000); %Vector de 10,000 puntos
h=x(2)-x(1)
y=x.^2/2+w; %función x^2/2 + la señal aleatoria
for i=2:1:10000-1
    d1(i)=(y(i+1)-y(i-1))/(2*h); %primera derivada
    d2(i)=(y(i+1)-2*y(i)+y(i-1))/h^2; %segunda derivada
end
d1(1)=d1(2);d2(1)=d2(2); %líneas para que el vector de derivada tenfga dimensiones correctas
d1(10000)=d1(10000-1); d2(10000)=d2(10000-1); 

figure(10)
plot(x,y,'g') %gráfica de la función f(x)
title('gráfica de la función x^2/2 + la señal aleatoria')
xlim([-3 3])
ylim([-0.5 5.2])

figure(5)
plot(x,d1, 'r') %gráfica de la primera derivada
title('Primera derivada de f(x)')
xlim([-3.5 3.5])

figure(6)
plot(x,d2) %gráfica de la segunda derivada
title('Segunda derivada de f(x)')
xlim([-3.5 3.5])

end