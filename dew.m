%% DEW com diferença entre imagens já reconstruidas
% 
% k = 0.5;
% 
% RecDEW = Rec - (k*RecEsp);
% 
% for i=1:256
%     imagesc(RecDEW(:,:,i)),title(['Reconstrução DEW:',num2str(i)]);
%     drawnow
% end
% 
% %% DEW com diferença entre sinogramas
% 
% k = 0.5;
% 
% singfinal = sing1 - (k*singesp1);
% 
% for i=1:256
%     imagesc(singfinal(:,:,i)),title(['Sinograma DEW:',num2str(i)]);
%     drawnow
% end

%% DEW com diferença entre projeções

k = 0.575;

b1 = b;
b2 = besp;

% for gg=1:1:128
%     
%     b1(:,:,gg)=b(:,:,gg);
%     b2(:,:,gg)=b(:,:,gg+128);
%     
% end

projfinal = b1 - (k*b2);

for i=1:1:128
     imagesc(projfinal(:,:,i)),title(num2str(i));
     drawnow
     for k=1:1000
     end
end

clear b
b = projfinal;