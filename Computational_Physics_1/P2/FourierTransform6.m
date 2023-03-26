f = @(x) exp(-x.^2);
t = linspace(-10,10,1000);
g = f(t);
N = length(t);
im = sqrt(-1);
sum1 = 0;
sum2 = 0;
% Trans = 0 para FT, Trans = 1 para IFT

%---------fft-------------------------------

for i = 1:1:N
    for j = 1:1:N
        term1 = g(j)*exp(-im*2*pi*(i-1)*(j-1)/N);
        sum1 = sum1+term1;
    end
        X(i) = sum1;
end
figure(1)
plot(abs(X))
title('FFT')
xlabel('x'); ylabel('X(k)')

%---------ifft-------------------------------

for i = 1:1:N
    for j = 1:1:N
        term2 = X(j)*exp(im*2*pi*(j-1)*(i-1)/N);
        sum2 = sum2+term2;
    end
    xin(i) = sum2/N;
end
figure(2)
plot(abs(xin))
title('IFFT')
xlabel('x'); ylabel('x(n)')