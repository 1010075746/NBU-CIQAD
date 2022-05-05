%%% txw_IQA函数： 给出客观评价结果和主观DMOS值，就能计算出质量评价的4个指标以及画图。
%%% 由客观评价值与主观值画出（主观值vs客观评价值）以及（DMOS VS DMOSp）散点图，且求出CC、SROCC、OR、RMSE 4个评价指标值；
%%% 使用时，请记得将nihe,logistics函数跟txw_IQA放到一个目录下，并根据具体情况修改X0值。

function [ pearson_cc, spearman_srocc, kendall_krocc, rmse,dmosp ] = IQA( obj_result, dmos, distortion_type )%%%%%%%%%%%%%%%画黑散点图，适用于任何库
% obj_result:客观模型计算的原始的没有拟合过的客观值，为一个矩阵数据；
% dmos:主观评价值，即各类DMOS值；
% dmos_std:主观评价值的标准差，在计算OR值的时候会用到。如果不需要计算OR值的话，以0替代，然后or值不取即可。
% distortion_type: 指明失真类型，这里主要是用于画图时标题显示用的。
%% 求取dmosp [实际上是对客观值进行 四参数\五参数logistic函数非线性拟合得到dmosp值]
% load('all_dmos.mat')
% load('V1_Binocular_S.mat')
% load('V1_minocular_S.mat')
% load('V2_Binocular_S.mat')
% load('LGN_S.mat')
% obj_result=LGN_S;
xdata = obj_result;
dmos=dmos';
ydata = dmos;

 %X0 = [ max( dmos ), min( dmos ), mean( obj_result ), 1 ]; %最小二乘问题的起始值X0，四参数
X0 = [ max( dmos ), min(dmos ), median( obj_result ),mean(dmos),1 ]; %最小二乘问题的起始值X0,五参数

x = lsqcurvefit( @nihe, X0, xdata, ydata ); %最小二乘问题

dmosp = nihe(x,xdata); %这是客观值经四参数拟合后的dmosp值,参考的是周俊明的博士论文72页（这里引用的文献140里可能是错误的）



%% 开始各类指标的计算
%% CC系数
pearson_cc = corr( [ dmos, dmosp] );
pearson_cc = pearson_cc( 2 );

%% SROCC系数
spearman_srocc = corr( [ dmos, obj_result], 'type', 'Spearman' );
spearman_srocc = spearman_srocc( 2 );

%% KROCC
kendall_krocc = corr( [ dmos, obj_result], 'type', 'kendall' );
kendall_krocc = kendall_krocc( 2 );
%% RMSE系数
rmse = sqrt( mean( ( dmosp - dmos ).^2 ) );  

end

