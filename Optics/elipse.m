close all
%P = zeros(400,400);
xp1 = zeros(1,200);
yp1 = zeros(1,200);

x0 = 1; y0 = 1.5;
k1 = 1;
k2 = 1;
D = 2;
x = linspace(-D,D,200);
y = linspace(-D,D,200);
for i = 1:38
    for j = 1:38
        phi1 = k1*x(2+(j-1)*5);
        phi2 = k2*y(2+(i-1)*5);
        del = phi1 - phi2;
        alpha = 1/2*atan(2*x0*y0*cos(del)/(x0^2-y0^2));
        A = sqrt((1/2)*(x0^2*(1+sec(2*alpha))+y0^2*(1-sec(2*alpha))));
        B = sqrt((1/2)*(x0^2*(1-sec(2*alpha))+y0^2*(1+sec(2*alpha))));

        theta = alpha+pi/2;
        r1 = A;
        r2 = B;
%         xc = 10+aux*100;
%         yc = 10+aux*100;
        % compute points corresponding to axis-oriented ellipse
        t = linspace(0, 2*pi, 100);
        xt = (r1 * cos(t));
        yt = (r2 * sin(t));
        % aply rotation by angle theta
        cot = cos(theta); sit = sin(theta);
        xp = xt * cot-(i-1)*5 - yt * sit;
        yp = xt * sit + yt * cot-(j-1)*5;
        % xp1 = xp1 + xp;
        % yp1 = yp1+yp;
        % aux = aux+1;
        % draw the curbe

        %surface(xp2,yp2)
        hold on
        plot(real(xp), real(yp), 'r');

    end
end