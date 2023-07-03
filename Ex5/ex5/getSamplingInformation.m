function [assignmentPositionsX,assignmentPositionsY,samplingPositionsX,samplingPositionsY] = ...
            getSamplingInformation1(sampleCentersX,sampleCentersY,pyr,inputPatchesCentersX,inputPatchesCentersY,levelsUp)
% GETSAMPLINGINFORMATION
% Get the information for sampling a high resolution image. Pairs of: assignment positions in the high resolution image,
% and sampling positions from the rendered pyramid image
% INPUT:
% sampleCentersX: (m - 4) x (n - 4) x 3 matrix with the x coordinates of the center of the high resolution patches in the rendered image.
% This variable should be returned from getSamplingCenters function. (green x locations)
% sampleCentersY: (m - 4) x (n - 4) x 3 matrix with the y coordinates of the center of the high resolution patches in the rendered image.
% This variable should be returned from getSamplingCenters function. (green y locations).
% pyr: 7 x 1 cell created using createPyramid
% inputPatchesCentersX: (m - 4) x (n - 4) input patches center x coordinates
% inputPatchesCentersY: (m - 4) x (n - 4) input patches center y coordinates
% levelsUp   integer which tells how much levels up we need to sample the window, from the found patch.
% OUTPUT:
% assignmentPositionsX: (m - 4) x (n - 4) x 3 x 5 x 5 -  x assignment coordinates in the high resolution image
% assignmentPositionsY   (m - 4) x (n - 4) x 3 x 5 x 5 -  y assignment coordinates in the high resolution image
% samplingPositionsX: (m - 4) x (n - 4) x 3 x 5 x 5 - x sampling coordinates in the rendered pyramid image
% samplingPositionsY: (m - 4) x (n - 4) x 3 x 5 x 5 - y sampling coordinates in the rendered pyramid image

%find up pixels of original image (levels.k=1)
[r,c,k] = size(sampleCentersX);
levels = ones(r,c).* 4;
[ UpPixelX,UpPixelY,~ ] = transformPointsLevelsUp (inputPatchesCentersX, inputPatchesCentersY, levels, pyr, levelsUp );
roundUpPixelX = floor(UpPixelX);
roundUpPixelY = floor(UpPixelY);

%mask for location in 5x5 patch
[patchFrameX, patchFrameY] = meshgrid(-2:2,-2:2);
patchFrameX = repmat(reshape(patchFrameX, [1, 1, 1, 5, 5]), [r c k]);
patchFrameY = repmat(reshape(patchFrameY, [1, 1, 1, 5, 5]), [r c k]);

%round patches in the up levels, add "mask of location in patch"
assignmentPositionsX = repmat(roundUpPixelX, [1, 1, 3, 5, 5]) + patchFrameX;
assignmentPositionsY = repmat(roundUpPixelY, [1, 1, 3, 5, 5]) + patchFrameY;

%find the difference between the rounded pixels to the non-rounded pixels
shiftX = repmat(roundUpPixelX - UpPixelX, [1 1 3]);
shiftY = repmat(roundUpPixelY - UpPixelY, [1 1 3]);

% shift all patch's coordinates
% (patches of nieghbours in the render image will be shifted instead of shifting the target)
samplingPositionsX = repmat(sampleCentersX + shiftX, [1 1 1 5 5]) + patchFrameX;
samplingPositionsY = repmat(sampleCentersY + shiftY, [1 1 1 5 5]) + patchFrameY;

end
