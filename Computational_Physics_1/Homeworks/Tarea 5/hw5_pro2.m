q = 2*10^-5; Q = q; a = 0.9; e0 = 8.85*10^-12;
f = @(x) 1/(4*pi*e0)*(q*Q*x/((x.^2+a^2)^(3/2)));
t = linspace(-10,10,1000);
for i=1:1:1000
y(i) = f(t(i));
end
plot(t,y)
title('Fuerza eléctrica del anillo sobre la carga')
xlabel('distancia(x)')
ylabel('Fuerza')

parametro = 1; %Indica a nuestro código que se busque un mínimo
Xmax = 4;
Xmin = -4;
R = (1+sqrt(5))/2; %Razón Aurea
Rp = 1-R;
x1 = Xmax+Rp*(Xmax-Xmin); %Cálculo de X1
x2 = Xmin-Rp*(Xmax-Xmin); %Cálculo de X2
error = 10;
if parametro == 1 %Algoritmo para encontrar un máximo
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
    fprintf('La fuerza máxima es: %d y se obtiene  una distancia x: %d \n', fmax,maximo);

end
