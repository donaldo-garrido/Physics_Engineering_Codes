f = @(x,y) sin(pi*sqrt(x.^2+y.^2))/sqrt(x.^2+y.^2);
a = -3*pi; b = 0.01;
int1 = integral2(f, -3*pi, -0.1, -3*pi, -0.1,0.1);

int2 = integral2(fun,  0.1, 3*pi,  0.1, 3*pi,0.1);

int3 = integral2(pi,  -0.1, 0.1,  -0.1, 0.1);

int = int1+int2+int3;