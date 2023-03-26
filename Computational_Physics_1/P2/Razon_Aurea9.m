%parametro 1 si se quiere el máximo, 0 si se quiere el mínimo
Xmin = 0;
Xmax = 1;
parametro = 0; 
t = linspace(-5,5,1000);
f = @(x) 2*sin(x)-x.^2/10;
plot (t,f(t));
R = (1+sqrt(5))/2;
Rp = 1-R;
x1 = Xmax+Rp*(Xmax-Xmin);
x2 = Xmin-Rp*(Xmax-Xmin);
error = 10;
if parametro == 1
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
    fprintf('La función tiene un máximo en: %f con un valor de: %d \n', maximo,fmax);
    
    
elseif parametro == 0
    while error>0.00001
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
    fprintf('La función tiene un mínimo en: %f con un valor de: %d \n', minimo,fmin);
    
end


