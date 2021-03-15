function par = setup;
% Set model Parameters

% # of Games
par.NGames = 15;
% Variance
par.eps = [1e-12,1e-12];
% Max time
par.tMax = 0.5;
% number of balls
par.N = 25;
% initial velocity scale 
par.v0 = 0.1;
% time step
par.dt = 0.01;
% Table size parameters
par.XMax = ones(par.N,2);
par.XMin = zeros(par.N,2);
% distance between balls force interaction
par.forFcn = @inv_rsq;
% exponent in inverse sq.
par.alpha = 5/2;
% Global force magnitude variable
par.F0 = 0.01;
% Multiplicity limit for balls proximity
par.r0 = 3;
% Produce plot timestep;
par.plotTime = 2.5e-3;
% Global radius
par.rad = 0.01;
% Divergence axes limit
par.yLim = 3.5;

end


