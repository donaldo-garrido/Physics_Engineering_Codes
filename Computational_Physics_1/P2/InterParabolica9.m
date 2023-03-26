f = @(x) 2*sin(x)-x.^2/10; %Función
x0 = 0;
x1 = 2;
x2 = 4;
x3 = (f(x0)*(x1^2-x2^2)+f(x1)*(x2^2-x0^2)+f(x2)*(x0^2-x1^2))/(2*f(x0)*(x1-x2)+2*f(x1)*(x2-x0)+2*f(x2)*(x0-x1));
fprintf('La función tiene un mínimo/máximo en: %d \n', x3);
t = linspace(-5,5,1000);
plot (t,f(t));