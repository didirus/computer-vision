%     clear
        I=imread('../Caltech4/ImageData/airplanes_train/img001.jpg');
    %     %     imshow(I,[])
    %     %     I=single(I);
    %
    %     I2 = im2single(I1);
    %     I = rgb2gray(I2);
    %     binSize = 8 ;
    %     magnif = 3 ;
    %     Is = vl_imsmooth(I, sqrt((binSize/magnif)^2 - .25)) ;
    %
    %     % dense feat
    %     [f, d] = vl_dsift(Is, 'size', binSize) ;
    %     f(3,:) = binSize/magnif ;
    %     f(4,:) = 0 ;
    %
    %     % normal sift.
    %     [f_, d_] = vl_sift(I, 'frames', f) ;
    %
    % %     figure;
    % %     subplot(121)
    % %     imshow(I,[])
    % %     subplot(122)
    % %     imshow(unit8(Is),[])

    %     if f==f_
    %         disp('hey')
    %     end


%     I5=imread('../Caltech4/ImageData/airplanes_train/img001.jpg');
%     I5 = im2single(I5);
%     %     type for rgbsift or opponentsift
%     type_s = 'rgb';
%     % type_s = 'opponent';
% 
%     [fr,ds] = vl_phow(I5,'color',type_s);
    
    
    %kmeans
    
    
%     TODO: loop over images and concat the descriptors. then do the
%     kmeans.
    
%     [~,d] = descriptors(I,'normal');
%     [a,b] = kmeans(single(d),400);

Classes = {'airplanes_train','cars_train','faces_train','motorbikes_train'};

for i=1:length(Classes)
%     disp(Classes(i))
    filename = strcat('../Caltech4/subdata/', string(Classes(i)), '/' );
%     disp(filename)
    for j =1:5
        imagename = strcat(filename,num2str(j,'%.3d'),'.jpg');
%         I = imread()
        I = imread(imagename);
        disp(imagename);
        
    end
end

