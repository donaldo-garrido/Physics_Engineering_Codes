f = @(x) 2*sin(x)-x.^2/10; %Funci�n
%------Escriba la primera derivada-------
f1 = @(x) 2*cos(x)-x/5;
%------Escriba la segunda derivada-------
f2 = @(x) -2*sin(x)-1/5;
%----------------------------------------
Es = 0.0001; Ea = 100;
Xi = 1;
t = linspace(-Xi,3*Xi,1000);
g = f(t);
plot(t,g)
iter = 0;
while abs(Ea)>Es
    Xf=Xi-(f1(Xi)./f2(Xi));
    Ea=100*(abs(Xf-Xi)/Xf);
    Xi=Xf;
    iter=iter+1;
end
opt = f(Xf);
fprintf('La funci�n tiene un m�nimo/m�ximo en: %f cuando la funci�n vale %f . Se lleg� al resultado en %f iteraciones \n', Xf, opt,iter);