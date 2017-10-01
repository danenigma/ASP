
n = 100;
p = 0.0001;
e = 1;
figure;
hold on;
x = zeros(1,n);
y = zeros(1,n);
for i=e+1:100
x(i) = Pce(i,n,p);
end
plot(x)
sum(x)
y = nchoosek(n,e+1)*p^(e+1)
function pce = Pce(i,n,p)
pce = nchoosek(n,i)*p^i*(1-p)^(n-i);
end