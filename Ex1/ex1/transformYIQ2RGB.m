function imgRGB = transformYIQ2RGB(imYIQ)
% transformYIQ2RGB convert image from RGB format to YIQ format

% assume that the given image is double [0 1] 
%imYIQ = double(imYIQ)./255;

% find 2-D size of matrix
% n = num of rows
% m = num of culumns
[n,m] = size(imYIQ(:,:,1));

% define a matrix in size of 3 x (#ofPixel)
% while:
% row #1 = R
% row #2 = G
% row #3 = B
YIQMatrix = zeros(3,n*m);
YIQMatrix(1,:) = reshape(imYIQ(:,:,1), 1 ,numel(imYIQ(:,:,1)));
YIQMatrix(2,:) = reshape(imYIQ(:,:,2), 1 ,numel(imYIQ(:,:,2)));
YIQMatrix(3,:) = reshape(imYIQ(:,:,3), 1 ,numel(imYIQ(:,:,3)));

% multiply imageYIQ in transform matrix (inverse of the one we had on slides) to get RGB matrix..
YIQ2RGBConvertMatrix = inv( [0.299 0.587 0.114; 0.596 -0.275 -0.321; 0.212 -0.523 0.311]);

imgRGBTemp = YIQ2RGBConvertMatrix * YIQMatrix;
imgRGB(:,:,1) = reshape(imgRGBTemp(1,:), n, m);
imgRGB(:,:,2) = reshape(imgRGBTemp(2,:), n, m);
imgRGB(:,:,3) = reshape(imgRGBTemp(3,:), n, m);

%imgRGB =imgRGB*.255;
end