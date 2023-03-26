%z = @(x,y) 4*x.^2+7*y;
z = @(x,y) sin(pi*sqrt(x.^2+y.^2))/sqrt(x.^2+y.^2);

int = dblquad(z, -2, 2, 0, 4);
disp(int)