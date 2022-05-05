% 四参数或五参数拟合函数
function F = nihe(x,xdata)
% F = x(2) + (x(1)-x(2))./( 1 + exp( -( xdata - x(3))/abs(x(4)) ) );  %四参数logistic 拟合
F = x(1)*logistics( x(2),( xdata - x(3) ) ) + x(4)*xdata +x(5);  %需要用到logistics函数，五参数logistic 拟合，文献 ：A statistical evaluation of recent。。。
%F = x(1)*xdata.^3 + x(2)*xdata.^2 + x(3)*xdata + x(4);  %四参数多项式 拟合