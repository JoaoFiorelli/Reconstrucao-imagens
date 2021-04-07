%close all,clear all, clc

% voce tem de usar o interfileread e ter o cabeçario para ler o arquivo. 
% O cabeçario tem a informação de como esta salvo a imagem.
 
msize1=128;
msize2=128;
b=zeros(msize1,msize2,256);

for j=1:128
    fid=fopen(['..\JaszczakFINAL\SPECTdew' num2str(j) '.sin'],'r');
    a=fread(fid,inf,'uint16','ieee-le');
    al=length(a)/(msize1*msize2);
    fclose(fid);
    a=reshape(a,msize1,msize2,length(a)/(msize1*msize2));
    b(:,:,1:al)=b(:,:,1:al)+a;       
end

for i=1:1:256
     imagesc(b(:,:,i)),title(num2str(i));
     drawnow
     for k=1:1000
     end
end