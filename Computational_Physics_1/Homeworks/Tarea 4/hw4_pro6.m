x = linspace(-5,5,1000); %Definición del dominio
y = exp(-x.^2); %Gaussiana

y1 = fft(abs(y)); %Aplicamos fft
y2 = ifft(y1); %Aplicamos ifft
y3 = fftshift(y); %Aplicamos fftshift
y4 = ifftshift(y3); %Aplicamos ifftshift
figure(5)
plot(y)
title('Pulso gaussiano original')
xlabel('x'); ylabel('y');

figure(1)
plot(abs(y1))
title('fft')
xlabel('x'); ylabel('y');

figure(2)
plot(y2)
title('ifft')
xlabel('x'); ylabel('y');

figure(3)
plot(y3)
title('fftshift')
xlabel('x'); ylabel('y');

figure(4)
plot(y4)
title('ifftshift')
xlabel('x'); ylabel('y');
