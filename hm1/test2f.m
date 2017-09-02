N = 100;
P = [0.3 0.7 0;0.1 0.4 0.5;1 0 0];
pi0 = [1 0 0];
pin = PIN(pi0,P,N);
x = [1:N];
scatter(x,pin(:,1),'d');
hold on;
scatter(x,pin(:,2),'o');
scatter(x,pin(:,3),'x');
hold off;
legend('state0','state1','state2');
xlabel('n');
ylabel('\pin')
