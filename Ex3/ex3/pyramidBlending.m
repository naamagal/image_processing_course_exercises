function imBlend = pyramidBlending(im1, im2, mask, maxLevels, filterSizeIm, filterSizeMask)
% blend two images using laplacian pyramids
% INPUT:
% im1, im2 - are two input grayscale images to be blended.
% mask - is a binary mask containing 1's and 0's representing which parts of im1 and im2 should appear in the resulting imBlend.
% maxLevels - is the maxLevels parameter you should use when generating the Gaussian and Laplacian pyramids.
% filterSizeIm - is the size of the Gaussian filter ( od value, defining the filter used in the construction of the Laplacian pyramids of im1 and im2)
% filterSizeMask - is the size of the Gaussian filter (an odd scalar that represents a squared filter) which defining the filter used in the construction of the Gaussian pyramid of mask.
% OUTPUT:
% imBlended - the result blended image


% construct pyramids
[L1, filter] = LaplacianPyramid ( im1, maxLevels, filterSizeIm );
[L2, filter] = LaplacianPyramid ( im2, maxLevels, filterSizeIm );
[Gm, GaussianFilter] =  GaussianPyramid ( mask, maxLevels, filterSizeMask );

numOfLevels = size( L1,1 );
Lout =  cell( numOfLevels,1 );
for k = 1: numOfLevels
    Lout{k} = Gm{k}.*L1{k} + ( 1-Gm{k} ).*L2{k};
end

imBlend = LaplacianToImage(Lout, filter, ones(numOfLevels));
end

