constmi = 0.12;                      %Coeficiente de atenuação em cm^-1
Nang = 2*64;
dist = DFINAL;
%imgparacor = double(eixo(:,:,58));
imgparacor = imresize(eixocor,[128 128]);
sizeRec = 128;
mi = round(sizeRec/2);
mj = round(sizeRec/2);
theta=(0:1:360);

for i=1:1:sizeRec
    for j=1:1:sizeRec

        Somdist = 0;
        valu = dist(i,j,1);
        
        if valu > 0
       
        for k=1:1:Nang
            
            %nx = round(cosd(k*360/Nang)*(j-mj)-sind(k*360/Nang)*(i-mi)+mj)
            %ny = round(sind(k*360/Nang)*(j-mj)-cosd(k*360/Nang)*(i-mi)+mi)
            
            %d=dist(ny,nx,k)
            factorexp = (-1)*constmi*dist(i,j,k);
            somdist = exp(factorexp);
            Somdist = Somdist + somdist;
            
        end
        
        else
                
            C(i,j) = 1; 
            
        end
        
        if valu > 0 
            
            c = Somdist * (1/Nang);
            C(i,j) = 1/c;
            
        end
        
    end
end

ImgCor = C .* imgparacor;
Erroproj = radon(ImgCor,theta);
singori = radon(imgparacor,theta);
ProjErro = Erroproj - singori;
ImgErro = iradon(ProjErro,theta,'Ram-Lak');
ImgErro = imresize(ImgErro,[128 128]);
ImgErroCor = C .* ImgErro;
ImgSAte = ImgCor + ImgErroCor;

figure,imagesc(C);
figure,imagesc(ImgCor);
figure,imagesc(Erroproj);
figure,imagesc(ProjErro);
figure,imagesc(ImgErro);
figure,imagesc(ImgErroCor);
figure,imagesc(ImgSAte);