imageNo = 95;
error = zeros(165,1);
for i = 1:165
	tempEigenVec = sortedEigVectors(:,1:i);
	meanCenteredImage = meanCentered(imageNo,:);
	reconstrImage = meanCenteredImage*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + mean;
	%error(i,1) = (norm((reconstrImage - imageArray(i,:)),'fro')/norm(imageArray(i,:),'fro'));
	error(i,1) = (norm((reconstrImage - imageArray(imageNo,:)),'fro')/norm(imageArray(imageNo,:),'fro'))*100;
	if error(i,1) < 1
		break;
	end
end

figure;
imshow(reshape(imageArray(162,:),243,[]),[]);
title('subject15.sad10');

error = zeros(165,1);
for i = 1:165
	tempEigenVec = sortedEigVectors(:,1:i);
	reconstrImage = meanCentered*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + repmat(mean,165,1);
	error(i,1) = (norm((reconstrImage - imageArray),'fro')/norm(imageArray,'fro'))*100;
end

imageNo = 165;
error = zeros(165,1);
for i = 1:1
	tempEigenVec = sortedEigVectors(:,1:i);
	meanCenteredImage = meanCentered(imageNo,:);
	reconstrImage = meanCenteredImage*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + mean;
	%error(i,1) = (norm((reconstrImage - imageArray(i,:)),'fro')/norm(imageArray(i,:),'fro'));
	error(i,1) = (norm((reconstrImage - imageArray(imageNo,:)),'fro')/norm(imageArray(imageNo,:),'fro'))*100;
end

figure;
subplot(1,2,1), imshow(reshape(reconstrImage,243,[]),[]);
title('Reconstruced Image');
subplot(1,2,2), imshow(reshape(reconstrImage-imageArray(imageNo,:),243,[]),[]);
title('Error Image');

error = zeros(165,1);
for i = 1:17
	tempEigenVec = sortedEigVectors(:,1:i);
	meanCenteredImage = meanCentered(imageNo,:);
	reconstrImage = meanCenteredImage*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + mean;
	%error(i,1) = (norm((reconstrImage - imageArray(i,:)),'fro')/norm(imageArray(i,:),'fro'));
	error(i,1) = (norm((reconstrImage - imageArray(imageNo,:)),'fro')/norm(imageArray(imageNo,:),'fro'))*100;
end

figure;
subplot(1,2,1), imshow(reshape(reconstrImage,243,[]),[]);
title('Reconstruced Image');
subplot(1,2,2), imshow(reshape(reconstrImage-imageArray(imageNo,:),243,[]),[]);
title('Error Image');

error = zeros(165,1);
for i = 1:46
	tempEigenVec = sortedEigVectors(:,1:i);
	meanCenteredImage = meanCentered(imageNo,:);
	reconstrImage = meanCenteredImage*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + mean;
	%error(i,1) = (norm((reconstrImage - imageArray(i,:)),'fro')/norm(imageArray(i,:),'fro'));
	error(i,1) = (norm((reconstrImage - imageArray(imageNo,:)),'fro')/norm(imageArray(imageNo,:),'fro'))*100;
end

figure;
subplot(1,2,1), imshow(reshape(reconstrImage,243,[]),[]);
title('Reconstruced Image');
subplot(1,2,2), imshow(reshape(reconstrImage-imageArray(imageNo,:),243,[]),[]);
title('Error Image');

error = zeros(165,1);
for i = 1:88
	tempEigenVec = sortedEigVectors(:,1:i);
	meanCenteredImage = meanCentered(imageNo,:);
	reconstrImage = meanCenteredImage*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + mean;
	%error(i,1) = (norm((reconstrImage - imageArray(i,:)),'fro')/norm(imageArray(i,:),'fro'));
	error(i,1) = (norm((reconstrImage - imageArray(imageNo,:)),'fro')/norm(imageArray(imageNo,:),'fro'))*100;
end

figure;
subplot(1,2,1), imshow(reshape(reconstrImage,243,[]),[]);
title('Reconstruced Image');
subplot(1,2,2), imshow(reshape(reconstrImage-imageArray(imageNo,:),243,[]),[]);
title('Error Image');

error = zeros(165,1);
for i = 1:130
	tempEigenVec = sortedEigVectors(:,1:i);
	meanCenteredImage = meanCentered(imageNo,:);
	reconstrImage = meanCenteredImage*tempEigenVec*tempEigenVec';
	reconstrImage = reconstrImage + mean;
	%error(i,1) = (norm((reconstrImage - imageArray(i,:)),'fro')/norm(imageArray(i,:),'fro'));
	error(i,1) = (norm((reconstrImage - imageArray(imageNo,:)),'fro')/norm(imageArray(imageNo,:),'fro'))*100;
end

figure;
subplot(1,2,1), imshow(reshape(reconstrImage,243,[]),[]);
title('Reconstruced Image');
subplot(1,2,2), imshow(reshape(reconstrImage-imageArray(imageNo,:),243,[]),[]);
title('Error Image');