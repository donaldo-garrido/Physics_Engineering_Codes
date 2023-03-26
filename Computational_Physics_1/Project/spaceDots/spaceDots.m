% Space Dots {Silas Henderson}
% Animated multibody problem with SI Euler

clear; clc; clf;
% -------------------------- setup ---------------------------------- %
set(gcf,'color',[.7 .7 .9])                             % figure props
set(gca,'gridcolor',[1 1 0],'color',[0 0 0],...         % axis props
       'TickLength',  [0 0],'XTickLabel',[],...
       'YTickLabel',     [],'ZTickLabel',[])
hold on; grid on; axis([-1 1 -1 1 -1 1]);

n  =                  3;                               % planet data
m  =      1000*rand(1,n);                     
x  = rand(3,n)-rand(3,n);     
v  =          zeros(3,n);   
dt =              .00005; 

for e = 1:n                                             % planet markers
    planets(e) = plot3(x(1,e),x(2,e),x(3,e),'o',...
        'markersize',m(e)/100,'markerfacecolor',rand(1,3));
end

% ---------------------------- main loop --------------------------- % 
tic;
while toc < 100
    %view(10*toc,30)                                     % rotate axis
    planets = plotUpdate(planets,x);                    % update plot
    [x,v]   = dataUpdate(x,v,m,dt);                     % update data
    pause(.02); 
end

% ------------------------- functions --------------------------------- %
function planets = plotUpdate(planets,x)                % update plot
for e = 1:length(x)
    set(planets(e),'XData',x(1,e),'YData',x(2,e),'ZData',x(3,e));
end
end

function [x,v] = dataUpdate(x,v,m,dt)                   % update data
for i = 1:length(x)                                     % [euler method]
    a(:,i) = zeros(3,1);
    for j = 1:length(m)                                 
        if i ~= j
            a(:,i) = a(:,i) + m(j).*(x(:,j) - x(:,i))./...
                (norm(x(:,j) - x(:,i))^3 + .5);
        end
        v(:,i) = v(:,i) + a(:,i)*dt;
        x(:,i) = x(:,i) + v(:,i)*dt;
    end
end
end