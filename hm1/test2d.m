N = 100;
P = [0.3 0.7 0;0.1 0.4 0.5;1 0 0];
start  = 3;
ending = 3;
[R,ch] = chapman(P,N,start,ending);
ch = ch(:);
plot(ch);