a=[0.95 0.05;0 1];
c=[1 0;0 1];
x= zeros(2,300);
xh=x;
h= zeros(2,2);
k=h;
x(:,1)= [25,25];
for n=1 : 299
  
v= [normrnd(0,0.04); normrnd(0,0.01)];
x(:,n+1)=a* x(:,n)+v;
y= c* x (:,n+1) + [normrnd(0,4); normrnd(0,1)];

s= a*h*a' + [0.04; 0.01]*[0.04; 0.01]';

k= s * c' * ((c*s*c' +[4 ;1]*[4 ;1]')).^(-1);

h= (1-k*c)*s;
xh(:,n+1)= (a-k*c*a)*xh(:,n)+ k*y;
end
p=[x(1,:);xh(1,:)]';
plot(x(1,:));
hold on 
plot(xh(1,:));
hold on 
plot(x(2,:));
hold on 
plot(xh(2,:));
xlabel('time steps');
ylabel('Temprature');
title('room temperature monitoring system');
legend('predicted indoor temprature','estimated indoor temprature',...
    'predicted outdoor temprature','estiamted indoor temprature');
