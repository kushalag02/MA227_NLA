% Given matrix A and vector b
A = [10.0, 1; 10.1, 1; 10.2, 1; 10.3, 1; 10.4, 1; 10.5, 1; 10.6, 1; 10.7, 1; 10.8, 1; 10.9, 1; 11.0, 1];
b = [0.0; 0.0; 1.0; 1.5; 2.5; 3.5; 4.5; 5.0; 6.5; 8.0; 10.0];

% Creating a temporary array to store the first column of A
for i = 1:11
    temp(i, 1) = A(i, 1);
end

% Performing Householder QR decomposition
[Q, R] = HouseSelf(A);

% Displaying Q and R matrices
disp('Q matrix:');
disp(Q);
disp('R matrix:');
disp(R);

% Preparing a temporary matrix for adjusting the size of R
temp3 = [eye(2, 2); zeros(9, 2)];
temp2 = [R(1, 1), R(1, 2); R(2, 1), R(2, 2)];
R = temp2;

% Adjusting the size of Q and R matrices
Q = Q * temp3;

% Solving the linear system using backward substitution
Y = Q.' * b;
X = BdSubs(R, Y);

% Displaying the solution X
disp('Solution (X):');
disp(X);

% Calculating y values for plotting
for i = 1:11
    y(i, 1) = X(1, 1) * A(i, 1) + X(2, 1);
end

% Plotting the original points and the fitted line
for i = 1:11
    hold on;
    plot(temp(i, 1), b(i, 1), 'r*');
end

plot(temp, y);
hold off;
