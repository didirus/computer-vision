function [H, r, c] = harris_corner_detector(image)  
    sigma = 2;
    kernel_size = 17;
    
    % compute Ix
    gaussfilter_x = gauss(sigma, kernel_size);
    [smoothed_image_x, ~] = gaussDer(image, gaussfilter_x, sigma);
    
    % compute Iy
    gaussfilter_y = gauss(sigma, kernel_size);
    gaussfilter_y = gaussfilter_y';
    [smoothed_image_y, ~] = gaussDer(image, gaussfilter_y, sigma);
    
    % compute A
    A = smoothed_image_x .^ 2;
    kernel = fspecial('gaussian', [kernel_size kernel_size], sigma);
    A = convn(A, kernel, 'same');
    
    % compute B
    B = smoothed_image_x .* smoothed_image_y;
    kernel = fspecial('gaussian', [kernel_size kernel_size], sigma);
    B = convn(B, kernel, 'same');
    
    % compute C
    C = smoothed_image_y .^ 2;
    kernel = fspecial('gaussian', [kernel_size kernel_size], sigma);
    C = convn(C, kernel, 'same');
    
    % compute H
    H = (A.*C-B.^2) - 0.04*(A+C).^2;
    
    % get corner points
    threshold = 100;
    
    rows = size(image, 1); % no. of rows in image
    cols = size(image, 2); % no. of cols in image
    
    r = []; %zeros(rows, 1); r = [3, 3, 5, 6, 0 , 0 , 0, 0]
    c = []; % zeros(cols, 1); c = [1, 2, 3 ,5]
    %indicator = 1;

    % centering
    window_size = 19;
    r_center = (window_size-1)/2; 
    c_center = (window_size-1)/2;
    
    for i = 1:3 % for each colorspace
        im = H(:,:,i);
        for r_index = r_center+1:(rows-r_center)
            for c_index = c_center+1:(cols-c_center)
                window = im((r_index - r_center):(r_index + r_center), (c_index - c_center):(c_index + c_center));
                if im(r_index, c_index) == max(window(:)) && im(r_index, c_index) > threshold
                    r = [r r_index];
                    c = [c c_index];
                end                    
            end
        end
    end
    
    
    figure;
    subplot(1,3,1)
    imshow(smoothed_image_x)
    subplot(1,3,2)
    imshow(smoothed_image_y)
    subplot(1,3,3)
    imshow(image)
    hold on;
    plot(c,r,'r.','MarkerSize',5)
end
