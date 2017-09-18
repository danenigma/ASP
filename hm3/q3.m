DEBUG = 1;
N = 200;%time steps
State0 = 1;
lamda = 0.1;
mu = 0.001:0.001:0.01; % 10% mu
%mu = 0.02:0.01:0.2;     % 1% mu
low_load_mu = 0;
BUFFER_SIZE = 10;
percentage = 10;
MU_FOUND = 0;
for i=1:length(mu)
    P = get_stochastic_matrix(BUFFER_SIZE,lamda,mu(i));
    StateTrans = simMC(N,State0,P);
    lost_packets = mean(StateTrans==(BUFFER_SIZE+2))*100;%loss of packets
    if DEBUG
    fprintf('mu %0.4f buffer size %i lost packets %4.4f percent\n',mu(i),BUFFER_SIZE,lost_packets);
    end
    if lost_packets>percentage
    %if lost_packets<percentage
        low_load_mu = mu(i);
        MU_FOUND = 1;
        if DEBUG
            fprintf('mu %0.3f satisfies loss value of %i percent with packet loss of %4.4f\n',...
            mu(i),percentage,lost_packets);
        end
     
            
    end
end
if MU_FOUND
    % Some stat before modifying StateTrans
    
    StateTrans(StateTrans==(BUFFER_SIZE+2))=BUFFER_SIZE+1;% dropped == full
    Avg_Number_Of_Packets   = mean(StateTrans);
    Fraction_Of_Time_BEmpty = mean(StateTrans==1);
    Fraction_Of_Time_BBlocked = lost_packets/100;
    result = fopen('result_b.txt','w');
    fprintf(result,' Average Number of packets in Buffer: %2.2f \n Fraction of time the buffer is empty: %2.2f\n',...
       Avg_Number_Of_Packets,Fraction_Of_Time_BEmpty);
    fprintf(result,' The fraction of packet Arrivals that are blocked %2.4f\n',Fraction_Of_Time_BBlocked);
    fprintf(result,'\n MU:%2.2f\n Buffer Size: %i\n Lamda:%1.2f\n Number of Steps:%i\n Packet Loss:%2.2f percent\n',...
        low_load_mu,BUFFER_SIZE,lamda,N,lost_packets);
        StateTrans = StateTrans-1;% get rid of the bias so that it starts at state 0
    fclose(result);
    stem(1:N,StateTrans,'filled');
    xlabel('Time Steps');
    ylim([0 10]);
    ylabel('Number of packtes in Buffer');   
else
    fprintf('appropriate mu not found try again!!\n')
end
