X = csvread("X_test.csv",1,0);
Xt = X';
y = csvread("y_test.csv",1,0);
y_test = csvread("y_test.csv",1,0);

w = randn(4,1);
alpha = 0.0001;
m = 1000; 
n = 4;
costo = zeros(m,1);

for i = 1:m
    w = w - alpha*(Xt*(sigmoid(X*w)-y));
    costo(i) = cost(n,w,X,y);
end

x1 = -4:0.1:4;
x2 = -w(1)/w(3)-(w(2)/w(3))*x1;
close all;
figure;
plot(1:m,costo), axis tight, xlabel('Iteración de Gradiente Descendiente'), ylabel('Costo'), title('Evolución de la función de costo');

% Cálculo de accuracy

acc = 0;
correct = zeros(length(y));

for ii = 1:length(y)
    if y[ii] == y_test[ii]
        acc = acc+ 1;
    end
end

function c = cost(n,w,X,y)

c = -(1/n)*(y'*log(sigmoid(X*w))+(1-y)'*log(1-sigmoid(X*w)));

end