function sim = initSim(par)
clc;
% Retrieve setup variables
par = setup();
sim(1).t = 0;
% Initialize random positions between 0 and 1 (Nx2 array)
pos = rand(par.N,2);
% Initialize random velocities between 0 and 1 (Nx2 array)
vel = par.v0*randn(par.N,2);
% Get accelerations 
acc = calcAcc(par.r0,par.F0,par.rad,par.alpha,pos);

% Initialize first simulation, and work off of that
sim(1).c = rand(1,3);
sim(1).p = pos;
sim(1).v = vel;
sim(1).a = acc;

% Initialize NGames-1 simulations with perturbations
for i = 2:par.NGames
    sim(i).c = rand(1,3);
    sim(i).p = sim(1).p + ((sim(1).p).*(par.eps.*randn(par.N,2)));
    sim(i).v = sim(1).v + ((sim(1).v).*(par.eps.*randn(par.N,2)));
    sim(i).a = calcAcc(par.r0,par.F0,par.rad,par.alpha,sim(1).p);

end

end
    
    
  







