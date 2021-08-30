function Y=Tlin(Nodes,CharZ,ElecLength,RefFreq,f)
%Function Tlin(Nodes,CharZ,ElecLength,RefFreq,f)
%to update global Y matrix with
%an ideal transmission line
%
% - -Error Check, Bell, and Message Routine - - -
Nodechk(Nodes,2,1); % Nodechk(Array of Nodes, # of nodes, zerosok=1)
%
% - - - - - - Element Model - - - - - - - - - - -
%
% Freq dependent Elec Length
Theta=(f/RefFreq)*ElecLength;
%
% Y matrix for Tlin
Ytlin=i*[-cos(Theta),+1;+1,-cos(Theta)]/(CharZ*sin(Theta));
%%
% - - - - - - Convert to SysNodes - - - - - - - -
Sysnodes=Nodenum(Nodes);
% - - - -UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
YGLOBAL=UpdateY(Ytlin,YGLOBAL,Sysnodes);