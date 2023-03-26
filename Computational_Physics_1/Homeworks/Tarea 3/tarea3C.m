function[]=tarea3C
x=linspace(-10,10,256); %Creamos el dominio en x
y=linspace(-10,10,256); %Creamos el dominio en x
h=x(2)-x(1); %Calculamos el delta x =delta y

%podemos escribir la función como f=exp(-x^2)*exp(-y^2)
for i=1:1:256
    z(i)=exp(-x(i).^2); %Evaluamos la función en el dominio de x
    w(i)=exp(-2*y(i).^2); %Evaluamos la función en el dominio de y
end
for j=2:1:256-1
    u(j)=(z(j+1)-z(j-1))/h; %Representa la derivada cuando y es cte.
    v(j)=(w(j+1)-w(j-1))/h; %Representa la derivada cuando x es cte.
end
u(1)=u(2);
u(256)=u(256-1);
v(1)=v(2);
v(256)=v(256-1);
%Las lineas pasadas son para que el tamaño de los vectores coincidan

[X,Y]=meshgrid(z,w); %Creamos las matrices que contienen los valores 
%de f para todos los valores de x y y
f=X.*Y; %Multipicamos para saber el valor de la función en cada punto
figure(7) 
surf(x,y,f) %Esta es la gráfica directa de la función f
title('f(x,y)=exp(-x^2-2y^2)')
xlim([-2 2]) 
ylim([-2 2]) 
zlim([-0.5 1.5])

[U,Y]=meshgrid(u,w);%Creamos las matrices que contienen los valores 
%de la parcial f con respecto a x y y cte.
n=U.*Y; %Las multiplicamos para saber el valor en cada punto
figure(8) 
surf(x,y,n) %Esta es la gráfica de la parcial de x
title('Derivada Parcial de f(x,y) con respecto a x')
xlim([-2 2]) 
ylim([-2 2]) 
zlim([-3 3])

[X,V]=meshgrid(z,v); ;%Creamos las matrices que contienen los valores 
%de la parcial f con respecto a y y x cte.
m=X.*V; %Las multiplicamos para saber el valor en cada punto
figure(9) 
surf(x,y,m) %Esta es la gráfica de la parcial de y
title('Derivada Parcial de f(x,y) con respecto a y')
xlim([-2 2]) 
ylim([-2 2]) 
zlim([-3 3])

delta=['La medida del delta es ',num2str(h)];
disp(delta)
end