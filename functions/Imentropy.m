function entr = Imentropy(im)
    I = roundn(im,-1) ;  %取小数点后n位
    [C,R] = size(I);      %求图像的规格
    Img_size = C * R;       %图像像素点的总个数
    P_N = unique(I);
    L = length(P_N);
    H_img = 0;
    nk = zeros(L,1);
    for i = 1 : C
        for j = 1 : R
            for k = 1 : L
                temp = P_N(k,1);
                if I(i,j) == temp
                    nk(k,1) = nk(k,1) + 1;
                end
            end
        end
    end
    for k = 1 : L
        Ps(k) = nk(k)/Img_size;       %计算每一个灰度级像素点所占的概率
        if Ps(k)~=0;                  %去掉概率为0的像素点
            H_img = -Ps(k)*log2(Ps(k))+H_img;    %求熵值的公式
        end
    end
    entr = H_img;
 end