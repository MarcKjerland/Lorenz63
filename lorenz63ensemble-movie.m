% This generates a sequence of PNG images showing the evolution
%  of an ensemble evolving under the influence of a dynamical system,
%  in this case a 3-dimensional ODE given by the Lorenz 63 system.
%
% The viewpoint slowly rotates in time to provide additional
%  satisfaction for the human spectator.
%
% (Note that the physical interpretation of the Lorenz system is not
%  a point moving through 3-space but rather a simple quasi-physical 
%  system defined by 3 variables which evolves in time. However, "3" 
%  is a convenient number of variables for human-friendly visualization.)
%
% The image files can be converted to a movie using ffmpeg:
% ffmpeg -r 20 -i pix/lorenz%04d.png -vcodec ffv1 -sameq pix/lorenz_ensemble.avi

% We will use LSODE (Octave) to solve the ODE system.
lsode_options("absolute tolerance",1e-3)
lsode_options("relative tolerance",1e-4)

% Setting up the ensemble
ensemble_size = 600;
Nt = 600;
t = linspace(0,10,Nt);
X = zeros(ensemble_size,Nt);
Y = zeros(ensemble_size,Nt);
Z = zeros(ensemble_size,Nt);

% Generate initial conditions for each ensemble member
%  and save a long trajectory under the flow of the
%  dynamical system
for i=[1:ensemble_size]
    X0 = [-50+100*rand(),-50+100*rand(),-50+100*rand()];
    [V,T,MSG]=lsode(@lorenz63,X0,t);
    X(i,:) = V(:,1);
    Y(i,:) = V(:,2);
    Z(i,:) = V(:,3);
end

% Generate plots of all ensemble members at snapshots in time
f=figure;
set(f,'visible','on')
mycolors = rand(ensemble_size,3);
for i=[1:Nt]
    scatter3(X(:,i),Y(:,i),Z(:,i),2,mycolors,'filled')
    xlabel('x'); ylabel('y'); zlabel('z')
    axis([-20 20 -30 30 0 50]);
    view(mod(40+360*i/Nt,360),10);
    %title("Lorenz '63");
    filename=sprintf('pix/lorenz%04d.png',i);
    drawnow
    print(filename);
end
