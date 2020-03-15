%% Train 1 Training Samples
% Jazz Training Samples
close all; clear all; clc;
jazzurls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_The_Lasso_of_Time.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_02_-_The_Other_Side_of_Darkness.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_Sleepless.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_07_-_Synchronicity.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_08_-_Gibraltar.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_In_Former_Rings.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_Uncertain.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_Played_by_Ear.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_13_-_Dust_and_Memories.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_14_-_Depressed_Buddhist.mp3'};
count = 1;
shrink = 5;
yjazz = zeros(5*(44100/shrink),length(jazzurls)*3);
for  k = 1:length(jazzurls)
    [y,Fs] = webread(jazzurls{k});
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    yjazz(:,count) = y((Fs*5):(Fs*10-1),1);
    yjazz(:,count+1) = y((Fs*30):(Fs*35-1),1);
    yjazz(:,count+2) = y((Fs*60):(Fs*65-1),1);
    count = count + 3;
end

% Rock Training Samples
rockurls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_01_-_Out_of_School.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_02_-_FM.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_03_-_Fireworks.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_04_-_Storyteller.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_05_-_Siesta.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_06_-_Echoes.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_07_-_Summercase.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_08_-_Overdose.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_09_-_So_Easy.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_10_-_April_from_the_train.mp3'};
count = 1;
yrock = zeros(5*(44100/shrink),length(rockurls)*3);
for  k = 1:length(rockurls)
    [y,Fs] = webread(rockurls{k});
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    yrock(:,count) = y((Fs*30):(Fs*35-1),1);
    yrock(:,count+1) = y((Fs*60):(Fs*65-1),1);
    yrock(:,count+2) = y((Fs*120):(Fs*125-1),1);
    count = count + 3;
end

% Hip-Hop Training Sample
hipurls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/August_2019/Yung_Kartz_-_05_-_Picture_Perfect.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/August_2019/Yung_Kartz_-_04_-_One_Way.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/August_2019/Yung_Kartz_-_03_-_Intranet.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/August_2019/Yung_Kartz_-_02_-_Stranger.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/August_2019/Yung_Kartz_-_01_-_Jeopardy.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/July_2019/Yung_Kartz_-_08_-_Landline.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/July_2019/Yung_Kartz_-_07_-_Frontline.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/July_2019/Yung_Kartz_-_06_-_Psychedelic.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/July_2019/Yung_Kartz_-_05_-_Magic.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/July_2019/Yung_Kartz_-_04_-_Abandoned.mp3'};
count = 1;
yhip = zeros(5*(44100/shrink),length(hipurls)*3);
for  k = 1:length(hipurls)
    [y,Fs] = webread(hipurls{k});
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    yhip(:,count) = y((Fs*30):(Fs*35-1),1);
    yhip(:,count+1) = y((Fs*60):(Fs*65-1),1);
    yhip(:,count+2) = y((Fs*120):(Fs*125-1),1);
    count = count + 3;
end

%% Test 1 
hipspec = zeros(51,5*(44100/shrink),30);
for i = 1:size(yhip,2)
   hipspec(:,:,i) = specmaker(yhip(:,i),Fs); 
end
hipflat = specshaper(hipspec);

rockspec = zeros(51,5*(44100/shrink),30);
for i = 1:size(yrock,2)
   rockspec(:,:,i) = specmaker(yrock(:,i),Fs); 
end
rockflat = specshaper(rockspec);

jazzspec = zeros(51,5*(44100/shrink),30);
for i = 1:size(yjazz,2)
   jazzspec(:,:,i) = specmaker(yjazz(:,i),Fs); 
end
jazzflat = specshaper(jazzspec);

%%
features = 20;
[U,S,V,w,threshold1,threshold2,sortg1,sortg2,sortg3] = music_trainer(jazzflat,hipflat,rockflat,features);
%%
p1 = plot(sortg1,zeros(30),'ob','Linewidth',2);
hold on
p2 = plot(sortg2,ones(30),'or','Linewidth',2);
p3 = plot(sortg3,2*ones(30),'og','Linewidth',2);
plot([threshold1,threshold1],[0,3],'k')
plot([threshold2,threshold2],[0,3],'k')
ylim([0 3])
title('Training Set Projections')
xlabel('Sorted Projections')
legend([p1(1) p2(1) p3(1)],'Jazz Samples','Hip-Hop Samples','Rock Samples')
set(gca,'Fontsize',16)
% figure()
% semilogy(diag(S),'ko')
%%
close all;

tslide = 0:0.1:5;
k=(1/5)*[0:(length(yhip)/2-1) (-length(yhip)/2):-1];
thipmus = linspace(1,5,5*(44100/shrink));
figure()
plot(thipmus,yhip(:,5))
ylabel('Amplitude')
xlabel('Time (sec)')
title('5 Second Hip-Hop Sample')
set(gca,'Fontsize',16)
figure()
pcolor(tslide,fftshift(k),hipspec(:,:,5).'); 
shading interp 
set(gca, 'Ylim',[0,1000], 'Fontsize',16) 
colormap(hot)
ylabel('Frequency (Hz)')
xlabel('Time (sec)')
title('Spectrogram of 5 Second Hip-Hop Sample')


%% Test 1

testurls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_11_-_Riots.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_12_-_B-Side.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_13_-_Italia_90.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Jahzzar/Travellers_Guide_Excerpt/Jahzzar_-_14_-_Before__After.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/Jahzzar/The_Crowd_excerpt/Jahzzar_-_02_-_Streetview.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/The_Crowd_excerpt/03_-_Car_Crash.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/The_Crowd_excerpt/04_-_Ice_Cream.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/Jahzzar/The_Crowd_excerpt/Jahzzar_-_06_-_Agoraphobia.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/The_Crowd_excerpt/07_-_Polaroid.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/Jahzzar/The_Crowd_excerpt/Jahzzar_-_08_-_Bored.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_01_-_Number_One.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_02_-_Reward.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_03_-_Inbound.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_04_-_Out_Cold.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_15_-_OUTCAST.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_06_-_u_know.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_07_-_Bankroll.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_08_-_Strange_Times.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_09_-_Made_It.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Yung_Kartz/March_2019/Yung_Kartz_-_10_-_Crystalline.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_Uncertain.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_Played_by_Ear.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_13_-_Dust_and_Memories.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_14_-_Depressed_Buddhist.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_15_-_Turning.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_16_-_Dakota.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/The_Lasso_of_Time/17_-_Rain.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_22_-_Microwave.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_23_-_23_Wacko.mp3';
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Unheard_Music_Concepts/The_Lasso_of_Time/Unheard_Music_Concepts_-_24_-_Cosmic_Relevance.mp3'};

count = 1;
ytest = zeros(5*(44100/shrink),length(testurls));
for  k = 1:length(testurls)
    [y,~] = webread(testurls{k});
    Fs = 44100;
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    ytest(:,count) = y((Fs*15):(Fs*20-1),1);
    ytest(:,count+1) = y((Fs*30):(Fs*35-1),1);
    ytest(:,count+2) = y((Fs*50):(Fs*55-1),1);
    count = count + 3;
end
%%
testspec = zeros(51,5*(44100/shrink),30);
for i = 1:size(ytest,2)
   testspec(:,:,i) = specmaker(ytest(:,i),Fs); 
end
testflat = specshaper(testspec);

Testmat = U'*testflat;
pval = w'*Testmat;
ansvec = zeros(1,90);
for i = 1:length(pval)
    if pval(i)<threshold1
       ansvec(i) = 1; %hip
    elseif pval(i)>threshold2
        ansvec(i) = 2; %jazz
    else
        ansvec(i) = 3; %rock
    end
end
keyvec = [3*ones(1,30) ones(1,30) 2*ones(1,30)];
ernum = key(ansvec,keyvec);
percentcorrect1 = (1-sum(ernum)/90)*100
%%
for i = 1:length(ernum)
    hold on
    if ernum(i) == 1
        pwrong = plot(pval(i),ansvec(i)-1,'ro');
    else
        pright = plot(pval(i),ansvec(i)-1,'go');
    end
end
% plot(pval,ernum,'ko')
plot([threshold1,threshold1],[0,3],'k')
plot([threshold2,threshold2],[0,3],'k')
legend([pwrong(1) pright(1)],'Wrong Sorting','Right Sorting')
set(gca,'Fontsize',16)
title('Test Set Projections')
xlabel('Sorted Projections')

%% Train 2 Training Samples
clear all; close all; clc;
train2urls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_01_-_Indian_Summer_ID_206.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_02_-_Jonny_pass_auf_ID_290.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_03_-_Cabanossi_Mwe_ID_258.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_04_-_Nighlight_ID_202.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_05_-_Out_of_Paradise_ID_246.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_06_-_Swinging_Sofas_ID_272.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_07_-_Echoes_Boogie_Dancehall_ID_278.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_08_-_Springtime_ID_277.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_09_-_Pianoman_Sofa_ID_265.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_10_-_Ja_was_sah_ich_da_ID_247.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_01_-_The_Way_I_Feel.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_02_-_Our_Love_Is_Rich_Enough.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_03_-_Peculiar.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_04_-_Is_Real.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_05_-_It_Aint_This_Bed.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_06_-_Help_Desk.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_07_-_Working_For_The_County.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_08_-_Life_and_Times.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_09_-_My_Word.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_10_-_Selfish.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_01_-_Jai_t_au_bal.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_02_-_Quand_la_bire_est_tire.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_03_-_Un_gars_de_la_baie.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_04_-_La_ballade_de_Jacques_Cartier.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_05_-_John_Junior.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_06_-_John_Edmond.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_07_-_Ici_en_Gaspsie.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_08_-_Toute_la_nuit.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_09_-_Mama.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_10_-_Le_pcheur.mp3'};
shrink = 5;
count = 1;
ytrain2 = zeros(5*(44100/shrink),length(train2urls));
for  k = 1:length(train2urls)
    [y,~] = webread(train2urls{k});
    Fs = 44100;
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    ytrain2(:,count) = y((Fs*15):(Fs*20-1),1);
    ytrain2(:,count+1) = y((Fs*30):(Fs*35-1),1);
    ytrain2(:,count+2) = y((Fs*50):(Fs*55-1),1);
    count = count + 3;
end
%%
train2spec = zeros(51,5*(44100/shrink),30);
for i = 1:size(ytrain2,2)
   train2spec(:,:,i) = specmaker(ytrain2(:,i),Fs); 
end
train2flat = specshaper(train2spec);
%%
features = 20;
[U,S,V,w,threshold1,threshold2,sortg1,sortg2,sortg3] = music_trainer(train2flat(:,1:30),train2flat(:,31:60),train2flat(:,61:90),features);
%%
p1 = plot(sortg1,zeros(30),'ob','Linewidth',2);
hold on
p2 = plot(sortg2,ones(30),'or','Linewidth',2);
p3 = plot(sortg3,2*ones(30),'og','Linewidth',2);
plot([threshold1,threshold1],[0,3],'k')
plot([threshold2,threshold2],[0,3],'k')
ylim([0 3])
title('Training Set Projections')
xlabel('Sorted Projections')
legend([p1(1) p2(1) p3(1)],'Lobo Samples','Clegg Samples','Quimo Samples')
set(gca,'Fontsize',16)
%% Test 2 
testurls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_11_-_ICE_Meltdown_ID_251.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_12_-_Cant_Let_Her_Go_ID_261.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_13_-_Mary_Roose_Spaceblues_ID_94.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Lobo_Loco/My_FAVORITE_SWEET_HOME_TRACKS/Lobo_Loco_-_14_-_Buzzard_ID_177.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Adventure/Lobo_Loco_-_01_-_Blues_about_Mary_Roose_ID_1153.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Adventure/Lobo_Loco_-_02_-_Traveling_to_Lousiana_-_Soft_Delay_ID_1174.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Adventure/Lobo_Loco_-_03_-_Cool_and_Wonderful_ID_1163.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Adventure/Lobo_Loco_-_04_-_Bad_Old_Daemons_ID_1138.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Adventure/Lobo_Loco_-_05_-_Evening_Campfire_ID_1178.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Adventure/Lobo_Loco_-_06_-_Snowflakes_ID_1139.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_11_-_Good_Graces.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_12_-_Bed_of_Weeds.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_13_-_Unfair_To_Me.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_14_-_I_Have_You.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Derek_Clegg/Good_Graces/Derek_Clegg_-_15_-_Never_Really_Change.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/blocSonic/Derek_Clegg/Overlook_The_Human_Race_5_Year_Anniversary_Re-Release/Derek_Clegg_-_01_-_To_Lose_You.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/blocSonic/Derek_Clegg/Overlook_The_Human_Race_5_Year_Anniversary_Re-Release/Derek_Clegg_-_02_-_Never_Leave_LA.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/blocSonic/Derek_Clegg/Overlook_The_Human_Race_5_Year_Anniversary_Re-Release/Derek_Clegg_-_03_-_If_Only_We_Had_More_Time.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/blocSonic/Derek_Clegg/Overlook_The_Human_Race_5_Year_Anniversary_Re-Release/Derek_Clegg_-_04_-_Photograph.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/blocSonic/Derek_Clegg/Overlook_The_Human_Race_5_Year_Anniversary_Re-Release/Derek_Clegg_-_05_-_Carry_On.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_11_-_Tite_tuque__Bosco_Stomp_.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_12_-_Capitaine_Jack.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_13_-_Ma_bouteille.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_14_-_Loin_devant.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_15_-_Su_lquai.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_16_-_Mother.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_17_-_Matelot.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_18_-_Le_chasseur.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_19_-_Le_train_pour_Paspbiac.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Quimorucru/Un_mchant_party/Quimorucru_-_20_-_Salut_John.mp3'};
count = 1;
ytest = zeros(5*(44100/shrink),length(testurls));
for  k = 1:length(testurls)
    [y,~] = webread(testurls{k});
    Fs = 44100;
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    ytest(:,count) = y((Fs*15):(Fs*20-1),1);
    ytest(:,count+1) = y((Fs*30):(Fs*35-1),1);
    ytest(:,count+2) = y((Fs*50):(Fs*55-1),1);
    count = count + 3;
end

%%
testspec = zeros(51,5*(44100/shrink),30);
for i = 1:size(ytest,2)
   testspec(:,:,i) = specmaker(ytest(:,i),Fs); 
end
testflat = specshaper(testspec);

Testmat = U'*testflat;
pval = w'*Testmat;
ansvec = zeros(1,90);
for i = 1:length(pval)
    if pval(i)<threshold2
       ansvec(i) = 1; %quimo
    elseif pval(i)>threshold1
        ansvec(i) = 2; %clegg
    else
        ansvec(i) = 3; %lobo
    end
end
keyvec = [3*ones(1,30) 2*ones(1,30) ones(1,30)];
ernum = key(ansvec,keyvec);
percentcorrect2 = (1-sum(ernum)/90)*100
%%
for i = 1:length(ernum)
    hold on
    if ernum(i) == 1
        pwrong = plot(pval(i),ansvec(i)-1,'ro');
    else
        pright = plot(pval(i),ansvec(i)-1,'go');
    end
end
% plot(pval,ernum,'ko')
plot([threshold1,threshold1],[0,3],'k')
plot([threshold2,threshold2],[0,3],'k')
legend([pwrong(1) pright(1)],'Wrong Sorting','Right Sorting')
set(gca,'Fontsize',16)
title('Test Set Projections')
xlabel('Sorted Projections')
%% Train 3 Training Samples
close all; clear all; clc
train3urls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/KieLoKaz/Free_Ganymed/KieLoKaz_-_07_-_Alte_Herren_Kielokaz_ID_364.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Checkie_Brown/hey/Checkie_Brown_-_10_-_Violence_CB_34.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/shane_br/Live_at_KBOO_for_The_Monday_Sampler_Nov_21_2016/shane_br_-_01_-_Shane_Brown-Novem_2016-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Diversity_of_Life/Lobo_Loco_-_01_-_Aldebaraner_Funky_Disco_ID_1126.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/joyt/Live_at_KBOO_for_The_Monday_Sampler_02202017/joyt_-_01_-_Joytribe-Feb_2017-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/dubio/Live_at_KBOO_for_The_Monday_Sampler_03202017/dubio_-_01_-_Dubious_Move-Mar_2017-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/far_out/Live_at_KBOO_for_Grateful_Dead__Friends_07292017/far_out_-_01_-_Far_Out_West-Jul_2017-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/worlds/Live_at_KBOO_for_Grateful_Dead__Friends_04152017/worlds_-_01_-_Worlds_Finest-Apr_2017-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/radio_phone/Live_at_KBOO_for_The_Monday_Sampler_04102017/radio_phone_-_01_-_Radio_Phoenix-Apr_2017-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/The_Gays/THE_AGENDA/The_Gays_-_09_-_Our_World.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/White_Market_Podcast/Six_Umbrellas/Private_Ark/Six_Umbrellas_-_09_-_Longest_Summer.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/WFMU/Opra_Mort/Je_Suis_Parmi_Les_Cinq_Cents_Personnes_Que_Tu_Prfres_Au_Monde/Opra_Mort_-_02_-_Les_Instants_Chavirs_Montreuil_19122009.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Synapsis/Goan_Psynapsia/Synapsis_-_06_-_Goan_Toca_Me.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/C_C/Impendulo/C_C_-_01_-_UKUZIJABULISA.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/none_given/Sro/Sro_-_Singles/Sro_-_Submersed_Phonics_JBYo_Collab.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Toucan_Music/Psychadelik_Pedestrian/Best_Bytes_Volume_4/Psychadelik_Pedestrian_-_01_-_Drones.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/chZ_/The_Clones_of_Dr_Funkenstein/chZ__-_08_-_Organ_Grinder_Swing.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Studio_11_Chicago/Glass_Lux/Glass_Lux_-_Singles/Glass_Lux_-_Im_A_Machine.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Spiedkiks/Little_Smartphone_People/Spiedkiks_-_16_-_Mos_Eisley_Cantina.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/tozo/albatross/tozo_-_15_-_ikarus.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Scott_Holmes/Inspiring__Upbeat_Music/Scott_Holmes_-_04_-_Upbeat_Party.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/West_Cortez_Records/David_Hilowitz/Gradual_Sunrise/David_Hilowitz_-_Gradual_Sunrise.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Mild_Wild/a_Queens_Lodge_b_Crooked_Straight/Mild_Wild_-_02_-_Crooked_Straight.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Aglow_Hollow/Proximate_Laws_Baba_Yaga_Booty_Calls/Aglow_Hollow_-_04_-_Dog_Soldier___Stand_Down.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Small_Tall_Order/B_Sides/Small_Tall_Order_-_02_-_My_Fault.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/yumenoma/Instant_0_in_the_Universe/yumenoma_-_02_-______-_who_built_the_moon__-.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Pistol_Jazz/Chic/Pistol_Jazz_-_Winter_Snow.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Ryan_Andersen/Never_Sleep_-_Indie_Rock/Ryan_Andersen_-_Well_Never_Sleep.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/The_Inventors/Counting_backwards/The_Inventors_-_09_-_Blood_Milk.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/HealthBeauty/It_was_almost_certainly_a_small_child/HealthBeauty_-_07_-_deathxmas.mp3'};

shrink = 5;
count = 1;
ytrain3 = zeros(5*(44100/shrink),length(train3urls));
for  k = 1:length(train3urls)
    [y,~] = webread(train3urls{k});
    Fs = 44100;
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    ytrain3(:,count) = y((Fs*15):(Fs*20-1),1);
    ytrain3(:,count+1) = y((Fs*30):(Fs*35-1),1);
    ytrain3(:,count+2) = y((Fs*50):(Fs*55-1),1);
    count = count + 3;
end
%%
train3spec = zeros(51,5*(44100/shrink),30);
for i = 1:size(ytrain3,2)
   train3spec(:,:,i) = specmaker(ytrain3(:,i),Fs); 
end
train3flat = specshaper(train3spec);
%%
features = 20;
[U,S,V,w,threshold1,threshold2,sortg1,sortg2,sortg3] = music_trainer(train3flat(:,1:30),train3flat(:,31:60),train3flat(:,61:90),features);
%%
p1 = plot(sortg1,zeros(30),'ob','Linewidth',2);
hold on
p2 = plot(sortg2,ones(30),'or','Linewidth',2);
p3 = plot(sortg3,2*ones(30),'og','Linewidth',2);
plot([threshold1,threshold1],[0,3],'k')
plot([threshold2,threshold2],[0,3],'k')
ylim([0 3])
title('Training Set Projections')
xlabel('Sorted Projections')
legend([p1(1) p2(1) p3(1)],'Mixed Funk Samples','Mixed Electronic Samples','Mixed Inde Samples')
set(gca,'Fontsize',16)

%% Test 3 
testurls = {'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Checkie_Brown/hey/Checkie_Brown_-_08_-_Hippie_Bulle_-Stoned_Funghi_CB_28.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/shane_brow/Live_at_KBOO_for_The_Monday_Sampler_11212016/shane_brow_-_01_-_Shane_Brown-Nov_2016-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Lobo_Loco/Diversity_of_Life/Lobo_Loco_-_02_-_Autumn_Morning_ID_1022.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/KieLoKaz/Under_Stars/KieLoKaz_-_01_-_End_of_Schwindel_ID_352.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/KieLoBot/Hounds_of_Darkmoor/KieLoBot_-_09_-_Seniorita_K_ID_28.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/The_Gays/THE_AGENDA/The_Gays_-_08_-_Wrong_.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/Ava_Luna/Services_EP/Ava_Luna_-_04_-_Eight_Nine_Wont_You_Be_Mine.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/KBOO/Sweet_N/Live_at_KBOO_for_Lighthouse_Lessons_3212018/Sweet_N_-_07_-_Sweet_N_Juicy-Irresistable-Mar_2018-LIVE.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Glad_Rags/Wonder_Under/Glad_Rags_-_08_-_Social_Kapital_Reprise.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Macchiato_Funky/Bugella_20-50/Macchiato_Funky_-_09_-_Ramona.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/White_Market_Podcast/Six_Umbrellas/Private_Ark/Six_Umbrellas_-_08_-_Stockholm.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/WFMU/Opra_Mort/Je_Suis_Parmi_Les_Cinq_Cents_Personnes_Que_Tu_Prfres_Au_Monde/Opra_Mort_-_01_-_La_Suite_Paris_01022010.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Synapsis/Goan_Psynapsia/Synapsis_-_05_-_Seven.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/C_C/Impendulo/C_C_-_02_-_TINTINABUL.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/chZ_/The_Clones_of_Dr_Funkenstein/chZ__-_07_-_Trash-A-Go-Go.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Spiedkiks/Little_Smartphone_People/Spiedkiks_-_14_-_Helicopter.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/tozo/albatross/tozo_-_14_-_wobble.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/blocSonic/Flex_Vector/The_Killbots_Are_Coming/Flex_Vector_-_The_Killbots_Are_Coming.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Cock_Rock_Disco/Debmaster/Crevin/Debmaster_-_16_-_Retourn_Acrobatique.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/WFMU/Smersh/Smersh_Library_Sampler/Smersh_-_15_-_My_God_Those_Legs.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Scott_Holmes/Inspiring__Upbeat_Music/Scott_Holmes_-_01_-_Storybook.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Mild_W/a_Queens_Lodge_b_Crooked_Straight/Mild_W_-_01_-_Queens_Lodge.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/B_Sides/01_-_Until_We_Get_By.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/yumenoma/Instant_0_in_the_Universe/yumenoma_-_01_-______-_instant_0_in_the_universe_-.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Pistol_Jazz/Chic/Pistol_Jazz_-_Swallow.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/REW/Swimming_with_Kawatora/REW_-_01_-_Swimming_With_Kawatora.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Ryan_Andersen/Never_Sleep_-_Indie_Rock/Ryan_Andersen_-_SLOW_FUZZ.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/The_Inventors/Counting_backwards/The_Inventors_-_12_-_Brooklyn.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Ziklibrenbib/HealthBeauty/It_was_almost_certainly_a_small_child/HealthBeauty_-_08_-_the_pig__the_worm_devastate_the_overground.mp3'
    'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/eddy/2_Damn_Loud/eddy_-_03_-_All_The_Way_Up.mp3'};
count = 1;
ytest = zeros(5*(44100/shrink),length(testurls));
for  k = 1:length(testurls)
    [y,~] = webread(testurls{k});
    Fs = 44100;
    y = resample(y,1,shrink);
    Fs = Fs/shrink;
    ytest(:,count) = y((Fs*15):(Fs*20-1),1);
    ytest(:,count+1) = y((Fs*30):(Fs*35-1),1);
    ytest(:,count+2) = y((Fs*50):(Fs*55-1),1);
    count = count + 3;
end

%%
testspec = zeros(51,5*(44100/shrink),30);
for i = 1:size(ytest,2)
   testspec(:,:,i) = specmaker(ytest(:,i),Fs); 
end
testflat = specshaper(testspec);

Testmat = U'*testflat;
pval = w'*Testmat;
ansvec = zeros(1,90);
for i = 1:length(pval)
    if pval(i)<threshold1
       ansvec(i) = 1; %tech
    elseif pval(i)>threshold2
        ansvec(i) = 2; %funk
    else
        ansvec(i) = 3; %inde
    end
end
keyvec = [2*ones(1,30) ones(1,30) 3*ones(1,30)];
ernum = key(ansvec,keyvec);
percentcorrect3 = (1-sum(ernum)/90)*100
%%
for i = 1:length(ernum)
    hold on
    if ernum(i) == 1
        pwrong = plot(pval(i),ansvec(i)-1,'ro');
    else
        pright = plot(pval(i),ansvec(i)-1,'go');
    end
end
% plot(pval,ernum,'ko')
plot([threshold1,threshold1],[0,3],'k')
plot([threshold2,threshold2],[0,3],'k')
legend([pwrong(1) pright(1)],'Wrong Sorting','Right Sorting')
set(gca,'Fontsize',16)
xlim([-2*10^4 10^4])
title('Test Set Projections')
xlabel('Sorted Projections')
%% Functions
function [Sgt_spec] = specmaker(yhip,Fs)
    a = 0.1;
    tslide = 0:0.1:5;
    thip = (1:length(yhip))/Fs;
    Sgt_spec = zeros(length(tslide),length(yhip));
    for j=1:length(tslide)
        g=exp(-a*(thip-tslide(j)).^2); 
        Sg=g.*yhip(:,1)';
        Sgt=fft(Sg);
%         [~,tin]=max(abs(Sgt));
%         Sgtf = Sgt.*exp(-0.01*(k-k(tin)).^2);
        Sgt_spec(j,:) = fftshift(abs(Sgt));
    end
end

function [Spec_data] = specshaper(Sgt_spec)
    [m,n,p] = size(Sgt_spec);
    Spec_data = zeros(m*n,p);
    for k = 1:p
       Spec_data(:,k) = reshape(Sgt_spec(:,:,k),m*n,1);
    end
end

function [ernum] = key(ansvec,keyvec)
    ernum = zeros(1,90);
    for k = 1:length(ansvec)
        if ansvec(k) == keyvec(k)
            ernum(k) = 0;
        else 
            ernum(k) = 1;
        end
    end
end

function [U,S,V,w,threshold1,threshold2,sortg1,sortg2,sortg3] = music_trainer(genre1,genre2,genre3,feature)
    n1 = size(genre1,2); 
    n2 = size(genre2,2);
    n3 = size(genre3,2);
    [U,S,V] = svd([genre1 genre2 genre3],'econ');
    
    music = S*V'; % projection onto principal components
    U = U(:,1:feature);
    prog1 = music(1:feature,1:n1);
    prog2 = music(1:feature,n1+1:2*n1);
    prog3 = music(1:feature,2*n1+1:3*n1);
    
    m1 = mean(prog1,2);
    m2 = mean(prog2,2);
    m3 = mean(prog3,2);
    m = (m1+m2+m3)/3;

    Sw = 0; % within class variances
    for k=1:n1
        Sw = Sw + (prog1(:,k)-m1)*(prog1(:,k)-m1)';
    end
    for k=1:n2
        Sw = Sw + (prog2(:,k)-m2)*(prog2(:,k)-m2)';
    end
    for k=1:n3
        Sw = Sw + (prog3(:,k)-m3)*(prog3(:,k)-m3)';
    end
    
    sb1 = (m1-m)*(m1-m)';
    sb2 = (m2-m)*(m2-m)';
    sb3 = (m3-m)*(m3-m)'; % between class 
    Sb = (sb1+sb2+sb3)/3;
    
    [V2,D] = eig(Sb,Sw); % linear discriminant analysis
    [~,ind] = max(abs(diag(D)));
    w = V2(:,ind); w = w/norm(w,2);
    
    vg1 = w'*prog1; 
    vg2 = w'*prog2;
    vg3 = w'*prog3;
    
    sortg1 = sort(vg1);
    sortg2 = sort(vg2);
    sortg3 = sort(vg3);
    
    threshold1 = mean(sortg2);
    threshold2 = mean(sortg3);
end