function Y=Tlsc(Nodes,CharZ,ElecLength,RefFreq,f)
%Function Tlsc(Nodes,CharZ,ElecLength,RefFreq,f)
%to update global Y matrix with
%an ideal short circuited transmission line
%
% - -Error Check, Bell, and Message Routine - - -
Nodechk(Nodes,2,1); % Nodechk(Array of Nodes, # of nodes, zerosok=1)
%
% - - - - - - Element Model - - - - - - - - - - -
%
% Freq dependent Elec Length
Theta=(f/RefFreq)*ElecLength;
%
% - - - - - - Y matrix for Tlin - - - - - - - - -
if 0<=tan(Theta) & tan(Theta)<1e-12,
Ytlsc=[1,-1;-1,1]/(i*1e-12*CharZ);
elseif -1e-12<tan(Theta) & tan(Theta)<=0,
Ytlsc=-[1,-1;-1,1]/(i*1e-12*CharZ);
else
Ytlsc=[1,-1;-1,1]/(i*tan(Theta)*CharZ);
end
% - - - - - - Convert to SysNodes - - - - - - - -
Sysnodes=Nodenum(Nodes);
% - - - -UpdateGlobal Ymatrix- - - - - - - - - - -
global YGLOBAL;
YGLOBAL=UpdateY(Ytlsc,YGLOBAL,Sysnodes);