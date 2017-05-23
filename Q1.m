clear all;
%%
filename='test_cif.y';
k=10;
frame=getCifYframe(filename,k);
image(frame);
colormap(gray(256));
axis image;
axis off;
%%
K=234;
figure(2);
for k=1:K
    frame=getCifYframe(filename,k);
    image(frame);
    colormap(gray(256));
    axis image;
    axis off;
    pause(1/30);
end
%%
cur=getCifYframe(filename,3);
ref=getCifYframe(filename,4);
brow=4;
bcol=4;
search=8;
mvf=me(cur,ref,brow,bcol,search);
displayMVF(cur,mvf,8);
%%
motcomp=mc(ref,mvf);
image(motcomp);
colormap(gray(256));
%%
cost=codingCost(mvf,[brow bcol]);
%%
M=size(cur);
PSNR=10*log10((255^2*M(1)*M(2))./sum(sum((cur-motcomp).^2)));
%%
brow=4;
bcol=4;
search=8;
distance=1;
%%
for i=4:16
    brow=i;
    bcol=i;
    [time(i),cost(i),PSNR(i)]=compensation(3,brow,bcol,search,distance);
end
plot(time);


