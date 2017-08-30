% note that these constants are samples only, 
% and should be MEASURED off the actual robot
m = 0.1;   % mass of the robot
M = 0.01;  % mass of the wheel
J = 1e-6;  % inertia of the wheel
L = 0.2;    % distance from the wheel to the center of mass
r = 50e-3;  % wheel radius

step_time = 1e-1;

params = segway();

[A, B] = linearize(params);

C = [ 1 0 0 0 ; 0 0 1 0 ];
D = [ 0; 0];

sys_ss = ss(A,B,C,D);

poles = eig(sys_ss)

K = lqr( sys_ss , diag ( [ 10 1 100 1 ] ) , 1)

sys_closed_ss = ss(A-B*K, B, [ 1 0 0 0 ; 0 0 1 0 ] , 0)
sys_closed_ss.OutputName = {'\theta', 'y'}

closed_loop_poles = eig(sys_closed_ss)

x0 = [ 0.1, 0, 0, 0 ]';
t = [ 0 : 0.005 : 20 ]'; % simulation time vector
lsim( sys_closed_ss, 0*t , t, x0);
