Matlab Version R2013a (8.1.0.604), platform 64-bit (win64)

files included:
1. functions:
imReadAndConvert.m
	Reads a given image  and converts it into a given representation
	input:
	file path of an image
	representation could be 1 or 2 for B/W or RGB respectively
	imageOutput- same image in the requested representation
imDisplay.m
	Display an image in a given presentation (using imReadAndConvert.m)
	input:
	file path of an image
	representation could be 1 or 2 for B/W or RGB respectively
histogramEqualize.m
	HistogramEqualize function performs histogram equalization
	of a given grayscale or RGB image.
	input:
	imOrig - is the input grayscale or RGB double image with values in [0 1]
	output:
	imEq - is the equalized image. Grayscale or RGB double image with values in [0; 1]
	histOrig - is a 256 bin histogram of the original image (256x1 vector).
	histEq - is a 256 bin histogram of the equalized image (256x1 vector).
quantizeImage.m
	Performs optimal quantization of a given grayscale or RGB image.
	input:
	imOrig - is the input grayscale or RGB image to be quantized.
	nQuant - is the number of intensities your output imQuant image should have.
	nIter - is the maximum number of iterations of the optimization procedure. (May converge earlier.
	output:
	imQuant - the quantize output image
	error- an error plot representing the total intensities error for each
	iteration in the quantization procedure, i.e <nIter over 1> 

2. images:
	RGB:
	swan.jpg
	snow.jpg
	testImg2.jpg
	testImg1.jpg
	B/W:
	lena.png
	gradient.jpg

I added these two picture to check my code, in this case I added testImg2.jpg and testImg1.jpg
I chose the testImg2 (board picture) to see how the histogram and the quantization will deal with a picture that have a lots of "white" and a bit "black"..
I chose the testImg1 (koala picture) to see how very colorful picture will be effected by the quantization (if less level of grayscale is seen) and the same for the histogram..

testImg1 is working with quantization under around 40.
testImg2 is working with quantization under around 100.

	

