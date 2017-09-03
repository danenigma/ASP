N = 100;
P = [0.3 0.7 0;0.1 0.4 0.5;1 0 0];
start  = 1;%state 0
ending = 3;%state 2
[R,ch] = chapmanKolmogorov(P,N,start,ending);
ch = ch(:);
plot(ch);
xlabel('number of steps(n)');
ylabel('Prob. 0->2 after n steps')