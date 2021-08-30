function Y=Nodechk(N, k,zerosok)
% disp("Nodechk")
%File to check node number entries: nodechk.m
% Nodechk(Nodes,number of nodes, zerosok) where zerosok=1 if true
if isempty(N), error('***Nodes missing***'),end
if length(N) ~= k, error(['***Number nodes should equal ',num2str(k)],' ***'), end
if zerosok,
if isempty(find(N~=0)), error('***No non-zero nodes***'), end
else
if nnz(N)~=length(N), error('***Gnd, "0," not allowed as node number***'), end
end;
nonzero=N(find(N~=0));
T=(nonzero'*ones(1,length(nonzero))==ones(length(nonzero),1)*nonzero);
if any(sum(T)>1), error('***Repeated non-zero nodes not allowed***'), end;
function sysnodes