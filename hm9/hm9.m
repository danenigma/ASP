clear;
clc;
P = [0.9,0.1;0.1,0.9];
O = [0.5,0.5;0.9,0.1];

%Bored = 1;
%Engaged = 2
%Correct = 1
%Wrong = 2


[states,observables] = simMC(50,P,O);


display_states(states);
display_observables(observables);

[edgeWeights,VX,stateS,HMMestimate] = create_graph(P,O,observables,50,[0.5;0.5]);
display_states(HMMestimate);
accuracy = 100*(sum(HMMestimate==states)/50);
fprintf('Accuracy of HMM estimate:%2.2f percent\n',accuracy);
figure
bar([observables' states' HMMestimate'], 0.5, 'stack');
xlabel('steps')
legend('Observables', 'True States', 'HMM estimate');