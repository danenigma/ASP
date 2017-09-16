function Yn = computeGCLT(X,Mean,Var)
    Yn = (sum(X)-sum(Mean))/sqrt(sum(Var));
end