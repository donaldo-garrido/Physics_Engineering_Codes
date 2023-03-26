T = 2*pi;
xIn=-30;
%for i = 1:3
    t1 = linspace(xIn,xIn+(T/2),100000);
    f = 1/(1+t1.^2);
    figure(1)
    plot(t1,f);
    hold on
    grid on
    xIn = xIn+T;
%end

t1 = linspace(0,T/2,100000);
f1 = 1/(1+t1.^2);

delta = t1(2)-t1(1);
t = linspace(0,T*19/60,100000);
N = 2048;

    