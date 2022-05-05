function dstImage = LBP(srcImage)
 
if ndims(srcImage) == 3
   srcImage =  rgb2gray(srcImage); 
end
 
I = im2double(srcImage); 
 
[m, n] = size(I); 
J = zeros(m, n); 

 for i = 2 : m-1
   for j = 2 : n-1
       J(i,j) = ( I(i-1,j-1) > I(i,j) )  + ...
                ( I(i-1,j) > I(i,j) ) + ...
                ( I(i-1,j+1) > I(i,j) )  + ...
                ( I(i,j+1) > I(i,j) )  + ...
                ( I(i+1,j+1) > I(i,j) )  + ...
                ( I(i+1,j) > I(i,j) )  + ...
                ( I(i+1,j-1) > I(i,j) )  + ...
                ( I(i,j-1) > I(i,j) ) ; 
   end
end
 dstImage = J; 