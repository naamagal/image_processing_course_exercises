function magnitude = convDerivative(inImage)
% convDerivative computes the magnitude of image derivatives.
% INPUT: inImage is a grayscale image of type double.
% OUTPUT: drivedImages is a grayscale image of type double, contains the
% magnitude of the drived image by X direction and Y direction.

% creat derivative mask
dx = [1 0 -1];
dy = [1 ; 0 ; -1];

% same- take the center of the covolved image (to be as the size of the
% original image
imageDx = conv2(inImage, dx, 'same');
imageDy = conv2(inImage, dy, 'same');

imageDx = imageDx .^ 2;
imageDy = imageDy .^ 2;
magnitude= sqrt(imageDx + imageDy);

% show original image and magnitude image
figure;
subplot(1,2,1), subimage(inImage);
subplot(1,2,2), subimage(magnitude);

end

