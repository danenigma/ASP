Mahogany = xlsread('Mahogany.csv');
Bamboo   = xlsread('Bamboo.csv');
%(a)
%****************************************************************
figure;
plot(Mahogany(:,1),Mahogany(:,2),'o','DisplayName','Mahogany');
hold on;
plot(Bamboo(:,1),Bamboo(:,2),'x','DisplayName','Bamboo');

% legend('show');
% title('Mahogany and Bamboo with two features');
% xlabel('x');
% ylabel('y')

%figure;
%hist(Mahogany(:,2),30);

%****************************************************************
%(b)
%****************************************************************
%Prior probabilities
totalNumberOfDataPoints = length(Mahogany)+length(Bamboo);
P_M = length(Mahogany)/totalNumberOfDataPoints;
P_B = length(Bamboo)/totalNumberOfDataPoints;
%mean values
Mahoganyx = Mahogany(:,1);
Mahoganyy = Mahogany(:,2);
Bamboox   = Bamboo(:,1);
Bambooy   = Bamboo(:,2);

muMx = mean(Mahoganyx);
muMy = mean(Mahoganyy);
muBx = mean(Bamboox);
muBy = mean(Bambooy);


sigMx = var(Mahoganyx);
sigMy = var(Mahoganyy);
sigBx = var(Bamboox);
sigBy = var(Bambooy);

muM = [muMx;muMy];
muB = [muBx;muBy];

sigM = [sigMx;sigMy];
sigB = [sigBx;sigBy];
%covariance matrix
KM  = cov(Mahoganyx,Mahoganyy);
KB  = cov(Bamboox,Bambooy);
%****************************************************************
%(c)
%****************************************************************
Mahoganyrho = corrcoef(Mahoganyx,Mahoganyy);
Mahoganyrho = Mahoganyrho(1,2);

Bamboorho = corrcoef(Bamboox,Bambooy);
Bamboorho = Bamboorho(1,2);

MahoganyLE = muMy + Mahoganyrho*sqrt(sigMy/sigMx)*(Mahoganyx-muMx);
BambooLE = muBy + Bamboorho*sqrt(sigBy/sigBx)*(Bamboox-muBx);

MahoganyLESlope  = Mahoganyrho*sqrt(sigMy/sigMx);
MahoganyLEIntercept  = muMy-Mahoganyrho*sqrt(sigMy/sigMx)*muMx;
BambooLESlope  = Bamboorho*sqrt(sigBy/sigBx);
BambooLEIntercept  = muBy-Bamboorho*sqrt(sigBy/sigBx)*muBx;

fprintf('Mahogany Linear Estimator Slope: %2.2f y-intercept: %2.2f \n'...
    ,MahoganyLESlope,MahoganyLEIntercept);
fprintf('Bamboo Linear Estimator Slope: %2.2f y-intercept: %2.2f \n'...
    ,BambooLESlope,BambooLEIntercept);

hold on;
plot(Mahoganyx,MahoganyLE,'DisplayName','Mahogany Linear Estimate');
hold on;
plot(Bamboox,BambooLE,'--','DisplayName','Bamboo Linear Estimate');

%****************************************************************
%(d)
%****************************************************************
%fisher's Linear Discriminate Vector
Kw = KM + KB;
a = inv(Kw)*(muM-muB);
projVectorSlope = a(2)/a(1);
projx = -4:0.1:4;
projy = projx*projVectorSlope;

plot(projx,projy,'DisplayName','Fishers Discriminant vector');
legend('show');
title('Mahogany and Bamboo with two features');
xlabel('x');
ylabel('y');
hold off;
%****************************************************************
%(e)
%****************************************************************
%z-space
Mahoganyz = a'*[Mahoganyx,Mahoganyy]';
Bambooz = a'*[Bamboox,Bambooy]';

figure;
plot(Mahoganyz,zeros(length(Mahoganyz),1),'o','DisplayName','Mahogany');
hold on;
plot(Bambooz,zeros(length(Bambooz),1),'x','DisplayName','Bamboo');
title('Mahogany and Bamboo in z-space')
xlabel('Z');
legend('show');


%****************************************************************
%(f)
%****************************************************************
%prior Prob.
totalProbInZSpace = length(Mahoganyz)+length(Mahoganyz);
P_M_z =  length(Mahoganyz)/totalProbInZSpace;
P_B_z = length(Bambooz)/totalProbInZSpace;
%mean Values
mM = mean(Mahoganyz);
mB = mean(Bambooz);
%standard deviation
sdM = sqrt(var(Mahoganyz));
sdB = sqrt(var(Bambooz));
%simple classifier always say Mahogany
%****************************************************************
%(g)
%****************************************************************
mMProj = a'*muM;
sigMProj = a'*KM*a;

mBProj = a'*muB;
sigBProj = a'*KB*a;

fprintf('mM: %2.2f mMProj: %2.2f \n',mM,mMProj);
fprintf('mB: %2.2f mBProj: %2.2f \n',mB,mBProj);

fprintf('sigM: %2.2f mMProj: %2.2f \n',sdM^2,sigMProj);
fprintf('sigB: %2.2f mBProj: %2.2f \n',sdB^2,sigBProj);
%****************************************************************
%(h)
%****************************************************************
x = -10:0.1:10;
MahoganyApprox = normpdf(x,mM,sdM);
BambooApprox = normpdf(x,mB,sdB);
figure;
plot(Mahoganyz,zeros(length(Mahoganyz),1),'o','DisplayName','Mahogany');
hold on;
plot(Bambooz,zeros(length(Bambooz),1),'x','DisplayName','Bamboo');
plot(x,MahoganyApprox*P_M_z,'b','DisplayName','Mahogany P(Z|M)P(M)');
hold on;
plot(x,BambooApprox*P_B_z,'r','DisplayName','Bamboo   P(Z|B)P(B)');

%****************************************************************
%(i)
%****************************************************************
%ax^2+bx+c>0 map decision boundary
a = (1/sigBProj-1/sigMProj);
b = -2*(mBProj/sigBProj-mMProj/sigMProj);
c = (mBProj^2/sigBProj-mMProj^2/sigMProj)+log((P_M_z*sigBProj)/(P_B_z*sigMProj));
MapDecsionBoundaryOne = (-b - sqrt(b^2-4*a*c))/(2*a);
MapDecsionBoundaryTwo = (-b + sqrt(b^2-4*a*c))/(2*a);
%plot([MapDecsionBoundaryTwo,MapDecsionBoundaryTwo],[0,0.21],'DisplayName','First  MAP Decision Boundary');
%plot([MapDecsionBoundaryOne,MapDecsionBoundaryOne],[0,0.21],'DisplayName','Second MAP Decision Boundary');
xlabel('Z');
legend('show');
PBB = sum(Bambooz<MapDecsionBoundaryTwo)+sum(Bambooz>MapDecsionBoundaryOne);
PBM = sum(Mahoganyz<MapDecsionBoundaryTwo) + sum(Mahoganyz>MapDecsionBoundaryOne);
PMB = sum(Bambooz>MapDecsionBoundaryTwo)-sum(Bambooz>MapDecsionBoundaryOne);
PMM = sum(Mahoganyz>MapDecsionBoundaryTwo)-sum(Mahoganyz>MapDecsionBoundaryOne);
result = [PBB,PMB;PMB,PMM]./totalNumberOfDataPoints;
fprintf('error rate: %2.2f \n',1-sum(diag(result)));
%with the gaussian approximation
PMMG  = (qfunc((MapDecsionBoundaryTwo-mMProj)/sdM)-qfunc((MapDecsionBoundaryOne-mMProj)/sdM))*(2/3); 
PBBG  = (1-qfunc((MapDecsionBoundaryTwo-mBProj)/sdB)+qfunc((MapDecsionBoundaryOne-mBProj)/sdB))*(1/3); 
PMBG  = ((qfunc((MapDecsionBoundaryTwo-mBProj)/sdB)- qfunc((MapDecsionBoundaryOne-mBProj)/sdB)))*(1/3);
PBMG  = ((1-qfunc((MapDecsionBoundaryTwo-mMProj)/sdM)+ qfunc((MapDecsionBoundaryOne-mMProj)/sdM)))*(2/3);
resultG = [PBBG,PMBG;PMBG,PMMG];



