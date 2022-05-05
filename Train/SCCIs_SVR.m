clear all;clc;tic;
for j=1:10 
%% Load data

load SCCIs_features.mat
load MOS_SCCIs

features_data = (SCCIs_features');
label=MOS_SCCIs';

%% Completely randomly selected, 80% were trained and 20% were tested

a=randperm(1900);
b=a(1:round(1900*0.8));
c=a(round(1900*0.8)+1:1900);
data_train= features_data(:,b)';  
label_train= label(b)';

%% SVR 
bestp = 0.1;  
bestc = 128;  bestg = 1;   
libsvm_options = ['-c ',num2str(bestc),' -g ',num2str(bestg),' -s 3 -p ',num2str(bestp)];
data_test = features_data(:,c)';
label_test = label(c)';

svr_model = svmtrain(label_train, data_train, libsvm_options);
[pred_mos, accuracy, prob_esti] = svmpredict(label_test, data_test, svr_model);

%% Performance

srcc = IQAPerformance(pred_mos(:),label_test(:),'s');
krcc = corr(pred_mos(:),label_test(:),'type','Kendall');
plcc = IQAPerformance(pred_mos(:),label_test(:),'p');
rmse = IQAPerformance(pred_mos(:),label_test(:),'e');

PLCC(j)=plcc;SRCC(j)=srcc;KRCC(j)= krcc;RMSE(j)=rmse;

end
%% Results (1000 iterations)
disp('-------------------------------------------------------------------------------');
disp(['mean PLCC  = ' num2str(mean(PLCC), '%0.4f')]);
disp(['mean SROCC = ' num2str(mean(SRCC), '%0.4f')]);
disp(['mean KROCC = ' num2str(mean(KRCC), '%0.4f')]);
disp(['mean RMSE  = ' num2str(mean(RMSE), '%0.4f')]);
disp('-------------------------------------------------------------------------------');
%% %%%%
toc;