%% Gram-Schmidt Method for QR decomposition

% This algorithm starts with n LI Vectors and 
% produces n orthogonal vectors

function [Q,R] = GramSelf(A)

[m,n] = size(A);
Q = zeros(m,n);
R = zeros(n,n);

for j=1:n
    v = A(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,i)'*A(:,j);
        v = v-R(i,j)*Q(:,i);
    end
    R(j,j)=norm(v);
    Q(:,j)=v/R(j,j);
end

end

% Here in the following example -
% Q will be [0.8 , -0.6 ; 0.6 , 0.8];
% R will be [5 , -1 ; 0 , 2];