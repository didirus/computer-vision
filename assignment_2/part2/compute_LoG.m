function imOut = compute_LoG(image, LOG_type)
    switch LOG_type
        case 1
            %method 1
            %Smoothing the image with a Gaussian operator,
            % then taking the Laplacian of the smoothed image.
            blurred = imgaussfilt(image, 0.7);
            h = fspecial('laplacian');
            imOut = imfilter(blurred, h);
            
        case 2
            %method 2
            %Convolving the image directly with LoG operator.
            h = fspecial('log');
            imOut = imfilter(image, h);
            
        case 3
            %method 3
            %Taking the diff between two Gaussians (DoG) computed
            %at different scales S1 and S2.
            sigma1 = .5;
            sigma2 = .6;
            imOut = imgaussfilt(image, sigma1,'FilterSize',5) - imgaussfilt(image, sigma2,'FilterSize',5);
    end
end
