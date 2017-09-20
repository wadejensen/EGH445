% note that these constants are samples only, 
% and should be MEASURED off the actual robot
m = ((80170 * 2) + (4230 * 2) + 147900 + (3300 * 10)) * 10^-6;   % mass of the robot
M = 2*0.006;  % mass of the wheel

J = 1e-6;  % inertia of the wheel
L = 0.1;    % distance from the wheel to the center of mass
r = 0.03;  % wheel radius