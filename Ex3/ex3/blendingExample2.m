% script- blendingExample2.m
filename_2A = 'im_2A.jpg';
filename_2B = 'im_2B.jpg';
X_A = imfinfo(filename_2A);
X_B = imfinfo(filename_2B);
if (strcmp(X_A.ColorType, 'truecolor') && (strcmp(X_B.ColorType, 'truecolor')))
    im_2A = imReadAndConvert(filename_2A, 2);
    im_2B = imReadAndConvert(filename_2B, 2);
else
    im_2A = imReadAndConvert(filename_2A, 1);
    im_2B = imReadAndConvert(filename_2B, 1);
end

mask_2 = imReadAndConvert('mask_2.jpg', 1);
maxLevels = 5;
filterSizeIm = 5;
filterSizeMask = 5;

% for RGB:
imBlend = zeros(size(im_2A));
imageSize = size(im_2A,3);
for idx = 1 :imageSize 
    % blend image
    imBlend(:,:,idx) = pyramidBlending(im_2A(:,:,idx), im_2B(:,:,idx), mask_2, maxLevels, filterSizeIm, filterSizeMask);
end
    
% display the 2 input images, mask and the result image
figure; imshow( im_2A );
figure; imshow( im_2B );
figure; imshow( mask_2 );
figure; imshow( imBlend );