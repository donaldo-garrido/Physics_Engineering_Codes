close all
%P = zeros(400,400);
xp1 = zeros(1,200);
yp1 = zeros(1,200);

x0 = 3; y0 = 1;
k1 = 5;
k2 = 0;
D = 2;
x = linspace(-D,D,200);
y = linspace(-D,D,200);
for ii = 1:38
    for jj = 1:38
        phi1 = k1*x(2+(jj-1)*5);
        phi2 = k2*y(2+(ii-1)*5);
        del = phi1 - phi2;
        alpha = 1/2*atan(2*x0*y0*cos(del)/(x0^2-y0^2));
        A = sqrt((1/2)*(x0^2*(1-sec(2*alpha))+y0^2*(1-sec(2*alpha))));
        B = sqrt((1/2)*(x0^2*(1-sec(2*alpha))+y0^2*(1+sec(2*alpha))));

        theta = alpha+pi/2;
        r1 = A;
        r2 = B;
%         xc = 10+aux*100;
%         yc = 10+aux*100;
        % calculo de los puntos del elipse
        t = linspace(0, 2*pi, 100);
        xt = (r1 * cos(t));
        yt = (r2 * sin(t));
        % Rotación respecto al ángulo theta
        cot = cos(theta); 
        sit = sin(theta);
        xp = xt * cot-(ii-1)*5 - yt * sit;
        yp = xt * sit + yt * cot-(jj-1)*5;
        
        hold on
        plot(real(xp), real(yp), 'r');

    end
end