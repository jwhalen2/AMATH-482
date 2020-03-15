%% definitions and refresh
close all; clear all; clc;
load handel
v = y';
n = length(y);
L = n/Fs;
t = (1:length(y))/(Fs);
k=(1/L)*[0:((n+1)/2-1) (-n/2):-1]; 
ks=fftshift(k);
a = [1,10,100,1000];
tslide=0:0.1:9;
width = [2, 1, 0.1, 0.01];
%%
ghold=exp(-10*(t-5).^2);
    plot(t,v);
    hold on
    plot(t,ghold,'linewidth',2)
ghold=exp(-10*(t-5.2).^2);
    plot(t,ghold,'linewidth',2)
ghold=exp(-10*(t-7).^2);
    plot(t,ghold,'linewidth',2)
    xlabel('Time [sec]');
    ylabel('Amplitude');
    title('Sampling Frequncy and Window Width');
%% Gaus filter
for k = 1:length(a)
    ghold=exp(-a(k)*(t-5).^2);
    subplot(2,2,k)
    plot(t,v);
    hold on
    plot(t,ghold,'linewidth',2)
    xlabel('Time [sec]');
    ylabel('Amplitude');
    title('Sampling Frequncy and Window Width');
end 
subplot(2,2,1)
title('a = 1')
xlabel('Time [sec]');
ylabel('Amplitude');
subplot(2,2,2)
title('a = 10')
xlabel('Time [sec]');
ylabel('Amplitude');
subplot(2,2,3)
title('a = 100')
xlabel('Time [sec]');
ylabel('Amplitude');
subplot(2,2,4)
title('a = 1000')
xlabel('Time [sec]');
ylabel('Amplitude');
%% Gaus plot
figure(2)
% for k = 1:length(a)
    Sgt_spec = zeros(length(tslide),n);
    for j=1:length(tslide)
        g=exp(-200*(t-tslide(j)).^2); 
        Sg=v.*g; 
        Sgt=fft(Sg); 
        Sgt_spec(j,:) = abs(fftshift(Sgt)); % We don't want to scale it
    end   
%     subplot(2,2,k)
    pcolor(tslide,ks,Sgt_spec.'), 
    shading interp 
    set(gca,'Fontsize',16) 
    colormap(hot)
    title('Filtered Handel Spectrogram')
    xlabel('Time [sec]');
    ylabel('Frequncy [Hz]');
%end
% subplot(2,2,1)
% title('a = 1')
% xlabel('Time [sec]');
% ylabel('Frequncy [Hz]');
% subplot(2,2,2)
% title('a = 10')
% xlabel('Time [sec]');
% ylabel('Frequncy [Hz]');
% subplot(2,2,3)
% title('a = 100')
% xlabel('Time [sec]');
% ylabel('Frequncy [Hz]');
% subplot(2,2,4)
% title('a = 1000')
% xlabel('Time [sec]');
% ylabel('Frequncy [Hz]');
%% Sampling freq
tspace = [1, 0.1, 0.01];
for k = 1:length(tspace)
    tslide = 0:tspace(k):9;
    Sgt_spec = zeros(length(tslide),n);
    for j=1:length(tslide)
        g=exp(-100*(t-tslide(j)).^2); 
        Sg=v.*g; 
        Sgt=fft(Sg); 
        Sgt_spec(j,:) = abs(fftshift(Sgt)); % We don't want to scale it
    end   
    subplot(3,1,k)
    pcolor(tslide,ks,Sgt_spec.'), 
    shading interp 
    set(gca,'Fontsize',16) 
    colormap(hot)
end
subplot(3,1,1)
title('Sample Frequncy = 1s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
subplot(3,1,2)
title('Sample Frequncy = 0.1s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
subplot(3,1,3)
title('Sample Frequncy = 0.01s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
%% Shannon plot
for k = 1:length(width)
    for j=1:length(tslide)
        g = -heaviside(t-tslide(j)-width(k)) + heaviside(t-tslide(j));
        Sg=v.*g; 
        Sgt=fft(Sg); 
        Sgt_spec(j,:) = abs(fftshift(Sgt)); % We don't want to scale it
    end  
    subplot(2,2,k)
    pcolor(tslide,ks,Sgt_spec.'), 
    shading interp 
    set(gca,'Fontsize',16) 
    colormap(hot)
end
subplot(2,2,1)
title('Width = 2s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
subplot(2,2,2)
title('Width = 1s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
subplot(2,2,3)
title('Width = 0.1s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
subplot(2,2,4)
title('Width = 0.01s')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');
%% Shannon filter
figure()
for k = 1:length(width)
    ghold = -heaviside(t-5-width(k)) + heaviside(t-5);
    subplot(2,2,k)
    plot(t,v);
    hold on
    plot(t,ghold,'linewidth',2)
end 
subplot(2,2,1)
title('Width = 2s')
xlabel('Time [sec]');
ylabel('Amplitude');
subplot(2,2,2)
title('Width = 1s')
xlabel('Time [sec]');
ylabel('Amplitude');
subplot(2,2,3)
title('Width = 0.1s')
xlabel('Time [sec]');
ylabel('Amplitude');
subplot(2,2,4)
title('Width = 0.01s')
xlabel('Time [sec]');
ylabel('Amplitude');

%% piano + filter
close all; clear all; clc;
[ypiano,Fs] = audioread('music1.wav');
Fs = Fs/16;
vpiano = ypiano';
vpiano = downsample(vpiano, 16);
tr_piano=length(vpiano)/Fs;
npiano = length(vpiano);
tpiano = (1:npiano)/Fs;
a = 100;
k=(1/tr_piano)*[0:(npiano/2-1) (-npiano/2):-1]; 
ks=fftshift(k);
tslide=0:0.1:tr_piano;
Sgt_spec = zeros(length(tslide),npiano);

 for j=1:length(tslide)
        g=exp(-a*(tpiano-tslide(j)).^2); 
        Sg=g.*vpiano;
        Sgt=fft(Sg);
        [maxt,tin]=max(abs(Sgt));
        Sgtf = Sgt.*exp(-0.01*(k-k(tin)).^2); 
        Sgt_spec(j,:) = fftshift(abs(Sgtf));
 end
figure()
pcolor(tslide,ks,Sgt_spec.'), 
shading interp 
set(gca,'Ylim',[0,1000],'Fontsize',16) 
colormap(hot)
title('Mary had a Little Lamb Spectrogram w/o Overtones (Piano) ')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');

figure()
plot((1:length(vpiano))/Fs,vpiano);
xlabel('Time [sec]'); ylabel('Amplitude');
title('Mary had a Little Lamb Filter Visual (Piano)');
hold on
g=exp(-100*(tpiano-5).^2);
plot(tpiano,g,'linewidth',2)


%% recorder + filter

close all; clear all; clc;
[yrec,Fs] = audioread('music2.wav');
vrec = yrec';
tr_rec=length(vrec)/Fs;
nrec = length(vrec);
trec = (1:nrec)/Fs;
a = 100;
k=(1/tr_rec)*[0:(nrec/2-1) (-nrec/2):-1]; 
ks=fftshift(k);
tslide=0:0.1:tr_rec;
Sgt_spec = zeros(length(tslide),nrec);

 for j=1:length(tslide)
        g=exp(-a*(trec-tslide(j)).^2); 
        Sg=g.*vrec;
        Sgt=fft(Sg);
        [maxt,tin]=max(abs(Sgt));
        Sgtf = Sgt.*exp(-0.001*(k-k(tin)).^2); 
        Sgt_spec(j,:) = fftshift(abs(Sgtf));
 end
figure()
pcolor(tslide,ks,Sgt_spec.'), 
shading interp 
set(gca,'Ylim',[500,4000],'Fontsize',16) 
colormap(hot)
title('Mary had a Little Lamb Spectrogram w/o Overtones (Recorder) ')
xlabel('Time [sec]');
ylabel('Frequncy [Hz]');

figure()
plot((1:length(vrec))/Fs,vrec);
xlabel('Time [sec]'); ylabel('Amplitude');
title('Mary had a Little Lamb Filter Visual (Recorder)');
hold on
g=exp(-100*(trec-5).^2);
plot(trec,g,'linewidth',2)