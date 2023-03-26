% Resolver OSCLADOR ARMÓNICO
tspan = [0,20];
y0 = [2,1];
[t,y] = ode23('predprey',tspan,y0);
plot(t,y);
%plot(y(:,1),y(:,2));