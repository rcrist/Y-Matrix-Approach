%Wilkckt.M
%Name: M.L.Edwards
%Purpose: Illustrate MATLAB Linear Simulation with Wilkenson Coupler
%
%                   Z=70.7
%                   E=90deg,
%                   f=4GHz
%                   ------
%                --| Tlin |---(2)-----< Port B
%               |   ------     |
%               |              |
%    Port A >--(1)            R=100
%               |              |
%               |   ------     |
%                --| Tlin |---(3)-----< PortC
%                   ------
%                   Z=70.7,
%                   E=90deg,
%                   f=4GHz
%
% * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Initlize %clears all variables from previous anaylsis
%Variables (Optional)
%Units
GHz=1e9;Deg=pi/180;
Ytable = [];
Stable = [];
Fstart=.25; Fstop=8; Fdelta=.25;
%Frequency Sweep
for f=Fstart : Fdelta : Fstop,
%Netlist
Tlin([1,2],70.7,90*Deg,4*GHz,f*GHz);
Tlin([1,3],70.7,90*Deg,4*GHz,f*GHz);
RES([2,3],100);
Yout=Reduce([1,2,3]); %Reduces Y matrix to two port with A=3 & B=2
Sout=Y2S(Yout,1/50); %Creates Scattering Matrix of S-parameters
Ytable=mktable(Ytable, f, Yout);
Stable=mktable(Stable, f, Sout);
end
plot(Stable(:,1),abs(Stable(:,2)),'r',Stable(:,1),abs(Stable(:,4)),'g')
hold on
plot(Stable(:,1),abs(Stable(:,7)),'m')
xlabel('Frequency (GHz)');ylabel('mag(S11,S21,S32)');
title('S-parameter for WILKCKT1.m')