function blurImage = blurInFourierSpace(inImage,kernelSize)
% blurInFourierSpace performs image blurring with gaussian kernel in fourier space
% Assuming kernelsize is smaller then the inImage size
% blurring in Furier space is calculated by duplicating bit-wise
% F (-inImage in Fourier space) and G (kernel presentation in Fourier space)

% find the binomial coefficient of the Gausian kernel, by given kernelSize
kernel = binomialKernel2D( kernelSize );

% paddind kernel with zeros
[R,C] = size(inImage);
addR = floor((R - kernelSize)/2);
addC = floor((C - kernelSize)/2);
kernelPadded= padarray(kernel,[addR, addC]);
if( mod( R - kernelSize, 2 ) == 1)
    kernelPadded= padarray( kernelPadded, [1,0], 'post' );
end
if( mod( C - kernelSize, 2 ) == 1)
    kernelPadded= padarray( kernelPadded, [0,1], 'post');
end

% Fourier bluring
K = fftshift(DFT2(kernelPadded));
I = fftshift(DFT2(inImage)); 
fourierBlurImage = I.*K;
blurImage = fftshift( abs( IDFT2( fourierBlurImage )));

% for peresenting...
K2 = log(1+abs(K));
I2 = log(1+abs(I));

figure;
subplot(1,2,1), subimage(inImage);
subplot(1,2,2), subimage(blurImage);

end
