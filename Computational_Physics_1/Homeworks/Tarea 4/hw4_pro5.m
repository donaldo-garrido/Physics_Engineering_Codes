x = rand([1,4096]);
N = 4096;
im = sqrt(-1);
sum1 = 0;
sum2 = 0;
%---------fft-------------------------------
tic
for i = 1:1:N
    for j = 1:1:N
        term1 = x(j)*exp(-im*2*pi*(i-1)*(j-1)/N);
        sum1 = sum1+term1;
    end
        X(i) = sum1;
end
toc
tic
y=fft(x);
toc
figure(1)
plot(abs(X))
title('FFT')
xlabel('x'); ylabel('X(k)')

%---------ifft-------------------------------
tic
for i = 1:1:N
    for j = 1:1:N
        term2 = X(j)*exp(im*2*pi*(j-1)*(i-1)/N);
        sum2 = sum2+term2;
    end
    xin(i) = sum2/N;
end
toc
tic
xin2 = ifft(X);
toc
figure(2)
plot(abs(xin))
title('IFFT')
xlabel('x'); ylabel('x(n)')