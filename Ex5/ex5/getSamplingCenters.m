function [sampleCentersX,sampleCentersY,renderedPyramid] = getSamplingCenters( xCenters, yCenters, centersPyrLevel, pyr, levelsUp )
% GETSAMPLINGCENTERS Given 3 nearest neighbors for each patch of the input image, from the patches DB,
% find the location of parent patch in the rendered pyramid image
% INPUT:
% xCenters: (m - 4) x (n - 4) x 3 matrix with the x coordinates of the closest patches (child patches) to each sampled patch from the image
% yCenters: (m - 4) x (n - 4) x 3 matrix with the y coordinates of the closest patches (child patches) to each sampled patch from the image
% centersPyrLevel: (m - 4) x (n - 4) x 3 matrix with the levels of the closest patches to each sampled patch from the image
% pyr: 7 x 1 cell created using createPyramid
% levelsUp   integer which tells how much levels up we need to sample the parent patch, from the found patch.
% OUTPUT:
% sampleCentersX: (m - 4) x (n - 4) x 3 matrix with the x coordinates of the center of the patches in the rendered image
% sampleCentersY: (m - 4) x (n - 4) x3 matrix with the y coordinates of the center of the patches in the rendered image
% renderedPyramid: a single image containing all levels of the pyramid

renderedPyramid = renderPyramidEx5(pyr);
[xPositions, yPositions,levels] = transformPointsLevelsUp(xCenters, yCenters, centersPyrLevel, pyr, levelsUp);
shift =  [0; cellfun(@(p) size(p, 2),pyr)];
shift = cumsum(shift);
[m,n,k] = size(levels);

L = reshape(levels, m*n,k);
xPositions = reshape(xPositions, m*n, k);
yPositions = reshape(yPositions, m*n, k);

sampleCentersX = zeros(m * n, k);
sampleCentersY = zeros(m * n, k);

for i = 1+levelsUp:3+levelsUp
    indeces = (L ==i);
    sampleCentersX(indeces) = xPositions(indeces) + shift(i);
    sampleCentersY(indeces) = yPositions(indeces);
end

sampleCentersX = reshape(sampleCentersX, m,n,k);
sampleCentersY = reshape(sampleCentersY, m,n,k);

end