function kernel = binomialKernel2D( kernelSize )
% Find the binomial coefficient of the Gausian kernel

BinomialCoefficients = diag( flipud( pascal( kernelSize ) ) );
kernel = conv2( BinomialCoefficients, BinomialCoefficients' );

sumOfKernel = sum( kernel(:) );
kernel = kernel./sumOfKernel;

end

