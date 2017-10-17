alpha = 0.2;
beta = 1;
P = [1-alpha,alpha;1-beta,beta];
state = 1;
for i=1:10
state = discrete(P(state,:));%predict the next state
end