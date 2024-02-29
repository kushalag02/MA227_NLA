A = [6 1 1 1 1;1 7 1 1 1;1 1 8 1 1;1 1 1 9 1;1 1 1 1 10];
b = [-10;-6;0;8;18];

GSIterSel(A,b)
function GSIterSel(A, b)
    % Gauss-Seidel iterative solver for Ax = b
    
    % Set default values for tolerance and maximum iterations
    max_tol = 1e-8;
    max_iter = 150;
    
    % Initialize variables
    n = length(b);
    x1 = zeros(n, 1);
    x2 = x1;
    k = 0;

    % Norm type for residual error
    p = Inf;

    % Initial residual error
    error = norm(A * x1 - b, p);
    
    % Initialize tolerance
    tol = Inf;

    % Arrays to store iteration data
    data1 = zeros(max_iter, n);
    data2 = zeros(max_iter, 2);

    % Gauss-Seidel iteration loop
    while tol > max_tol && k < max_iter
        x2 = x1;
        
        % Gauss-Seidel iteration formula
        for i = 1:n
            temp = 0;
            for j = 1:i-1
                temp = temp + A(i, j) * x1(j);
            end
            for j = i+1:n
                temp = temp + A(i, j) * x2(j);
            end
            x1(i) = (b(i) - temp) / A(i, i);
        end
        
        % Update tolerance and iteration count
        tol = norm(x1 - x2, p) / norm(x1, p);
        k = k + 1;
        
        % Update residual error
        error = norm(A * x1 - b, p);
        
        % Store iteration data
        data1(k, :) = x1';
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
    xlabel('Iteration');
    ylabel('Residual Error');
    title('Gauss-Seidel Iterative Solver');
    hold off;
end
