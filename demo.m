% DEMO Code
% Version 0.1,  5.2022, by Hangwei Chen, Feng Shao @ NBU
% -----------------------------------------------------------------------------
% You can run this m file in MATLAB:
% -----------------------------------------------------------------------------
% Paper citation information:
% Author: Hangwei Chen, Xiongli Chai, Feng Shao, Xuejin Wang, Qiuping Jiang, Xiangchao Meng, and Yo-Sung Ho, 
% Title: "Perceptual Quality Assessment of Cartoon Images ,"
%  
% IEEE TRANSACTIONS ON MULTIMEDIA, Accept, 2021.
%-----------------------------------------------------------------------------

clc;clear all

load svr_model.mat
img=imread('Sasuke.jpg');
features = feature_extract(img);
score = quality_prediction(features, svr_model);

disp(['quality score  = ' num2str(score, '%0.4f')]);


