function index = IQAPerformance(obj_score, sub_score,type)
% code to computed the IQA performance

% obj_score: an vector with each element representing the score of an
% objective IQA algorithm. 
% sub_score: an vector with each element representing the subjevtive score
% of the image quality.
% type: a character denoting which index is to be computed.

switch type
    case 's' % Spearman rank order correlation coefficient
        index = corr(obj_score,sub_score,'type','Spearman');
    case 'p' % Pearson correlation coefficient after nonlinear regression
        score_fit = nonlinear_fit(obj_score, sub_score);
        index = corr(score_fit,sub_score,'type','Pearson');
    case 'e'
        score_fit = nonlinear_fit(obj_score, sub_score);
        index = sqrt(mean((score_fit-sub_score).^2));
end
        
function [x_fit]= nonlinear_fit(x,y)
if corr(x,y,'type','Pearson')>0
    beta0(1) = max(y) - min(y);
else
    beta0(1) = min(y) - max(y);
end
beta0(2) = 1/std(x);
beta0(3) = mean(x);
beta0(4) = -1;
beta0(5) = mean(y);

beta = nlinfit(x,y,@logistic5,beta0);
x_fit = feval(@logistic5, beta, x);

function f = logistic5(beta, x)
f = beta(1).*(0.5-(1./(1+exp(beta(2).*(x-beta(3)))))) + beta(4).*x + beta(5);        