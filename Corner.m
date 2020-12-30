% Corner Detection

clc;
clear all;
close all;
%Reading the input image
im = imread("IITG.jpg");
im = rgb2gray(im);% Changing into grey scale

% Considering a 3*3 sobel mask 
dx = [-1 -2 -1;0 0 0;1 2 1];
dy = [-1 0 1;-2 0 2;-1 0 1];

% Constructing gaussian kernel
sigma = 1;
mask = zeros(3,3);
sum = 0;
for i=1:3
    for j=1:3
        e = (i-2)^2+(j-2)^2;
        mask(i,j) = exp((-1*e)/(2*sigma^2));
        sum = sum + mask(i,j);
    end
end
mask = mask/sum; %Normalising

Ix = xcorr2(im,dx); %Gradient along X
Iy = xcorr2(im,dy); %Gradient along Y

Ix2 = xcorr2(Ix.^2,mask); %Convolving with gaussian kernel as the weighting factor 
Iy2 = xcorr2(Iy.^2,mask); 
Ixy = xcorr2(Ix.*Iy,mask);
Ix =  xcorr2(Ix,mask); 
Iy =  xcorr2(Iy,mask);

R = ((Ix2.*Iy2)-(Ixy).^2 -0.05*(Ix+Iy).^2); %Corner score

max_sup = ordfilt2(R,9,ones(3,3)); %Maximal Supression
harris_points = (R==max_sup) & (R > 5*10^7); %Another step of thresholding
[r,c] = find(harris_points); %(x,y) co-ordinates of corner points

figure(1)
imshow(im);
title("Original image");
figure(2)
imshow(im);
hold on;
plot(c,r,'ys');
title("Harris corners detected")