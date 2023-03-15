close all
n = 37;
D = 5*pi/2;
E0x = 0.5;
E0y = 0.5;
i = sqrt(-1);
Space = linspace(-D,D,n);

D1 = 1;
D = linspace(0.4,1,12);
U0x = zeros(n);
U0y = zeros(n);
x0=linspace(-D1,D1,n);
y0=linspace(-D1,D1,n);
[x,y]=meshgrid(x0,y0);
for ii = 1:length(D)
    circx=0.8*(atan((ii-1))+i*sin((ii)*pi/2))*(abs(x/D(ii))>=sqrt(D(ii).^2-(y).^2));
    circy=0.8*(atan((ii-1))+i*sin((ii)*pi/2))*(abs(y/D(ii))>=sqrt(D(ii).^2-(x).^2));
    g=circx.*circy;
    U0x=U0x+circx;
    U0y=U0y+circy;
end
decaimiento = 1*(abs(x/D(end))<=sqrt(D(end).^2-(y).^2));
Ex = U0x.*decaimiento;
Ey = U0y.*decaimiento;
S0 = abs(Ex).^2+abs(Ey).^2;
S1 = abs(Ex).^2-abs(Ey).^2;
S2 = 2.*real(Ex.*conj(Ey));
S3 = 2.*imag(Ex.*conj(Ey));
Ip = sqrt(S1.^2+S2.^2+S3.^2);
Labs = sqrt(S1.^2+S2.^2);
L = S1+i*S2;
A = sqrt((Ip+abs(L))/2);%.*exp(-0.05*Space.^2);
B = sqrt((Ip-abs(L))/2);%.*exp(-0.05*Space.^2);
phi = (angle(L))/2;
H = sign(S3);

for ii = 1:n
        
    for jj = 1:n
        if ii == (n+1)/2 || jj == (n+1)/2
            B(ii,jj)  = 0;
            B(ii+1,jj+1)  = 0;
            B(ii+2,jj+2)  = 0;
            %A(ii,jj)  = 0;
        end
        theta = phi(ii,jj);
        r1 = 0.5*A(ii,jj);
        r2 = 1.5*B(ii,jj);
        % calculo de los puntos del elipse
        t = linspace(0, 2*pi, 20);
        xt = (r1 * cos(t));
        yt = (r2 * sin(t));

        cot = cos(theta); 
        sit = sin(theta);
        xp = xt * cot - yt * sit-(jj-1)*9;
        yp = xt * sit + yt * cot+(ii-1)*9; 

        hold on
        
        plot(real(xp), real(yp), 'k');

    end
end
