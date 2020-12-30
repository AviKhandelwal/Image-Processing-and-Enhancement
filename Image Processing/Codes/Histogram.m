%Histogram Specification

clc;
clear all;
close all;
%Reading the input image
img1 = imread("givenhist.jpg");

[r1 c1] = size(img1); % Rows and columns in image

hist1_inp = zeros(256,1);

%Calculating input image histogram values
for i = 1:r1
    for j = 1:c1
        k = img1(i,j);
        hist1_inp(k+1) = hist1_inp(k+1) + 1;
    end
end

pdf1 = hist1_inp/(r1*c1); %pdf of input image histogram

%Calculating input image CDF
sk = zeros(256,1);
sk(1) = pdf1(1);
for i = 2:256
    sk(i) = sk(i-1)+ pdf1(i);
end

sk = round(sk*255);

%Reading the input image to be matched
img2 = imread("sphist.jpg");
hist2_inp = zeros(256,1);

%Calculating histogram values of the image to be matched
for i = 1:r1
    for j = 1:c1
        k = img2(i,j);
        hist2_inp(k+1) = hist2_inp(k+1) + 1;
    end
end

pdf2 = hist2_inp/(r1*c1); %pdf calculation
sz = zeros(256,1);
%cdf calculation
sz(1) = pdf2(1);
for i = 2:256
    sz(i) = sz(i-1)+ pdf2(i);
end

sz = round(sz*255);

%Transformation function calculation
T = (255)*ones(256,1);
for i = 1:256
    for j = 1:256
       if sk(i) < sz(j)
           if sz(j)-sk(i) > sk(i) - sz(j-1)
               T(i) = j-1;
               break;
           end
           if sz(j)-sk(i) < sk(i) - sz(j-1);
               T(i) = j;
               break;
          end
       end
     end
end

%Histogram specification
img_out = zeros(r1,c1);
for i = 1:r1
    for j = 1:c1
        img_out(i,j) = T(img1(i,j)+1)-1;
    end
end
img_out = uint8(img_out); 

figure(1);
imshow(img1)
title("Given image");
figure(2);
imhist(img1);
title("Given Histogram");

figure(3);
imshow(img2)
title("Specifed image");
figure(4);
imhist(img2)
title("Specified Histogram");


figure(5);
imshow(img_out)
title("Transformed image");
figure(6);
imhist(img_out)
title("Transformed Histogram");