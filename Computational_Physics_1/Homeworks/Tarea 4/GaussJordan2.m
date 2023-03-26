A = [2,1,-1; 5,2,2; 3,1,1];
b = [1,-4,5]';
x = zeros(size(b));

M = [A b];
fprintf("M= \n");
disp(M);
fprintf("PRIMER PASO = \n");
M(1,:) = M(1,:)*(1/M(1,1)); 
M(2,:) = M(2,:)-M(2,1)*M(1,:);
M(3,:) = M(3,:)-M(3,1)*M(1,:);
disp(M(1,:))
disp(M(2,:))
disp(M(3,:))
fprintf("SEGUNDO PASO = \n");
M(2,:) = M(2,:)*(1/M(2,2));
M(1,:) = M(1,:)-M(1,2)*M(2,:);
M(3,:) = M(3,:)-M(3,2)*M(2,:);
disp(M(1,:))
disp(M(2,:))
disp(M(3,:))
fprintf("TERCER PASO = \n");
M(3,:) = M(3,:)*(1/M(3,3));
M(1,:) = M(1,:)-M(1,3)*M(3,:);
M(2,:) = M(2,:)-M(2,3)*M(3,:);
disp(M(1,:))
disp(M(2,:))
disp(M(3,:))