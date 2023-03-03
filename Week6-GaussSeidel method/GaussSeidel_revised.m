clc;      % 清除Command Window
clear     % 清除workspace
close all % 關閉所有圖片
%%gauss-seidel method
 n=input('方程式數量?, n:  ');
 A = zeros(n,n+1);
 x1 = zeros(n);
 tol = input('允許正負誤差值?, tol: ');
 m = input('最大疊代次數, m:  ');
%輸入值
%A為每方程式系數
 A=[2 1 1 7; -1 3 -1 2; 1 -1 2 5];
%高斯法的初始猜測值 
 x1=[0 0 0];
 %%
 k = 1;
 while  k <= m
    err = 0;
    for i = 1 : n
       s = 0;
       for j = 1 : n
          s = s-A(i,j)*x1(j);%將所有數移至等式右側
       end
       s = (s+A(i,n+1))/A(i,i);%及誤差量&增值(除上當前答案的係數)
       if abs(s) > err %誤差量是正負範圍皆可
         err  = abs(s);
       end
       x1(i) = x1(i) + s;
    end

    if err <= tol
      break;
    else
      k = k+1;
    end
 end

 fprintf('方程式答案照順序 :\n', k-1);
 for i = 1 : n
   fprintf(' %11.8f \n', x1(i));
 end