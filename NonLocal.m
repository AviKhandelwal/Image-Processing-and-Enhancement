% non-local means filter

close all;
clc;
clear all;

%Reading the input image 
im = imread('lenna.noise.jpg');

subplot(1,2,1);% Original image
imshow(im)
title("Original image");

im = double(im); % To carry out big number calculations on pixel intensities
[m,n] = size(im); % Number of rows and columns in image 
d = ones(m,n); % array of m*n containing all ones

%Starting the iteration at 6,6 because in its 5*5 neibourhood at the
%top-left corner pixel will be at 4,4 and considering 7*7 patch around this
%pixel its top left pixel will be at 1,1, so we will not be going out of
%array using 6,6 as stating point. Similary ending at m-6,n-6.

for i = 6:m-6
    for j = 6:n-6
        v = im(i-3:i+3,j-3:j+3); % 7*7 patch around im(i,j)
        sum = 0; % It will be storing the sum of weights
        patch = zeros(7,7); % It will be storing sum of weighted patches in the 5*5 neibourhood of v
        for r = -2:2 %Iterating over 5*5 neibourhood
            for c = -2:2
                x = i+r;
                y = j+c;
                w = im(x-3:x+3,y-3:y+3); %ones of the patches in the 5*5 neibourhood of v
                diff = (v-w)^2; % Squared differences between the intensity values of the two patches
  
                %Finding out the sum of all the sq differences in the diff
                %array which is 7*7
                norm = 0; % will be storing the sum of all the sq differences
                for p = 1:7
                    for q=1:7
                        norm = norm + diff(p,q);
                    end
                end
                s = exp(-1*(norm)/10^10);% Calculating the weight on the patch
                w = w.*s;
                patch = patch + w; %Sum of the intensity values in all weighted patches in the 5*5 neibourhood
                sum = sum + s; % Sum of all weights in the 5*5 neibourhood
            end
        end
        d(i-3:i+3,j-3:j+3) = round(patch/sum); % Revised intensity values of im(i,j) patch 
    end
end

d1 = uint8(d); % type casting to unsigned int8 format
subplot(1,2,2);
imshow(d1); % Non-local means filtered image
title("Enhanced image");