function Y=Cap(Nodes,C,f)
%Function to update global Y matrix with
%an capacitor
%
% - -Error Check, Bell, and Message Routine Here-
Nodechk(Nodes,2,1); % Nodechk(Array of Nodes, # of nodes, zerosok=1)
%
% - - - - - - Element Model - - - - - - - - - - -
Ycap=[1,-1;-1,1]*(i*2*pi*f*C); %Y matrix for inductor
%cross terms neg because of
%current direction
%
% - - - - - - Convert to SysNodes - - - - - - - -
% - - - -UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
Sysnodes=Nodenum(Nodes);
YGLOBAL=UpdateY(Ycap,YGLOBAL,Sysnodes);