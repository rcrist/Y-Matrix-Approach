function NewTable=MkTable(OldTable, F, NewData)
% disp("MkTable")
% This function adds a row to the bottom of the OldTable.
% The new row consists of the frequency F as the first element,
% and the elements in NewData taken row by row.
% Make N the transpose of the new matrix NewData
N=NewData'; % This transpose conjugate all complex numbers.
% Take the transpose of the column form of N
O=N(:)'; % This second transpose conjugate back all complex numbers.
% Add variable F to the beginning of new row of data
Newline=[F, O];
% Add new row to the oldtable
NewTable=[OldTable; Newline];