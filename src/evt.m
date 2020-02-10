A = [1 2 ; 6 2 ];
s=2;

ata=A'*A;
% aat=A*A';

eig_ata=eigs(ata);
% eig_aat=eig(aat);
% eig_aat(3)
B=ata-(eye(2).*eig_ata(2));
