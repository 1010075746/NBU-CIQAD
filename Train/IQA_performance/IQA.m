%%% txw_IQA������ �����͹����۽��������DMOSֵ�����ܼ�����������۵�4��ָ���Լ���ͼ��
%%% �ɿ͹�����ֵ������ֵ����������ֵvs�͹�����ֵ���Լ���DMOS VS DMOSp��ɢ��ͼ�������CC��SROCC��OR��RMSE 4������ָ��ֵ��
%%% ʹ��ʱ����ǵý�nihe,logistics������txw_IQA�ŵ�һ��Ŀ¼�£������ݾ�������޸�X0ֵ��

function [ pearson_cc, spearman_srocc, kendall_krocc, rmse,dmosp ] = IQA( obj_result, dmos, distortion_type )%%%%%%%%%%%%%%%����ɢ��ͼ���������κο�
% obj_result:�͹�ģ�ͼ����ԭʼ��û����Ϲ��Ŀ͹�ֵ��Ϊһ���������ݣ�
% dmos:��������ֵ��������DMOSֵ��
% dmos_std:��������ֵ�ı�׼��ڼ���ORֵ��ʱ����õ����������Ҫ����ORֵ�Ļ�����0�����Ȼ��orֵ��ȡ���ɡ�
% distortion_type: ָ��ʧ�����ͣ�������Ҫ�����ڻ�ͼʱ������ʾ�õġ�
%% ��ȡdmosp [ʵ�����ǶԿ͹�ֵ���� �Ĳ���\�����logistic������������ϵõ�dmospֵ]
% load('all_dmos.mat')
% load('V1_Binocular_S.mat')
% load('V1_minocular_S.mat')
% load('V2_Binocular_S.mat')
% load('LGN_S.mat')
% obj_result=LGN_S;
xdata = obj_result;
dmos=dmos';
ydata = dmos;

 %X0 = [ max( dmos ), min( dmos ), mean( obj_result ), 1 ]; %��С�����������ʼֵX0���Ĳ���
X0 = [ max( dmos ), min(dmos ), median( obj_result ),mean(dmos),1 ]; %��С�����������ʼֵX0,�����

x = lsqcurvefit( @nihe, X0, xdata, ydata ); %��С��������

dmosp = nihe(x,xdata); %���ǿ͹�ֵ���Ĳ�����Ϻ��dmospֵ,�ο������ܿ����Ĳ�ʿ����72ҳ���������õ�����140������Ǵ���ģ�



%% ��ʼ����ָ��ļ���
%% CCϵ��
pearson_cc = corr( [ dmos, dmosp] );
pearson_cc = pearson_cc( 2 );

%% SROCCϵ��
spearman_srocc = corr( [ dmos, obj_result], 'type', 'Spearman' );
spearman_srocc = spearman_srocc( 2 );

%% KROCC
kendall_krocc = corr( [ dmos, obj_result], 'type', 'kendall' );
kendall_krocc = kendall_krocc( 2 );
%% RMSEϵ��
rmse = sqrt( mean( ( dmosp - dmos ).^2 ) );  

end

