Mm = zeros(11,21);
for i = 2:11
    k = 0;
    for j=(12-i):(10+i)
        Mm(i,j) = -i+1+k;
        k = k+1;
    end
    
end

Ml = zeros(11,21);
for i = 1:11
    k = 0;
    for j=(12-i):(10+i)
        Ml(i,j) = (i-1)*i;
    end
    
end