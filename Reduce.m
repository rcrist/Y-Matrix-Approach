function Yreduce=reduce(nodes)
% disp("reduce")
%====================check nodes for errors =========================
global GLOBALNODES;GN=GLOBALNODES;
if isempty(GN); error('*** No element nodes in circuit ***'), end ;
if isempty(nodes); error('*** No ports in reduce statement ***'), end ;
T=nodes'*ones(1,length(GN)+1)==ones(length(nodes),1)*[0,GN];
if any(T(:,1)); error(['*** Gnd, "0," not allowed as ',...
'port in "reduce" statement ***']), end
if ~all(any(T')); error(['*** Node number(s) " ',...
num2str(nodes(find(~any(T')))),...
' " not in circuit netlist***']), end
T(:,1)=[]; Duplicate=(sum(T)>1);
if any(Duplicate); error(['*** Mulitple node numbers "',...
num2str(GN(Duplicate)),'" in "reduce" statement ***']),end
%=====================================================================
N=Nodenum(nodes); %N=system nodes
%function to reduce global Y-matrix to an N-port Y-matrix where N<=number of nodes
%Need to move rows and columns so that external nodes at upper left and internal nodes
%lower right. At completion clears Global Y matrix and Global Node Counter
% - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Example Y=Reduce([2,3])
%Note:
% (y11 y12 y13) (y22 y23 y21)
% (y21 y22 y23) => (y32 y33 y31)
% (y31 y32 y33) (y12 y13 y11)
% [Old] [New]
% Shuffle Function Shifts row and column so internal node lower left
%%then
% (y22 y23)
% Yee= (y32 y33) and Yii=(y11)
%
% (y21)
% Yie=(y12 y13) and Yei=(y31)
%
% Yreduce=Yee-Yei*inv(Yii)*Yie
% - - - - - - - - - - - - - - - - - - - - - - - - - - - -
global YGLOBAL
Ynew=schuff(YGLOBAL,N); % routine shuffle matrix
%numports=length(N)
sz=size(YGLOBAL);
Yee=Ynew(1:length(N),1:length(N));
Yii=Ynew(length(N)+1:sz,length(N)+1:sz);
Yei=Ynew(1:length(N),length(N)+1:sz);
Yie=Ynew(length(N)+1:sz,1:length(N));
Yreduce=Yee-Yei*inv(Yii)*Yie; %using add( , ) takes care of Yii=[] case
YGLOBAL=[]; %Clear YGLOBAL for additional circuit calulations
GLOBALNODES=[]; %Clears node counter(relates user nodes to program nodes)
