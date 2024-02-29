%% Here we have created a function LSSNEqn

function [X]=LSSNEqn(A,b)
    temp1=A.'; %temp1 is transpose of A

    C=temp1*A;

    D=chol(C); % chol function is basically do a cholskey decomposition
    temp3=D.';

    % Solving the system of linear equation using backward and forward
    % substitution

    Y=FdSubs(temp3,temp1*b);
    X=BdSubs(D,Y);
end


