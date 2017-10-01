x = -10:.01:10;
a = 0.5;
p = 0.1;
f_x_given_0   =  normpdf(x,-a,1);
cdf_x_given_0 =  normcdf(x,-a,1);%probability of correct detection
f_x_given_1   =  normpdf(x,a,1);
cdf_x_given_1 =  normcdf(x,a,1);%probability of false alarm
MAPDecisionBoundary = (1/(2*a))*log((1-p)/p); 
MLEDecisionBoundary = 0;

figure;
plot(x,f_x_given_0,'DisplayName','f(r|0)');
title(strcat('Received signal = s + N(0,1) where s = 0.5 for 1 and s =-0.5 for 0 p=',num2str(p)));
xlabel('r');
hold on;
plot(x,f_x_given_1,'--','DisplayName','f(r|1)');

verticalLineY = 0:0.1:0.4;
verticalLineX = MAPDecisionBoundary*ones(1,length(verticalLineY));
plot(verticalLineX,verticalLineY,'--','DisplayName','MAP Decision Boundary');
verticalLineX = MLEDecisionBoundary*ones(1,length(verticalLineY));
plot(verticalLineX,verticalLineY,'DisplayName','MLE Decision Boundary');
ylim([0,0.6]);
legend('show');
figure;
hold on;
plot(cdf_x_given_1,cdf_x_given_0);
hold on;
xlabel('PFA');
ylabel('PCD');
title('ROC');

