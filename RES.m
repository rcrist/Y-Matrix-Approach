function Y=Res(Nodes,Resist)
% disp("Res")
%Function to update global Y matrix with a resistor
%
Nodechk(Nodes,2,1); %Error Check, Nodechk(Array of Nodes, # of nodes, zerosok=1)
Yres=[1,-1;-1,1]/Resist; %Element Model: Y matrix for resistor
global YGLOBAL; %UpdateGlobal Ymatrix
Sysnodes=Nodenum(Nodes); %Convert to SysNodes
YGLOBAL=UpdateY(Yres,YGLOBAL,Sysnodes); %End of function