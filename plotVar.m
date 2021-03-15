function leVar = plotVar(sim,par)
% Establish first pos,vel values in four matrices
% varx = zeros(par.N,par.NGames)
% vary = zeros(par.N,par.NGames)
% varvx = zeros(par.N,par.NGames)
% varvy = zeros(par.N,par.NGames)

varx = sim(1).p(:,1);
vary = sim(1).p(:,2);
varvx = sim(1).v(:,1);
varvy = sim(1).v(:,2);

% Collect the rest of the simulations data
for i = 2:par.NGames;
   varx = [varx,sim(i).p(:,1)];
   vary = [vary,sim(i).p(:,2)];
   varvx = [varvx,sim(i).v(:,1)];
   varvy = [varvy,sim(i).v(:,2)];
end;

% Calculate all variances and store in matrix (for sake of organization)
varMat = [var(varx').' var(vary').' var(varvx').' var(varvy').'];

% Retrieve total variances in positions
leVar.X =sqrt(sum(varMat(:,1)+varMat(:,2)));

% Retrieve total variances in velocities
%leVar.V =sqrt(sum(varMat(:,3)+varMat(:,4)))






end
%dp = [sum(sim(1).p(:,1)) sum(sim(1).p(:,2))];
%dv = [sum(sim(1).v(:,1)) sum(sim(1).v(:,2))];

%for i = 2:par.NGames;
%    dp = [dp; sum(sim(i).p(:,1)) sum(sim(i).p(:,2))];
%    dv = [dv; sum(sim(i).v(:,1)) sum(sim(i).v(:,2))];

%end;

%leVar.X=sqrt(sum(var(dp(:,1)))+var(dp(:,2)));
%leVar.V=sqrt(sum(var(dv(:,1)))+var(dv(:,2)));
%figure(2)
%axis([0 2 0 2]);
%plot(log(1+sim(1).t),(leVar.X),'.','Color',[0.321 0.321 0.321]);
%plot(sim(1).t,leVar.V,'.','Color',[0 0 0]);
%hold on
%drawnow;