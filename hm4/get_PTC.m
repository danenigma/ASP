function P_m = get_PTC(p,m,N)
P_s =  (1-(1-p)^m)^N;
P_f =  1-P_s;
P_m = P_s*(P_f^(m-1));
end 