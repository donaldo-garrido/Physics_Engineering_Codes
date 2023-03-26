%------MÉTODO RUNGE-KUTTA----------
% Cuarto Orden
f = @(t) -2*t.^3+12*t.^2-20*t+8.5;

h = 0.01;

x = linspace(0,4,(4-0)/h);

y(1) = 0;

for i = 2:1:length(x)
    
    k1 = f(x(i-1));
    k2 = f(x(i-1)+h/2);
    k3 = f(x(i-1)+h/2);
    k4 = f(x(i-1)+h);
    y(i)=y(i-1)+h*(k1+2*k2+2*k3+k4)/6;
end

plot(x,y,'g')
hold on
g = @(t) -(1/2)*t.^4+4*t.^3-10*t.^2+8.5*t;
z = g(x);
plot(x,z)