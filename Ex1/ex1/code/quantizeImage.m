function [imQuant, error] = quantizeImage(imOrig, nQuant, nIter)
% Performs optimal quantization of a given grayscale or RGB image.
%  INPUT:
% imOrig - is the input grayscale or RGB image to be quantized.
% nQuant - is the number of intensities your output imQuant image should have.
% nIter - is the maximum number of iterations of the optimization procedure. (May converge earlier.
% OUTPUT:
% imQuant - the quantize output image
% error- an error plot representing the total intensities error for each
% iteration in the quantization procedure, i.e <nIter over 1> 

% display the input image;
figure;
imshow(imOrig);

%validate input and in case of RGB, take only the Y channel
dim = numel(size(imOrig));
% I assumed that if I have 3-D matrix it is RGB and not anything else!
% I can't check here the colorType because I don't have the imFile..
if dim == 3 % truecolor
    imYIQOrig = rgb2ntsc(imOrig);
    imOrigT = imYIQOrig(:,:,1);
else
    if dim ==2
        imOrigT = imOrig;
    %else
    % error('Error, this function support only RGB or B/W images');
    end
end
[m,n] = size(imOrigT);
imOrigT = imOrigT(:);

% initialize z vector with the initialize nQuant indeces of the partition
% (each part has the same number of pixels approximately in avarage)
histOrig = imhist(imOrigT,256);
av = round(sum(histOrig)/nQuant);
s = cumsum(histOrig);

% initialize q, z, error vectors
z = zeros(nQuant+1,1)-1;
z(1) = 0;
z(nQuant+1) = 255;
zT = z;
q = zeros(nQuant,1)-1;
LUT = zeros(256,1)-1;
error = zeros(nIter,1)-1;
flag = false;

% Iterate nIter times over this process:
for iterIdx = 1:nIter
    % STEP #1
    % Finding z - the borders which divide the histograms into segments. z is a vector containing nQuant+1
    % elements. The first and last elements are 0 and 255 respectively
    if (iterIdx == 1)
            for zIdx =1:nQuant-1
                biggerThenAv = find(s>=av*zIdx);
                if (isempty(biggerThenAv))
                    display('nQuant is too big for this image can NOT divid vector to nQuant parts');
                end
                z(zIdx+1) = biggerThenAv(1);
            end
            if (sum(histOrig(z(nQuant): z(nQuant+1))) == 0)
                display('Can NOT divid vector to nQuant parts equivalent because it will cause for division by -0 in future');
            end
            zT = z;
    else
        for zTIdx=1:nQuant- 1
           zT(zTIdx+1) = round(double(q(zTIdx)+q(zTIdx+1))/2);
        end
        if( z == zT)
            flag = true;
        end
    end
    display('z: ');
    display(zT');
    
    % STEP #2
    % Finding q - the values that each of the segments' intensities will map to. q is also a vector, however,
    % containing nQuant elements.
    for qIdx=1:nQuant
        zFrom= zT(qIdx) +1;
        zTo = zT(qIdx+1);
        if(qIdx == nQuant)
            zTo = 256;
        end
        indexes = zFrom:zTo;
        sumNumerator = sum( histOrig(indexes).*(indexes-1)');
        sumDenomirator = sum( histOrig(indexes));
        q(qIdx) = round(sumNumerator/sumDenomirator);
    end
     display('q: ');
     display(q');
     
    %STEP #3
    % calculate error of quantization
    % perform the quantization on imOrig
    for idx = 1:nQuant
        LUT(zT(idx)+1:(zT(idx+1)+1)) = q(idx);
    end
    
    histAfterQ = LUT.* (round(histOrig));
    histBeforeQ = (0:255)' .* (round(histOrig));
    newError = sqrt(sum( (histAfterQ - histBeforeQ).^2 ));
     z = zT;
     if(flag)
         display ('Convergence of z');
        break;
     end
     error(iterIdx) = newError;
end
    % imAfterQuant = LUT(round(imOrigT*255)+1);
   % error(iterIdx) = sqrt(sum((double(histAfterQ)/255 - imOrigT).^2)); 

error = error(error > -1);
imAfterQuant = LUT(round(imOrigT*255)+1);
imAfterQuant = reshape(double(imAfterQuant)/255, m, n);

% for RGB pic - convert back from YIQ to RGB
% while only the Y-ch (first, for intensity) changed by the hist
if dim == 3 % truecolor
    imYIQ_1ch = imAfterQuant;
    imYIQ_allch = imYIQOrig;
    imYIQ_allch(:,:,1) = imYIQ_1ch;
    imQuant = ntsc2rgb(imYIQ_allch);
else
    if dim ==2 % 'grayscale'
        imQuant = imAfterQuant;   
    end
end

figure;
imshow(imQuant);
figure; plot(error);
end