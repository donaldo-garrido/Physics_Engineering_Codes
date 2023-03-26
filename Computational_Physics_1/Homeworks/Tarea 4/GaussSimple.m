A=[2,5,6;4,6,8;8,8,7];
n=3;
for k=1:1:n
for i=1:1:n-1
    res = A(k,:)*(A(i+1,k)/A(k,k));
    for j = 1:1:n
        A(i+1,j)=A(i+1,j)-res(j);
    end   
end
end
A