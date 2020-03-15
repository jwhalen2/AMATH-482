clear all; close all; clc;

load Testdata
L=15; % spatial domain
n=64; % Fourier modes

%Averaging The Spectrum
ave = zeros(n,n,n); %defining the average array
for j=1:20 %looping through the data reshaping, transform, and summation.
    Un(:,:,:)=reshape(Undata(j,:),n,n,n);
    Unt = fftn(Un);
    ave = Unt+ave;
end
[mxv,idx] = max(ave(:)/20); %find the max and indices
[r,c,p] = ind2sub(size(ave),idx);

%Generating and Applying the Filter
a = 0.05; %bandwidth
filter = zeros(n,n,n); %defining filter array
for x=1:64
    for y=1:64
        for z=1:64
            filter(x,y,z) = exp(-a*((x-r).^2+(y-c).^2+(z-p).^2)); %filter equation
        end
    end
end

%defining position vectors for marble movement
xpos = zeros(1,20);
ypos = zeros(1,20);
zpos = zeros(1,20);

for j=1:20
    Un_filter(:,:,:)=reshape(Undata(j,:),n,n,n);
    Unt_filter = fftn(Un_filter).*filter; %applying filter
    marble = ifftn(Unt_filter);
    [m,id] = max(marble(:));
    [xpos(j),ypos(j),zpos(j)] = ind2sub(size(marble),id); %saving marble position
end

%ploting marble position
plot3(xpos.*L/n,ypos.*L/n,zpos.*L/n,'k','LineWidth',2) 
hold on
plot3(xpos(end)*L/n,ypos(end)*L/n,zpos(end)*L/n,'ro')
title('Marble Movement in 3 Dimensions')
legend('Tracking Marble Movement','Marbles Current Location')
text(xpos(end)*L/n,ypos(end)*L/n,zpos(end).*L/n+0.8, '[9.84, 4.92, 4.69]')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
%%
%Raw data visualization
test(:,:,:)=reshape(Undata(5,:),n,n,n);
isosurface(X,Y,Z,abs(test),0.4)
title('Raw Ultrasound data in 3 Dimensions')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')