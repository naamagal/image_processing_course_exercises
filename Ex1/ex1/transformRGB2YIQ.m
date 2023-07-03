function  imgYIQ = transformRGB2YIQ(imRGB)
% transformRGB2YIQ convert image from RGB format to YIQ format
% assume that the given image is double [0 1] 

%imRGB = double(imRGB)./255;

% find 2-D size of matrix
% n = num of rows
% m = num of culumns
[n,m] = size(imRGB(:,:,1));

% define a matrix in size of 3 x (#ofPixel)
% while:
% row #1 = R
% row #2 = G
% row #3 = B
RGBMatrix = zeros(3,n*m); %  (3, floor(numel(imRGB)/3))
RGBMatrix(1,:) = reshape(imRGB(:,:,1), 1 ,numel(imRGB(:,:,1)));
RGBMatrix(2,:) = reshape(imRGB(:,:,2), 1 ,numel(imRGB(:,:,2)));
RGBMatrix(3,:) = reshape(imRGB(:,:,3), 1 ,numel(imRGB(:,:,3)));

% multiply imageRGB in transform matrix to get YIQ matrix..
RGB2YIQConvertMatrix = [0.299 0.587 0.114; 0.596 -0.275 -0.321; 0.212 -0.523 0.311];

imgYIQTemp =  RGB2YIQConvertMatrix*RGBMatrix;
imgYIQ(:,:,1) = reshape(imgYIQTemp(1,:), n, m);
imgYIQ(:,:,2) = reshape(imgYIQTemp(2,:), n, m);
imgYIQ(:,:,3) = reshape(imgYIQTemp(3,:), n, m);

%imgYIQ = imgYIQ.*255;
end