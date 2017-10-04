% Question 2.b
% Plotting each eigen basis as an image

for i = 1: 100: 250
    imshow(mat2gray(reshape(COEFF(:,i), 92 , 92)), 'InitialMagnification', 1500);
    pause(0.3);
end











% Question 2c
% Plotting each image onto the eigen space

img1 = double(imread('./s26/face1.pgm'));

img1 = reshape(img1, 8464, 1);


for n_eigenValues = 1:8464
    A = COEFF(: , 1: n_eigenValues );
    pMatrix = A * inv(A' * A) * A';
    reconstructedImage = pMatrix * img1; 

    imshow(mat2gray(reshape(reconstructedImage, 92, 92)), 'InitialMagnification', 1500);

    errorImage = reconstructedImage - img1;

    imshow(mat2gray(reshape(errorImage, 92, 92)), 'InitialMagnification', 1500);

    e = (norm(errorImage) / norm(img1)) * 100;
    if e < 1
        break
    end

end
e
n_eigenValues