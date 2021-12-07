resol = 0.2113;                       %Resolução em cm
%ImgMask = eixo(:,:,58); 
ImgMask = imresize(eixocor,[128 128]);
Ipol = roipoly(ImgMask);           %Construção da ROI
Nang = 2*64;                       %Número de ângulos
N = 0;
sizeRec = 128;

for Ang=0:360/Nang:359
    
for i=1:1:sizeRec
    for j=1:1:sizeRec
        
        value = Ipol(i,j);
        
        if value==1
            
            for k=1:1:sizeRec
                
                value1 = Ipol(k,j);
                value2 = Ipol(k+1,j);
        
                if (value1 == 0 && value2 == 1) 
                    dborda = k+1;
                    break
                end
                
            end
            
            dpixel = i;
            dfinal = dpixel - dborda;
            dfinalreal = resol * dfinal;
                    
            Dfinal(i,j) = dfinalreal;
            
        else
            
            Dfinal(i,j) = 0;
            
        end
        
    end
end

N = N + 1;
DfinalMt(:,:,N) = Dfinal;

Dfinal = zeros(sizeRec,sizeRec);

IpolRot = imrotate(Ipol,360/Nang,'bicubic','crop');
%Ipol = medfilt2(IpolRot);

end

for h=1:1:Nang
    
   DFINAL(:,:,h) = imrotate(DfinalMt(:,:,h),((65-h)*360/Nang),'crop');
   
end

figure

for i=1:1:Nang
     imagesc(DFINAL(:,:,i)),title(['Mapa de distância ',num2str(i)]);
     drawnow
end 