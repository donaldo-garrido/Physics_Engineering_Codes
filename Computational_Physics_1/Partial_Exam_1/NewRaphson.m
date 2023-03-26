function[]=NewRaphson(Es,Xi)
Ea=100;
iter=0;
y=@(x) (sqrt(100-x)*tan(sqrt(100-x))-x.^(1/2));
t=linspace(-Xi,3*Xi,1000);
g=y(t);
plot(t,g)
while abs(Ea)>Es
    f=y(Xi);
    fder=(2.(Xi-50).(cos(sqrt(100-Xi))).^2-sqrt(Xi).sin(sqrt(100-Xi)).*cos(sqrt(100-Xi))-sqrt(Xi).*sqrt(100-Xi))/(2.*sqrt(Xi)*sqrt(100-Xi).(cos(sqrt(100-Xi))).^2)
    Xf=Xi-(f./fder);
    Ea=100*(abs(Xf-Xi)/Xf);
    Xi=Xf;
    iter=iter+1;
end
raiz=['La raiz es ',num2str(Xf)];
iteracion=['Numero de iteraciones: ',num2str(iter)];
error=['para lograr un error de ', num2str(Ea)];
disp(raiz)
disp(iteracion)
disp(error)
end
