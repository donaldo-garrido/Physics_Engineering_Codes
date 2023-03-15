% -------------- Radial Map of Polarization ---------------
close all
n = 57;  %No. elpises per side
i = sqrt(-1);
D1 = 1;
D = linspace(0.8,1.2,10);%Definition of radius of the rings
U0x = ones(n);
U0y = ones(n);
for ii = 1:length(D)
    %Creation of X  & Y components of the fields
    %Sinusoidal radial variation
    x0=linspace(-D1,D1,n);
    y0=linspace(-D1,D1,n);
    [x,y]=meshgrid(x0,y0);
    circx=(cos((ii-1)*pi/7)+i*sin((ii)*pi/2))*(abs(x/D(ii))>=sqrt(D(ii).^2-(y).^2));
    circy=(cos((ii-1)*pi/7)+i*sin((ii)*pi/2))*(abs(y/D(ii))>=sqrt(D(ii).^2-(x).^2));
    g=circx.*circy;
    U0x=U0x+circx;
    U0y=U0y+circy;
end
Ex = U0x;
Ey = U0y;
% Stokes Vectors:
S0 = abs(Ex).^2+abs(Ey).^2;
S1 = abs(Ex).^2-abs(Ey).^2;
S2 = 2.*real(Ex.*conj(Ey));
S3 = 2.*imag(Ex.*conj(Ey));
%Parameters for elipses
Ip = sqrt(S1.^2+S2.^2+S3.^2);
L = S1+i*S2;
%Semiaxis, helicity and angles of each elipse
phi = (atan(S2./S1));
A = sqrt((Ip+abs(L))/2);
B = sqrt((Ip-abs(L))/2);
H = sign(S3);

%Parametric plot of each elipse
%Once we have their parameters
for ii = 1:n
        
    for jj = 1:n
        theta = phi(ii,jj)+pi/4;
        r1 = A(ii,jj);
        r2 = 3*B(ii,jj);
        % compute the points of each elipse
        t = linspace(0, 2*pi, 20);
        xt = (r1 * cos(t));
        yt = (r2 * sin(t));

        cot = cos(theta); 
        sit = sin(theta);
        xp = xt * cot - yt * sit-(jj-1)*10 ;
        yp = xt * sit + yt * cot+(ii-1)*10; 

        hold on
        plot(real(xp), real(yp), 'k');
    end
end