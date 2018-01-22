Zk = zeros(2,300);
Xk = Zk;
Xk(:,1) = [23,20];
u_k = 0;
U_k = zeros(1,300);
for i=2:300
    state = discrete([0.99,0.01]);
    if Xk(1,i-1)> 28
        u_k = 1;
    else
        u_k = 0;
    end
    U_k(i) = u_k;
    [Xk(:,i),Zk(:,i)] = get_measurment(Xk(:,i-1),u_k,i);
end
figure;
plot(Xk(1,:),'b')
hold on;
plot(Zk(1,:),'r')
plot(U_k);