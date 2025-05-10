%{
AME 201
Statics Final Project
Natalia Hopper, nhopper@usc.edu
Joanna Myint, ____@usc.edu

History:
Date            Programmer          Changes
--------------------------------------------------------
04/30/2025      Natalia Hopper      Base Code, disclaimer
04/30/2025      Natalia Hopper      Rectangle Calculation 
04/30/2025      Joanna Myint        Triangle Calculation
05/10/2025      Natalia Hopper      Triangle Graphing, Final fixes
%}
clear; clc; close all;
%% Disclaimer
disp('Please only input rectangles, squares, or right triangles')
disp('Additionally, input the vertices in the order that you would connect')
disp('them if you were playing connect the dots!')
disp('Thank you!')

%% Base code
% Polygon vertices collection, polygon graphing, case determination

% Ask for number of polygon vertices
n = input('How many vertices does you polygon have?');
if n <3
    error('That is not a triangle or rectangle')
elseif n==3
    polyCase = 1;
elseif n==4
    polyCase = 2;
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

%% Case 1: Input = 3 --> Right Triangle
if polyCase == 1
    % define the base and height
    b = xMax - xMin;
    h = yMax - yMin;

    % define 4 types of right triangles:
    % dependent on x-vertices: one with right angle on the left and the other on the right
    % dependent on y-vertices: "base" is on top vs. on bottom

    xSum = sum(x);
    ySum = sum(y);
    
    % X-Dependent cases:
    % case 1: right angle on the left (2*xMin + xMax)
    if xSum == 2 * xMin + xMax
        xBarTriangle = b / 3 + xMin;
        % case 2: right angle on the right (xMin + 2*xMax)
    elseif xSum == xMin + 2 * xMax
        xBarTriangle = (2 / 3) * b + xMin;
    end

    % Y-Dependent cases:
   if ySum == 2 * yMin + yMax
        yBarTriangle = h / 3 + yMin;
        % case 2: base is at top of triangle ("upside-down")
    elseif ySum == yMin + 2 * yMax
        yBarTriangle = 2*h / 3 + yMin;
    end 

    % Display centroid:
    fprintf('The Centroid of the Right Triangle is (%.2f, %.2f)\n', xBarTriangle, yBarTriangle);

    % calculate MOI of triangle
    moixTriangle = (1 / 36) * b * h^3;
    moiyTriangle = (1 / 36) * b^3 * h;

    fprintf('Ix = %.2f\n', moixTriangle);
    fprintf('Iy = %.2f\n', moiyTriangle);

    % Plot centroid
    plot (xBarTriangle, yBarTriangle, 'ko', 'MarkerFaceColor', 'r')
    hold on

    % Plot Centroidal Axes
    % X-centroidal Axis:
    xCentroidalRange = [yMin-5,yMax+5];
    plot([xBarTriangle,xBarTriangle],xCentroidalRange,'--')
    % Y-centroidal Axis
    yCentroidalRange = [xMin-5,xMax+5];
    plot(yCentroidalRange,[yBarTriangle,yBarTriangle],'--')
    xlabel('X-Axis')
    ylabel('Y-Axis')
    title('Polygon, Centroid, and Centroidal Axes')

elseif polyCase == 2
    %% Case 2: Input = 4 --> Rectangle
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
    xlabel('X-Axis')
    ylabel('Y-Axis')
    title('Polygon, Centroid, and Centroidal Axes')

    %Display Moments of Inertia
    fprintf('Moment of Inertia about x-centroidal axis: %.2f\n',moix)
    fprintf('Moment of Inertia about y-centroidal axis: %.2f\n',moiy)


end
