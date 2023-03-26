M = rref(A);
for i = 2:1:10
    x1(i)=-M(1,i);
end

for i = 3:1:10
    x2(i)=-M(2,i);
end
disp(x1)
disp(x2)

y = zeros(8,10);
for j = 1:1:8
    
        y(j,1) = x1(j+2);
        y(j,2) = x2(j+2);
        y(j,j+2) = 1;
end
disp(y)
%Los siguientes 8 vectores son soluciones a AX = 0

xsol1 = transpose(y(1,:));
xsol2 = transpose(y(2,:));
xsol3 = transpose(y(3,:));
xsol4 = transpose(y(4,:));
xsol5 = transpose(y(5,:));
xsol6 = transpose(y(6,:));
xsol7 = transpose(y(7,:));
xsol8 = transpose(y(8,:));

%probamos
disp(A*xsol3)
disp(A*xsol7)
% Reporté el solo xsol1
