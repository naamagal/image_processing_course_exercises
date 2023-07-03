Ng6767535
----------------------------------------------------------------------------------------------------------------------------
Matlab Version R2013a (8.1.0.604), platform 64-bit (win64)
----------------------------------------------------------------------------------------------------------------------------
Included file can be devided to four main topics:
Functions:
	3.1 GaussianPyramid.m	Creates Gaussian Pyramid of a given image
	3.1 LaplacianPyramid.m	Creates Laplacian pyramid of a given image
	3.2 LaplacianToImage.m	Implements the reconstruction of an image from its Laplacian Pyramid
	3.3 renderPyramid.m	Presents pyramid levels in one matrix		
	3.3 displayPyramid.m	Present the result of render- a matrix with images in all levels of the pyramid
	4.- pyramidBlending.m	Blends two images using laplacian pyramids

	Additionals:
	ExpandImg.m		ExpandImage with zeroes and blur it with filter
	binomialFilter1D.m	Find the binomical filter of 1-Dim by convolution [1,1]
	LinearStretching.m	Linear stretch of an image
	imReadAndConvert.m	Reads a given image and converts it into a given representation (grayscale or RGB)
Pictures:
	im_1A.jpg
	im_1B.jpg 
	mask_1.jpg
	
	im_2A.jpg
	im_2B.jpg
	mask_2.jpg
Scripts:
	blendingExample1.m
	blendingExample2.m	
Other:
	REAMME.txt file- this note you read right now :)
----------------------------------------------------------------------------------------------------------------------------
Questions and their Answers (hopefully)

3.2
Q: What does it mean to multiply each level in a diferent value? What do we try to control on?
A: When the coefficient vector is not vector of ones, that means we give different weight to different images,
   while by the definition of the pyramid the first cell contains the biggest (original) image which is the image in the best resolution = have many details including short wavelengths
   and as long as the indeces grows, the image in the pyramid there become smaller, with worst resolution, less details (less noise) and longer wavelengths
   in this case, we are control here on the 'band-pass' (some band of wavelengths between the high and the low pass), the meaning of that is 'filtering the image' by it's wavelengths..

4.2.1
Q: what happens (and why this happens) to the result blending from section 4
image when Blending is performed with different image filters (filterSizeIm = 1,3,5,7...).
A: At each level we mix some frequencies from both of the images, if we have a bigger filters we will get more frequencies in every level.
So, when we blend we get get a smoother image.

4.2.2
Q: what happens (and why this happens) to the result blending from section 4
image when Blending is performed with a varying number of pyramid levels (maxLevels = 1,2,3,4,5,...)
A: At each level we mix some frequencies from both of the images, if we have more levels we get more information of frequencies.
So, we will get a smoother blending.
           

----------------------------------------------------------------------------------------------------------------------------
Thank you!