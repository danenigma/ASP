m = 1:20;
cummulativeOutput = zeros(1,length(m));
AllOutput = zeros(1,length(m));
N = 10;
p=0.9;
for i=1:length(m)
cummulativeOutput(i) = get_prob_success(p,m(i),N);
AllOutput(i) = p^N;
end
figure;
plot(cummulativeOutput);
hold on;
plot(AllOutput);

