% Octave (Matlab) script to generate a spaghetti plot for the Lorenz 63 system
% We'll use LSODE to solve the ODE system.
lsode_options("absolute tolerance",1e-3)
lsode_options("relative tolerance",1e-4)
% Initialize time vector and solution vector
Tmax=15;
Nt = Tmax*10;
t = linspace(0,Tmax,Nt);
% Initialize solution storage matrices for the ensemble
ensemble_size = 20;
X = zeros(ensemble_size,Nt);
Y = zeros(ensemble_size,Nt);
Z = zeros(ensemble_size,Nt);
% Generate initial condition at random position near origin
X0 = randn(1,3)*sqrt(5);
% Generate ensemble of solutions with initial conditions 
% in a neighborhood of X0 and save their trajectories
for i=[1:ensemble_size]
    X1 = X0 + randn(1,3)*sqrt(0.1);
    [V,T,MSG] = lsode(@lorenz63,X1,t);
    X(i,:) = V(:,1);
    Y(i,:) = V(:,2);
    Z(i,:) = V(:,3);
end
% Make spaghetti plot of all trajectories using the X variable versus time.
% We highlight one trajectory in red for easier visual tracking.
f=figure;
plot([0:Nt-1]/Tmax,Y(2:ensemble_size,:)','k','linewidth',1,[0:Nt-1]/Tmax,Y(1,:)','r','linewidth',2)
xlabel('time t');
ylabel('x(t)');
title('Trajectories of nearby initial conditions in L63 system')
% Save figure as PDF
drawnow
%print('l63spaghetti','-dpng')
