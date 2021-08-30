function S=Y2S(Y,Yo)
% disp("Y2s")
%converts Y matrix to Scattering Matrix
% - - -Identity matrix with dimension of Y - - -
I=eye(size(Y));
S=(Yo*I-Y)/(Yo*I+Y); %Matrix division==mult by inverse