function blurImage = blurInImageSpace(inImage,kernelSize)
% blurInImageSpace performs image blurring using 2D convolution between
% inImage and a gaussian kernel by given kernelSize.

% find the binomial coefficient of the Gausian kernel, by given kernelSize
kernel = binomialKernel2D( kernelSize );

% Blur image (padding with zeros..)
blurImage = conv2(inImage, kernel, 'same');

figure;
subplot(1,2,1), subimage(inImage);
subplot(1,2,2), subimage(blurImage);

end

