function []=Tarea3A(a)
x=linspace(-10,10,a);
h=x(2)-x(1);
y1=sec(x);
y2=x.^3;
y3=log(x);
y4=sin(x);
for j=2:1:a-1
    d1(j)=(y1(j+1)-y1(j-1))/(2*h);
    d2(j)=(y2(j+1)-y2(j-1))/(2*h);
    d3(j)=(y3(j+1)-y3(j-1))/(2*h);
    d4(j)=(y4(j+1)-y4(j-1))/(2*h);
end
d1(a)=d1(a-1); d1(1)=d1(2);
d2(a)=d2(a-1); d2(1)=d2(2);
d3(a)=d3(a-1); d3(1)=d3(2);
d4(a)=d4(a-1); d4(1)=d4(2);

Errorderivada1=d1(a/2+1)-sec(x(a/2+1)).*tan(x(a/2+1))
Errorderivada2=d2(a/2+1)-3*(x(a/2+1)).^2
Errorderivada3=d3(a/2+1)-(1/(x(a/2+1)))
Errorderivada4=d4(a/2+1)-cos(x(a/2+1))


figure(1)
plot(x,d1)
hold on
plot(x,y1,'r')
ylim([-200 200])

figure(2)
plot(x,d2)
hold on
plot(x,y2,'r')

figure(3)
plot(x,d3)
hold on
plot(x,y3,'r')
xlim([0 10])
ylim([-5 4])

figure(4)
plot(x,d4)
hold on
plot(x,y4,'r')

end