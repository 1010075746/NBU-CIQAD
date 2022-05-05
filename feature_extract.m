function features = feature_extract(img)
%% Structure feature
F_GD = gradient_domain(img);
F_EQ = UISM(img);
structure_features = [F_GD ,F_EQ];
%% Color feature
img_hsv = rgb2hsv(img);
F_CM = color_moment(img_hsv, 1);
F_CE = color_entropy(img_hsv);
color_features = [F_CM,F_CE];
%% All feature
features=[color_features,structure_features];