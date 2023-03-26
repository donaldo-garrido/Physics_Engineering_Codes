t = linspace(-10,10,1000);
h = t(2)-t(1);
N = length(x);

hold on
z = cos(5*x);
plot(x,h,'r')
x1 = -0.999997;
x2 = 0.000003;
delta = x2-x1;
T = N*h;
disp (T);
w = 2*pi/T; 
disp(w)
f = cos(w*t);
plot(t,f,'b');
