
function x = BdSubs(U, b)
 n = size(U, 1);
 x = zeros(n, 1);
 for i = n:-1:1
 x(i) = (b(i) - U(i, i+1:end) * x(i+1:end)) / U(i,i);
 end
end