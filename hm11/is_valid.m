function res = is_valid(row,col)

V_M = zeros(3,4);
V_M(1,4) =  1;
V_M(2,4) = -1;
V_M(2,2) = -10;
if (row>0 && col>0)
    if (row<=3 && col<=4 && V_M(row,col)~=-10)
        res = 1;
    else
        res = 0;
    end
else
    res = 0;
end
end