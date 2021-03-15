function [dx,dy,dist] = checkDist(pos,rad,N);

% Check distances between balls
dx = pos(:,1) - pos(:,1)';
dy = pos(:,2) - pos(:,2)';
dist = (dx.^(2) + dy.^(2)).^(1/2);
% Return separate and radial distances 

end






