A=[10.0,1;10.1,1;10.2,1;10.3,1;10.4,1;10.5,1;10.6,1;10.7,1;10.8,1;10.9,1;11.0,1];
b=[0.0;0.0;1.0;1.5;2.5;3.5;4.5;5.0;6.5;8.0;10.0];
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




