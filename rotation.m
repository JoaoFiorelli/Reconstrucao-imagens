N = 256;

for pp=1:N
    
    new_b(:,:,pp) = imrotate(b(:,:,pp),90);
    
end

for i=1:1:N
     imagesc(new_b(:,:,i)),title(num2str(i));
     drawnow
     for k=1:1000
     end
end