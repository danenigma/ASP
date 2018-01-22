clear;
clc;
VM = zeros(3,4);
VM(1,4) = 1;
VM(2,4) = -1;
VM(2,2) = -10;
VM
for i=1:11
    disp(i)
[VM,policy] = update_mdp(VM)
end


