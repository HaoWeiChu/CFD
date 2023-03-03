
function T = TDMA(A,Su)
% 輸入兩個A,Su 兩個矩陣可以不透過矩陣運算得到T
n = length(Su);
P(1,1) = A(1,2)/A(1,1);
Q(1,1) = Su(1,1)/A(1,1);

for i = 2:n
    if i < n
        P(i,1)= A(i,i+1)/(A(i,i)-A(i,i-1)*P(i-1,1));
        Q(i,1) = (A(i,i-1)*Q(i-1,1)+Su(i,1))/(A(i,i)-A(i,i-1)*P(i-1,1));
    else
        P(i,1)= 0;
        Q(i,1) = (A(i,i-1)*Q(i-1,1)+Su(i,1))/(A(i,i)-A(i,i-1)*P(i-1,1));
    end
end





%%
%逆傳遞算法，從n, n-1, n-2 進行 for loop
T(n,1)= Q(n,1);
for i = (n-1):(-1):1
        T(i) = (P(i,1)*T(i+1,1))+Q(i,1);
end

end

    