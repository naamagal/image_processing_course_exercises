function [ imageOutput] = imReadAndConvert(filename, representation )
% imReadAndConvert function - reads a given image  and converts it into a given representation
% INPUT:
% filename - string containing the image filename to read
% grayscale: representation = 1, RGB: reperesentation = 2
% OUTPUT:
% imageOutput - same image in the requested representation

I = imread(filename);
% convert image to [1,0]
I = double(I)/255;

X = imfinfo(filename);
if representation == 1 % gray Scale
    if strcmp(X.ColorType, 'grayscale') 
        imageOutput = I;
    else
        imageOutput = rgb2gray(I);
    end
else
    if representation == 2 % RGB
        if strcmp (X.ColorType,  'truecolor' )
        imageOutput = I;
        else
           error('Error. \nCan not convert grayscale picture to RGB');
        end
    end
end

end