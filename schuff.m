function Yout=schuff(Yin,N)
%functions schuffles rows and columns of Matrix Yin so that rows and columns contained
%in vector N are moved to upper left
%----------------------------------------------------------
Seq=[1:size(Yin)] ; % Seq=sequence & Ncomp=deleted Sequence [Seq=N + Ncomp]
Ncomp=Seq(all( [N,0]'*ones(1,length(Seq)) ~= ones(length(N)+1,1)*Seq));
%"0" added so that "all" logic will also work for length(N)=1 case
Yout(Seq,Seq)=Yin([N,Ncomp],[N,Ncomp]); %end function