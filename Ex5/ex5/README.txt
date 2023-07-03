Student ID: ---
----------------------------------------------------------------------------------------------------------------------------
Matlab Version R2013a (8.1.0.604), platform 64-bit (win64)
----------------------------------------------------------------------------------------------------------------------------
createPyramid - Create a pyramid from the input image, where pyrf1g is the smallest level
samplePatches -  Sample 5  5 patches from the input image. You are allowed to use 2D loops here
createDB -  Sample 5  5 patches from levels 1,2,3 of the input pyramid
findNearestNeighbors - Find the 3 nearest neighbors for each patch in the input images from the patches in the DB
WeightSetting - Given 3 nearest neighbors for each patch of the input image find a threshold (maximum distance) for each input patch. Next, give a weight for each candidate based on its distance from the input patch.
getSamplingCenters - Given 3 nearest neighbors for each patch of the input image, from the patches DB,find the location of parent patch in the rendered pyramid image
getSamplingInformation - Get the information for sampling a high resolution image. Pairs of: assignment positions in the high resolution image, and sampling positions from the rendered pyramid image
MyResults - main function used as a script to run the algorithm with my images..

imReadAndConvert - reads a given image  and converts it into a given representation
renderPyramidEx5 - Getting a pyramid and draw it into a single image
supreResolution - Getting an image and returns high resolution image with doubled size.
transformPointsLevelsUp - Given position of points in some levels of the pyramid, return their location in an upper levels of the pyramid.
transformImageHalfPixel - Given an image return two images: out_x,out_y that are the result of shifting the image 0.5 pixel right, and 0.5 pixel down respectively

im1.png = my image 1 picture;
im2.png = my image 2 picture;
im3.png = butterfly picture;

README.txt file- this note you read right now :)

----------------------------------------------------------------------------------------------------------------------------
Questions for the three image describe:
1. Which details in the image the procedure keeps?
2. Which details in the image the procedure loses?

Answers:
1. in all image the edges in the super resolution is more sharpen then the upample version, means we keep the edges.
2. the algorithm loses small details because we take a patch of 5x5, and smaller things sometime can be lost..

----------------------------------------------------------------------------------------------------------------------------
Thank you!