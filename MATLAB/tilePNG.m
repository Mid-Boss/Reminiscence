function [Itile] = tilePNG(imname,nrows,ncols,outname)
% Itile = tilePNG(imname,nrows,ncols,outname);
%
% Reads a .png file and creates a tiled version of it. The output image has
% has copies of the original image with nrows and ncols rows and columns.
% Specify an output file name to save a copy of the tiled image.

% Readpng file and break into RGB components
 [I,~,alph] = imread(imname);
 I1 = I(:,:,1);
 I2 = I(:,:,2);
 I3 = I(:,:,3);
 
% Preallocate sizes of tiled RGB components
%[h,w] = size(I1);
%I1tile = zeros(nrows*h,ncols*w);
%I2tile = zeros(nrows*h,ncols*w);
%I3tile = zeros(nrows*h,ncols*w);

% Identify zero-valued indices of I
%alph = uint8(ones(size(I1)));
%for i = 1:size(I1,1)
%  for j = 1:size(I1,2);
%    if(I1(i,j)==0 && I2(i,j)==0 && I3(i,j)==0)
%      alph(i,j) = uint8(0);
%%      alph(i,j) = uint8(-1);
%%      alph(i,j) = uint8(-1);
%    end
%  end
%end

% Populate all rows, column 1 of tiled image RGB components
I1tileR = I1;
I2tileR = I2;
I3tileR = I3;
alphR   = alph;
for i = 2:nrows
  I1tileR = [I1tileR;I1];
  I2tileR = [I2tileR;I2];
  I3tileR = [I3tileR;I3];
  alphR   = [alphR;alph];
end

% Populate remaining columns of tile image RGB components
I1tileC = I1tileR;
I2tileC = I2tileR;
I3tileC = I3tileR;
alphC   = alphR;
for j = 2:ncols
  I1tileC = [I1tileC,I1tileR];
  I2tileC = [I2tileC,I2tileR];
  I3tileC = [I3tileC,I3tileR];
  alphC   = [alphC,alphR];
end

% Combine into tiled image
Itile(:,:,1) = I1tileC;
Itile(:,:,2) = I2tileC;
Itile(:,:,3) = I3tileC;

% Save image
%keyboard
imwrite(Itile,outname,'Alpha',alphC);
