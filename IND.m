function Y=Ind(Nodes,L,f)
%Function to update global Y matrix with
%an inductor
%
% - -Error Check, Bell, and Message Routine Here-
Nodechk(Nodes,2,1); % Nodechk(Array of Nodes, # of nodes, zerosok=1)
%
% - - - - - - Element Model - - - - - - - - - - -
Yind=[1,-1;-1,1]/(2*pi*f*L*i); %Y matrix for inductor
%cross terms neg because of
%current direction
%
% - - - - - - Convert to SysNodes - - - - - - - -
% - - - -UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
Sysnodes=Nodenum(Nodes);
YGLOBAL=UpdateY(Yind,YGLOBAL,Sysnodes);