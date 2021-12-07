psf = Perf;
img = b(:,:,1:128);
GamaC = 5*10^4;

maxi = max(max(psf));
psfnorm = psf./maxi;

psf_fft = fftshift(fft2(psfnorm));
img_fft = fftshift(fft2(img));

% psfgauss = fspecial('gaussian', 128, 2.5);
% psfgauss_fft = fftshift(fft2(psfgauss));

for i=1:size(img,3)
    
%     Im = img_fft(:,:,i);
%     H_estrela = conj(psfgauss_fft);
%     H_quad = abs(psfgauss_fft.*psfgauss_fft);
%     Im = Im.*(H_estrela./(H_quad + GamaC));
%     new(:,:,i)=Im;
    
    a_ = img_fft(:,:,i);
    psf_estrela = conj(psf_fft);
    psf_2 = abs(psf_fft.*psf_fft);
    a_ = a_.*(psf_estrela./(psf_2+5*10^4));
    new_(:,:,i) = a_;
    
end

% new = ifft2(ifftshift(new));
% new_2 = new./max(max(max(new)));
% new_final = ifftshift(new_2);

new_=ifft2(ifftshift(new_));
new_2=new_./max(max(max(new_)));
new_final=ifftshift(new_2);

for i=1:1:128
     imagesc(new_final(:,:,i)),title(num2str(i));
     drawnow
     for k=1:1000
     end
end

%figure,imagesc(psfgauss);

clear b
b = 100*new_final;