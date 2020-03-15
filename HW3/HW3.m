%% cam 1.1
clear all; close all; clc;
load('cam1_1.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames1_1);
numFrames = size(vidFrames1_1,4);

plotya = zeros(1,numFrames);
plotxa = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test = uint8(crop).*rgb2gray(vidFrames1_1(:,:,:,20));
% imshow(test)

for j = 1:numFrames
    X = vidFrames1_1(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxa(j) = inx;
    plotya(j) = iny;
end
[mn, mnindx] = min(plotya(1:50));
plotya = plotya(mnindx:end);
plotxa = plotxa(mnindx:end);
figure()
plot(plotxa,plotya,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
title('Ideal Case Camera Variance in Space')
ylabel('Position in Y')
xlabel('Postition in X')
%% cam 2.1

load('cam2_1.mat')
%implay(vidFrames1_1)
numFrames = size(vidFrames2_1,4);

plotyb = zeros(1,numFrames);
plotxb = zeros(1,numFrames);
crop = zeros(480,640);
crop(100:400,200:400) = ones(301,201);
% test = uint8(crop).*rgb2gray(vidFrames2_1(:,:,:,20));
% imshow(test)

for j = 1:numFrames
    X = vidFrames2_1(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxb(j) = inx;
    plotyb(j) = iny;
end
[mn, mnindx] = min(plotyb(1:50));
plotyb = plotyb(mnindx:end);
plotxb = plotxb(mnindx:end);
figure()
plot(plotxb,plotyb,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
%% cam 3.1

load('cam3_1.mat')
%implay(vidFrames1_1)
numFrames = size(vidFrames3_1,4);

plotyc = zeros(1,numFrames);
plotxc = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test = uint8(crop).*rgb2gray(vidFrames1_1(:,:,:,20));
% imshow(test)

for j = 1:numFrames
    X = vidFrames3_1(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxc(j) = inx;
    plotyc(j) = iny;
end
[mn, mnindx] = min(plotxc(1:50));
plotyc = plotyc(mnindx:end);
plotxc = plotxc(mnindx:end);
figure()
plot(plotxc,plotyc,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])

%% SVD
svdmatrix = [plotxa(1:204)-mean(plotxa(1:204)); plotya(1:204)-mean(plotya(1:204)); plotxb(1:204)-mean(plotxb(1:204)); plotyb(1:204)-mean(plotyb(1:204)); plotxc(1:204)-mean(plotxc(1:204)); plotyc(1:204)-mean(plotyc(1:204))];

[U,S,V] = svd(svdmatrix, 'econ');
Sdi = diag(S)';
energy = zeros(1,length(Sdi));
for i = 1:length(Sdi)
    energy(i) = Sdi(i)^2/(sum(Sdi.^2));
end
etot(2:7) = cumsum(energy);
etot(1) = 0;
figure()
plot([0:6],etot*100, 'k'); drawnow
title('Cumulative Energy Ideal Case')
ylabel('Energy (%)')
xlabel('Singular Values')


figure()
plot(1:204,U(:,1:3)'*svdmatrix)
title('Variance per Principle Component Ideal Case')
ylabel('Variance')
xlabel('Time')
legend('PC1','PC2','PC3')
xlim([0 204])

figure()
plot(1:204,[svdmatrix(2,:);svdmatrix(4,:);svdmatrix(5,:)])
title('Displacement in Time Ideal Case 3-Angles')
ylabel('Position Displacement')
xlabel('Time (s)')
legend('Angle 1','Angle 2','Angle 3')
xlim([0 204])
%% cam 1.2

load('cam1_2.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames1_2);
numFrames = size(vidFrames1_2,4);

plotya = zeros(1,numFrames);
plotxa = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test = uint8(crop).*vidFrames1_2(:,:,:,:);
% implay(test)

for j = 1:numFrames
    X = vidFrames1_2(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxa(j) = inx;
    plotya(j) = iny;
end
[mn, mnindx] = min(plotya(1:50));
plotya = plotya(mnindx:end);
plotxa = plotxa(mnindx:end);
figure()
plot(plotxa,plotya,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
title('Noisy Case Camera Variance in Space')
ylabel('Position in Y')
xlabel('Postition in X')
%% cam 2.2

load('cam2_2.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames2_2);
numFrames = size(vidFrames2_2,4);

plotyb = zeros(1,numFrames);
plotxb = zeros(1,numFrames);
crop = zeros(480,640);
crop(80:430,150:450) = ones(351,301);
% test = uint8(crop).*vidFrames2_2(:,:,:,:);
% implay(test)

for j = 1:numFrames
    X = vidFrames2_2(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxb(j) = inx;
    plotyb(j) = iny;
end
[mn, mnindx] = min(plotyb(1:50));
plotyb = plotyb(mnindx:end);
plotxb = plotxb(mnindx:end);
figure()
plot(plotxb,plotyb,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])

%% cam 3.2

load('cam3_2.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames3_2);
numFrames = size(vidFrames3_2,4);

plotyc = zeros(1,numFrames);
plotxc = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test = uint8(crop).*vidFrames3_2(:,:,:,:);
% implay(test)

for j = 1:numFrames
    X = vidFrames3_2(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxc(j) = inx;
    plotyc(j) = iny;
end
[mn, mnindx] = min(plotyc(1:50));
plotyc = plotyc(mnindx:end);
plotxc = plotxc(mnindx:end);
figure()
plot(plotxc,plotyc,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])

%% SVD
svdmatrix = [plotxa(1:286)-mean(plotxa(1:286)); plotya(1:286)-mean(plotya(1:286)); plotxb(1:286)-mean(plotxb(1:286)); plotyb(1:286)-mean(plotyb(1:286)); plotxc(1:286)-mean(plotxc(1:286)); plotyc(1:286)-mean(plotyc(1:286))];

[U,S,V] = svd(svdmatrix, 'econ');
Sdi = diag(S)';
energy = zeros(1,length(Sdi));
for i = 1:length(Sdi)
    energy(i) = Sdi(i)^2/(sum(Sdi.^2));
end
etot(2:7) = cumsum(energy);
etot(1) = 0;
figure()
plot([0:6],etot*100, 'k'); drawnow
title('Cumulative Energy Noisy Case')
ylabel('Energy (%)')
xlabel('Singular Values')


figure()
plot(1:286,U(:,1:3)'*svdmatrix)
title('Variance per Principle Component Noisy Case')
ylabel('Variance')
xlabel('Time')
legend('PC1','PC2','PC3')
xlim([0 286])

figure()
plot(1:286,[svdmatrix(2,:);svdmatrix(4,:);svdmatrix(5,:)])
title('Displacement in Time Noisy Case 3-Angles')
ylabel('Position Displacement')
xlabel('Time')
legend('Angle 1','Angle 2','Angle 3')
xlim([0 286])
%% cam 1.3

load('cam1_3.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames1_3);
numFrames = size(vidFrames1_3,4);

plotya = zeros(1,numFrames);
plotxa = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test = uint8(crop).*(vidFrames1_3(:,:,:,:));
% implay(test)

for j = 1:numFrames
    X = vidFrames1_3(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxa(j) = inx;
    plotya(j) = iny;
end
[mn, mnindx] = min(plotya(1:50));
plotya = plotya(mnindx:end);
plotxa = plotxa(mnindx:end);
figure()
plot(plotxa,plotya,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
title('Horizontal Displacement Case Camera Variance in Space')
ylabel('Position in Y')
xlabel('Postition in X')
%% cam 2.3

load('cam2_3.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames2_3);
numFrames = size(vidFrames2_3,4);

plotyb = zeros(1,numFrames);
plotxb = zeros(1,numFrames);
crop = zeros(480,640);
crop(170:400,150:450) = ones(231,301);
% test = uint8(crop).*(vidFrames2_3(:,:,:,:));
% implay(test)

for j = 1:numFrames
    X = vidFrames2_3(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxb(j) = inx;
    plotyb(j) = iny;
end
[mn, mnindx] = min(plotyb(1:50));
plotyb = plotyb(mnindx:end);
plotxb = plotxb(mnindx:end);
figure()
plot(plotxb,plotyb,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
%% cam 3.3

load('cam3_3.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames3_3);
numFrames = size(vidFrames3_3,4);

plotyc = zeros(1,numFrames);
plotxc = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test = uint8(crop).*(vidFrames3_3(:,:,:,:));
% implay(test)

for j = 1:numFrames
    X = vidFrames3_3(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxc(j) = inx;
    plotyc(j) = iny;
end
[mn, mnindx] = min(plotxc(1:50));
plotyc = plotyc(mnindx:end);
plotxc = plotxc(mnindx:end);
figure()
plot(plotxc,plotyc,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
%% SVD
svdmatrix = [plotxa(1:203)-mean(plotxa(1:203)); plotya(1:203)-mean(plotya(1:203)); plotxb(1:203)-mean(plotxb(1:203)); plotyb(1:203)-mean(plotyb(1:203)); plotxc(1:203)-mean(plotxc(1:203)); plotyc(1:203)-mean(plotyc(1:203))];

[U,S,V] = svd(svdmatrix, 'econ');
Sdi = diag(S)';
energy = zeros(1,length(Sdi));
for i = 1:length(Sdi)
    energy(i) = Sdi(i)^2/(sum(Sdi.^2));
end
etot(2:7) = cumsum(energy);
etot(1) = 0;
figure()
plot([0:6],etot*100, 'k'); drawnow
title('Cumulative Energy Horizontal Displacement Case')
ylabel('Energy (%)')
xlabel('Singular Values')

figure()
plot(1:203,U(:,1:3)'*svdmatrix)
title('Variance per Principle Component Horizontal Displacement Case')
ylabel('Variance')
xlabel('Time')
legend('PC1','PC2','PC3')
xlim([0 203])

figure()
plot(1:203,[svdmatrix(2,:);svdmatrix(4,:);svdmatrix(5,:)])
title('Displacement in Time Horizontal Displacement Case 3-Angles')
ylabel('Position Displacement')
xlabel('Time')
legend('Angle 1','Angle 2','Angle 3')
xlim([0 203])
%% cam 1.4

load('cam1_4.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames1_4);
numFrames = size(vidFrames1_4,4);

plotya = zeros(1,numFrames);
plotxa = zeros(1,numFrames);
crop = zeros(480,640);
crop(200:430,250:450) = ones(231,201);
% test =uint8(crop).*(vidFrames1_4(:,:,:,:));
% implay(test)

for j = 1:numFrames
    X = vidFrames1_4(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxa(j) = inx;
    plotya(j) = iny;
end
[mn, mnindx] = min(plotya(1:50));
plotya = plotya(mnindx:end);
plotxa = plotxa(mnindx:end);
figure()
plot(plotxa,plotya,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
title('Horizontal Displacement & Rotation Case Camera Variance in Space')
ylabel('Position in Y')
xlabel('Postition in X')
%% cam 2.4

load('cam2_4.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames2_4);
numFrames = size(vidFrames2_4,4);

plotyb = zeros(1,numFrames);
plotxb = zeros(1,numFrames);
crop = zeros(480,640);
crop(130:380,150:450) = ones(251,301);
test = (vidFrames2_4(:,:,:,50));
imshow(test)
%%
for j = 1:numFrames
    X = vidFrames2_4(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxb(j) = inx;
    plotyb(j) = iny;
end
[mn, mnindx] = min(plotyb(1:50));
plotyb = plotyb(mnindx:end);
plotxb = plotxb(mnindx:end);
figure()
plot(plotxb,plotyb,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])
%% cam 3.4

load('cam3_4.mat')
%implay(vidFrames1_1)
framesize = size(vidFrames3_4);
numFrames = size(vidFrames3_4,4);

plotyc = zeros(1,numFrames);
plotxc = zeros(1,numFrames);
crop = zeros(480,640);
crop(100:330,300:500) = ones(231,201);
% test = uint8(crop).*(vidFrames3_4(:,:,:,:));
% implay(test)

for j = 1:numFrames
    X = vidFrames3_4(:,:,:,j);
    grean = X(:,:,2);
    cropgrean = crop.*double(grean);
    [m,keep] = max(cropgrean);
    [m,inx] = max(m);
    iny = keep(inx);
    %imshow(X); drawnow
    plotxc(j) = inx;
    plotyc(j) = iny;
end
[mn, mnindx] = min(plotxc(1:100));
plotyc = plotyc(mnindx:end);
plotxc = plotxc(mnindx:end);
figure()
plot(plotxc,plotyc,'k.')
set(gca, 'YDir','reverse')
xlim([0 640])
ylim([0 480])

%% SVD
svdmatrix = [plotxa(1:345)-mean(plotxa(1:345)); plotya(1:345)-mean(plotya(1:345)); plotxb(1:345)-mean(plotxb(1:345)); plotyb(1:345)-mean(plotyb(1:345)); plotxc(1:345)-mean(plotxc(1:345)); plotyc(1:345)-mean(plotyc(1:345))];

[U,S,V] = svd(svdmatrix, 'econ');
Sdi = diag(S)';
energy = zeros(1,length(Sdi));
for i = 1:length(Sdi)
    energy(i) = Sdi(i)^2/(sum(Sdi.^2));
end
etot = cumsum(energy);
figure()
semilogy(etot, 'k'); drawnow
title('Cumulative Energy Horizontal Displacement with Rotation Case')
ylabel('Energy (%)')
xlabel('Singular Values')
figure()
plot(1:345,U(:,1:3)'*svdmatrix)
title('Variance per Principle Component Horizontal Displacement with Rotation Case')
ylabel('Variance')
xlabel('Time')
legend('PC1','PC2','PC3')
%%
figure()
plot(1:345,[svdmatrix(2,:);svdmatrix(4,:);svdmatrix(5,:)])
title('Displacement in Time Horizontal Displacement with Rotation Case 3-Angles')
ylabel('Position Displacement')
xlabel('Time')
legend('Angle 1','Angle 2','Angle 3')
xlim([0 345])
