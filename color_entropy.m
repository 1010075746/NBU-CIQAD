function CE = color_entropy(image)
image=double(image);
img_H=image(:,:,1);
img_S=image(:,:,2);
img_V=image(:,:,3);
I ={img_H,img_S,img_V};
F_all=[];
for i=1:3
    % MSCN coefficients
    img=I{i};
    window = fspecial('gaussian',5,7/5);  
    window = window/sum(sum(window));
    mu            = filter2(window, img, 'same');
    mu_sq         = mu.*mu;
    sigma         = sqrt(abs(filter2(window, img.*img, 'same') - mu_sq));
    MSCN          = (img-mu)./(sigma+1);
    %---------------------------------
    % average filter
    h1=fspecial('average',[2,2]); 
    MSCN_avg=imfilter(MSCN,h1); 
    %---------------------------------
    % calculate entropy
    MSCN_entr = Imentropy(MSCN);      
    MSCN_avg_entr=Imentropy(MSCN_avg);  
    %---------------------------------
    feature=[MSCN_entr,MSCN_avg_entr]; 
    F_all=[F_all,feature];
    CE=F_all;
end
