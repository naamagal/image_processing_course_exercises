for i = 3:-1:1
    im = imReadAndConvert(sprintf('im%d.png',i),2);
    imYIQ = rgb2ntsc(im);
    highres = superResolution( imYIQ(:,:,1) );
    imhighres = imresize(imYIQ, 2, 'cubic');
    imhighres(:,:,1) = highres;
    superIm = ntsc2rgb(imhighres);

    upSampleImage = imresize(im, 2, 'cubic');

    figure; imshow(im) , title('Original');
    figure; imshow(upSampleImage) , title('Up Sampled');
    figure; imshow(superIm) , title('Super Resolution');
    
end