setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");
blp <- read.csv('BLP_preprocessed.csv', as.is=F);

# PILOT 4
blp_4 <- subset(blp, sbj_ID=='60d87fdab51e54fe4863f97f'|sbj_ID=='5f3161410f87706425490ae1'|sbj_ID=='60ba2011cd8052508d401296'|sbj_ID=='60b55a6d44e17d6f0b810cdd'|sbj_ID=='614060a52d7c64c27ef9887c'|sbj_ID=='5f4cc4ea00dba58ecd5a98a4'|sbj_ID=='5fb7b8880045d6396a86c803'|sbj_ID=='5ee7b7c9eef92207297a0ad4'|sbj_ID=='6175a0a52e748285b3476b27'|sbj_ID=='615c43b800752a4f3d0fd1f0'|sbj_ID=='5d97c38dce449e001244dc15'|sbj_ID=='60c9c6e1728092717b93abde'|sbj_ID=='5feb64b3341f42bb63200e36'|sbj_ID=='5cb4adc019ee7300189e8547'|sbj_ID=='5e8783b0fde5153fbd9dca43'|sbj_ID=='5cf14e1eb4397d0001f94e20'|sbj_ID=='5caca6b4a9acb200011a6547'|sbj_ID=='5ed54d02957bee0c0de36cac'|sbj_ID=='5e823b35726b2a9508db127c'|sbj_ID=='61158a5c1d8390415ff117a8'|sbj_ID=='612d5712d75b6c46b4cefc63'|sbj_ID=='5f11ccbc1a1a2c08b4a99efb'|sbj_ID=='608edc13472b2dbc27b369fa'|sbj_ID=='60ddf71e95896d2595f0e1a5'|sbj_ID=='608abc6251feb3ddc3b2e01d'|sbj_ID=='605c9355001a5eb6d51e657d'|sbj_ID=='60fd703ecd62eb39eb07c328'|sbj_ID=='5fb3f38909fc360164f7c98d'|sbj_ID=='6048158f62550615002408af'|sbj_ID=='6161f43ddd46e845e7b3fab8'|sbj_ID=='5c5e04ca6539fe00016e1afa'|sbj_ID=='60f1846c851ee5a978a0e015'|sbj_ID=='60a45e33f404ba8cb7a19cfe'|sbj_ID=='5e99d95e0f50aa04266ad4ad'|sbj_ID=='5e80c7d61a07dd7b0d8f0111'|sbj_ID=='5ec806f532fe7d2afa2e315b'|sbj_ID=='609568823ff056b77e565445'|sbj_ID=='613d091096ca434d703f77c5'|sbj_ID=='5e82e99b37d333a1474dda93'|sbj_ID=='59aaf4b1321f870001d16f6c');
blp_4 <- subset(blp_4, select = -c(AoEaseL1, AoEaseL2, AoEaseL3, AoEaseL4, yearsEduL1, yearsEduL2, yearsEduL3, yearsEduL4, yearsCountryL1, yearsCountryL2, yearsCountryL3, yearsCountryL4, yearsFamilyL1, yearsFamilyL2, yearsFamilyL3, yearsFamilyL4, yearsWorkL1, yearsWorkL2, yearsWorkL3, yearsWorkL4, PercFriendsL1, PercFriendsL2, PercFriendsL3, PercFriendsL4, PercFamilyL1, PercFamilyL2, PercFamilyL3, PercFamilyL4, PercWorkL1, PercWorkL2, PercWorkL3, PercWorkL4, PercSelfL1, PercSelfL2, PercSelfL3, PercSelfL4, PercCountL1, PercCountL2, PercCountL3, PercCountL4, ProfSpeakL1, ProfSpeakL2, ProfSpeakL3, ProfSpeakL4, ProfUnderstandL1, ProfUnderstandL2, ProfUnderstandL3, ProfUnderstandL4, ProfReadL1, ProfReadL2, ProfReadL3, ProfReadL4, ProfWriteL1, ProfWriteL2, ProfWriteL3, ProfWriteL4, AttSelfL1, AttSelfL2, AttSelfL3, AttSelfL4, AttCultureL1, AttCultureL2, AttCultureL3, AttCultureL4, AttNativeLevelL1, AttNativeLevelL2, AttNativeLevelL3, AttNativeLevelL4, AttMothertongueL1, AttMothertongueL2, AttMothertongueL3, AttMothertongueL4));

head(blp_4); 
summary(blp_4);

png('corrPlot.png', width=1000, height=1000);
corrplot::corrplot(cor(blp_4[,c(92:111)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
png('corrPlotClustering.png', width=1000, height=1000);
corrplot::corrplot(cor(blp_4[,c(92:111)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

par(mfrow=c(2,2));
hist(blp_4$HistoryL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_4$UseL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_4$HistoryL2Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_4$UseL2Score, xlim=c(0,60), breaks=seq(0,60,2));
par(mfrow=c(2,1));

Hmisc::varclus(blp_4[,92:111]); # Error: x matrix must be numeric

pca_varimax_4 <- psych::principal(blp_4[,92:111], nfactors=16, rotate='varimax');
pca_varimax_4; # to view PCA
blp_4 <- cbind(blp_4, pca_varimax_4$scores[,c('RC1','RC3','RC5')]);
names(blp_4)[112:114] <- c('RC1_all_L4','RC5_all_L3','RC2_use_foreignlangs');
summary(ppt_in_pca_space_4);
cor(ppt_in_pca_space_4);

source("C:/Users/annal/OneDrive/Documents/Me/SISSA/BASL/BASL analysis/FunnyPeopleFunction_RodriguezLaioClustering.R");
funnyPeople(scores=as.vector(ppt_in_pca_space_4), sbjId=rep(1:30,5), itemId=rep(1:5, each=30), outForMatlabFunction=F)

# PILOT 5
blp_5 <- subset(blp, sbj_ID=='58f50400f4ce600001016db5'|sbj_ID=='5b715800b31d480001eda165'|sbj_ID=='5be84b9a40b06b0001370c9f'|sbj_ID=='5c5baaec192d350001d5c8e4'|sbj_ID=='5ed02ffb8090240f93ab74ad'|sbj_ID=='5ee25b060f0ccf35b31431af'|sbj_ID=='5eff6828a958150135ede8a4'|sbj_ID=='5f5282f98bb76c54f2c603a7'|sbj_ID=='5f60713e595007000a8e1da7'|sbj_ID=='5fbbdd11ff4568d9cc3536fb'|sbj_ID=='5fc65d9cc4575b0b47981de8'|sbj_ID=='5fd0c81fc79aef1882cbee94'|sbj_ID=='5fdf808af53c7a7e9199b430'|sbj_ID=='603e0fefed5529d4b14e3546'|sbj_ID=='605de3af48d7a575adb95b09'|sbj_ID=='60b87f3ca1dbf6bb340c9bb0'|sbj_ID=='60bb62cbaccd206e3502516e'|sbj_ID=='60d8873c18e520a7d5ae555f'|sbj_ID=='60fd0845a9a6b47d7adfea22'|sbj_ID=='60fd913b3fd4aeea9829cff3'|sbj_ID=='61086c2bfda98ba5d75b9db4'|sbj_ID=='611d33d7cc16fdd812b1a4c4'|sbj_ID=='6127f94d2af664941ae3bf4f'|sbj_ID=='612b5ed8c3b1fcb978aad0a8'|sbj_ID=='6136aa846e80ebd7daf6e148'|sbj_ID=='614e230ff8700b32ea648508'|sbj_ID=='61533ead92c280c34cc22482'|sbj_ID=='6172a1d4cffa5162140cc8c2'|sbj_ID=='64526929d8f9b780b29d4d8d'|sbj_ID=='648b962b8fdb1fa686213ac1');
blp_5 <- subset(blp_5, select = -c(AoAgioL1, AoAgioL2, AoAgioL3, AoAgioL4, anniInstrL1, anniInstrL2, anniInstrL3, anniInstrL4, anniPaeseL1, anniPaeseL2, anniPaeseL3, anniPaeseL4, anniFamigliaL1, anniFamigliaL2, anniFamigliaL3, anniFamigliaL4, anniLavoroL1, anniLavoroL2, anniLavoroL3, anniLavoroL4, PercAmiciL1, PercAmiciL2, PercAmiciL3, PercAmiciL4, PercFamigliaL1, PercFamigliaL2, PercFamigliaL3, PercFamigliaL4, PercLavoroL1, PercLavoroL2, PercLavoroL3, PercLavoroL4, PercStessoL1, PercStessoL2, PercStessoL3, PercStessoL4, PercCalcoliL1, PercCalcoliL2, PercCalcoliL3, PercCalcoliL4, ProfParlaL1, ProfParlaL2, ProfParlaL3, ProfParlaL4, ProfCapisceL1, ProfCapisceL2, ProfCapisceL3, ProfCapisceL4, ProfLeggeL1, ProfLeggeL2, ProfLeggeL3, ProfLeggeL4, ProfScriveL1, ProfScriveL2, ProfScriveL3, ProfScriveL4, AttMiStessoL1, AttMiStessoL2, AttMiStessoL3, AttMiStessoL4, AttCulturaL1, AttCulturaL2, AttCulturaL3, AttCulturaL4, AttLivNativoL1, AttLivNativoL2, AttLivNativoL3, AttLivNativoL4, AttMadrelinguaL1, AttMadrelinguaL2, AttMadrelinguaL3, AttMadrelinguaL4));

head(blp_5); 
summary(blp_5);

png('corrPlot.png', width=1000, height=1000);
corrplot::corrplot(cor(blp_5[,c(20:39)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
png('corrPlotClustering.png', width=1000, height=1000);
corrplot::corrplot(cor(blp_5[,c(20:39)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

par(mfrow=c(2,2));
hist(blp_5$HistoryL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_5$UseL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_5$HistoryL2Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_5$UseL2Score, xlim=c(0,60), breaks=seq(0,60,2));
par(mfrow=c(2,1));

Hmisc::varclus(blp_5[,20:39]); # Error: x matrix must be numeric

pca_varimax_5 <- psych::principal(blp_5[,20:35], nfactors=16, rotate='varimax');
blp_5 <- cbind(blp_5, pca_varimax_5$scores[,c('RC1','RC5','RC2','RC4','RC7')]);
names(blp_5)[112:116] <- c('RC1_overall_L3L4','RC5_history_L3L4','RC2_use_L1L2','RC4_proficiency_L2','RC7_attitude_L4');
summary(ppt_in_pca_space_5);
cor(ppt_in_pca_space_5);

source("C:/Users/annal/OneDrive/Documents/Me/SISSA/BASL/BASL analysis/FunnyPeopleFunction_RodriguezLaioClustering.R");
funnyPeople(scores=as.vector(ppt_in_pca_space_5), sbjId=rep(1:30,5), itemId=rep(1:5, each=30), outForMatlabFunction=F)

# PILOTS 4 & 5
blp_45 <- subset(blp, sbj_ID=='60d87fdab51e54fe4863f97f'|sbj_ID=='5f3161410f87706425490ae1'|sbj_ID=='60ba2011cd8052508d401296'|sbj_ID=='60b55a6d44e17d6f0b810cdd'|sbj_ID=='614060a52d7c64c27ef9887c'|sbj_ID=='5f4cc4ea00dba58ecd5a98a4'|sbj_ID=='5fb7b8880045d6396a86c803'|sbj_ID=='5ee7b7c9eef92207297a0ad4'|sbj_ID=='6175a0a52e748285b3476b27'|sbj_ID=='615c43b800752a4f3d0fd1f0'|sbj_ID=='5d97c38dce449e001244dc15'|sbj_ID=='60c9c6e1728092717b93abde'|sbj_ID=='5feb64b3341f42bb63200e36'|sbj_ID=='5cb4adc019ee7300189e8547'|sbj_ID=='5e8783b0fde5153fbd9dca43'|sbj_ID=='5cf14e1eb4397d0001f94e20'|sbj_ID=='5caca6b4a9acb200011a6547'|sbj_ID=='5ed54d02957bee0c0de36cac'|sbj_ID=='5e823b35726b2a9508db127c'|sbj_ID=='61158a5c1d8390415ff117a8'|sbj_ID=='612d5712d75b6c46b4cefc63'|sbj_ID=='5f11ccbc1a1a2c08b4a99efb'|sbj_ID=='608edc13472b2dbc27b369fa'|sbj_ID=='60ddf71e95896d2595f0e1a5'|sbj_ID=='608abc6251feb3ddc3b2e01d'|sbj_ID=='605c9355001a5eb6d51e657d'|sbj_ID=='60fd703ecd62eb39eb07c328'|sbj_ID=='5fb3f38909fc360164f7c98d'|sbj_ID=='6048158f62550615002408af'|sbj_ID=='6161f43ddd46e845e7b3fab8'|sbj_ID=='5c5e04ca6539fe00016e1afa'|sbj_ID=='60f1846c851ee5a978a0e015'|sbj_ID=='60a45e33f404ba8cb7a19cfe'|sbj_ID=='5e99d95e0f50aa04266ad4ad'|sbj_ID=='5e80c7d61a07dd7b0d8f0111'|sbj_ID=='5ec806f532fe7d2afa2e315b'|sbj_ID=='609568823ff056b77e565445'|sbj_ID=='613d091096ca434d703f77c5'|sbj_ID=='5e82e99b37d333a1474dda93'|sbj_ID=='59aaf4b1321f870001d16f6c'|sbj_ID=='58f50400f4ce600001016db5'|sbj_ID=='5b715800b31d480001eda165'|sbj_ID=='5be84b9a40b06b0001370c9f'|sbj_ID=='5c5baaec192d350001d5c8e4'|sbj_ID=='5ed02ffb8090240f93ab74ad'|sbj_ID=='5ee25b060f0ccf35b31431af'|sbj_ID=='5eff6828a958150135ede8a4'|sbj_ID=='5f5282f98bb76c54f2c603a7'|sbj_ID=='5f60713e595007000a8e1da7'|sbj_ID=='5fbbdd11ff4568d9cc3536fb'|sbj_ID=='5fc65d9cc4575b0b47981de8'|sbj_ID=='5fd0c81fc79aef1882cbee94'|sbj_ID=='5fdf808af53c7a7e9199b430'|sbj_ID=='603e0fefed5529d4b14e3546'|sbj_ID=='605de3af48d7a575adb95b09'|sbj_ID=='60b87f3ca1dbf6bb340c9bb0'|sbj_ID=='60bb62cbaccd206e3502516e'|sbj_ID=='60d8873c18e520a7d5ae555f'|sbj_ID=='60fd0845a9a6b47d7adfea22'|sbj_ID=='60fd913b3fd4aeea9829cff3'|sbj_ID=='61086c2bfda98ba5d75b9db4'|sbj_ID=='611d33d7cc16fdd812b1a4c4'|sbj_ID=='6127f94d2af664941ae3bf4f'|sbj_ID=='612b5ed8c3b1fcb978aad0a8'|sbj_ID=='6136aa846e80ebd7daf6e148'|sbj_ID=='614e230ff8700b32ea648508'|sbj_ID=='61533ead92c280c34cc22482'|sbj_ID=='6172a1d4cffa5162140cc8c2'|sbj_ID=='64526929d8f9b780b29d4d8d'|sbj_ID=='648b962b8fdb1fa686213ac1');

head(blp_45); 
summary(blp_45);

png('corrPlot.png', width=1000, height=1000);
corrplot::corrplot(cor(blp_45[,c(92:111)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
png('corrPlotClustering.png', width=1000, height=1000);
corrplot::corrplot(cor(blp_45[,c(92:111)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

par(mfrow=c(2,2));
hist(blp_45$HistoryL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_45$UseL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_45$HistoryL2Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(blp_45$UseL2Score, xlim=c(0,60), breaks=seq(0,60,2));
par(mfrow=c(2,1));

Hmisc::varclus(blp_45[,92:111]); # Error: x matrix must be numeric

pca_varimax_45 <- psych::principal(blp_45[,92:111], nfactors=16, rotate='varimax');
pca_varimax_45; # show PCA
blp_45 <- cbind(blp_45, pca_varimax_45$scores[,c('RC1','RC3','RC2','RC7','RC11','RC6')]);
names(blp_45)[184:189] <- c('RC1_all_L3','RC3_all_L4','RC2_use_L1L2','RC7_use_foreignlang','RC11_earlyforeignlangacqu','RC6_earlyforeignlangacqu(2)');
summary(ppt_in_pca_space_45);
cor(ppt_in_pca_space_45)