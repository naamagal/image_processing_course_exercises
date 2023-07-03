function [weights] = weightsSetting( imPatches, Dists, pyr ,dbPatchesStd )
% WEIGHTSSETTING Given 3 nearest neighbors for each patch of the input image
% Find a threshold (maximum distance) for each input patch.
% Next, give a weight for each candidate based on its distance from the input patch.
% denote m,n such that [m,n]=size(pyrf4g)
% INPUT:
% imPatches: (m - 4) x (n - 4) x 5 x 5 matrix with the patches that were sampled from the input image (pyrf4g)
% Dists: (m - 4) x (n - 4) x 3 matrix with the distances returned from findNearestNeighbors.
% pyr: 7 x 1 cell created using createPyramid
% dbPatchesStd: (m - 4) x (n - 4) x 3 matrix with the STDs of the neighbors patches returned from findNearestNeighbors.
% OUTPUT:
% weights: (m - 4) x (n - 4) x 3 matrix with the weights for each DB candidates

im = pyr{4};
% 1. Threshold selection
[out_x,out_y] = translateImageHalfPixel(im);
[~, ~, patchesX] = samplePatches( out_x , 0 );
[~, ~, patchesY] = samplePatches( out_y , 0 );

[r,c] = size(imPatches(:,:,1,1));
imPatchesV = reshape(imPatches, r*c, 25);
patchesXV = reshape(patchesX, r*c, 25);
patchesYV = reshape(patchesY, r*c, 25);

D_ij = reshape(Dists, r*c, 3);
Sig_j = reshape(dbPatchesStd,r*c,3);

distX = sqrt(sum(((imPatchesV - patchesXV).^2).').');
distY = sqrt(sum(((imPatchesV - patchesYV).^2).').');

thresholds = ( distX+distY ) / 2;
isUnderThreshold = ones (r*c,1);
isUnderThreshold ( 1:r*c, 1 ) = ( D_ij(:,3) <= thresholds );

weights = exp( -(D_ij.^2) ./ Sig_j);
weights(1:c*r,3) = weights(1:c*r,3) .* isUnderThreshold;
weights = reshape(weights, [r, c, 3]);

end