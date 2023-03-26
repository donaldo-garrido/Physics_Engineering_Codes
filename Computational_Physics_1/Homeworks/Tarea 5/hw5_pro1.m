sigma = 0.6; W = 16000;
f = @(V) (1/100)*sigma*V.^2+(0.95/sigma)*(W.^2/V.^2); %Funci�n del arrastre
t = linspace(400,700,1000);
for i=1:1:1000
   y(i) = f(t(i)); 
end
plot(t,y) %Gr�fica de la funci�n de arrastre
title('Arrastre')
xlabel('Velocidad')
ylabel('Arrastre')
parametro = 0; %Indica a nuestro c�digo que se busque un m�nimo
Xmax = 600;
Xmin = 400;
R = (1+sqrt(5))/2; %Raz�n Aurea
Rp = 1-R;
x1 = Xmax+Rp*(Xmax-Xmin); %C�lculo de X1
x2 = Xmin-Rp*(Xmax-Xmin); %C�lculo de X2
error = 10;
if parametro == 1 %Algoritmo para encontrar un m�ximo
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
    
    
elseif parametro == 0 %Algoritmo para encontrar un m�nimo
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
    fprintf('El arrastre m�nimo es: %d con un velocidad de: %d \n',fmin, minimo);
    
end
