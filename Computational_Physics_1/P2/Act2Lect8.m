t=linspace(-2,2,1024);
N=1024;
for i=1:1:1024
    f(i)=exp(-t(i).^2);
end
Xk1=0;
for k=1:1:1024
    for n=1:1:1024
    Xk2=sum(f(k)*exp(-j*2*pi*(k-1)*(n-1)/N));
    Xk1=Xk1+Xk2;
    end
    X(k)=Xk1;
end
disp(sum(X))
plot(t,f)
hold on
plot(t,abs(X))

