function [image] = getImage(assignmentPositionsX,assignmentPositionsY,samplingPositionsX,samplingPositionsY, ...
    weights,emptyHighResImage,renderedPyramid)
% GETIMAGE given an image of the rendered pyrmamid, sampling indices from the rendered pyrmamid, and assignment indices in the highres image return a high resolution image
% INPUT:
% assignmentPositionsX: (m - 4) x (n - 4) x 3 x 5 x 5 - x assignment coordinates in the high resolution image (getSamplingInformation output)
% assignmentPositionsY: (m - 4) x (n - 4) x 3 x 5 x 5 - y assignment coordinates in the high resolution image (getSamplingInformation output)
% samplingPositionsX: (m - 4) x (n - 4) x 3 x 5 x 5 - x sampling coordinates in the rendered pyramid image (getSamplingInformation output)
% samplingPositionsY: (m - 4) x (n - 4) x 3 x 5 x 5 - y sampling coordinates in the rendered pyramid image (getSamplingInformation output)
% weights: (m - 4) x (n - 4) x 3 matrix with the weights for each DB candidate
% emptyHighResImage: M x N zeros image, where M and N are the dimensions of a level in the pyramid that should be reconstructed in this function
% renderedPyramid: a single image containing all levels of the pyramid
% OUTPUT:
% image: M x N high resolution image

[r, c, k] = size(weights);
[M, N] = size(emptyHighResImage);
image = zeros(M, N);
totW = zeros(M, N);

% Sample the image at the sampling positions in the renderedPyramid
samplesInRender = interp2(renderedPyramid, samplingPositionsX, samplingPositionsY, 'cubic');
%nans = isnan(samplesInRender);
%samplesInRender(nans) = 0;

% Repmat weights to its size, avoid dividing in 0;
weights = repmat(weights, [1 1 1 5 5]);
%weights(nans) = 2.3e-16;

for t = 1:k
    for i = 0:4
        for j = 0:4
            curW = zeros(M, N);
            curIm = zeros(M, N);
            
            % Take patches with jumps of 5, for every image
            curX = assignmentPositionsX(1+i:5:r, 1+j:5:c, t, 1:5, 1:5);
            curY = assignmentPositionsY(1+i:5:r, 1+j:5:c, t, 1:5, 1:5);
            
            indeces = sub2ind( [M, N], curY(:), curX(:));
            
            curIm(indeces) = samplesInRender(1+i:5:r, 1+j:5:c, t, 1:5, 1:5);
            curW(indeces) = weights(1+i:5:r, 1+j:5:c, t, 1:5, 1:5);
            image = image + (curW .* curIm);
            totW = totW + curW;
            
        end
    end
end
% divid by the total wieghts we calculated from all the 75..
image = image ./ totW; 
end

