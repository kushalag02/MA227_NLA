function x = FdSubs(A, b)
    [m, n] = size(A);
    
    % Check if A is a square matrix
    if m ~= n
        error('The input matrix, A, is not a square matrix.');
    end
    
    % Initialize the solution vector
    x = zeros(m, 1);
    
    % Compute the solution using forward substitution
    x(1) = b(1) / A(1, 1);
    for i = 2:m
        x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1)) / A(i, i);
    end
end