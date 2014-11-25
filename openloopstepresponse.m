clear 
close all 
% Maxon flat motor parameters used in the modeling 
R = 1.2;        % Ohms, Terminal Resistance phase to phase 
L = 0.560e-3;   % Henrys, Terminal Inductance phase to phase 
Kt = 25.5e-3;   % Nm/A, Torque constant 
Ks = 37.4;       % rpm/V, Speed constant 
tm = 17.1e-3;   % seconds, s, Mechanical Time constant 
J = 92.5e-7;    % kg.m^2, Rotor inertia, given in gcm^2 
p = 3;          % Number of phases 

te = L/(p*R);               % seconds, s, Electrical Time constant 
Ke = (3*R*J)/(tm*Kt);       % Back emf constant 

% Transfer function without 13.11
G = tf([1/(tm*te)],[1 tm/(tm*te) 1/(tm*te)]); 
%ziegler-nichols I
wn=sqrt(1/(tm*te));ksi=(tm/(2*tm*te))/wn;
k1=(ksi+(ksi^2-1)^(1/2))*wn;k2=(ksi-(ksi^2-1)^(1/2))*wn;
tb=(log(k1)-log(k2))/(k1-k2);
y0=1+(wn/(2*((ksi^2-1)^(1/2))))*((k2*exp(-k1*tb)-k1*exp(-k2*tb))/(k1*k2));
m=wn*(-exp(-k1*tb)+exp(-k2*tb))/(2*((ksi^2-1)^(1/2)));
n=y0-m*tb;
L=-n/m;
T=-L+(1-n)/m;
Kp=T*0.9/(L*13.11);
Ki=(Kp*0.3)/(L*13.11);
%1/Ke = 13.11 gain 
% Plots the Step Response diagram 
figure; 
step(G, 0.5); 
title('Open Loop Step Response diagram'); 
xlabel('Time, secs') 
ylabel('Voltage, volts') 
grid on; 
Kp
L
Ki

