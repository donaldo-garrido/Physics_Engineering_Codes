function[]=deract(a)
x=linspace(-2*pi,2*pi,a);
h=x(2)-x(1);

for i=1:1:a
t(i)=sin(x(i));
end

for j=1:1:a-1
    y(j)=(t(j+1)-t(j))/h;
end
for i=1:1:a-2
    z(i)=(-t(i+2)+4*t(i+1)-3*t(i))/(h);   
end
z(a-1)=z(a-2);
z(a)=z(a-1);
y(a)=y(a-1);
figure(1)
plot(x,t)
hold on
plot(x,y)

figure(2)
plot(x,t)
hold on
plot(x,z)
end
