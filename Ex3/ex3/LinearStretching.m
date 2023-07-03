function imLinearStretched = LinearStretching ( imOrig )
% Linear stretch of an image

% imOrig dimantions
[m,n] = size(imOrig);

% convert image to vector
imOrigT = imOrig(:);
histOrig = imhist(imOrigT,256);

noneZeroElements = find(histOrig);
startIdx = noneZeroElements(1);
endIdx = noneZeroElements(end);
range = endIdx - startIdx;
% linear strech: OUTVAL = (INVAL - INLO) * ((OUTUP-OUTLO)/(INUP-INLO)) + OUTLO
imLinear = (imOrigT.*255-startIdx+1)/range;

% correct the image by the new values from the histogram
imLinearStretched = reshape(imLinear, m, n);
end