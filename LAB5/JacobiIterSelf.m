function JacobiIterSelf(A, b)
    % Jacobi iterative solver for Ax = b
    
    % Set default values for tolerance and maximum iterations
    max_tol = 1e-8;
    max_iter = 150;
    
    % Initialize variables
    [M, N] = size(A);
    x1 = zeros(N, 1);
    x2 = x1;
    k = 0;

    % Norm type for residual error
    p = Inf;

    % Initial residual error
    error = norm(A * x2 - b, p);
    
    % Initialize tolerance
    tol = Inf;

    % Arrays to store iteration data
    data1 = zeros(max_iter, N);
    data2 = zeros(max_iter, 2);

    % Jacobi iteration loop
    while tol > max_tol && k < max_iter
        x1 = x2;
        
        % Jacobi iteration formula
        for i = 1:N
            temp = 0;
            for j = 1:N
                if j ~= i
                    temp = temp + A(i, j) * x1(j);
                end
            end
            x2(i) = (b(i) - temp) / A(i, i);
        end
        
        % Update tolerance and iteration count
        tol = norm(x2 - x1, p) / norm(x2, p);
        k = k + 1;
        
        % Update residual error
        error = norm(A * x2 - b, p);
        
        % Store iteration data
        data1(k, :) = x2';
        data2(k, :) = [k, error];
    end
    
    % Display final solution, error, and iteration data
    disp('Final Solution (x2):');
    disp(x2);
    
    disp('Final Residual Error:');
    disp(error);
    
    disp('Iteration Data:');
    disp(data1(1:k, :));
    
    % Plotting
    figure;
    hold on;
    plot(data2(1:k, 1), data2(1:k, 2));
    xlabel('Number of Iterations');
    ylabel('Residual Error');
    title('Jacobi Iterative Solver');
    hold off;
end


