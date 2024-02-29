prompt = "Enter the matrix A =";
A = input(prompt);
prompt = "Enter the matrix b =";
b = input(prompt);

X=LSSNEqn(A,b);

for i=1:11
    temp(i,1)=A(i,1);
end
disp("A=");
disp(A);
disp("b=");
disp(b);
disp("Solution matrix x by least square method is " );
disp('X=');
disp(X);
for i=1:11
    y(i,1)=X(1,1)*A(i,1)+X(2,1);
end
for i=1:11
    hold on
    plot(A(i,1),b(i,1),'r*');
end
plot(temp,y);

hold off

