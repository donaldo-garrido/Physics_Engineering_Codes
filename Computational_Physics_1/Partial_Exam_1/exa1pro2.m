function []=exa1pro2
a=7; b=7.0035; n=1000;
c=(a+b)/2; ea=0.0000001; %error de |1e^-7|
iter=0;
y=@(x)(sin(x.^4));
t=linspace(a,b,n);
f=y(t);
figure(1)
plot(t,f,'g')
title('Gráfica en que está la primera raíz >7')

z=linspace(-10,10,n);
g=y(z);
figure(2)
plot(z,g,'r')
title('sin(x^4), x=[-10,10]') 

while abs(a-c)>ea
    if y(a)*y(c)>0
        a=c;
    else
        b=c;
    end
    c=(a+b)/2;
    iter=iter+1;
end
disp(c)
end