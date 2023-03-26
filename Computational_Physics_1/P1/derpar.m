function[]=derpar(a)
x=linspace(-10,10,a); %Creamos el dominio en x
y=linspace(-10,10,a); %Creamos el dominio en x
h=x(2)-x(1); %Calculamos el delta x =delta y

%podemos escribir la función como f=exp(-x^2)*exp(-y^2)
for i=1:1:a
    z(i)=exp(-x(i).^2); %Evaluamos la función en el dominio de x
    w(i)=exp(-y(i).^2); %Evaluamos la función en el dominio de y
end
for j=2:1:a-1
    u(j)=(z(j+1)-z(j-1))/h; %Representa la derivada cuando y es cte.
    v(j)=(w(j+1)-w(j-1))/h; %Representa la derivada cuando x es cte.
end
u(1)=u(2);
u(a)=u(a-1);
v(1)=v(2);
v(a)=v(a-1);
%Las lineas pasadas son para que el tamaño de los vectores coincidan
for i=2:1:a-1
    t(i)=(z(i+1)-2*z(i)+z(i-1))/h^2; %Parte en x del laplaciano
    r(i)=(w(i+1)-2*w(i)+w(i-1))/h^2; %Parte en y del laplaciano
end
t(1)=t(2);
t(a)=t(a-1);
r(1)=r(2);
r(a)=r(a-1);
%Las lineas pasadas son para que el tamaño de los vectores coincidan

[X,Y]=meshgrid(z,w); %Creamos las matrices que contienen los valores 
%de f para todos los valores de x y y
f=X.*Y; %Multipicamos para saber el valor de la función en cada punto
figure(1) 
surf(x,y,f) %Esta es la gráfica directa de la función f
title('f(x,y)=exp(-x^2-y^2)')
xlim([-2 2]) 
ylim([-2 2]) 
zlim([-0.5 1.5])

[U,Y]=meshgrid(u,w);%Creamos las matrices que contienen los valores 
%de la parcial f con respecto a x y y cte.
n=U.*Y; %Las multiplicamos para saber el valor en cada punto
figure(2) 
surf(x,y,n) %Esta es la gráfica de la parcial de x
title('Derivada Parcial de f(x,y) con respecto a x')
xlim([-2 2]) 
ylim([-2 2]) 
zlim([-2 2])

[X,V]=meshgrid(z,v); ;%Creamos las matrices que contienen los valores 
%de la parcial f con respecto a y y x cte.
m=X.*V; %Las multiplicamos para saber el valor en cada punto
figure(3) 
surf(x,y,m) %Esta es la gráfica de la parcial de y
title('Derivada Parcial de f(x,y) con respecto a y')
xlim([-2 2]) 
ylim([-2 2]) 
zlim([-2 2])

[T,R]=meshgrid(t,r); %Matrices que contienen la parte x y 
%y del Laplaciano
q=T.*R; %Valor del Laplaciano en cada punto
figure(4)
surf(x,y,q) %Esta es la gráfica del Laplaciano
title('Laplaciano de f')
xlim([-3 3]) 
ylim([-3 3]) 
zlim([-1 4])
end