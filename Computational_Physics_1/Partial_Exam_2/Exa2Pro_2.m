% La aceleraci�n se obtiene de derivar dos veces x
h = t(2)-t(1);
for i = 1:1:length(t)-1
    v(i) = (x(i+1)-x(i))/h; %Velocidad
end
v(length(t))=v(length(t)-1);

for i = 1:1:length(t)-1
    a(i) = (v(i+1)-v(i))/h; %Aceleraci�n
end
a(length(t))=a(length(t)-1);
plot(t,a)

Es = 0.0001; Ea = 100;
Xinf = 27500;

while a(Xinf)-a(Xinf-1)>0
    Xinf=Xinf+1;
end
tmax = t(Xinf-1);
max = a(Xinf-1);
fprintf('La funci�n encuentra un m�ximo  %f en tiempo %f \n',max,tmax)