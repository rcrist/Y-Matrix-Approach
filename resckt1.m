%RESCKT1.M
%Name: M.L.Edwards
%Purpose: Illustrate MATLAB Linear Simulation with Resistive Network
%
%% -------------- R=11 --------------
% | |
% | |
% Port A >--- 3 ---- R=Rs --- (-2) ---- R=Rs --- 1 ---< Port B
% | | |
% R=7.7 R=4.9 R=6.6
% | | |
% Gnd Gnd Gnd
% (0) (0) (0)
%% [Rs=5.2]
% * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Initlize %clears all variables from previous anaylsis
%Variables
Rs=5.2;
%Units
GHz=1e9;
Ytable = [];
Stable = [];
%Frequency Sweep
Fstart=1*GHz; Fstop=5*GHz; Fdelta=1*GHz;
for f=Fstart : Fdelta : Fstop
%Netlist
RES([3,0],7.7); %Node order irrevalent for reciprocal 2-port elements
RES([3,-2],Rs); %negative integers ok & valuable for parameter
RES([3,1],11);
RES([0,-2],4.9); %ground"0" can be first node
RES([1,-2],Rs);
RES([1,0],6.6);
Yout=Reduce([3,1]); %Reduces Y matrix to two port with A=3 & B=1
%and clear Global Y and NodeNum matrices
Sout=Y2S(Yout,1/50); %Creates Scattering Matrix of S-parameters
Ytable=mktable(Ytable, f/GHz, Yout);
Stable=mktable(Stable, f/GHz, Sout);
end %Repeat Analysis for next frequency
%Print\Plot results
Ytable %prints table since no ";" at end of line
Stable