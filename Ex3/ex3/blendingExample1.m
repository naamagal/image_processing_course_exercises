% script- blendingExample1.m
filename_1A = 'im_1A.jpg';
filename_1B = 'im_1B.jpg';
X_A = imfinfo(filename_1A);
X_B = imfinfo(filename_1B);
if (strcmp(X_A.ColorType, 'truecolor') && (strcmp(X_B.ColorType, 'truecolor')))
    im_1A = imReadAndConvert(filename_1A, 2);
    im_1B = imReadAndConvert(filename_1B, 2);
else
    im_1A = imReadAndConvert(filename_1A, 1);
    im_1B = imReadAndConvert(filename_1B, 1);
end

mask_1 = imReadAndConvert('mask_1.jpg', 1);
maxLevels = 6;
filterSizeIm = 7;
filterSizeMask = 7;

% for RGB:
imBlend = zeros(size(im_1A));
imageSize = size(im_1A,3);
for idx = 1 :imageSize 
    % blend image
    imBlend(:,:,idx) = pyramidBlending(im_1A(:,:,idx), im_1B(:,:,idx), mask_1, maxLevels, filterSizeIm, filterSizeMask);
end
    
% display the 2 input images, mask and the result image
figure; imshow( im_1A );
figure; imshow( im_1B );
figure; imshow( mask_1 );
figure; imshow( imBlend );