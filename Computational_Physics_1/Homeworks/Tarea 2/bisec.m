function[]=bisec(a,b,c)
t=linspace(a,b,c);
y(1)=tarea2A(a);
for i=2:1:c
    y(i)=tarea2A(t(i));
    z(i)=y(i).*y(i-1);
end
w=find(z<0)
end
