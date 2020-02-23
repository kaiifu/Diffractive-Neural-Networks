function T = transmission_diff_lens_h(dd, r, h)
% Computes geometry of zone plate based on radii, r. 
% h is a vector of heights same length as r
% dd is the 2D Euclidian distance with the center of the lens as origin

if length(h) ~= length(r)
    disp('Error: length of heights not equal to length of radii.\n');
end

T = zeros(size(dd));

for cnt=1:length(r)
    if cnt==1
        index = find(dd<=r(cnt));
        T(index) = h(cnt);
    else
        index = find(dd<=r(cnt) & dd>r(cnt-1));
        T(index) = h(cnt);
    end
end

