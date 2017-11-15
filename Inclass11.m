% Inclass11
% Walter Frank Lenoir
%GB comments
1) 100
2) 100
3) 100
4) 100
overall: 100

% You can find a multilayered .tif file with some data on stem cells here:
% https://www.dropbox.com/s/83vjkkj3np4ehu3/011917-wntDose-esi017-RI_f0016.tif?dl=0

% 1. Find out (without reading  the entire file) -  (a) the size of the image in
% x and y, (b) the number of z-slices, (c) the number of time points, and (d) the number of
% channels.

reader1 = bfGetReader('011917-wntDose-esi017-RI_f0016.tif');

[reader1.getSizeX,reader1.getSizeY]
 %a) X and Y size = 1024
 reader1.getSizeZ
 %b) Z sides = 1
 reader1.getSizeT
 %c) 68 time points
 reader1.getSizeC
 %d) 2 number of channels

% 2. Write code which reads in all the channels from the 30th time point
% and displays them as a multicolor image.

iplane = reader1.getIndex(1-1,1-1,30-1)+1;
img1 = bfGetPlane(reader1,iplane);
iplane = reader1.getIndex(1-1,2-1,30-1)+1;
img2 = bfGetPlane(reader1,iplane);
img2show = cat(3,imadjust(img1),imadjust(img2),zeros(size(img1)));
imshow(img2show);

% 3. Use the images from part (2). In one of the channels, the membrane is
% prominently marked. Determine the best threshold and make a binary
% mask which marks the membranes and displays this mask. 

iplane = reader1.getIndex(1-1,1-1,30-1)+1;
img1 = bfGetPlane(reader1,iplane);
imshow(imadjust(img1));

img_bw = img1 > 900;
imshow(img_bw);

% 4. Run and display both an erosion and a dilation on your mask from part
% (3) with a structuring element which is a disk of radius 3. Explain the
% results.

imshow(imdilate(img_bw,strel('disk',3)));

%The code above creates a morphological structuring element of a disk with
%radius 3. It helps outline the edges of the membrane from the mask. This
%also helps point out artifacts in the image that were not observable
%prior.
