theta = pi*50/180; %theta 0
v0 = 25; %velocidad inicial
y0 = 1; %posici�n inicial
g = 9.81;%cte de gravedad
%Funci�n de la altura:
f = @(x) tan(theta).*x - g*x.^2/(2*(v0.*cos(theta)).^2)+y0;
t = linspace(-20,80,1000);
for i=1:1:1000
 y(i) = f(t(i));
end
plot(t,y); %Gr�fica de la altura
title('Trayectoria de una pelota')
xlabel('x')
ylabel('Altura')
parametro = 1; %Indica que se busa un m�ximo
Xmax = 40; %Punto inicial minimo de b�squeda
Xmin = -10; %Punto inicial maximo de b�squeda
R = (1+sqrt(5))/2;
Rp = 1-R;
x1 = Xmax+Rp*(Xmax-Xmin);
x2 = Xmin-Rp*(Xmax-Xmin);
error = 10;
if parametro == 1 %algoritmo Raz�n Aurea para encontrar un m�ximo
    while error>0.00001
        if f(x1)>f(x2)
            Xmax=x2;
        elseif f(x1)<f(x2)
            Xmin = x1;
        end
    error = abs((1-Rp)*(Xmax-Xmin));
    x1 = Xmax+Rp*(Xmax-Xmin);
    x2 = Xmin-Rp*(Xmax-Xmin);
    end
    maximo = (Xmax+Xmin)/2;
    fmax = f(maximo);
    fprintf('La altura m�xima es: %d cuando x vale: %d \n', fmax, maximo);    
end
