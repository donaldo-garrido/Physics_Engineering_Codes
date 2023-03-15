% -------------- Azimuthal Map of Polarization ---------------
close all
S = 400; %number of points
%Definition of the grating using a diagonal pattern
%This is the "Base grating"
M = zeros(S);
lim = 18;
aux = 0;
for i = 1:S
    for j = 1:S
            M(i,j) = aux;
        if aux > (lim/2)+1
            M(i,j) = M(i,j)-aux+(lim/2);
        end
        if aux < lim
            aux = aux+1;
        else
            aux = 0;
        end
    end
end

%Creating a grating with a dephase of pi with respect the first
M1 = zeros(S);
lim = 18;
aux = 9; %Here is determined the phase
for i = 1:S
    for j = 1:S
            M1(i,j) = aux;
        if aux > (lim/2)+1
            M1(i,j) = M1(i,j)-aux+(lim/2);
        end
        if aux < lim
            aux = aux+1;
        else
            aux = 0;
        end
    end
end

%Creating a grating with a dephase of pi with respect the first
M2 = zeros(S);
lim = 18;
aux = 5; %Here is determined the phase
for i = 1:S
    for j = 1:S
            M2(i,j) = aux;
        if aux > (lim/2)+1
            M2(i,j) = M2(i,j)-aux+(lim/2);
        end
        if aux < lim
            aux = aux+1;
        else
            aux = 0;
        end
    end
end

%Creating a grating with a dephase of 3*pi/2 with respect the first
M3 = zeros(S);
lim = 18;
aux = 15; %Here is determined the phase
for i = 1:S
    for j = 1:S
            M3(i,j) = aux;
        if aux > (lim/2)+1
            M3(i,j) = M3(i,j)-aux+(lim/2);
        end
        if aux < lim
            aux = aux+1;
        else
            aux = 0;
        end
    end
end

%Diagram of the desired angular
BASE = 10*ones(S);
for i = 1:S
    for j = 1:S
        if j<i+1 && S-j>i
            BASE(i,j) = 0;
        elseif j>i+1 && j>S-i
            BASE(i,j) = 0;
        else
            BASE(i,j) = 5;
        end
    end
end
BASE(1,1) = 10;
% figure(1)
% surf(BASE)
% colormap('gray');
% shading interp
% colorbar
% set(gca,'XColor', 'none','YColor','none')

% Take the respective "triangle" of different phase
% Creating the grating of different phases
% Blazed grating
M4 = zeros(S);
for i = 1:S
    for j = 1:S
        if j<i+1
            M4(i,j) = M(i,j);
        elseif j>i+1
            M4(i,j) = M1(i,j);
        end
        if j<i+1 && S-j>i
            M4(i,j) = M2(i,j);
        elseif j>i+1 && j>S-i
            M4(i,j) = M3(i,j);
        end
    end
end
% figure(2)
% surf(M4)
% colormap('gray');
% shading interp
% colorbar
% set(gca,'XColor', 'none','YColor','none')

%Definition of the ring
n=S;
D=3;
D1=1;
D2=0.95;
D3=1;
x0=linspace(-D/2,D/2,n);
[x,y]=meshgrid(x0);
rectx=1.*(abs(x/D1)<=sqrt(D1.^2-y.^2));
recty=1.*(abs(y/D1)<=sqrt(D1.^2-x.^2));
rectx1=1.*(abs(x/D2)<=sqrt(D2.^2-y.^2));
recty2=1.*(abs(y/D2)<=sqrt(D2.^2-x.^2));
g5=rectx.*recty-rectx1.*recty2; %Ring n it's simple way

% figure(3)
% surface(x,y,g5)
% colormap('gray');
% shading interp
% set(gca,'XColor', 'none','YColor','none')

A = M.*g5; %Ring with the blazed grating
% figure(4)
% surface(x,y,A)
% colormap('gray');
% shading interp
% colorbar
% set(gca,'XColor', 'none','YColor','none')

%Arrange two pinholes
lim = 26;
n=S;
i=sqrt(-1);
z=300;
D=30;
D1=1;
D2=1;
SD=10; %Separation of the pinholes
m=1^6;
w0=1*10^(-3);
x0=linspace(-D,D,n);
x1=linspace(-D,D+SD,n);
y1=linspace(-D,D,n);
[x,y]=meshgrid(x0);
[s,e]=meshgrid(x1,y1);    
rectx=1.*(abs(x/D1)<=sqrt(D1.^2-y.^2));
recty=1.*(abs(y/D1)<=sqrt(D1.^2-x.^2));
rectx1=1.*(abs(s/D2)<=sqrt(D2.^2-e.^2));
recty2=1.*(abs(e/D2)<=sqrt(D2.^2-s.^2));
g1=rectx.*recty+rectx1.*recty2;
dots = M.*g1; %Definition of the blazed pinholes

% figure(5)
% surface(x,y,g1); %The two pinholes
% colormap('gray')
% shading interp
% set(gca,'XColor', 'none','YColor','none')
% 
% figure(6)
% surface(x,y,dots);
% colormap('gray')
% shading interp
% set(gca,'XColor', 'none','YColor','none')

figure(1)
subplot(3,2,1) %1
imagesc(g1)
title('(a)')
colormap('gray')
shading interp
set(gca,'XColor', 'none','YColor','none')
subplot(3,2,2) %2
imagesc(dots)
title('(b)')
colormap('gray')
shading interp
set(gca,'XColor', 'none','YColor','none')
subplot(3,2,3) %3
imagesc(BASE)
title('(c)')
colormap('gray');
shading interp
set(gca,'XColor', 'none','YColor','none')
subplot(3,2,4) %4
imagesc(M4)
title('(d)')
colormap('gray');
shading interp
set(gca,'XColor', 'none','YColor','none')
subplot(3,2,5) %5
imagesc(g5)
title('(e)')
colormap('gray');
shading interp
set(gca,'XColor', 'none','YColor','none')
subplot(3,2,6) %6
imagesc(A)
title('(f)')
colormap('gray');
shading interp
set(gca,'XColor', 'none','YColor','none')
