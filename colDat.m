function pertDat = colDat(X,T,xx,tt,par)
% Function used to collect dispersion data
ranG = (par.tMax/par.plotTime);

for i = 1:ranG
    xx(i,:) = X;
    tt(i,:) = T;
end
[X,T]
end