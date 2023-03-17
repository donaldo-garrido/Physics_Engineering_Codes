lambda = 633*10^-9;
i = sqrt(-1);
z = 1;
k = 2*pi/lambda;
n = 100;
Nf = 10;
x = linspace(-2,2,n);
y = linspace(-2,2,n);
D = sqrt(4*Nf*lambda*z);
[X,Y] = meshgrid(x,y);

iCx = zeros(1,length(x)); 
iCy = zeros(1,length(x)); 
iSx = zeros(1,length(x));
iSy = zeros(1,length(x));


for m=1:length(x)
	funcCx = @(x0) cos(pi/2*(sqrt(2/(lambda*z))*(x0-x(m))).^2);
	funcCy = @(y0) cos(pi/2*(sqrt(2/(lambda*z))*(y0-y(m))).^2);
	funcSx = @(x0) sin(pi/2*(sqrt(2/(lambda*z))*(x0-x(m))).^2);
	funcSy = @(y0) sin(pi/2*(sqrt(2/(lambda*z))*(y0-y(m))).^2);
	
	iCx(m) = integral(funcCx,0,D);
	iCy(m) = integral(funcCy,0,D);
	iSx(m) = integral(funcSx,0,D);
	iSy(m) = integral(funcSy,0,D);
end

fp = zeros(length(x));
for m = 1:length(x)
	for j = 1:length(y)
	fp(m,j) = iCx(m)*iSy(j)+iSx(m)*iCy(j)+i*iSx(m)*iSy(j)-i*iCx(m)*iCy(j);
	end
end
F = real(2*exp(i*k*z)/(lambda*z)*fp);

for m = 1:length(x)
	for j = 1:length(y)
		g(m,j) = funcCx(j).*funcSx(m);
	end
end

surf(X,Y,g)
surf(X,Y,F)
