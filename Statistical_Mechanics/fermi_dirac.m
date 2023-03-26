close all
Ef = 1;
k = 1;
T = linspace(0,0.5,10);
beta = 1;
Ei = linspace(0,10,200);
alpha = -Ef./(k*T);
for ii=1:length(alpha)
    f = 1./(1+exp(alpha(ii)+beta*Ei));
    plot(Ei,f, 'Linewidth', 2)
    axis([0 10 0 1.1])
    xlabel('E'); ylabel('f_i')
    set(gca,'XTick',[], 'YTick', [])
    hold on
end
