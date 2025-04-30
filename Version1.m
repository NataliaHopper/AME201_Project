%{
AME 201
Statics Final Project
Natalia Hopper, nhopper@usc.edu
Joanna Myint, ____@usc.edu

History:
Date            Programmer          Changes
--------------------------------------------------------
04/30/2025      Natalia Hopper      Original

%}

clear; clc; close all;

% Ask for number of polygon vertices
n = input('How many vertices does you polygon have?');

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
grid on



