function[] = exa1pro1
a=1000000;
x=linspace(-50,-20,a);
f=@(x)(besselj(0,x).*airy(x));
y=f(x);
h=x(2)-x(1);

for i=3:1:a-2
    segder=(-y(i+2)+16.*y(i+1)-30*y(i)+16.*y(i-1)-y(i-2))/(12*h^2);
end
b=-40;
segder40=(-f(b+2*h)+16.*f(b+h)-30*f(b)+16.*f(b-h)-f(b-2*h))/(12*h^2);
disp(segder40)
end