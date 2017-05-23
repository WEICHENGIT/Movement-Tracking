%%
brow=4;
bcol=4;
search=8;
distance=1;
%%
clear time cost PSNR;
for i=8:30
    %brow=i;
    %bcol=i; %from 4 to 16
    search=i; %from 8 to 30
    %distance=i;%from 1 to 16
    [time(i),cost(i),PSNR(i)]=compensation(3,brow,bcol,search,distance);
end
%%
figure();
plot(time,'--o');
ylabel('run time');
grid on;
figure();
plot(cost,'--o');
ylabel('coding cost');
grid on;
figure();
plot(PSNR,'--o');
ylabel('PSNR');
grid on;
