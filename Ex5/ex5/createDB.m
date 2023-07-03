function [p_x, p_y,levels, patches] = createDB( pyr )
% CREATEDB Sample 5 x 5 patches from levels 1,2,3 of the input pyramid.
% N represents the number of patches that are found in the three images.
% INPUT:
% pyr: 7 x 1 cell created using createPyramid
% OUTPUT:
% p_x: N x 1 vector with the x coordinates of the centers of the patches in the DB
% p_y: N x 1 vector with the y coordinates of the centers of the patches in the DB
% levels: N x 1 vector with the pyramid levels where each patch was sampled
% patches: N x 5 x 5 the patches

N =0;
border = 2;
for i=1:3
    [p_x_i, p_y_i, patches_i] = samplePatches( pyr{i}  , border );
    p_x_i = p_x_i(:);
    p_y_i = p_y_i(:);
    numOfpatches = size(p_x_i,1);
    p_x(N+1:N+numOfpatches, 1) = p_x_i;
    p_y(N+1:N+numOfpatches, 1) = p_y_i;
    
    patches_i = reshape(patches_i, numOfpatches,5,5);
    patches( N+1:N+numOfpatches, 1:5, 1:5 ) = patches_i;
    levels(N+1:N+numOfpatches,1) = i;

    N = numOfpatches;
end

end

