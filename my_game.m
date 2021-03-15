function initBil = my_game()
clc;
clf;
rng('shuffle')
% Retrieve setup variables
par = setup();
% Initiate the simulation
sim = initSim(par);
% Variables for collection of data for report
%ranG = (par.tMax/par.plotTime);
%colDat = []

% Video Output Functions
% Creating figure
%positionFig = figure('Name','Ks');

% Create video writer for saving the animation
%plotVideo = VideoWriter('Ks');
% Choose a frame rate
%plotVideo.FrameRate = 20;
% Open the video writer
%open(plotVideo);


% Start counting
for t=0:par.plotTime:par.tMax
    
    % Update all variables across all games
    for i = 1:par.NGames
        [sim(i).v, sim(i).p, sim(i).a] = getNew(sim(i).p,sim(i).v,sim(i).a,par.dt,par); 
    end
    
    % Count sim time
    sim(1).t = sim(1).t + par.plotTime;
    
    % Create subplot for the divergence graph
    ax1 = subplot(2,1,2);
    xlabel(ax1,'Time (s)','FontSize',7,'FontWeight','bold')
    ylabel(ax1,'Log{_e} of Position Divergence','FontSize',7,'FontWeight','bold')
    % Get divergence values
    leVar = plotVar(sim,par);
    %colDat = [colDat;t log(leVar.X+1)];
    %colDat((log(leVar.X+1)),sim(1).t,xx,tt,par);
    % Plot the ln(divergence) as a function of time
    plot(ax1,sim(1).t,log(leVar.X+1),'.','Color',[0.321 0.321 0.321]);
    axis([0 par.tMax 0  par.yLim]);
    hold on
    
    % Create subplot for the bouncing balls
    
    ax2 = subplot(2,1,1);
    title(ax2,'Butterfly Effect Simulation','FontSize',8,'FontWeight','bold');
    for i = 1:par.NGames
        plot(ax2,sim(i).p(:,1),sim(i).p(:,2),'O','color',sim(i).c);
        axis([0 1 0 1]);
        hold on
    end
    hold off
    
    drawnow;
    %writeVideo(plotVideo,getframe(positionFig))
    
    
end
%close(plotVideo)
%max(colDat(:,2))
end
