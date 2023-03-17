format long
i = sqrt(-1);
x = 1; y = 1; z = 3;
lambda0 = 633*10^-9;
k0 = 2*pi;
D = 1;
fun = @(z) exp(-i*x*cos(z)+y*sin(z));
funcTheta = integral(fun,0,2*pi);
funcR = i*D*z*exp(-i*k0*D/z)/k0+z^2/k0^2*(exp(-i*k0*D/z)-1);
x = linspace(-5,5,100);
y = linspace(-5,5,100);
[X,Y] = meshgrid(x,y);
f = -i*exp(i*k0*z)/(lambda0*z)*funcTheta*funcR*cos(k0/(2*z).*(X.^2+Y.^2))+i.*sin(k0/(2*z).*(X.^2+Y.^2));
surf(X,Y,real(f))
