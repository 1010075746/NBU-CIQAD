function GD = gradient_domain(img)
GD=[];
img=rgb2gray(img);
[m, n] = size(img);
d = double(img);
dSobel = img;
for img = 2 : m-1
for j = 2 : n-1
Gx = (d(img+1,j-1) + 2*d(img+1,j) + d(img+1,j+1)) - (d(img-1,j-1) + 2*d(img-1,j) + d(img-1,j+1));
Gy = (d(img-1,j+1) + 2*d(img,j+1) + d(img+1,j+1)) - (d(img-1,j-1) + 2*d(img,j-1) + d(img+1,j-1));
dSobel(img, j) = sqrt(Gx^2 + Gy^2);

end
end
dstImage = LBP(dSobel);

s0=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==0
            s0=s0+double(dSobel(q,w));
        end
    end
end
s0=s0/10000000;
s1=0;
% [K, L] = size(dstImage); 
for q=1:m
    for w=1:n
        if dstImage(q,w)==1
            s1=s1+double(dSobel(q,w));
        end
    end
end
s1=s1/10000000;

s2=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==2
            s2=s2+double(dSobel(q,w));
        end
    end
end
s2=s2/10000000;

s3=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==3
            s3=s3+double(dSobel(q,w));
        end
    end
end
s3=s3/10000000;

s4=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==4
            s4=s4+double(dSobel(q,w));
        end
    end
end
s4=s4/10000000;

s5=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==5
            s5=s5+double(dSobel(q,w));
        end
    end
end
s5=s5/10000000;

s6=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==6
            s6=s6+double(dSobel(q,w));
        end
    end
end
s6=s6/1000000;

s7=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==7
            s7=s7+double(dSobel(q,w));
        end
    end
end
s7=s7/1000000;

s8=0;
for q=1:m
    for w=1:n
        if dstImage(q,w)==8
            s8=s8+double(dSobel(q,w));
        end
    end
end
s8=s8/1000000;
S=[s0,s1,s2,s3,s4,s5,s6,s7,s8];
GD=[GD;S];