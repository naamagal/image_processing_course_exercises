function img = LaplacianToImage(lpyr, filter, coeffMultVec)
% LaplacianToImage implements the reconstruction of an image from its Laplacian Pyramid
%INPUT:
% pyr is a Laplacian pyramid
% filter used to built the pyramid
% coeffMultVec is a coefficient vector (size is the same as the number of
% levels in the pyramid lpyr)
%OUTPUT:
% img- constructed image 

pyrSize = size(lpyr,1);
img =  cell2mat(lpyr(pyrSize));
for pyrIdx = pyrSize-1:-1:1
    expandedIm = ExpandImg(img, filter );
    largerLap = lpyr {pyrIdx} * coeffMultVec( pyrIdx );
    img = expandedIm + largerLap;
end

