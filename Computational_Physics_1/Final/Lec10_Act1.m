f = @(x) -2*x.^3+12*x^2-20*x+8.5;

%----------MÉTODO DE EULER-----------
y(1) = 1;

h = 0.01;

x = linspace(0,4,(4-0)/h);

for i = 2:1:length(x)
    
    y(i) = y(i-1) + f(x(i))*h;
    
end

plot(x,y);

