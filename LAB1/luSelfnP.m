% Task 4 
clc, clearvars;

% Creating variables as mentioned in the ques
p=8;
x = [2 -1 zeros(1, p-2)];
A = toeplitz(x); % Creating a toeplitz matrix
[m ,n]=size(A);
B=ones(1,8);
% Creating another row matrix B in which all elements are 1

% Algorithm to calculate L and U

L=zeros(m,m);
U=zeros(m,m);
for i=1:m

    for k=1:i-1
        L(i,k)=A(i,k);
        for j=1:k-1
            L(i,k)= L(i,k)-L(i,j)*U(j,k);
        end
        L(i,k) = L(i,k)/U(k,k);
    end

    for k=i:m
        U(i,k) = A(i,k);
        for j=1:i-1
            U(i,k)= U(i,k)-L(i,j)*U(j,k);
        end
    end
end
for i=1:m
    L(i,i)=1;
end


%Now we are using FdSubs and BdSubs functions

Y=FdSub(L, B);
X=BdSub(U, Y);
disp('x=');
disp(x);
disp('A=');
disp(A);
disp('L=');
disp(L);
disp('U=');
disp(U);
disp('X=');
disp(X);

% Fdsubs function
function [x] = FdSub(L, b)
[m, n] = size(L);

if m ~= n
    error('L must be a square matrix');
end

x = zeros(n,1);
for i = 1:n
    x(i) = (b(i) - L(i, 1:n) * x) / L(i, i);
end

end


% Bdsubs function
function [x] = BdSub(U, b)
[m, n] = size(U);

if m ~= n
    error('U must be a square matrix');
end
x = zeros(n,1);
for i = 1:n
    j = n+1-i;

    x(j) = (b(j) - U(j, 1:n) * x) / U(j, j);
end
end