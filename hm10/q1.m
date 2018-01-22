1-pascalCdf(3,1/36,250)
pascal(3,1/36,250)
function cdf = pascalCdf(k,p,x)
    cdf = 0;
    for i=k:x
        cdf = cdf + pascal(k,p,i);
    end
end
function val = pascal(k,p,x)
val = nchoosek(x-1,k-1)*(p^k)*(1-p)^(x-k);
end