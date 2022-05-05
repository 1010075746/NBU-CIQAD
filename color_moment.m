function CM = color_moment(img, gpc)
% Extract Color Moments (CM) features from a image
% function CM = extractCM(img, gpc)
% Inputs:
%   img   - image in HSV format 
%   gpc   - grid partition constant for CM features extraction
%
% Outputs:
%   CM    - CM features 

currentBlockIndex = 1;
block = img_partition(img, gpc);
for i = 1:gpc 
    for j = 1:gpc 
        % pointer to locate CM features in CM vector
        p_cm = gpc*gpc*(currentBlockIndex - 1) + 1; 
        
        % matrix to vector for each channel
        cur_block = block{(i - 1)*gpc + j};
        currentBlock = reshape(cur_block, size(cur_block, 1)*size(cur_block, 2), 3); %将cur_block 重构成size(cur_block, 1)*size(cur_block, 2), 3大小的矩阵
        
        % 3 mean values
        curMean = mean(currentBlock); 
        CM(p_cm:p_cm + 2) = curMean; 
        
        % 3 variances values
        curVar = std(currentBlock); 
        CM(p_cm + 3:p_cm + 5) = curVar;
        
        % 3 skewness values
        curSkew = skewness(currentBlock, 1); 
        CM(p_cm + 6:p_cm + 8)= curSkew;  
        
        
        
        
       
     
        
        currentBlockIndex = currentBlockIndex+1;
    end
end
CM(find(isnan(CM)==1))=0;
