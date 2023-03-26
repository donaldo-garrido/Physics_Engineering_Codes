function[]= exa1pro5
for i=1:1:100000
    sum5(i)=3^(i-1)*(3^(2*(i-1)+1)); 
end
total=sum(sum5)
sumatoria=1/total;
result=['El resultado de la sumatoria es: ',num2str(sumatoria)];
disp(result)
end