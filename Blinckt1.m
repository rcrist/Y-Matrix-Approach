%Blinckt1.M
%Name: M.L.Edwards
%Purpose: Illustrate MATLAB Linear Simulation with Branchline Coupler
%                    Z=35.35
%                    E=90deg,
%                    f=4GHz
%                    ------
%               (4) --| Tlin |--(3)-----< Port B
%                |   ------      |
%     Z=50      ----           ----
%  E=90 @ 4GHz |Tlin|         |Tlin|  Z=50,E=90 @ 4 GHz
%               ----           ----
%                |    ------     |
%     Port A >--(1)--| Tlin |---(2)-----< PortC
%                     ------
%                     Z=35.35,
%                     E=90deg,
%                     f=4GHz
% * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Initlize %clears all variables from previous anaylsis
%Variables (Optional)
%Units
GHz=1e9;
Deg=pi/180;
Ytable=[];
Stable=[];
Fstart=.25; Fstop=8; Fdelta=.24;
%Frequency Sweep
for f=Fstart : Fdelta : Fstop,
%Netlist
Tlin([1,2],35.35,90*Deg,4*GHz,f*GHz);
Tlin([2,3],50,90*Deg,4*GHz,f*GHz);
Tlin([3,4],35.35,90*Deg,4*GHz,f*GHz);
Tlin([1,4],50,90*Deg,4*GHz,f*GHz);
Yout=Reduce([1,2,3,4]); %Reduces Y matrix to two port with A=3 & B=2
Sout=Y2S(Yout,1/50); %Creates Scattering Matrix of S-parameters
Ytable=mktable(Ytable, f, Yout);
Stable=mktable(Stable, f, Sout);
end
plot(Stable(:,1),abs(Stable(:,2)),'r',Stable(:,1),abs(Stable(:,3)),'g')
hold on
plot(Stable(:,1),abs(Stable(:,4)),'m',Stable(:,1),abs(Stable(:,5)),'b')
xlabel('Frequency (GHz)');
ylabel('mag(S11,S21,S31,S41)');
title('S-parameter for Blinckt1.m')