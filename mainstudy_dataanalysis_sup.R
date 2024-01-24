setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");

############
# OUTLIER? #
############
# looking at data from participant 5aa787c66219a30001c765f8 (bad response to BLP gender question)
data_testing_exclude <- data_all_testing[data_all_testing$sbj_ID == '5aa787c66219a30001c765f8',];
data_testing_exclude$sbj_ID <- as.factor(data_testing_exclude$sbj_ID);
data_testing_exclude$task <- as.factor(data_testing_exclude$task);
data_testing_exclude$item <- as.factor(data_testing_exclude$item);
data_testing_exclude$testing_condition <- as.factor(data_testing_exclude$testing_condition);
data_testing_exclude$correct <- as.logical(data_testing_exclude$correct);
summary(data_testing_exclude);
data_testing_exclude_2M <- aggregate(data_testing_exclude$correct[data_testing_exclude$testing_condition=='2M'], list(data_testing_exclude$sbj_ID[data_testing_exclude$testing_condition=='2M']), FUN=mean, na.rm=TRUE);
# testing data looks okay: 56% accuracy
# familiarity data: only 36% accuracy!!


###########
# ENTROPY #
###########
# multilingual balance: entropy - Gullifer & Titone (2018)
library(languageEntropy);
for (i in 1:193) { # transfrom 0-10 scores into 0-1
  temp <- unlist(scores_list[i]);
  total <- sum(temp)
  for (j in 1:4) {
    temp[j] <- temp[j]/total
  }
  scores_list[i] <- list(temp)
}
entropies_gul <- data.frame(t(sapply(scores_list,c)))
colnames(entropies_gul) <- c('L1Score','L2Score','L3Score','L4Score');
sbj_ID <- seq.int(193);
entropies_gul <- data.frame(sbj_ID, entropies_gul);
entropies_gul$L2Score[entropies_gul$L2Score==0] <- NA;
entropies_gul$L3Score[entropies_gul$L3Score==0] <- NA;
entropies_gul$L4Score[entropies_gul$L4Score==0] <- NA;
entropy_gul <- languageEntropy(entropies_gul, sbj_ID, L1Score, L2Score, L3Score, L4Score, 
                               contextName = "All");
data_BLP$lang_ent_gul <- entropy_gul$All.entropy;
cor(unlist(data_BLP$lang_ent),unlist(data_BLP$lang_ent_gul),method="pearson"); # r = 1 so same function


#########################
# BLP VARIABLE VARIANCE #
#########################
var(data_BLP$HistoryL1Score); # var = 36.65
var(data_BLP$HistoryL2Score); # var = 147.63
var(data_BLP$HistoryL3Score); # var = 104.32
var(data_BLP$HistoryL4Score); # var = 60.74
var(data_BLP$UseL1Score); # var = 115.14
var(data_BLP$UseL2Score); # var = 93.08
var(data_BLP$UseL3Score); # var = 33.70
var(data_BLP$UseL4Score); # var = 5.76
var(data_BLP$ProficiencyL1Score); # var = 10.31
var(data_BLP$ProficiencyL2Score); # var = 109.57
var(data_BLP$ProficiencyL3Score); # var = 299.17
var(data_BLP$ProficiencyL4Score); # var = 164.59
var(data_BLP$AttitudeL1Score); # var = 76.82
var(data_BLP$AttitudeL2Score); # var = 173.52
var(data_BLP$AttitudeL3Score); # var = 299.25
var(data_BLP$AttitudeL4Score); # var = 155.48
var(data_BLP$L1Score); # var = 369.41
var(data_BLP$L2Score); # var = 1167.72
var(data_BLP$L3Score); # var = 2066.13
var(data_BLP$L4Score); # var = 980.75


#################################
# GROUPED MULTILINGUAL ANALYSIS #
#################################
# count number of participants in each category
#monolinguals: n=4
data_BLP_monos <- subset(data_BLP[data_BLP$L2Score==0,]);

#bilinguals: n=80
data_BLP_bis <- subset(data_BLP[data_BLP$L2Score!=0&data_BLP$L3Score==0,]);

#trilinguals: n=58
data_BLP_tris <- subset(data_BLP[data_BLP$L2Score!=0&data_BLP$L3Score!=0&data_BLP$L4Score==0,]);

#quadrilinguals: n=51
data_BLP_quadris <- subset(data_BLP[data_BLP$L2Score!=0&data_BLP$L3Score!=0&data_BLP$L4Score!=0,]);

# monolinguals
#without language dominance scores
data_BLP_monos <- data_BLP_monos[, !is.na(colSums(data_BLP_monos != 0)) & colSums(data_BLP_monos != 0) > 0];
data_BLP_monos <- subset(data_BLP_monos, select = -c(AttentionL2,AttentionL3,AttentionL4));
pca_varimax3 <- psych::principal(data_BLP_monos[,13:16], nfactors=5, rotate='varimax');
#error: NAs in the correlation matrix?
data_BLP_monos <- cbind(data_BLP, pca_varimax3$scores[,c('RC1','RC9','RC2','RC6')]);
names(data_BLP_monos)[116:119] <- c('RC1_L3','RC9_L4','RC2_use_L1vsL2','RC6_use_L4');

# bilinguals
#without language dominance scores
data_BLP_bis <- data_BLP_bis[, !is.na(colSums(data_BLP_bis != 0)) & colSums(data_BLP_bis != 0) > 0];
data_BLP_bis <- subset(data_BLP_bis, select = -c(AttentionL3,AttentionL4));
pca_varimax4 <- psych::principal(data_BLP_bis[,15:22], nfactors=8, rotate='varimax');
data_BLP_bis <- cbind(data_BLP_bis, pca_varimax4$scores[,c('RC1','RC7','RC6')]);
names(data_BLP_bis)[66:68] <- c('RC1_use_L1vsL2','RC7_prof_L2','RC6_hist_L2');

# trilinguals
#without language dominance scores
data_BLP_tris <- data_BLP_tris[, !is.na(colSums(data_BLP_tris != 0)) & colSums(data_BLP_tris != 0) > 0];
data_BLP_tris <- subset(data_BLP_tris, select = -c(AttentionL4));
pca_varimax5 <- psych::principal(data_BLP_tris[,15:26], nfactors=12, rotate='varimax');
data_BLP_tris <- cbind(data_BLP_tris, pca_varimax5$scores[,c('RC1','RC3','RC10','RC6','RC8','RC9')]);
names(data_BLP_tris)[61:66] <- c('RC1_use_L1vsL2','RC3_prof_L2','RC10_L3','RC6_hist_L2','RC8_use_L3','RC9_hist_L3');

# quadrilinguals
#without language dominance scores
data_BLP_quadris <- data_BLP_quadris[, !is.na(colSums(data_BLP_quadris != 0)) & colSums(data_BLP_quadris != 0) > 0];
pca_varimax6 <- psych::principal(data_BLP_quadris[,17:32], nfactors=16, rotate='varimax');
data_BLP_quadris <- cbind(data_BLP_quadris, pca_varimax6$scores[,c('RC15','RC2','RC12','RC11','RC3','RC4','RC10','RC1','RC13')]);
names(data_BLP_quadris)[79:87] <- c('RC15_use_L1vsL2','RC2_prof_morethanbi','RC12_L4','RC11_use_L4','RC3_prof_L2','RC4_use_L3','RC10_att_L3','RC1_hist_morethanmono','RC13_hist_L2');

# adding testing scores and BLP metrics together
data_BLP_extracted_monos <- subset(data_BLP_monos, select=c(sbj_ID,HistoryL1Score,UseL1Score,ProficiencyL1Score,AttitudeL1Score,L1Score,lang_var,multi_exp));
data_BLP_testing_monos <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_monos) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_monos);

data_BLP_extracted_bis <- subset(data_BLP_bis, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,UseL1Score,UseL2Score,ProficiencyL1Score,ProficiencyL2Score,AttitudeL1Score,AttitudeL2Score,L1Score,L2Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC1_use_L1vsL2,RC7_prof_L2,RC6_hist_L2));
data_BLP_testing_bis <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_bis) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_bis);

data_BLP_extracted_tris <- subset(data_BLP_tris, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,HistoryL3Score,UseL1Score,UseL2Score,UseL3Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,L1Score,L2Score,L3Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC1_use_L1vsL2,RC3_prof_L2,RC10_L3,RC6_hist_L2,RC8_use_L3,RC9_hist_L3));
data_BLP_testing_tris <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_tris) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_tris);

data_BLP_extracted_quadris <- subset(data_BLP_quadris, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC15_use_L1vsL2,RC2_prof_morethanbi,RC12_L4,RC11_use_L4,RC3_prof_L2,RC4_use_L3,RC10_att_L3,RC1_hist_morethanmono,RC13_hist_L2));
data_BLP_testing_quadris <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_quadris) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_quadris);

# correlation plot of testing scores and BLP metrics
png('corrPlot4_bis.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_bis[,c(2:21)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlot5_tris.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_tris[,c(2:29)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlot6_quadris.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_quadris[,c(2:37)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# calculating exact correlations of interesting correlations found in corrplots
cor(data_BLP_testing_tris$HistoryL2Score, data_BLP_testing_tris$x_2_hits); # r = 0.38
cor(data_BLP_testing_tris$HistoryL2Score, data_BLP_testing_tris$x_2_rejs); # r = -0.50
cor(data_BLP_testing_tris$HistoryL3Score, data_BLP_testing_tris$x_2_hits); # r = 0.37
cor(data_BLP_testing_tris$HistoryL3Score, data_BLP_testing_tris$x_2_rejs); # r = -0.39
cor(data_BLP_testing_tris$UseL1Score, data_BLP_testing_tris$x_2_hits); # r = -0.23
cor(data_BLP_testing_tris$UseL1Score, data_BLP_testing_tris$x_2_rejs); # r = 0.18
cor(data_BLP_testing_tris$ProficiencyL2Score, data_BLP_testing_tris$x_2_rejs); # r = -0.21
cor(data_BLP_testing_tris$ProficiencyL3Score, data_BLP_testing_tris$x_2_rejs); # r = -0.29
cor(data_BLP_testing_tris$L2Score, data_BLP_testing_tris$x_2_hits); # r = 0.28
cor(data_BLP_testing_tris$L2Score, data_BLP_testing_tris$x_2_rejs); # r = -0.29
cor(data_BLP_testing_tris$L3Score, data_BLP_testing_tris$x_2_rejs); # r = -0.29
cor(data_BLP_testing_tris$lang_ent, data_BLP_testing_tris$x_2); # r = -0.25
cor(data_BLP_testing_tris$lang_ent, data_BLP_testing_tris$x_2_rejs); # r = -0.38
cor(data_BLP_testing_tris$L1_L2_diff, data_BLP_testing_tris$x_2_hits); # r = -0.29
cor(data_BLP_testing_tris$L1_L2_diff, data_BLP_testing_tris$x_2_rejs); # r = 0.28
cor(data_BLP_testing_tris$RC3_prof_L2, data_BLP_testing_tris$x_2_rejs); # r = -0.24
cor(data_BLP_testing_tris$RC6_hist_L2, data_BLP_testing_tris$x_2_hits); # r = 0.32
cor(data_BLP_testing_tris$RC6_hist_L2, data_BLP_testing_tris$x_2_rejs); # r = -0.47
cor(data_BLP_testing_tris$RC9_hist_L3, data_BLP_testing_tris$x_2_hits); # r = 0.29
cor(data_BLP_testing_tris$RC9_hist_L3, data_BLP_testing_tris$x_2_rejs); # r = -0.18

cor(data_BLP_testing_quadris$HistoryL1Score, data_BLP_testing_quadris$x_2); # r = -0.20
cor(data_BLP_testing_quadris$HistoryL2Score, data_BLP_testing_quadris$x_2); # r = 0.20
cor(data_BLP_testing_quadris$HistoryL2Score, data_BLP_testing_quadris$x_2_hits); # r = 0.21
cor(data_BLP_testing_quadris$HistoryL3Score, data_BLP_testing_quadris$x_2); # r = 0.20
cor(data_BLP_testing_quadris$HistoryL3Score, data_BLP_testing_quadris$x_2_hits); # r = 0.17
cor(data_BLP_testing_quadris$HistoryL4Score, data_BLP_testing_quadris$x_2); # r = 0.34
cor(data_BLP_testing_quadris$HistoryL4Score, data_BLP_testing_quadris$x_2_rejs); # r = 0.31
cor(data_BLP_testing_quadris$UseL2Score, data_BLP_testing_quadris$x_2_hits); # r = 0.30
cor(data_BLP_testing_quadris$UseL2Score, data_BLP_testing_quadris$x_2_rejs); # r = -0.31
cor(data_BLP_testing_quadris$UseL4Score, data_BLP_testing_quadris$x_2_hits); # r = -0.38
cor(data_BLP_testing_quadris$UseL4Score, data_BLP_testing_quadris$x_2_rejs); # r = 0.43
cor(data_BLP_testing_quadris$ProficiencyL2Score, data_BLP_testing_quadris$x_2); # r = -0.48
cor(data_BLP_testing_quadris$ProficiencyL2Score, data_BLP_testing_quadris$x_2_rejs); # r = -0.32
cor(data_BLP_testing_quadris$ProficiencyL4Score, data_BLP_testing_quadris$x_2); # r = 0.20
cor(data_BLP_testing_quadris$ProficiencyL4Score, data_BLP_testing_quadris$x_2_rejs); # r = 0.24
cor(data_BLP_testing_quadris$AttitudeL2Score, data_BLP_testing_quadris$x_2_rejs); # r = -0.22
cor(data_BLP_testing_quadris$L2Score, data_BLP_testing_quadris$x_2_hits); # r = 0.25
cor(data_BLP_testing_quadris$L2Score, data_BLP_testing_quadris$x_2_rejs); # r = -0.32
cor(data_BLP_testing_quadris$L4Score, data_BLP_testing_quadris$x_2_hits); # r = -0.19
cor(data_BLP_testing_quadris$L4Score, data_BLP_testing_quadris$x_2_rejs); # r = 0.32
cor(data_BLP_testing_quadris$lang_var, data_BLP_testing_quadris$x_2); # r = -0.24
cor(data_BLP_testing_quadris$lang_ent, data_BLP_testing_quadris$x_2); # r = 0.24
cor(data_BLP_testing_quadris$L1_L2_diff, data_BLP_testing_quadris$x_2_hits); # r = -0.22
cor(data_BLP_testing_quadris$L1_L2_diff, data_BLP_testing_quadris$x_2_rejs); # r = 0.23
cor(data_BLP_testing_quadris$RC15_use_L1vsL2, data_BLP_testing_quadris$x_2_hits); # r = 0.23
cor(data_BLP_testing_quadris$RC15_use_L1vsL2, data_BLP_testing_quadris$x_2_rejs); # r = -0.25
cor(data_BLP_testing_quadris$RC12_L4, data_BLP_testing_quadris$x_2); # r = 0.24
cor(data_BLP_testing_quadris$RC12_L4, data_BLP_testing_quadris$x_2_rejs); # r = 0.21
cor(data_BLP_testing_quadris$RC11_use_L4, data_BLP_testing_quadris$x_2_hits); # r = -0.41
cor(data_BLP_testing_quadris$RC11_use_L4, data_BLP_testing_quadris$x_2_rejs); # r = 0.42
cor(data_BLP_testing_quadris$RC3_prof_L2, data_BLP_testing_quadris$x_2); # r = -0.49
cor(data_BLP_testing_quadris$RC3_prof_L2, data_BLP_testing_quadris$x_2_rejs); # r = -0.26
cor(data_BLP_testing_quadris$RC13_hist_L2, data_BLP_testing_quadris$x_2); # r = 0.20
cor(data_BLP_testing_quadris$RC13_hist_L2, data_BLP_testing_quadris$x_2_hits); # r = 0.17

# group boxplot
collapsed_testing_monos <- subset(data_BLP_testing_monos, select=c(sbj_ID,x_2,x_2_hits,x_2_rejs));
collapsed_testing_monos$group <- "mono";
collapsed_testing_monos$group <- as.factor(collapsed_testing_monos$group);
collapsed_testing_bis <- subset(data_BLP_testing_bis, select=c(sbj_ID,x_2,x_2_hits,x_2_rejs));
collapsed_testing_bis$group <- "bi";
collapsed_testing_bis$group <- as.factor(collapsed_testing_bis$group);
collapsed_testing_tris <- subset(data_BLP_testing_tris, select=c(sbj_ID,x_2,x_2_hits,x_2_rejs));
collapsed_testing_tris$group <- "tri";
collapsed_testing_tris$group <- as.factor(collapsed_testing_tris$group);
collapsed_testing_quadris <- subset(data_BLP_testing_quadris, select=c(sbj_ID,x_2,x_2_hits,x_2_rejs));
collapsed_testing_quadris$group <- "quadri";
collapsed_testing_quadris$group <- as.factor(collapsed_testing_quadris$group);

data_BLP_testing_conditions <- rbind(collapsed_testing_monos,collapsed_testing_bis,collapsed_testing_tris,collapsed_testing_quadris);
summary(data_BLP_testing_conditions);
boxplot(data_BLP_testing_conditions$x_2 ~ data_BLP_testing_conditions$group,xlab='Group',ylab='Accuracy',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # all at 50% mean, quite even
boxplot(data_BLP_testing_conditions$x_2_hits ~ data_BLP_testing_conditions$group,xlab='Group',ylab='Accuracy - hits',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # monos at chance, bis & tris together, quadris a bit higher
boxplot(data_BLP_testing_conditions$x_2_rejs ~ data_BLP_testing_conditions$group,xlab='Group',ylab='Accuracy - correct rejections',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # monos a bit higher than the others

# group boxplot - yes responses
data_BLP_testing_monos_yes <- list(data_testing_2M_yes,data_BLP_extracted_monos) %>% reduce(inner_join, by='sbj_ID');
data_BLP_testing_monos_yes$x_2 <- data_BLP_testing_monos_yes$x_2 * 2.5
data_BLP_testing_bis_yes <- list(data_testing_2M_yes,data_BLP_extracted_bis) %>% reduce(inner_join, by='sbj_ID');
data_BLP_testing_bis_yes$x_2 <- data_BLP_testing_bis_yes$x_2 * 2.5
data_BLP_testing_tris_yes <- list(data_testing_2M_yes,data_BLP_extracted_tris) %>% reduce(inner_join, by='sbj_ID');
data_BLP_testing_tris_yes$x_2 <- data_BLP_testing_tris_yes$x_2 * 2.5
data_BLP_testing_quadris_yes <- list(data_testing_2M_yes,data_BLP_extracted_quadris) %>% reduce(inner_join, by='sbj_ID');
data_BLP_testing_quadris_yes$x_2 <- data_BLP_testing_quadris_yes$x_2 * 2.5

collapsed_testing_monos_yes <- subset(data_BLP_testing_monos_yes, select=c(sbj_ID,x_2));
collapsed_testing_monos_yes$group <- "mono";
collapsed_testing_monos_yes$group <- as.factor(collapsed_testing_monos_yes$group);
collapsed_testing_bis_yes <- subset(data_BLP_testing_bis_yes, select=c(sbj_ID,x_2));
collapsed_testing_bis_yes$group <- "bi";
collapsed_testing_bis_yes$group <- as.factor(collapsed_testing_bis_yes$group);
collapsed_testing_tris_yes <- subset(data_BLP_testing_tris_yes, select=c(sbj_ID,x_2));
collapsed_testing_tris_yes$group <- "tri";
collapsed_testing_tris_yes$group <- as.factor(collapsed_testing_tris_yes$group);
collapsed_testing_quadris_yes <- subset(data_BLP_testing_quadris_yes, select=c(sbj_ID,x_2));
collapsed_testing_quadris_yes$group <- "quadri";
collapsed_testing_quadris_yes$group <- as.factor(collapsed_testing_quadris_yes$group);

data_BLP_testing_conditions_yes <- rbind(collapsed_testing_monos_yes,collapsed_testing_bis_yes,collapsed_testing_tris_yes,collapsed_testing_quadris_yes);
summary(data_BLP_testing_conditions_yes);
boxplot(data_BLP_testing_conditions_yes$x_2 ~ data_BLP_testing_conditions_yes$group,xlab='Group',ylab='Percent of yes responses - 2M',cex.lab=1.5,ylim=c(0,100),yaxs="i");
abline(h=50, lty=5); # all at 50% mean, quite even (monos a bit lower)

# testing hits in each language group
boxplot(data_BLP_testing_monos$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_monos$x_2_hits);
#min:0.24 Q1:0.46 med:0.53 mean:0.49 Q3:0.56 max:0.65
hist(data_BLP_testing_monos$x_2_hits);
t.test(data_BLP_testing_monos$x_2_hits, mu=50);
#t=-564, p=1.23e-8, CI=[0.21,0.76]
plot(data_BLP_testing_monos$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_bis$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_bis$x_2_hits);
#min:0.29 Q1:0.57 med:0.65 mean:0.64 Q3:0.71 max:1
hist(data_BLP_testing_bis$x_2_hits); # normally distributed
t.test(data_BLP_testing_bis$x_2_hits, mu=50);
#t=-3117, p<2.2e-16, CI=[0.61,0.67]
plot(data_BLP_testing_bis$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_tris$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_tris$x_2_hits);
#min:0.24 Q1:0.53 med:0.65 mean:0.62 Q3:0.71 max:1
hist(data_BLP_testing_tris$x_2_hits); # normally distributed
t.test(data_BLP_testing_tris$x_2_hits, mu=50);
#t=-2281, p<2.2e-16, CI=[0.58,0.67]
plot(data_BLP_testing_tris$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_quadris$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_quadris$x_2_hits);
#min:0.12 Q1:0.59 med:0.71 mean:0.66 Q3:0.76 max:88
hist(data_BLP_testing_quadris$x_2_hits); # normally distributed, very right-skewed
t.test(data_BLP_testing_quadris$x_2_hits, mu=50);
#t=-2258, p<2.2e-16, CI=[0.61,0.70]
plot(data_BLP_testing_quadris$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

# yes reponses in each language group
boxplot(data_BLP_testing_monos$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_monos$x_2_hits);
#min:0.24 Q1:0.46 med:0.53 mean:0.49 Q3:0.56 max:0.65
hist(data_BLP_testing_monos$x_2_hits);
t.test(data_BLP_testing_monos$x_2_hits, mu=50);
#t=-564, p=1.23e-8, CI=[0.21,0.76]
plot(data_BLP_testing_monos$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_bis$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_bis$x_2_hits);
#min:0.29 Q1:0.57 med:0.65 mean:0.64 Q3:0.71 max:1
hist(data_BLP_testing_bis$x_2_hits); # normally distributed
t.test(data_BLP_testing_bis$x_2_hits, mu=50);
#t=-3117, p<2.2e-16, CI=[0.61,0.67]
plot(data_BLP_testing_bis$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_tris$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_tris$x_2_hits);
#min:0.24 Q1:0.53 med:0.65 mean:0.62 Q3:0.71 max:1
hist(data_BLP_testing_tris$x_2_hits); # normally distributed
t.test(data_BLP_testing_tris$x_2_hits, mu=50);
#t=-2281, p<2.2e-16, CI=[0.58,0.67]
plot(data_BLP_testing_tris$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_quadris$x_2_hits, ylim=c(0,1), ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_BLP_testing_quadris$x_2_hits);
#min:0.12 Q1:0.59 med:0.71 mean:0.66 Q3:0.76 max:88
hist(data_BLP_testing_quadris$x_2_hits); # normally distributed, very right-skewed
t.test(data_BLP_testing_quadris$x_2_hits, mu=50);
#t=-2258, p<2.2e-16, CI=[0.61,0.70]
plot(data_BLP_testing_quadris$x_2_hits,ylim=c(0,1),ylab = "Correct responses - hits",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

# familiarity responses
data_BLP_extracted_all$group[data_BLP$L2Score==0] <- 'mono';
data_BLP_extracted_all$group[data_BLP_extracted_all$L2Score!=0&data_BLP_extracted_all$L3Score==0] <- 'bi';
data_BLP_extracted_all$group[data_BLP_extracted_all$L2Score!=0&data_BLP_extracted_all$L3Score!=0&data_BLP_extracted_all$L4Score==0] <- 'tri';
data_BLP_extracted_all$group[data_BLP_extracted_all$L2Score!=0&data_BLP_extracted_all$L3Score!=0&data_BLP_extracted_all$L4Score!=0] <- 'quadri';
data_BLP_extracted_all$group <- as.factor(data_BLP_extracted_all$group);

# familiarity responses in each language group
data_BLP_familiarity_monos <- list(data_familiarity_means,data_BLP_extracted_monos) %>% reduce(inner_join, by='sbj_ID');
data_BLP_familiarity_bis <- list(data_familiarity_means,data_BLP_extracted_bis) %>% reduce(inner_join, by='sbj_ID');
data_BLP_familiarity_tris <- list(data_familiarity_means,data_BLP_extracted_tris) %>% reduce(inner_join, by='sbj_ID');
data_BLP_familiarity_quadris <- list(data_familiarity_means,data_BLP_extracted_quadris) %>% reduce(inner_join, by='sbj_ID');
collapsed_familiarity_monos <- subset(data_BLP_familiarity_monos, select=c(sbj_ID,x));
collapsed_familiarity_monos$group <- "mono";
collapsed_familiarity_monos$group <- as.factor(collapsed_familiarity_monos$group);
collapsed_familiarity_bis <- subset(data_BLP_familiarity_bis, select=c(sbj_ID,x));
collapsed_familiarity_bis$group <- "bi";
collapsed_familiarity_bis$group <- as.factor(collapsed_familiarity_bis$group);
collapsed_familiarity_tris <- subset(data_BLP_familiarity_tris, select=c(sbj_ID,x));
collapsed_familiarity_tris$group <- "tri";
collapsed_familiarity_tris$group <- as.factor(collapsed_familiarity_tris$group);
collapsed_familiarity_quadris <- subset(data_BLP_familiarity_quadris, select=c(sbj_ID,x));
collapsed_familiarity_quadris$group <- "quadri";
collapsed_familiarity_quadris$group <- as.factor(collapsed_familiarity_quadris$group);

data_BLP_familiarity_conditions <- rbind(collapsed_familiarity_monos,collapsed_familiarity_bis,collapsed_familiarity_tris,collapsed_familiarity_quadris);
summary(data_BLP_familiarity_conditions$x);
#min:0.29 Q1:0.50 med:0.57 mean:0.57 Q3:0.64 max:0.86
boxplot(data_BLP_familiarity_conditions$x ~ data_BLP_familiarity_conditions$group,xlab='Group',ylab='Familiarity accuracy',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # all at 57% roughly
hist(data_BLP_familiarity_conditions$x); # normally distributed
t.test(data_BLP_familiarity_conditions$x, mu=50)
#t=-6768 p<2.2e-16 CI=[0.55,0.58]