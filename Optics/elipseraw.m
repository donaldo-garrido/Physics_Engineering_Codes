close all
xIn = 0.7;
yIn = 0.0;
noElip = 37;
thetav = zeros(1,noElip);
rx =  zeros(1,noElip);
ry = zeros(1,noElip);
for ii = 1: noElip
    thetav(ii) = (ii-1)*pi/8;
    if ii < 20
        rx(ii) = xIn;
        ry(ii) = yIn;
        xIn = xIn+0.1;
        yIn = yIn+0.08;
    elseif ii > 19
        rx(ii) = xIn;
        ry(ii) = yIn;
        xIn = xIn-0.1;
        yIn = yIn-0.08;
    end
    if mod(ii,4)==1
        thetav(ii) = pi/2;
    end
end
thetav(1) = pi/2;
thetav(37) = pi/2;


for ii = 1:noElip
    for jj = 1:noElip
        theta = thetav(ii)+pi/2;
        r1 = ry(jj);
        r2 = rx(ii);
        if r1 > r2
            r2 = ry(jj);
            r1 = rx(ii);
        end
        if mod(ii,4)== 3
        r1 = 0;
        end
        t = linspace(0, 2*pi, 100);
        xt = (r1 * cos(t));
        yt = (r2 * sin(t));

        cot = cos(theta); 
        sit = sin(theta);
        xp = xt * cot- yt * sit-(ii-1)*5 ;
        yp = xt * sit + yt * cot-(jj-1)*5; 

        hold on
        plot(real(xp), real(yp), 'k');
        set(gca,'XColor', 'none','YColor','none')
    end
end