function [p_x, p_y, patches] = samplePatches( im , border )
% SAMPLEPATCHES Sample 5 x 5 patches from the input image. You are allowed to use 2D loops here.
% INPUT:
% im: a grayscale image of size mxn (rxc)
% border: An integer that determines how much border we want to leave in the image. For example: if border=0 the
%center of the first patch will be at (3,3), and the last one will be at (end - 2,end - 2), so the number of patches in this
%case is (m - 4) x (n - 4). But if border=1 the center of the first patch will be at (4,4) and the last one will be at (end 3,end 3).
%So in general, the number of patches is (m - 2 * (2 + border)) x (n - 2 * (2 + border)).
%OUTPUT:
% p_x: (m - 2 * (2 + border)) x (n - 2 * (2 + border)) matrix with the x indices of the centers of the patches
% p_y: (m - 2 * (2 + border)) x (n - 2 * (2 + border)) matrix with the y indices of the centers of the patches
% patches: (m - 2 * (2 + border)) x (n - 2 * (2 + border)) x 5 x 5 the patches

[r,c] = size(im);
margin = 3+ border;
yInd = (margin:r - margin+1);
xInd = (margin:c - margin+1);

sizeY = r - 2*(border+2);
sizeX = c - 2*(border+2);
p_y = repmat(yInd, [ sizeX ,1]).';
p_x = repmat(xInd, [ sizeY ,1]);

patches = zeros(sizeY, sizeX, 5, 5);

for i=1:sizeY %2
    for j=1:sizeX %5
        patch = im(p_y(i,j)-2:p_y(i,j)+2,p_x(i,j)-2:p_x(i,j)+2);
        patches(i,j,:,:) = patch;
    end
end

end