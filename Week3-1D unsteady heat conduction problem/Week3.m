syms n
x = linspace(0,10,100);
plot(x,y(x),x,y_t3(x),x,y_t5(x),x,y_t9999(x))
xlabel('位置');
ylabel('速度');
title('浩緯_ Week3');
legend('t=1','t=3','t=5','t=9999')