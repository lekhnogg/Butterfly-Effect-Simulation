function [newVel,newPos,newAcc] = getNew(pos,vel,acc,dt,par)
% Retrieve setup variables
par = setup();
% Get new relative positions
newPos = pos + vel.*dt + acc.*(dt*dt*0.5);

% Check max bounds and update pos and vel
dX=newPos-par.XMax;
indexBouncemax=dX > 0;
newPos(indexBouncemax)=par.XMax(indexBouncemax)-dX(indexBouncemax);
vel(indexBouncemax)=-vel(indexBouncemax); 

% Check min bounds and update pos and vel
dM=par.XMin-newPos;
indexBouncemin=dM > 0;
newPos(indexBouncemin)=newPos(indexBouncemin)+dM(indexBouncemin);
vel(indexBouncemin)=-vel(indexBouncemin); 

% Calculate new velocity and acceleration
newVel = vel + (acc).*(dt*0.5);
newAcc = calcAcc(par.r0,par.F0,par.rad,par.alpha,newPos);

end

