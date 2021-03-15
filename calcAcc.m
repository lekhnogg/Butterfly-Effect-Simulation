function acc = calcAcc(r0,F0,rad,alpha,pos)
% Establish variable for NaN prevention (Ball interacting with itself)
eps = 1e-12;

% Retrieve distances
[dx,dy,dist] = checkDist(pos);
% Choose Required Kernel Implementation (Uncomment and replace lines 21,22)
% Softened power-law force law 
 Ks = F0./((dist).^(alpha)+ rad^alpha);
% Softened finite-range power-law forces.%
% Kf = F0.*max(0,1./(rad^alpha+dist.^alpha)-1/(2*rad^alpha));
% Unsoftened finite-range power-law forces.
% Ku = F0.*max(0, 1./dist.^alpha-1/(rad^alpha));



% Restrict updating acceleration to certain proximity 
constAcc = (dist<(r0*rad)).*dist;
restAcc = (dist>(r0*rad)).*dist;
% Update normalized acceleration
ax = (dx.*restAcc)+(dx.*(constAcc).^(-1)).* Ks;
ay = (dy.*restAcc)+(dy.*(constAcc).^(-1)).* Ks;

% Avoid NaN 
ax(constAcc<eps) = 0;
ay(constAcc<eps) = 0;

% Collect and return net accelerations in both directions
acc = [sum(ax,2) sum(ay,2)];
end
    