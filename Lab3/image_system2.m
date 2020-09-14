
function [ za ] = image_system2 (z , Sx , Sy )
% IMAGE_SYSTEM2 === > Moves the image to the lower left<===
% ==== > Creates a zeros matrix of the image size <====
za = zeros ( size (z ,1) , size (z ,2) ) ;
for nn = 1: size (z ,1)
for mm = 1: size (z ,2)
% ==== > If the image is not already where it is to be shifted <====
if nn > Sy && nn - Sy < size(z ,1) && mm > Sx && mm - Sx < size(z ,2)
    % ==== > Shift the image <====
    za ( nn , mm ) = 1/2* z ( nn - Sy , mm - Sx ) ;
end
end
end
end