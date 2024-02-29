% Task - 1
% We have already created the function luSelfnP ...
% Now we are using that function and try to evaluate the solution of given
%equations

function[X]= Q1(n)
A=ones(n,n); % Creating a matrix with all ones
[m ,n]=size(A);
% A and B are as given in the Question
B=[1;0];
A(1,1)=power(10,-15);       % Changing the values of A(1,1) as mentioned in question

[L,U] = luSelfnP(A);     % Here we are using luselfnP function and evaluating L and U

Y=FdSubs(L, B);
X=BdSubs(U, Y);
disp('Using A\B');
disp(A\B);
disp('Using LU');
end