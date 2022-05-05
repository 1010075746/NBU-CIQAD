function block = img_partition(img, gpc)
% image parted into several blocks
% function block = img_partition(img, gpc)
% Inputs:
%   img   - image in RGB format 
%   gpc   - grid partition constant
%
% Outputs:
%   block    - image blocks 

% size of image
[h_img, w_img] = size(img(:, :, 1));
% size of each
block_size = fix(size(img(:, :, 1))/gpc);
h_block = block_size(1);
w_block = block_size(2);
for i = 1:gpc 
    for j = 1:gpc 
        % pointer to locate image blocks
        row = h_block*(i - 1) + 1; %row是行
        col = w_block*(j - 1) + 1; %col是列
        % adjust block size
        if i == gpc
            h_block = h_img - (gpc - 1)*h_block;
        end
        if j == gpc
           w_block = w_img - (gpc - 1)*w_block;
        end
        % every block stored into a cell
        block{(i - 1)*gpc + j} = img(row:row + h_block - 1, ...
                    col:col + w_block - 1, :); 
    end
end