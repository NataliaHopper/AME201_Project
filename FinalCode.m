%{
AME 201
Statics Final Project
Natalia Hopper, nhopper@usc.edu
Joanna Myint, ____@usc.edu

History:
Date            Programmer          Changes
--------------------------------------------------------
04/30/2025      Natalia Hopper      Original
04/30/2025      Joanna Myint        Original
%}

clear; clc; close all;

% Ask for number of polygon vertices
n = input('How many vertices does you polygon have?');
if n <3
    error('That is not a triangle or rectangle')
elseif n>4
    error('That is not a triangle or rectangle')
end

% Preallocate values to fill with user input
x = zeros(1,n);
y = zeros(1,n);

% Collect all vertices coordinates via user input
for i = 1:n
    fprintf('For vertex %d,\n',i)
    coords = input('Input the coordinates in [x,y] format: ');
    x(i) = coords(1);
    y(i) = coords(2);
end

% Create the Polygon
pgon = polyshape(x,y); %Remove semicolon to view polygon properties

% Plot the Polygon
figure(1)
plot(pgon)
hold on
grid on

% Find max and min values of the coordinates
xMax = max(x);
yMax = max(y);
xMin = min(x);
yMin = min(y);

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

