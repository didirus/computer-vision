function [ outIm ] = lucas_kanade(region_size, image1, image2 )
   v_p = [];
   u_p = [];
    for i = 1:region_size:size(image1,1) - (size(image1,1)/region_size)
        for j = 1:region_size:size(image1,2) - (size(image1,2)/region_size)
            % get regions
            region1 = image1(i:i+region_size-1,j:j+region_size-1);
            region2 = image2(i:i+region_size-1,j:j+region_size-1);
            
            % get derivatives
            Ix = conv2(region1,[-1 1;-1 1],'same');
            Iy = conv2(region1,[-1 -1;1 1],'same');
            Ix = reshape(Ix,region_size^2,1);
            Iy = reshape(Iy,region_size^2,1);
            
            % get optical flow
            A = [Ix Iy];
            It = (double(region1)-double(region2));
            
            b = -It;
            b = reshape(b,region_size^2,1);  
            v1 = pinv(A'*A);
            v2 = A' * b;
            v = v1 * v2;
%             disp(v(1,:))
            
            v_p = [v_p v(1,:)];
            u_p = [u_p v(2,:)];
            
        end
    end
%     quiver(v(:1),v(:,2))
    outIm =v;
%     disp(size(v))
    figure
    quiver(u_p,v_p,1,'r')
end

