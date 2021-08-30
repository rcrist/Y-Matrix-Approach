%RLCCKT1.M
%Name: Rick A. Crist
%Purpose: MATLAB Linear Simulation for RLC Network in "Microwave Circuit
%Design Using Programmable Calculators", pg. 27.
%%
% Port A >--- 1 --- R=75 ---- 2 ---- L=5 --- 3 --- C=1 ---< Port B
% 
% * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Initlize % clears all variables from previous anaylsis
%Variables (Optional)
%Units
GHz=1e9;
nH=1e-9;
pF=1e-12;

% Initialize the Y & S tables
Ytable = [];
Stable = [];

%Simulation loop (single frequency or sweep)
fstart=1.0*GHz; fdelta=.5*GHz; fstop=18*GHz;
for f=fstart:fdelta:fstop
%Netlist
RES([1,2],75);
IND([2,3],5*nH,f);
CAP([3,4],1*pF,f);

% Process the Y-Matrix and convert to S-Matrix
Yout=Reduce([1,4]); %Reduces Y matrix to two port with A=1 & B=4
Sout=Y2S(Yout,1/50); %Creates Scattering Matrix of S-parameters
Ytable=mktable(Ytable, f/GHz, Yout);
Stable=mktable(Stable, f/GHz, Sout);
end

% Print tabulated data results
Stable

% Plot the results
plot(Stable(:,1),abs(Stable(:,2)),'r',Stable(:,1),abs(Stable(:,4)),'g')
xlabel('Frequency (GHz)');
ylabel('mag(S11) & mag(S21)');
title('S-parameter for rlcckt1.m')
