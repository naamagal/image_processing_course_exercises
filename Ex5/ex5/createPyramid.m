function pyr = createPyramid( im )
% CREATEPYRAMID Create a pyramid from the input image, where pyrf1g is the smallest level,
% pyrf4g is the input image, and pyrf5g,pyrf6g,pyrf7g are zeros.
% The ratio between two adjacent levels in the pyramid is 2^(1/3)
%INPUT:
% im   a grayscale image
%OUTPUT:
% pyr   A 7  1 cell of matrices

[r,c] = size(im);
blackIm = zeros(r,c);
pyr = cell(7,1);
n= 4;
pyr{n} = im;
for i=1:3
    pyr{n-i}  = imresize( pyr{n}, 1/(2^(i/3)), 'cubic');
    pyr{n+i} = imresize( blackIm, 2^(i/3), 'cubic');
end

end