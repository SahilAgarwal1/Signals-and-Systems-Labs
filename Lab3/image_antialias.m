function zaa = image_antialias(z)
zaa = zeros(size(z,1),size(z,2));
for i = 2:size(z,1)-1
    for k = 2:size(z,2)-1
        zaa(i,k) = (1/2) * z(i,k) + (1/8) * (z(i-1,k) +z(i+1,k) + ...
            z(i,k-1) + z(i, k+1));
    end
end