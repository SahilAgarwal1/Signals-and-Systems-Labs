function [xz, yz, zz] = image_insertzeros(zaas, U)
insertXSize = ((size(zaas,2) - 1) * (U-1)) + size(zaas,2);
insertYSize = ((size(zaas,1) - 1) * (U-1)) + size(zaas,1);
zz = zeros(insertYSize,insertXSize);
i = 1;
k = 1;
zaasi = 1;
zaask = 1;
while(i <= (insertYSize))
   while (k <= (insertXSize))
        if ((mod(i,2) == 0) || (mod(k,2) == 0))
              %  zz(i,k) = 0;
               % k = k+1;
               % zaask = zaask+1;
               zz(i,k) = zaas(zaasi,zaask);
               k = k+1;
        else
         %   zz(i,k) = zaas(zaasi,zaask);
           % k = k+1;
               zz(i,k) = 0;
               k = k+1;
               zaask = zaask+1;

        end

   end
      i = i+1;
      k = 1;
      if(mod(i,2) == 0)
        zaasi = zaasi + 1;
      end
      zaask = 1;
end
xz = 0:1:insertXSize;
yz = 0:1:insertYSize;
end

   
                
                


    

