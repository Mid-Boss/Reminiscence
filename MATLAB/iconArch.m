% iconArch.m - Using user-specified parameters, prints out icon statements
% for a parabolic icon path to use in custom skill sets

clc
clear all
close all

% Image name
img = 'plantain';

% Initial (i), middle (m), and final (f) x and y coordinates
x.i = 0;
y.i = 0;
x.m = -80;
y.m = -120;
x.f = -300;
y.f = -600;

% Initial and final rotation angle (deg)
r.i = 0;
r.f = 360*3;

% Number of steps (this will be the number of 'icon' lines)
n = 30;

% ---------- End User Input ---------- %
% Construct linear system and solver for a, b, c (using y = ax^2 + bx + c)
xmat = [x.i^2, x.i, 1;
        x.m^2, x.m, 1;
        x.f^2, x.f, 1];
ymat = [y.i; y.m; y.f];
coeffs = xmat\ymat;
a = coeffs(1);
b = coeffs(2);
c = coeffs(3);

% Anonymous function for parabola
fun = @(X) a*X^2 + b*X + c;

% Generate points on parabola
xlin = linspace(x.i,x.f,n)';
stuff(:,1) = xlin;
for i=1:n
    stuff(i,2) = fun(xlin(i));
end

% Rotation points
rot = linspace(r.i,r.f,n)';
stuff(:,3) = rot;

% Print results to command window
fprintf('Copy-paste this stuff into the VE-Side battle script\n\n');
for i=1:n
    fprintf(['    icon: self, image ''',img,''', angle ',num2str(round(stuff(i,3))),...
        ', x ',num2str(round(stuff(i,1))),', y ',num2str(round(stuff(i,2))),';\n']);
end
fprintf('\n')
