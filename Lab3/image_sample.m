function [xs , ys , zs ] = image_sample (z , D)
x = zeros(ceil(size(z,2)/D),1); % size of aliased x axis
y = zeros(ceil(size(z,1)/D),1);%size of aliased y axis
zs = zeros(size(y,1),size(x,1)); %size of alaised image
xs = 0:1:size(x); %x axis
ys = 0:1:size(y); %y axis
for i = 1:size(x) %aliasing
    for k = 1:size(y)
        zs(k,i) = z(k*D,i*D);
    end
end

        


