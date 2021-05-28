function [] = k_medias(I)
   BW = ~imbinarize(I,graythresh(I));
   cc = bwconncomp(BW, 8);
   prop = regionprops(cc, 'all');
   obj = 0;   
   for i=1:cc.NumObjects
       if prop(i).Area>100
           X(i,1) = prop(i).Perimeter;
           X(i,2) = prop(i).ConvexArea;
           obj =obj+1;
       end
   end   
   idx =kmeans(X,3);
   imshow(BW);
   hold on;   
   for i=1:obj
       text(prop(i).Centroid(1),prop(i).Centroid(2), sprintf('%d',idx(i)),'color','red');
   end
   hold off
end

