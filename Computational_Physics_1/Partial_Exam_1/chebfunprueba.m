% 14 neutrones, 12 electrones, 12 protones
format long
me=1; h=1; mp=1836*me; mn=1836; mp=1836;
a = 4.96*10^7;
b = 624;
m1 = 12*me+12*mp+12*mn;
m2 = 12*me+12*mp+12*mn;
Mu = m1*m2/(m1+m2);
l = 0; h = 1;
c = -h^2*(l^2+l+1/4)/(2*Mu);
r = linspace(0,35,1000);
Vr = zeros(length(r),1);
for i=1:length(r)
    Vr(i) = a./(r(i).^12)-b./(r(i).^6)+(l.^2+l+1/4)*(h^2/(2*Mu*r(i).^2));
end
%plot(r,Vr)
%xlim([0,15]);
%ylim([-2*10^-3, 2*10^-3])

for i=2:1000
    if Vr(i)-Vr(i-1)>0
        minVr = Vr(i-1);
        minr = r(i-1);
        indexmin = i;
        %disp(minVr)
        %disp(minr)
        break
    end
    
end


for i=1:1000
if Vr(i) < 0
    zeroVr = Vr(i-1);
    %disp(zeroVr)
    zeror = r(i-1);
    %disp(zeror)
    indexzero = i;
    break
end
end
j=1;
E = zeros(indexmin-indexzero,1);
for i = indexzero:indexmin
    %disp(i)
        E(j) = Vr(i);
        j=j+1;
end
radius=zeros(length(E),2);
for j=1:length(E)
p = [c 0 0 0 b 0 0 0 0 0 E(j)-a];
radi = roots(p);



compare = -1;
for i=1:length(radi)
    if imag(radi(i))==0 && real(radi(i))> 0
        radiu = radi(i);
        if radiu > compare
            radius(j,1) = radiu;
            compare = radiu;
        elseif radiu < compare
            radius(j,2) = radiu;
            radius(j,1) = compare;
        end
    end
    
end
end
disp(radius)
%Para la integral:
nr=1
for j=1:length(E)
I = 0;
r1 = radius(j,2);
r2 = radius(j,1);
delta = abs(r2-r1)/100000;
    while r1<r2
        I = I + sqrt(E(j)-(a/(r1^12)-b/(r1^6)+h^2*(l^2+l+1/4)/(2*Mu*(r1^2))))*delta;
        r1= r1+delta;
    end
 Int = sqrt(2*Mu)*I/pi;
 disp(Int-(nr+1/2)*h)
end