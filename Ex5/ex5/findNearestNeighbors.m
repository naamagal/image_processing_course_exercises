function [idx,Dist] = findNearestNeighbors( imPatches, dbPatches )
% FINDNEARESTNEIGHBORS Find the 3 nearest neighbors for each patch in the input images from the patches in the DB
% N represents the number of patches in the DB, and M represents the number of patches in the input image.
% INPUT:
% imPatches   M x 5 x 5 matrix with M patches that were sampled from the input image (pyrf4g)
% dbPatches   N x 5 x 5 matrix with N db patches
% OUTPUT:
% idx: M x 3 matrix where the i'th row has 3 indices of the 3 patches in the db
% that are most similar to the i'th patch from the input image
% Dist: M x 3 matrix where the i'th row contains the euclidean distances
%between the best 3 patches that has been found for the i'th patch

M = size(imPatches,1);
N = size(dbPatches,1);
imPatches25 = reshape(imPatches, M, 25);
dbPatches25 = reshape(dbPatches, N, 25);
% we should order the patches in 'dbPatches' and imPatches both NumOfFeatures X 25
%idx are the row indeces of dbPatches25, where we found the closest match for each row in imPatches25
[idx,Dist] = knnsearch(dbPatches25, imPatches25, 'K', 3, 'distance', 'euclidean');

end

