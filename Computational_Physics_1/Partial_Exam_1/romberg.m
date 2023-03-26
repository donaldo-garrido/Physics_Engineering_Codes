i2b1=0;
i2b2=0;
n=1000;
x=linspace(0,3*pi/8,n);
y=sin(x);
ha=abs(x(1)-x(2));
syms t
z=sin(t);
exac=int(z,[0 3*pi/8]);
% por  trapecio
int1a=(x(length(x))-x(1))*(y(1)+2*sum(y)+y(length(y)))/(2*(length(x)));
error1a=abs((exac-int1a)/exac);
fprintf('El resultado de la integral por trapecio es: %f \n con error %f \n',int1a, error1a);
%por simpson 1/3
i2a=(x(length(x))-x(1));
i2c=(3*length(x));
for i=1:2:(length(x)-1)
i2b1=i2b1+y(i);
end
for j=2:2:(length(x)-2)
i2b2=i2b2+y(j);
end
int2a=i2a*(y(1)+4*i2b1+2*i2b2+y(length(x)))/i2c;
error2a=abs((exac-int2a)/exac);
fprintf('El resultado de la integral por simpson 1/3 es: %f \n con error %f \n',int2a, error2a);
%Comandos matlab
int3a=sum(y)*ha;
error3a=abs((exac-int3a)/exac);
fprintf('Por sumatoria con comando de matlab: %f \n con error %f \n',int3a, error3a);

i2b1=0;
i2b2=0;
n=2*1000;
x=linspace(0,3*pi/8,n);
y=sin(x);
ha=abs(x(1)-x(2));
% por  trapecio
int1b=(x(length(x))-x(1))*(y(1)+2*sum(y)+y(length(y)))/(2*(length(x)));
%por simpson 1/3
i2a=(x(length(x))-x(1));
i2c=(3*length(x));
for i=1:2:(length(x)-1)
i2b1=i2b1+y(i);
end
for j=2:2:(length(x)-2)
i2b2=i2b2+y(j);
end
int2b=i2a*(y(1)+4*i2b1+2*i2b2+y(length(x)))/i2c;
%Comandos matlab
int3b=sum(y)*ha;
%Trapecio ROMBERG 
int1R=4/3*int1b-int1a/3;
error1=abs((exac-int1R)/exac);
int2R=4/3*int2b-int2a/3;
error2=abs((exac-int2R)/exac);
int3R=4/3*int3b-int3a/3;
error3=abs((exac-int3R)/exac);

fprintf('Por trapecio y Romberg: %f \n con error %f \n',int1R, error1);
fprintf('Por Simson y Romberg: %f \n con error %f \n',int2R, error2);
fprintf('Por Sum y Romberg: %f \n con error %f \n',int3R, error3);
