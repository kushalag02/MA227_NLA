% I have created a function named rref2 and now I am trying to use it as per
%instruction given in the question
%Here I am giving specified values to n and m. We can also change it
m=4;
n=3;
for i=1:5
    
    A=rand(m,n);
    A=rref(A);
    disp(A);
    m=m+1;
    n=n+1;  
end