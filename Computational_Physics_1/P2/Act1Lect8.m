T=2*pi;
t=linspace(0,2*pi,1000);
h=t(2)-t(1);
for i=1:1:length(t)

gb(i)=sin(i*2*pi/T*t(i));
ga(i)=cos(i*2*pi/T*t(i));
end

Bn=(2/T)*sum(f.*gb.*h)
An=(2/T)*sum(f.*ga.*h)
for n = 1:1:1000
s(n)=sum(An*cos(n*2*pi/T.*t(n))+Bn*sin(n*2*pi/T.*t(n)));
hold on
end
plot(t,s)
