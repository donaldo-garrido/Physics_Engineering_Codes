close all
n=1024;
i=sqrt(-1);
z=300;
D=100;
D1=0.4;
D2=D1;
m=1^6;
w0=1*10^(-3);
l = 1;
k = 2*pi/l;

noDots = 11;
[v,a] = pol2cart(linspace(0, 2*pi, noDots), noDots);

U0 = zeros(n);
for i = 1:noDots-1
    x0=linspace(-D,D+v(i),n);
    y0=linspace(-D,D+a(i),n);
    [x,y]=meshgrid(x0,y0);
    circx=2.*(abs(x/D1)<=sqrt(D1.^2-(y).^2));
    circy=2.*(abs(y/D1)<=sqrt(D1.^2-(x).^2));
    g=circx.*circy;
    U0=U0+g;
end
FT1=fftshift(fft2(U0));
 
x1 = linspace(-5,5,n);
y1 = linspace(-5,5,n);
[u,s] = meshgrid(x1,y1);
figure(1)
surface(u,s,real(U0))
shading interp
figure(2)
surface(u,s,real(exp(-(i.*k)/(z).*(u+s)).*FT1))
shading interp

