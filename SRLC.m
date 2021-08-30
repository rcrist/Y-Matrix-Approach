function Y=SRLC(Nodes,R,L,C,f)
%Function to update global Y matrix with
%a series resistor, inductor, and capacitor
%
% - -Error Check, Bell, and Message Routine Here-
Nodechk(Nodes,2,1); % Nodechk(Array of Nodes, # of nodes, zerosok=1)
%
% - - - - - - Element Model - - - - - - - - - - -
Z=R+i*2*pi*f*L+1/(i*2*pi*f*C);
Ysrlc=[1,-1;-1,1]/Z;
% - - - - - - Convert to SysNodes - - - - - - - -
Sysnodes=Nodenum(Nodes);
% - - - - UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
YGLOBAL=UpdateY(Ysrlc,YGLOBAL,Sysnodes);