% �Ĳ������������Ϻ���
function F = nihe(x,xdata)
% F = x(2) + (x(1)-x(2))./( 1 + exp( -( xdata - x(3))/abs(x(4)) ) );  %�Ĳ���logistic ���
F = x(1)*logistics( x(2),( xdata - x(3) ) ) + x(4)*xdata +x(5);  %��Ҫ�õ�logistics�����������logistic ��ϣ����� ��A statistical evaluation of recent������
%F = x(1)*xdata.^3 + x(2)*xdata.^2 + x(3)*xdata + x(4);  %�Ĳ�������ʽ ���