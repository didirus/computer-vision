
% test = 'denoise';
%  test = 'Histogram_matching';
test = 'compute_gradient';
% test = 'unsharp';
% test = 'LoG';
%2.1
if (strcmp(test,'denoise'))

    I  = imread('../Images/image2.jpeg');
    X = denoise(I,'median',[3 3]);

    imshow(X)
end
%2.2
if (strcmp(test,'Histogram_matching'))
    input = imread('../Images/input.png');
    reference = imread('../Images/reference.png');
    match_im = myHistMatching( input, reference );
end
%2.3
if (strcmp(test,'compute_gradient'))
    I  = imread('../Images/image3.jpeg');
    I = double(I);
    [x,y] = compute_gradient(I);
end
%2.4
if (strcmp(test,'unsharp'))
    I  = imread('../Images/image4.jpeg');
    I=double(I);
    sigma = 50;
    kernel_size = 5;
    k=2;
    [x] = unsharp ( I , sigma , kernel_size , k );
end

%2.5

if (strcmp(test,'LoG'))
%     image = imread('../Images/lenna.jpg');
%     image = rgb2gray(image);
    [X, map] = imread('../Images/image1.jpeg');
    if ~isempty(map)
        image = ind2gray(X,map);
    end
    image = double(image);
    
    subplot(221)
    imshow(image,[])
    title('Original Image')
    subplot(222)
    imshow(compute_LoG(image, 1),[])
    title('Method 1')
    subplot(223)
    imshow(compute_LoG(image, 2),[])
    title('Method 2')
    subplot(224)
    imshow(compute_LoG(image, 3),[])
    title('Method 3')
end
