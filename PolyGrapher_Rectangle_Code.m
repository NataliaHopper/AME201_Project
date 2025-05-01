%% Case 2: Input = 4 --> Rectangle inputted
% Find x-centroid location
xCenter = (xMax+xMin)/2 ;
% Find y-centroid location
yCenter = (yMax+yMin)/2 ;

% Centroid Coordinate
plot(xCenter,yCenter, 'ko','MarkerSize',8,'MarkerFaceColor','r')
hold on

% Moment about x-centroidal axis
% moix = b*h^3/12
moix = ((xMax-xMin)*(yMax-yMin)^3)/12;
% Moment about y-centroidal axis
% moiy = b^3*h/12
moiy = ((xMax-xMin)^3 *(yMax-yMin))/12;

% Plot centroidal axes
% x' axis
xRange = [yMin-5,yMax+5];
plot([xCenter xCenter],xRange,'--')
hold on

% y' axis
yRange = [xMin-5,xMax+5];
plot(yRange,[yCenter yCenter],'--')

%Display Moments of Inertia
fprintf('Moment of Inertia about x-centroidal axis: %.2f\n',moix)
fprintf('Moment of Inertia about y-centroidal axis: %.2f\n',moiy)
