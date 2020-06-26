img=imread('jokerimage.png');

R=zeros(514);
R(2:513,2:513) = img(:,:,1);
G=zeros(514);
G(2:513,2:513) = img(:,:,2);
B=zeros(514);
B(2:513,2:513) = img(:,:,3);

blurR = zeros(512);
blurG = zeros(512);
blurB = zeros(512);
for c = 2:513
    for r = 2:513
        
       sumR = R(r-1,c-1)+ R(r-1,c) + R(r-1,c+1) + R(r,c-1) + R(r,c) + R(r,c + 1) + R(r+1,c-1) + R(r+1,c) + R(r+1,c+1);
       blurR(r-1,c-1) = sumR * 1/9;
       
       sumG = G(r-1,c-1)+ G(r-1,c) + G(r-1,c+1) + G(r,c-1) + G(r,c) + G(r,c + 1) + G(r+1,c-1) + G(r+1,c) + G(r+1,c+1);
       blurG(r-1,c-1) = sumG * 1/9;
       
       sumB = B(r-1,c-1)+ B(r-1,c) + B(r-1,c+1) + B(r,c-1) + B(r,c) + B(r,c + 1) + B(r+1,c-1) + B(r+1,c) + B(r+1,c+1);
       blurB(r-1,c-1) = sumB * 1/9;
         
    end
end

blurredJoker = zeros(512,512,3);
blurredJoker(:,:,1) = blurR;
blurredJoker(:,:,2) = blurG;
blurredJoker(:,:,3) = blurB;

figure('Name','Blurred');
imshow(uint8(blurredJoker))


edgeR = zeros(512);
edgeG = zeros(512);
edgeB = zeros(512);

for c = 2:513
    for r = 2:513
        
       edgeR(r-1,c-1) = 0 - R(r-1,c-1)- R(r-1,c) - R(r-1,c+1) - R(r,c-1) + 8 * R(r,c) - R(r,c + 1) - R(r+1,c-1) - R(r+1,c) - R(r+1,c+1);
       
       edgeG(r-1,c-1) = 0 - G(r-1,c-1)- G(r-1,c) - G(r-1,c+1) - G(r,c-1) + 8 * G(r,c) - G(r,c + 1) - G(r+1,c-1) - G(r+1,c) - G(r+1,c+1);
       
       edgeB(r-1,c-1) = 0 - B(r-1,c-1)- B(r-1,c) - B(r-1,c+1) - B(r,c-1) + 8 * B(r,c) - B(r,c + 1) - B(r+1,c-1) - B(r+1,c) - B(r+1,c+1);         
    end
end

edgedJoker = zeros(512,512,3);
edgedJoker(:,:,1) = edgeR;
edgedJoker(:,:,2) = edgeG;
edgedJoker(:,:,3) = edgeB;
figure('Name','Edge Detector');
imshow(uint8(edgedJoker))

R2=zeros(514);
R2(2:513,2:513) = blurredJoker(:,:,1);
G2=zeros(514);
G2(2:513,2:513) = blurredJoker(:,:,2);
B2=zeros(514);
B2(2:513,2:513) = blurredJoker(:,:,3);

sharpenR = zeros(512);
sharpenG = zeros(512);
sharpenB = zeros(512);

for c = 2:513
    for r = 2:513
        
       sharpenR(r-1,c-1) = 0 - R2(r-1,c) - R2(r,c-1) + 5 *  R2(r,c) - R2(r,c + 1) - R2(r+1,c);
       sharpenG(r-1,c-1) = 0 - G2(r-1,c) - G2(r,c-1) + 5 *  G2(r,c) - G2(r,c + 1) - G2(r+1,c);
       sharpenB(r-1,c-1) = 0 - B2(r-1,c) - B2(r,c-1) + 5 *  B2(r,c) - B2(r,c + 1) - B2(r+1,c);


         
    end
end

sharpenedJoker = zeros(512,512,3);
sharpenedJoker(:,:,1) = sharpenR;
sharpenedJoker(:,:,2) = sharpenG;
sharpenedJoker(:,:,3) = sharpenB;
figure('Name','Sharpened');
imshow(uint8(sharpenedJoker))


embossR = zeros(512);
embossG = zeros(512);
embossB = zeros(512);

for c = 2:513
    for r = 2:513
        
       embossR(r-1,c-1) = 0 - 2 * R(r-1,c-1)- R(r-1,c)  - R(r,c-1) +  R(r,c) + R(r,c + 1)  + R(r+1,c) + 2 *  R(r+1,c+1);
       
       embossG(r-1,c-1) = 0 - 2 *  G(r-1,c-1)- G(r-1,c)  - G(r,c-1) +  G(r,c) + G(r,c + 1)  + G(r+1,c) + 2 *  G(r+1,c+1);
       
       embossB(r-1,c-1) = 0 - 2 * B(r-1,c-1)- B(r-1,c)  - B(r,c-1) +  B(r,c) + B(r,c + 1)  + B(r+1,c) + 2 * B(r+1,c+1);         
    end
end

embossedJoker = zeros(512,512,3);
embossedJoker(:,:,1) = embossR;
embossedJoker(:,:,2) = embossG;
embossedJoker(:,:,3) = embossB;
figure('Name','Emboss');
imshow(uint8(embossedJoker))