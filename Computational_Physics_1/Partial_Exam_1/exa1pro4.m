function[]=exa1pro4
load problema4(2)
h=x(2)-x(1);
[m,n]=size(x);
g=1:1:n;
for i=3:1:n-2
    g(i)=(-y(i+2)+8*y(i+1)-8*y(i-1)+y(i-2))/(12*h);
end
g(2)=(y(3)-y(1))/(2*h); 
g(1)=g(2);
g(n-1)=(y(n)-y(n-2))/(2*h); 
g(n)=g(n-2);
plot(x,g)

[X,Y]=size(g);
c=0.1;
while Y>2
indx=find(g<c & g>-c);
[X,Y]=size(indx);
c=c/10;
end
x1=x(indx(1,1));
raiz=['El valor de x que es raíz de la derivada es ', num2str(x1)];
indi=['Y su índice es ', num2str(indx)];

disp(raiz)
disp(indi)

end