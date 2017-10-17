clear s
s.x = [25,25];
s.A = [0.95,-0.05;0,1];
% Define a process noise (stdev) of 2 volts as the car operates:
Q = [0.2;0.1];
s.Q = Q*Q'; % variance, hence stdev^2

% Define the voltimeter to measure the voltage itself:
s.H = eye(2);
% Define a measurement error (stdev) of 2 volts:
R = [2;1];
s.R = R*R'; % variance, hence stdev^2
% Do not define any system input (control) functions:
s.B = 0;
s.u = 0;
% Do not specify an initial state:
s.x = nan;
s.P = nan;
% Generate random voltages and watch the filter operate.
tru=[]; % truth voltage
for t=1:20
   tru(end+1) = randn*2+25;
   s(end).z = tru(end) + randn*2; % create a measurement
   s(end+1)=kalmanf(s(end)); % perform a Kalman filter iteration
end
figure
hold on
grid on
% plot measurement data:
hz=plot([s(1:end-1).z],'r.');
% plot a-posteriori state estimates:
hk=plot([s(2:end).x],'b-');
ht=plot(tru,'g-');
legend([hz hk ht],'observations','Kalman output','true voltage',0)
title('Automobile Voltimeter Example')
hold off
legend('show')