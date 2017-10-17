clear;
clc;
A=[0.95 0.05;0 1];
H=[1 0;0 1];
X= zeros(2,300);
Var = zeros(2,300);
Xh=X;
P = zeros(2,2,300);
K=P;
Xh(:,1)= [25,25];

numberOfTimeSteps = 299;
Q = [0.04,0 ; 0,0.01];
R = [4 0;0 1];
Z = zeros(2,300); 
turnOn = 0;
u_k = 0;
P(:,:,1)= inv(H)*R*inv(H');
U_k = zeros(300,1);
B = [-1,0]';
meanEstimateInternal = zeros(300,1);
varianceEstimate = zeros(300,1);
alpha = 1;
beta = 1;
mcP = [1-alpha,alpha;beta,1-beta];%markov chain transition matrix
state = 1;
for n=1:numberOfTimeSteps
    u_k = turnOn;
    U_k(n) = u_k;
    v = [normrnd(0,0.04); normrnd(0,0.01)];
    X(:,n+1)= A*Xh(:,n) + 0.1*sin((2*pi/300)*n) + B*u_k + v ;%B*u_k + v;  
    Pp = A*P(:,:,n)*A' + Q;
    Z(:,n) = H*X(:,n+1) + [normrnd(0,4); normrnd(0,1)];
    

    K = Pp * H' * ((H*Pp*H' +R))^(-1);
    P(:,:,n+1) = (eye(2)-K*H)*Pp;
    
    Xh(:,n+1)= X(:,n+1)+K*(Z(:,n)-H*X(:,n+1));
    
    meanEstimateInternal(n) = Xh(1,n+1);
    varianceEstimate(n) = P(1,1,n+1);
    if qfunc((28-meanEstimateInternal(n))/sqrt(varianceEstimate(n)))>0.1
        turnOn = 1;
    else
        turnOn = 0;
    end
end


internalTempError = sqrt(P(1,1,:));
externalTempError = sqrt(P(2,2,:));
figure;
errorbar(1:300,Xh(1,:),internalTempError(:));
hold on;
plot(Z(1,:));
hold on;
plot(X(1,:));
%plot(U_k(:,1));
title('Kalman filter Internal Temperature');
xlabel('Time step')
ylabel('Temperature')
legend('Estimated Indoor Temperature','Indoor Temperature Measurment','Indoor Temperature Blind prediction');