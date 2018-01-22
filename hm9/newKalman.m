clear;
clc;
close all;
A=[0.95 0.05;0 1];%state transtion matric 
H=[1 0;0 1];%measurment transition
X= zeros(2,300);% blind prediction
Var = zeros(2,300);
Xh=X;%estimate
P = zeros(2,2,300);%estimate covariance
K=P;%gain
Xh(:,1)= [25,25];%initial state estimate
numberOfTimeSteps = 299;
Q = [0.04,0 ; 0,0.01];%model covariance
R = [4 0;0 1];%measurement covariance
Z = zeros(2,300); %measurment
turnOn = 0;%comand to turn on an off air conditioner
u_k = 0;%control input
P(:,:,1)= eye(2);%initialize estimate covariance to some big value
U_k = zeros(300,1);%hold command history
B = [-0.2,0]';%B
meanEstimateInternal = zeros(300,1);
varianceEstimate = zeros(300,1);
alpha =1;%contol the MC
beta  =1;%control the MC
mcP = [1-alpha,alpha;beta,1-beta];%markov chain transition matrix
state = 1;%start state of MC
Ztrue = zeros(2,300);
Xtrue = Ztrue;
Xtrue(:,1) = [23,20];
ZtrueNoConditioner = zeros(2,300);
XtrueNoConditioner = ZtrueNoConditioner;
XtrueNoConditioner(:,1) = [23,20];

for n=1:numberOfTimeSteps
    u_k = turnOn;
    U_k(n) = u_k;
    
    [Xtrue(:,n+1),Ztrue(:,n+1)] = get_measurment(Xtrue(:,n),u_k,n);%get measurement at constant rate        
    [XtrueNoConditioner(:,n+1),ZtrueNoConditioner(:,n+1)] = get_measurment(XtrueNoConditioner(:,n),0,n);%get measurement at constant rate
  
    if state==1%if in prediction state
            
        Xh(:,n+1)  = A*Xh(:,n) + [0;0.1*sin((2*pi/300)*n)] + B*u_k ; %prediction
        P(:,:,n+1) = A*P(:,:,n)*A' + Q;%predicted covariance
        state = discrete(mcP(state,:));%get next state
        fprintf('prediction\n');
        
    end
    while state==2%while measurment is available update
          
        %get measurement
        [Xtrue(:,n+1),Ztrue(:,n+1)] = get_measurment(Xtrue(:,n),u_k,n);%get measurement at constant rate
    
        [XtrueNoConditioner(:,n+1),ZtrueNoConditioner(:,n+1)] = get_measurment(XtrueNoConditioner(:,n),0,n);%get measurement at constant rate

        Z(:,n) = Ztrue(:,n) + [normrnd(0,4); normrnd(0,1)];
        
        
        K = P(:,:,n+1) * H' * ((H*P(:,:,n+1)*H' +R))^(-1);
        P(:,:,n+1) = (eye(2)-K*H)*P(:,:,n+1);
        Xh(:,n+1)= Xh(:,n+1)+K*(Z(:,n)-H*Xh(:,n+1));
        
        fprintf('fusion\n');
        state = discrete(mcP(state,:));

    end
    meanEstimateInternal(n) = Xh(1,n+1);
    varianceEstimate(n) = P(1,1,n+1);
    %if prob. temp>28 is >10%=0.1
    if qfunc((28-meanEstimateInternal(n))/sqrt(varianceEstimate(n)))>0.1
        turnOn = 1;
    else
        turnOn = 0;
    end
end


internalTempError = sqrt(P(1,1,:));%error matric
externalTempError = sqrt(P(2,2,:));
figure;
errorbar(1:300,Xh(1,:),internalTempError(:));
hold on;
%plot(Z(1,:));
%hold on;
plot(Xtrue(1,:),'r');
%plot(Ztrue(1,:),'b--');
plot(U_k(:,1));
title('Kalma n filter Internal Temperature');
xlabel('Time step')
ylabel('Temperature')
legend('Internal Temperature Estimate','True Internal Temperature.','Control Input');
figure;
plot(XtrueNoConditioner(1,:),'DisplayName','Actual internal temp. no air conditioner');
hold on;
plot(Xtrue(1,:),'DisplayName','Actual internal temp. with air conditioner');
plot(Xtrue(2,:),'DisplayName','Actual external temp.');
legend('show')

figure;
plot(Xtrue(1,:),'b');
hold on;
plot(Ztrue(1,:),'r');