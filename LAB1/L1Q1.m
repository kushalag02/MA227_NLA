% Task 1
clc, clearvars;

n = 500:50:1000; % For size of matrix as mentioned in ques.
j = 1;

time1 = zeros(10, 1);
time2 = zeros(10, 1);
val1 = zeros(10, 1);

filename = 'L1Q1.xlsx';

% Starting loop (10 Times)

for i = 1:10
    %creating a random sized matrix A & B using rand fn
    A = rand(n(1, j), n(1, j));
    b = rand(n(1, j), 1);

    % To measure the time in the operation using function
    tic
    x = A\b;
    y1 = toc; % Stopwatch stops and the value is noted

    % Creating an array which will store the all data
    time1(i) = y1;
    val1(i) = n(1, j);

    % Write val1 and time1 to columns A and B
    writematrix([val1, time1], filename, 'Sheet', 'Sheet1', 'Range', 'A1');

    tic
    x1 = inv(A)*b;
    y2 = toc;

    time2(i) = y2;

    % Write time2 to column C
    writematrix(time2, filename, 'Sheet', 'Sheet1', 'Range', 'C1');

    j = j + 1;
end


% Plotting the graph
temp=readmatrix(filename);
x_1 = temp(:, 1);
y_1 = temp(:, 2);
z_1 = temp(:, 3);

plot(x_1,y_1);

hold on
plot(x_1,z_1);
hold off
legend('A\B','inv(A)*B')




