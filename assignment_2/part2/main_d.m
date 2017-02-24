
test = 'denoise';
%2.1
if (strcomp(test,'denoise'))

    I  = imread('../Images/image2.jpeg');
    X = denoise(I,'median',[3 3]);

    imshow(X)
end
%2.2
if (strcomp(test,'Histogram_matching'))
    input = imread('../Images/input.png');
    reference = imread('../Images/reference.png');
    match_im = myHistMatching( input, reference );
end
%2.3
if (strcomp(test,'compute_gradient'))
    I  = imread('../Images/image3.jpeg');
    [x,y] = compute_gradient(I);
end
%2.4
if (strcomp(test,'unsharp'))
    I  = imread('../Images/image4.jpeg');
    sigma = 50;
    kernel_size = 5;
    k=2;
    [x] = unsharp ( I , sigma , kernel_size , k );
end

%2.5

if (strcomp(test,'LoG'))
    lena = imread('../Images/image1.jpeg');
    figure
    subplot(131)
    imshow(compute_LoG(lena, 1))
    subplot(132)
    imshow(compute_LoG(lena, 2))
    subplot(133)
    imshow(compute_LoG(lena, 3))
end