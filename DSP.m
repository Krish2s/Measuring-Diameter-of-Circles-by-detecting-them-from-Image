%% Measuring Diameter of circle in an image
%%Aman Kumar -TETA06
%%krushna Garkal -TETA10

clc;close all;

%% Import image
obj=imread('images.jpeg');
imshow(obj)

%% Segment Image

red=obj(:,:,1);
green=obj(:,:,2);
blue=obj(:,:,3);

figure(1)
subplot(2,2,1);
imshow(obj);
title('Original Image');
subplot(2,2,2);
imshow(red);
title('Red Plane');
subplot(2,2,3);
imshow(green);
title('Green Plane');
subplot(2,2,4);
imshow(blue);
title('Blue Plane');

%% Threshold the blue plane 
figure(2)
level=0.37;
bw2=im2bw(blue,level);
subplot(2,2,1);
imshow(bw2);
title('Blue Plane threshholded');


%% Remove Noise 

%%Fill any holes

fill=imfill(bw2,'holes');
subplot(2,2,2);
imshow(obj);
title('Holes filled');

%%Remove any blobs on the border of the image

clear=imclearborder(fill);
subplot(2,2,3);
imshow(clear);
title('Remove blobs on border');

%% Remove blobs that are smaller than 7 pixels across

se=strel('disk',7);
open=imopen(fill,se);
subplot(2,2,4);
imshow(open);
title('Remove small blobs');

%% Measure Object Diameter

diameter=regionprops(open,'MajorAxisLength')

%%Show Result
figure(3)
imshow(obj)
d=imdistline; %includes line to physically measure the ball


