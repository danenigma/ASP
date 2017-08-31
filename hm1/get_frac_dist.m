function frac_dist = get_frac_dist(state_tans,number_of_states)
frac_dist = zeros(1,number_of_states);
N = size(state_tans);
N = N(2);

for i=1:number_of_states
 frac_dist(i)= sum(state_tans==i);
end
frac_dist = frac_dist/N;
end
