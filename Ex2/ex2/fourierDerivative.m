function magnitude = fourierDerivative(inImage)
% fourierDerivative computes the magnitude of image derivatives
% using fourier transform

[M, N] = size(inImage);

%recenter the signal in fourier space to be in the (0,0) logic
fourierIm = fftshift(DFT2(inImage));

%create u, v  matrics following the image derivative formula
u = ((-M/2):(M/2)-1);
u_mat = repmat(u', 1, N);

v = ((-N/2):(N/2)-1);
v_mat = repmat(v, M, 1);

% calculate F(u,v) * u * 2*pi*i/M for derive by x
% calculate F(u,v) * v * 2*pi*i/N for derive by y
% by the definition of IDFT we already divided by N/M so no need to divid
% here by N^2/ M^2!
rowDeriv = IDFT2(((fourierIm .* u_mat) .* (2*pi*1i))./ M);   
colDeriv = IDFT2(((v_mat .* fourierIm) .* (2*pi*1i))./ N);  

magnitude = sqrt( abs(rowDeriv).^ 2 + abs(colDeriv).^ 2 );
figure;
subplot(1,2,1), subimage(inImage);
subplot(1,2,2), subimage(magnitude);

end

