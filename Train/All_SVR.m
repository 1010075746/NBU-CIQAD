clear all;clc;tic;
for j=1:10 
%% Load data

load All_features.mat
load MOS_all

features_data = (All_features');
label=MOS_all';

%% Completely randomly selected, 80% data were trained and 20% data were tested

a=randperm(2700);
b=a(1:round(2700*0.8));
c=a(round(2700*0.8)+1:2700);
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