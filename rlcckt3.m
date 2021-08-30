%RLCCKT3.M
%Name: M.L.Edwards
%Purpose: Illustrate MATLAB Linear Simulation for RLC Networkin Chap 5.3
%%
% Port A >--- 1 --- L=1 ---- 2 ---- L=1 --- 3 ---< Port B
%                            |
%                            |
%                           C=2
%                            |
%                            |
%                           Gnd
%                           (0)
% * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Initlize % clears all variables from previous anaylsis
%Variables (Optional)
%Units
GHz=1e9;
nH=1e-9;
pF=1e-12;
%Initialize the Y and S tables
Ytable = [];
Stable = [];
%Stimulation (single frequency or sweep)
fstart=.01*GHz; fdelta=.5*GHz; fstop=18*GHz;
for f=fstart:fdelta:fstop
%Netlist
IND([1,2],1*nH,f);
IND([2,3],1*nH,f);
CAP([2,0],2*pF,f);
Yout=Reduce([1,3]); %Reduces Y matrix to two port with A=1 & B=3
Sout=Y2S(Yout,1/50); %Creates Scattering Matrix of S-parameters
Ytable=mktable(Ytable, f/GHz, Yout);
Stable=mktable(Stable, f/GHz, Sout);
end
%Ytable;
%Stable;
plot(Stable(:,1),abs(Stable(:,2)),'r',Stable(:,1),abs(Stable(:,4)),'g')
xlabel('Frequency (GHz)');
ylabel('mag(S11) & mag(S21)');
title('S-parameter for LPFCKT1.m')