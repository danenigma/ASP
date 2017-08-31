N =1000;
Number_of_states = 3;
start_state = 1;
P = [0.3 0.7 0;0.1 0.4 0.5;1 0 0];
Y = zeros(N,Number_of_states);

for i=1:N
    Y(i,:)=get_frac_dist(simMC(i,start_state,P),Number_of_states);
end

x =(1:N);
scatter(x,Y(:,1),'d');
hold on;
scatter(x,Y(:,2),'o');
scatter(x,Y(:,3),'x');
hold off;
legend('state1','state2','state3');
xlabel('n(number of steps)');
ylabel('fraction of time spent')
