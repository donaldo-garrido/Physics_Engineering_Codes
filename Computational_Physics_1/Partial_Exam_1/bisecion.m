function []=bisecion(a,b,n)
c=(a+b)/2; ea=0.000000000000001; iter=0;
y=@(x)(sqrt(100-x)*tan(sqrt(100-x))-x.^(1/2));
t=linspace(a,b,n);


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