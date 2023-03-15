n = 11;
D1 = 1;
D = linspace(0.7,1.1,6);
U0x = zeros(n);
U0y = zeros(n);
for ii = 1:length(D)
    x0=linspace(-D1,D1,n);
    y0=linspace(-D1,D1,n);
    [x,y]=meshgrid(x0,y0);
    circx=atan((ii-1))*(abs(x/D(ii))>=sqrt(D(ii).^2-(y).^2));
    circy=atan((ii-1))*(abs(y/D(ii))>=sqrt(D(ii).^2-(x).^2));
    g=circx.*circy;
    U0x=U0x+circx;
    U0y=U0y+circy;
end
Ex = U0x;
Ey = U0y;