function score= quality_prediction(all_features, svr_model)
test_label = 1; % In the prediction phase, the test_label can be unknown. Here, we simply set to 1 .
[pred_mos, ~, ~] = svmpredict(test_label, all_features, svr_model);
score=pred_mos;