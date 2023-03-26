function [] = Trap6(a,b,n)
h = (b-a)/n;
f = @(t) t.^3-(1/3)*t.^2+pi*t-2.71; 
ev = f(a);

for i = 1:n-1
    x(i) = a+h*i;
    ev = ev+2*f(x(i));
end
ev = ev+f(b); 

I = h*ev/2;

disp(I)



