
close all
xc = 0;
yc = 0;
theta = 1*pi/4+pi/2;
r1 = 4;
r2 = 5;
% compute points corresponding to axis-oriented ellipse
t = linspace(0, 2*pi, 200);
xt = r1 * cos(t) + xc;
yt = r2 * sin(t) + yc;
% aply rotation by angle theta
cot = cos(theta); sit = sin(theta);
x = xt * cot - yt * sit;
y = xt * sit + yt * cot;
% draw the curbe
plot(x, y, '-');
xlim([-10 10])
ylim([-10 10])