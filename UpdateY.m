function Ynew=UpdateY(Yelem,Yold,Nodes)
% disp("UpdateY")
%% Ynew=UpdateY(Yelem,Yold,Nodes)
%function to update global Y matrix, Yold, with values
%from the element Y matrix--works for any size(Yelem)
% Note: lenght(Nodes) = size(Yelem)
% - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Ynew=Yold; % Initialize Ynew for update

%Increase size of Yold if new nodes being added
if max(Nodes)>max(size(Yold));
    Yold(max(Nodes),max(Nodes))= 0;
end

NonZero=Nodes(Nodes~=0);
ElemNode=find(Nodes~=0);

if isempty(Yold)
    Ynew = Yelem;
else
    Ynew(NonZero,NonZero)=Yold(NonZero,NonZero)+Yelem(ElemNode,ElemNode);
end