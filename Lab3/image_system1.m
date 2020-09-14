function [ xs , ys , zs ] = image_system1 (z , Dx , Uy )
% IMAGE_SYSTEM1 === > This function changes the image by stretching it
%by a factor of Uy and shrinking it by a factor of Dx<===
% == > Creates a Zeros matrix of the size  <==
zs = zeros ( ceil ( Uy * size (z ,1) ) , ceil ( size (z ,2) / Dx ) ) ;
% == > Creates modified X and Y axis <==
ys = 1: ceil ( Uy * size (z ,1) ) ;
xs = 1: ceil ( size (z ,2) / Dx ) ;
% == > instantiates the new zs matrix with the modified dimensions<==
zs (1: Uy : end ,1: end ) = z (1: end ,1: Dx : end ) ;
end

