f = @(x)6*cos(x)-1.5*sin(x); %Funci�n de presi�n
t = linspace(0,6,1000);
y = f(t);
plot(t,y);
title('Gr�fica de presi�n')
xlabel('Puntos del aeroplano')
ylabel('Presi�n')
parametro = 0; %B�squeda del m�nimo
Xmax = 6;
Xmin = 0;
R = (1+sqrt(5))/2;
Rp = 1-R;
x1 = Xmax+Rp*(Xmax-Xmin);
x2 = Xmin-Rp*(Xmax-Xmin);
error = 10;
if parametro == 1
    while error>0.001
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
    fprintf('La funci�n tiene un m�ximo en: %d con un valor de: %d \n', maximo,fmax);
    
    
elseif parametro == 0
    while error>0.001
        if f(x1)<f(x2)
            Xmax=x2;
        elseif f(x1)>f(x2)
            Xmin = x1;
        end
    error = abs((1-Rp)*(Xmax-Xmin));
    x1 = Xmax+Rp*(Xmax-Xmin);
    x2 = Xmin-Rp*(Xmax-Xmin);
    end
    minimo=(Xmax+Xmin)/2;
    fmin = f(minimo);
    fprintf('La presi�n m�nima es: %d cuando : %d \n',fmin, minimo);
    
end
