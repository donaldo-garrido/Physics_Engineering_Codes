close all
n=1024;
i=sqrt(-1);
D=5;
D1=1;
y0=linspace(-D,D,n);
x0=linspace(-D,D,n);
[x,y]=meshgrid(x0,y0);
%Azimutal apertures
circx1=2.*(abs(y/D1))<=tan(abs(0.5*x)); %Angular apertures
circx2=1.*(abs(y/D1)<=sqrt(0.6*D1.^2-(x).^2)); %Delimiting polar circle
U0=circx1.*circx2;
FT1=fftshift(fft2(U0)); %Creation of the interference pattern

figure(1)
subplot(1,2,1)
imagesc(x0,x0,abs(U0))
set(gca,'XColor', 'none','YColor','none')
subplot(1,2,2)
imagesc(x0,x0,(abs(FT1)).^2);
colormap ('gray');
set(gca,'XColor', 'none','YColor','none')