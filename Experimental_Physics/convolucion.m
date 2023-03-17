L = 10;
n = 1000;
x1 = [-L:1/n:0];%Ubicar frec 0
x2 = [1/n:1/n:L];
x = [x1 x2];
y1 = [-L:1/n:0];%Ubicar frec 0
y2 = [1/n:1/n:L];
y = [y1 y2];
deltaX=2*L/n; deltaY=2*L/n;
deltaKx = pi/L;
deltaKy = pi/L;
omega0 = sqrt(n/pi)*deltaX;
k0 = 0.7;
zR = k0*omega0^2/2
zMax = (2*k0*L^2)/(n*pi)
Kmax = pi/deltaX;
Kx = [-Kmax: deltaKx: Kmax];
Ky = [-Kmax: deltaKy: Kmax];
z = [0:1/length(x):zMax];
c1 = exp(i*k0.*z)*k0;


