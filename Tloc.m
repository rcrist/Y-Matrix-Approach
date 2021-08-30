function Y=Tloc(Nodes,CharZ,ElecLength,RefFreq,f)
%Function Tloc(Nodes,CharZ,ElecLength,RefFreq,f)
%to update global Y matrix with
%an ideal open circuited transmission line
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
if tan(Theta)>1e12,
Ytloc=i*[1,-1;-1,1]*1e12;
else,
Ytloc=i*[1,-1;-1,1]*tan(Theta)/CharZ;
end;
%%
% - - - - - - Convert to SysNodes - - - - - - - -
Sysnodes=Nodenum(Nodes);
% - - - -UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
YGLOBAL=UpdateY(Ytloc,YGLOBAL,Sysnodes);