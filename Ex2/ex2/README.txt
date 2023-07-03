Matlab Version R2013a (8.1.0.604), platform 64-bit (win64)
submitted by student id: ---

files included:
    DFT.m
	converts a 1D discrete signal to its fourier representation
    IDFT.m
	inverse of DFT function: converts a fourier signal to it 1D discrete signal representation
    DFT2.m
	converts a 2D discrete signal to its fourier representation
    IDFT2.m
	inverse of DFT2 function: converts a fourier signal to it 2D discrete signal representation
    convDerivative.m
	computes the magnitude of image derivatives using convolutions in x direction [-1 0 1] and y direction [-1; 0 ; 1]
    fourierDerivative.m
	computes the magnitude of image derivatives using fourier transform (duplicate bit-wise the fourier image and the fourier kernel)
    blurInImageSpace.m
	blur an image f using a convolution with gaussian kernel g in image space
    blurInFourierSpace.m
	blur an image f using a point-wise operation between the fourier image F with the same gaussian kernel, but in fourier space G.
    
    binomialKernel2D.m
	calculate the binomial coefficient with given kernel size
    imReadAndConvert.m
	read a filename and convert it's representation to RGB or grayscale if have been asked.

----------------------------------------------------------------------------------------------------
Questions & their Answers:

* Section #2:
	Q: Why did you get two different magnitude images?

	A: The magnitude of convolution algorithm is less accurate then the magnitude of the Fourier algorithm.
	   because the derivative of the convolution is an approximation with epsilon = 1,
	   while the Fourier drivative is more accurate because it works on continues function about the pixels.

* Section #3:
	Q1: What happens if the center of the gaussian (in the space domain) will not be at the (0,0) of the image? Why does it happen?
	Q2: What is the difference between the two results (Blurring in image space and blurring infourier space)?
	
	A1: Domain space? not really clear, but here two answers:
	    -shift in the image space: if we will not center the kernel in image space that means that we will preform a shift in the image!
	    that happens because if the center will be shifted in i rows and j columns,and the kernel will be padded with zeros-
            then when we will convolve this kernel with the image it will cause the same shift because the way of convolution works.
	    -shift in the Fourier space: I shifted the kernel before using DFT2, the values after Fourier transform don't change due to phase change in the image.
	    means, the spectrum will be the same but the only change is in the phase of the kernel which will cause a cyclic phase in the result.
	    
	A2: There is no difference between the pictures, because of the convolution theorem: DFT2(f*g) = F .* G
	    convolved in image space is equal to duplicate bit-wise in Fourier space
