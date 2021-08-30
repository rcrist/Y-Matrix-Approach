function sysnodes=Nodenum(n)
% disp("Nodenum")
global GLOBALNODES;GN=GLOBALNODES;
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%T=Transfer matrix between n and GN==>n repeated columns
%compared with GN repeated as rows. No available match causes T to
%have a zero row determining GNnew which is added to update GN
%Transfer matrix recalculated with update GN to get sysnodes
% =========================================================
if isempty(GN); GN=n(find(n~=0)); end ; % (1)
T=n'*ones(1,length(GN)+1)==ones(length(n),1)*[0,GN]; % (2)
GN=[GN,n(all(T'==0))] ; % (3)
T=n'*ones(1,length(GN)+1)==ones(length(n),1)*[0,GN] ; % (4)
sysnodes=[0:length(GN)]*T'; % (5)
GLOBALNODES=GN; % end of function %(6)
%==========================================================
%Footnotes:
%-----------
%(1) At first call of function Globalnode is empty
% Therefore, Non zero input nodes start off list
%
%Next several notes illustrated by example
% assume n=[2 0 4] and GN=[1 4 3 5] at start of function
%(2) n'*ones(1,length(GN)+1)
% ( 2 ) ( 2 2 2 2 2 )
% ( 0 )*(1 1 1 1 1) = ( 0 0 0 0 0 )
% ( 4 ) ( 4 4 4 4 4 )
%
% ones(length(n),1)*[0,GN]
% (1) (0 1 4 3 5 )
% (1)*(0 1 4 3 5) = (0 1 4 3 5 )
% (1) (0 1 4 3 5 )
%
% (0 0 0 0 0) <==detects that 2 not in list
% T = (1 0 0 0 0)
% (0 0 1 0 0)
%%
% (3)
% all(T'==0) => [1 0 0]
% n(all(T'==0)) n( [1 0 0]) = 2
% [GN,n(all(T'==0))] => [[1 4 3 5],[2]] = [1 4 3 5 2]
%%
% (4)
% ( 2 2 2 2 2 2) (0 1 4 3 5 2)
% ( 0 0 0 0 0 0) == (0 1 4 3 5 2)
% ( 4 4 4 4 4 4) (0 1 4 3 5 2)
%
% (0 0 0 0 0 1) <==2 detected in update GN list
% T = (1 0 0 0 0 0)
% (0 0 1 0 0 0)
%%
%(5) sysnodes = [0 1 2 3 4 5]*transpose(T) = [5 0 2]
%(6) GLOBALNODES = [1 4 3 5 2]