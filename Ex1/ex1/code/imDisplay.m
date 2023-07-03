function imDisplay( fileName, representation)
% Display an image in a given presentation
% INPUT:
% imageFile - is the file path
% presentation could be 1 or 2 for B/W or RGB respectively
imageOutput = imReadAndConvert(fileName, representation);
figure;
imshow(imageOutput);
impixelinfo;

end

