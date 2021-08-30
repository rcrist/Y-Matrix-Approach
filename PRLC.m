function Y=PRLC(Nodes,R,L,C,f)
%Function to update global Y matrix with
%a parallel resistor, inductor, and capacitor
%
% - -Error Check, Bell, and Message Routine Here-
Nodechk(Nodes,2,1); % Nodechk(Array of Nodes, # of nodes, zerosok=1)
%
% - - - - - - Element Model - - - - - - - - - - -
Yprlc=[1,-1;-1,1]*(1/R+1/(i*2*pi*f*L)+i*2*pi*f*C);
% - - - - - - Convert to SysNodes - - - - - - - -
Sysnodes=Nodenum(Nodes);
% - - - - UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
YGLOBAL=UpdateY(Yprlc,YGLOBAL,Sysnodes);