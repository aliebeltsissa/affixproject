setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");

participants <- list('6488afe97766c9083ffc3171','5c437f6a4fe4f800016e3d52','5c840aedbad8fb000106cb44','5d696d1c55742f001af29220','5e248b6f0c0b31718a9d3f31','5e2b03f0005f2a02c5a64f7b','5e9dad3fd8d8010ac6a18620','5ebd8f8679146d0a116bc257','5ecba4b6ef75d53505406d57','5ed14691e983f5067842fd20','5f21c29511084913913af654','5f316280965ec564c886f978','5f35782429beab53ef93cc2d','5f3d119b77d8ba0009a79558','5f5a5d4618746310515e2828','5f8af153e27f001bcc23ffc4','5f9c2359530d3e067a300bd6','5faacca24cd0384c1fa08be1','5fade36bdde8092117469a42','5ffab69a57132749844b8020','5ffd4230d96f6b2649d31f72','604d5e61486bd0622d2102c0','6057a8fe2d302939fc759940','60a8bd22d03adbe92cbb9a5e','60c4a402716a8f9074fcd92e','60c715c89bb47f3847a690f0','60c873a65a9883b52f70db6c','60db9c9850c39eea109ef1d3','60e586145b73b702a608bace','60f9739250a5c6f6e4726336','6102ee48644f517877d64d2b','6103cbc5310ffddfafa01661','610d45e26c9b141264755d3c','61118c6d3c980e8b5b50e2fa','6117bb7900c0ba81f079a4ee','611e00dc377e4fb7a27725e8','611e125063d1a52330225838','611fd297eb06449f7f0a06b9','61242dd5be1a06b174975a1f','61248a51eefb6797024ecb85','612cc44439ccefbbd5d4b278','612cd9f34adcee82f65685a1','6136a1e1159dc808ad660d89','613758e7a80409ba7f5affb6','613ca0a2040055a4e87c5d71','6148b49d6ac652cefd310332','615c1372e7e639775817487e','6166ef334de9e433e83bfb79','616b567b3e605b7245a9aead','6171946a19f6673fb215c0c7','628ed30ae7ff849e8bc91c86','631a1795de5efe7d3395caa3','6413799cf7721ee0ce637e09','646e0d2370c16a7561ae7dcb','649264e0b601af80c5677791','6492c23a1a7735dfaab2b095','6495a5f76daf70e418baf5f7','6497e970e2621e753513a695','64e8bd55c9089d5bf26c90cd','64e8c14bbe184c20cb9d0583','64f61553b5635b5e00595923','650330fa0cbc534b423f41e9','6505a9adbb769aeea736a2f5','651c59ec0cb6fef4208190f5','651eda4af4a809dbba0bb002','653d2df588326f6f627b8cb5','654632f222cb15acd453c0d3','655f5b404a09c686df3b0143','655f8b959477c803eb906622','65672c69a3737224f1d0bbfa','6597e935328d41ae3aeef33b','6598994f0e7e5db183bfe3ee','65a97afe116a650acc588c5b','65b901451577b2a0f18bc7ab','65cf6d92ac6f7932b1470fb4','65dce7715387badaf80e875d','65fc949678623ac83f926940','66031000461c44484ac359a8','660310c1b1a7ea09dee682e2','6606800e185d326591af6f7a','6606c9d692990fbf223f63bb','660c0d70a8f60acced0c8cc8','660c265dce47171c0dd7d359','66156fd87e14e8a60c007e17','66168e55cb60649609600268','6616a8636a12b432e8d914b5','661c24ab06db7f1ff0146700','661ff04db0e4a8222d5c4dd7','6634f754adfec54a4b1aaed4','66383ecf52e239b6f2ad54f4','663a5bb8f7f79c7e04abc9b3','663e08a82c273a8ea28be4e7')

library(paletteer);
cols <- paletteer_d("MetBrewer::Degas");

library(extrafont)
font_import()
loadfonts()
par(family="Montserrat")

# d' function
dPrime <- function(sbj, expectedResp, observedResp)
{
  sbjNumbers <- unique(sbj);
  dprimes <- vector(length=length(sbjNumbers), mode="numeric");
  log_beta <- vector(length=length(sbjNumbers), mode="numeric");
  c <- vector(length=length(sbjNumbers), mode="numeric");
  subjects <- vector(length=length(sbjNumbers), mode="integer");
  counter <- 1;
  for (s in sbjNumbers)
  {
    expectedRespCurrentSbj <- expectedResp[sbj==s];
    observedRespCurrentSbj <- observedResp[sbj==s];
    num_of_hits <- sum(observedRespCurrentSbj[expectedRespCurrentSbj==1])+.5;
    num_of_fa <- sum(observedRespCurrentSbj[expectedRespCurrentSbj==0])+.5;
    prop_of_hits <- num_of_hits/ (xtabs(~expectedRespCurrentSbj)[2]+1);
    prop_of_fa <- num_of_fa/ (xtabs(~expectedRespCurrentSbj)[1]+1);
    z_hits <- qnorm(prop_of_hits);
    z_fa <- qnorm(prop_of_fa); 
    dprimes[counter] <- round(z_hits - z_fa, digits = 3);
    log_beta[counter] <- round((z_fa^2 - z_hits^2)/2, digits = 3); #this is taken from Stanislaw and Todorov, PBR 1999. Log_beta=0 indicates no bias; negative values is bias for YES; positive values is bias for NO
    c[counter] <- round( -(z_hits + z_fa)/2, digits = 3); # this is taken again from Stanislaw and Todorov, PBR 1999, who note that c "...assumes that subjects respond yes when the decision variable exceeds the criterion and no otherwise; responses are based directly on the decision variable, which some researchers regard as more plausible than assuming that responses are based on a likelihood ratio [which the assumption behind beta] (Richardson, 1994). Another advantage of c is that it is unaffected by changes in d', whereas Beta is (Ingham, 1970; Macmil- lan, 1993; McNicol, 1972, pp. 63--64)". Similarly to log_beta, c=0 is no bias, negative c is bias for YES, negative c is bias for NO.
    subjects[counter] <- s;
    counter <- counter + 1;
  };
  print(data.frame(sbj=subjects, dprime=dprimes, log_beta=log_beta, c=c));
};


# Testing -----------------------------------------------------------------
# import testing data
data_all_testing <- read.csv("exp2_testing_preprocessed.csv",header=T,sep=",");
data_all_testing <- subset(data_all_testing, select = -c(X)) # remove redundant column added by Pavlovia
data_testing <- data_all_testing[data_all_testing$sbj_ID %in% participants,]; # n =  participants
data_testing <- data_testing[!data_testing$sbj_ID %in% c('6488afe97766c9083ffc3171'),]; # excluded for RTs

# make some variables factors
data_testing$sbj_ID <- as.factor(data_testing$sbj_ID);
data_testing$task <- as.factor(data_testing$task);
data_testing$item <- as.factor(data_testing$item);
data_testing$testing_condition <- as.factor(data_testing$testing_condition);
data_testing$correct <- as.logical(data_testing$correct);
summary(data_testing);

# change coding: make YES into 1 and NO into 0
data_expected <- replace(data_testing$expected, data_testing$expected == 0, 'YES');
data_expected <- replace(data_expected, data_expected == 1, 'NO');
data_expected <- replace(data_expected, data_expected == 'NO', 0);
data_expected <- replace(data_expected, data_expected == 'YES', 1);
data_testing$expected <- data_expected;
data_testing$expected <- as.numeric(data_testing$expected);

data_observed <- replace(data_testing$observed, data_testing$observed == 0, 'YES');
data_observed <- replace(data_observed, data_observed == 1, 'NO');
data_observed <- replace(data_observed, data_observed == 'NO', 0);
data_observed <- replace(data_observed, data_observed == 'YES', 1);
data_testing$observed <- data_observed;
data_testing$observed <- as.numeric(data_testing$observed);

# testing RTs
library(paletteer);
cols2 <- paletteer_d("palettesForR::Named");
IDs <- list(data_testing$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_testing$rt[data_testing$sbj_ID==IDs[1]],na.rm=TRUE),xlim=c(0,2200),ylim=c(0,0.007),xlab="RTs (ms)",main="",xaxt = "n",col=cols2[27],yaxs="i",lwd=1,cex.lab=1.5);
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
for (x in 2:92) {
  lines(density(data_testing$rt[data_testing$sbj_ID==IDs[x]],na.rm=TRUE),col=cols2[x+26],lwd=1)
};
# good, centered around 600ms
data_testing_rt_means <- aggregate(data_testing$rt, list(data_testing$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_testing_rt_means$x);
#min:174.5 Q1:797.7 med:955.4 mean:926.4 Q3:1099.4 max:1461.2
# good med & mean
plot(data_testing_rt_means$x, ylab="Mean participant RT (ms)",xlab="Participants",main="",xaxt = "n",pch=3,yaxs="i",ylim=c(0,2750))
# looks healthy overall
plot(data_testing$rt[data_testing$sbj_ID=="6488afe97766c9083ffc3171"],ylim=c(0,1000))
#exclude 6488afe97766c9083ffc3171: mean RT of 175ms too fast
data_testing_rt_means <- data_testing_rt_means[!data_testing_rt_means$Group.1 %in% c('6488afe97766c9083ffc3171'),]
plot(data_testing$rt[data_testing$sbj_ID=="660c265dce47171c0dd7d359"]);
#fine to include: very long with the first item (50s!) but others all around 1s afterwards

# 0M yes responses boxplot
data_testing_0M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='0M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN = function(x) sum(x == 1));
names(data_testing_0M_yes) <- c("sbj_ID","x_0");
data_testing_0M_yes$x_0 <- data_testing_0M_yes$x_0/40*100; #transform into percent
summary(data_testing_0M_yes$x_0);
#min:0 Q1:41.25 med:52.5 mean:51.59 Q3:62.5 max:100
t.test(data_testing_0M_yes$x_0, mu=50);
#t=0.87 p=0.385 CI=[47.97;55.22] -> 0M "yes" not sig difference from chance
boxplot(data_testing_0M_yes$x, ylab = "0M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);

# 0M scores
data_testing_0M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='0M'], list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN=mean, na.rm=TRUE);
names(data_testing_0M_means) <- c("sbj_ID","x_0");
summary(data_testing_0M_means$x_0);
#min:0 Q1:0.38 med:0.48 mean:0.48 Q3:0.59 max:1
var(data_testing_0M_means$x_0);
#var=0.03
plot(data_testing_0M_means$x_0,pch=3,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # clustered around 50%

hist(data_testing_0M_means$x_0); # normally distributed
t.test(data_testing_0M_means$x_0, mu=0.5);
#t=-0.87 p=0.385 CI=[0.45;0.52] -> 0M scores not sig different from chance

# 1M yes responses boxplot
data_testing_1M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='1M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN = function(x) sum(x == 1));
names(data_testing_1M_yes) <- c("sbj_ID","x_1");
data_testing_1M_yes$x_1 <- data_testing_1M_yes$x_1/40*100; #transform into percent
summary(data_testing_1M_yes$x_1);
#min:0 Q1:48.75 med:57.5 mean:57.31 Q3:66.25 max:100
t.test(data_testing_1M_yes$x_1, mu=50);
#t=4.6 p=1.34e-5 CI=[54.16;60.46] -> sig above chance
boxplot(data_testing_1M_yes$x, ylab = "1M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);

# 1M scores
data_testing_1M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='1M'], list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN=mean, na.rm=TRUE);
names(data_testing_1M_means) <- c("sbj_ID","x_1");
summary(data_testing_1M_means$x_1);
#min:0 Q1:0.49 med:0.58 mean:0.57 Q3:0.66 max:1
var(data_testing_1M_means$x_1);
#var=0.02
plot(data_testing_1M_means$x_1,pch=3,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5);
# clustered slightly above chance
hist(data_testing_1M_means$x_1); # normally distributed
t.test(data_testing_1M_means$x_1, mu=0.5);
#t=4.6 p=1.34e-5 CI=[0.54;0.60] -> sig above chance

# 2M yes responses boxplot
data_testing_2M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='2M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN = function(x) sum(x == 1));
names(data_testing_2M_yes) <- c("sbj_ID","x_2");
data_testing_2M_yes$x_2 <- data_testing_2M_yes$x_2/40*100; #transform into percent
summary(data_testing_2M_yes$x_2);
#min:0 Q1:52.5 med:65 mean:63.2 Q3:72.5 max:100
t.test(data_testing_2M_yes$x_2, mu=50);
#t=7.78 p=1.15e-11 CI=[59.80;66.52] -> sig above chance
boxplot(data_testing_2M_yes$x, ylab = "2M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);

# yes responses across conditions
library(tidyverse);
data_testing_conditions <- list(data_testing_0M_yes,data_testing_1M_yes,data_testing_2M_yes) %>% reduce(inner_join, by='sbj_ID');
par(mar=c(5, 5, 4, 2) + 0.1)
boxplot(data_testing_conditions$x_0,data_testing_conditions$x_1,data_testing_conditions$x_2, ylab='Percent of "yes" responses', xlab="Condition", names=c('0M','1M','2M'),ylim=c(0,100),yaxs="i",cex.lab=2,cex.axis=1.75);
abline(h=50, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
conditions_table <- table(data_testing$testing_condition, data_testing$observed);
chisq.test(conditions_table);
# X-squared=99.5, df=2, p<2.23-16
data_testing_conditions <- data_testing_conditions %>%
  gather(condition, score, -sbj_ID);
data_testing_conditions$score <- data_testing_conditions$score/100;

ggplot(data_testing_conditions, aes(x = condition, y = score, color = condition)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_jitter(width = 0.1, height = 0, alpha = 0.3,color= "black",size=2) +
  labs(x = "Condition", y = 'Proportion of "yes" responses') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "Montserrat", size = 28, color = "black"),
        text=element_text(family="Montserrat",size=28)) +
  scale_y_continuous(expand = c(0, 0),breaks=seq(0,1,0.2)) +
  expand_limits(y = 1.05) +
  stat_summary(geom = "point",fun = "mean",col = "red",size = 4,shape = 19) +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = 0.1,col="red",position = position_dodge(width = 0.5)) +
  scale_x_discrete(labels=c("0M", "1M", "2M"));

# FIX THIS: NOT DISPLAYING
library(ggplot2);
conditions_dataframe <- as.data.frame(conditions_table);
ggplot(conditions_dataframe,
       aes(x = Var1,
           y = Freq,
           fill = Var2)) + 
  geom_bar(stat = "identity") +
  theme(axis.line = element_line()) +
  theme_classic() +
  scale_y_continuous(limits = c(0,100), expand = c(0, 0)) +
  labs(x="Testing conditions", y="Frequency of responses", fill="Response") +
  scale_fill_manual(values = c("#F1BB7B","#FD6467"), labels=c("No","Yes"));

# 2M correct boxplot
data_testing_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN=mean, na.rm=TRUE);
names(data_testing_2M_means) <- c("sbj_ID","x_2");
par(mar=c(2,5,2,2))
boxplot(data_testing_2M_means$x_2, ylab = "2M accuracy score",family="Montserrat",cex.lab=2,cex.axis=1.75);
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
summary(data_testing_2M_means$x_2);
#min:0.23 Q1:0.45 med:0.5 mean:0.50 Q3:0.55 max:0.7
var(data_testing_2M_means$x_2);
#var=0.006
plot(data_testing_2M_means$x_2,pch=3,ylim=c(0,1));
abline(h=0.5, lty=5); 
# clustered around chance
hist(data_testing_2M_means$x_2); # normally distributed
t.test(data_testing_2M_means$x_2, mu=0.50);
#t=-0.56 p=0.58 CI=[0.48;0.51] -> not sig different from chance

# scores across conditions
library(tidyverse);
data_testing_conditions_scores <- list(data_testing_0M_means,data_testing_1M_means,data_testing_2M_means) %>% reduce(inner_join, by='sbj_ID');
summary(data_testing_conditions_scores);
boxplot(data_testing_conditions_scores$x_0,data_testing_conditions_scores$x_1,data_testing_conditions_scores$x_2, ylab='Percent of correct responses', xlab="Condition", ylim=c(0,1), names=c('0M','1M','2M'));
abline(h=0.5, lty=5);

# 2M - hits only
data_testing_2M_hits_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='1'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='1']), FUN=sum, na.rm=TRUE);
names(data_testing_2M_hits_means) <- c("sbj_ID","x_2_hits");
data_testing_2M_hits_means$x_2_hits <- data_testing_2M_hits_means$x_2_hits/20;
par(mar=c(2,5,2,2))
boxplot(data_testing_2M_hits_means$x_2_hits, ylab = "Accuracy score - 2M hits",boxwex=1.5,ylim=c(0,1),yaxs="i",cex.lab=2);
abline(h=0.5, lty=5);
summary(data_testing_2M_hits_means$x_2_hits);
# min:0 Q1:0.5 med:0.65 mean:0.63 Q3:0.75 max:1
hist(data_testing_2M_hits_means$x_2_hits); # normally distributed
t.test(data_testing_2M_hits_means$x_2_hits, mu=0.50);
# t=6.8, p=9.3e-10, CI=[0.59;0.66] -> sig above chance
plot(data_testing_2M_hits_means$x_2_hits,ylim=c(0,1),ylab = "Hits",xlab="Participants",main="2M testing accuracy",pch=3,yaxs="i",col="#3B9AB2");
abline(h=0.5, lty=5);

# 2M - correct rejections only
data_testing_2M_rejs_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='0'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='0']), FUN=mean, na.rm=TRUE);
names(data_testing_2M_rejs_means) <- c("sbj_ID","x_2_rejs");
boxplot(data_testing_2M_rejs_means$x_2_rejs, ylim=c(0,1), ylab = "Accuracy score - 2M correct rejections",boxwex=1.5,yaxs="i",cex.lab=1.5);
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
summary(data_testing_2M_rejs_means$x_2_rejs);
# min:0 Q1:0.25 med:0.35 mean:0.36 Q3:0.5 max:1
hist(data_testing_2M_rejs_means$x_2_rejs); # normally distributed
t.test(data_testing_2M_rejs_means$x_2_rejs, mu=0.50);
# t=-7.12, p=2.7e-10, CI=[0.33;0.4] -> sig below chance
plot(data_testing_2M_rejs_means$x_2_rejs,ylim=c(0,1),ylab = "Correct rejections",xlab="Participants",pch=3,yaxs="i",col="#E1AF00");
abline(h=0.5, lty=5);

# 2M - all response types
data_testing$temp_sbjID <- rep(1:91, each=120); # necessary: R doesn't like format of Prolific IDs

misses <- list();
for (i in 1:91) { # calculate misses for each participant
  temp <- data_testing[data_testing$temp_sbjID==i&data_testing$testing_condition=='2M',];
  miss <- temp %>%
    summarize(count = sum(expected == 1 & observed == 0));
  miss <- miss/40;
  misses <- append(misses, miss)
};
data_testing_2M_means$misses <- misses;
data_testing_2M_means$misses <- as.numeric(data_testing_2M_means$misses);
summary(data_testing_2M_means$misses);
# min:0 Q1:0.13 med:0.18 mean:0.19 Q3:0.25 max:0.50

hits <- list();
for (i in 1:91) { # calculate hits for each participant
  temp <- data_testing[data_testing$temp_sbjID==i&data_testing$testing_condition=='2M',];
  hit <- temp %>%
    summarize(count = sum(expected == 1 & observed == 1));
  hit <- hit/40
  hits <- append(hits, hit)
};
data_testing_2M_means$hits <- hits;
data_testing_2M_means$hits <- as.numeric(data_testing_2M_means$hits);
summary(data_testing_2M_means$hits);
# min:0 Q1:0.25 med:0.33 mean:0.31 Q3:0.38 max:0.5

rejs <- list();
for (i in 1:91) { # calculate correct rejections for each participant
  temp <- data_testing[data_testing$temp_sbjID==i&data_testing$testing_condition=='2M',];
  rej <- temp %>%
    summarize(count = sum(expected == 0 & observed == 0));
  rej <- rej/40
  rejs <- append(rejs, rej)
};
data_testing_2M_means$rejs <- rejs;
data_testing_2M_means$rejs <- as.numeric(data_testing_2M_means$rejs);
summary(data_testing_2M_means$rejs);
# min:0 Q1:0.13 med:0.18 mean:0.18 Q3:0.25 max:0.5

alarms <- list();
for (i in 1:91) { # calculate false alarms for each participant
  temp <- data_testing[data_testing$temp_sbjID==i&data_testing$testing_condition=='2M',];
  alarm <- temp %>%
    summarize(count = sum(expected == 0 & observed == 1));
  alarm <- alarm/40
  alarms <- append(alarms, alarm)
};
data_testing_2M_means$alarms <- alarms;
data_testing_2M_means$alarms <- as.numeric(data_testing_2M_means$alarms);
summary(data_testing_2M_means$alarms);
# min:0 Q1:0.25 med:0.33 mean:0.32 Q3:0.38 max:0.5

# 2M - combined plots
#1 - side-by-side scatterplots of hits & correct rejection accuracy
par(mfrow=c(2,1), mai = c(1, 1, 0.25, 0.5));
plot(data_testing_2M_hits_means$x,ylim=c(0,1),ylab = "Hits",xlab="Participants",main="2M testing accuracy",pch=3,yaxs="i",col="#3B9AB2");
abline(h=0.5, lty=5);
plot(data_testing_2M_rejs_means$x,ylim=c(0,1),ylab = "Correct rejections",xlab="Participants",pch=3,yaxs="i",col="#E1AF00");
abline(h=0.5, lty=5);
par(mfrow=c(1,1), mai = c(1, 1, 1, 1));

#2 - scatterplot with hits accuracy & correct rejection accuracy
plot(data_testing_2M_hits_means$x,ylim=c(0,1),ylab = "Accuracy",xlab="Participants",main="2M testing",pch=3,yaxs="i",col="#3B9AB2");
points(data_testing_2M_rejs_means$x,ylim=c(0,1),xlab="Participants",pch=3,yaxs="i",col="#E1AF00");
abline(h=0.5, lty=5);

#3 - plot connecting hit score to correct rejection score
library(ggplot2);
data_testing_2M_bygroup_means <- merge(data_testing_2M_hits_means,data_testing_2M_rejs_means,by="sbj_ID");
data_testing_2M_bygroup_means <- merge(data_testing_2M_bygroup_means,data_testing_2M_means,by="sbj_ID");
names(data_testing_2M_bygroup_means) <- c("sbj_ID","hits_mean","rejs_mean","mean");
data_long <- reshape2::melt(data_testing_2M_bygroup_means, id.vars = "sbj_ID", variable.name = "condition", value.name = "accuracy");
ggplot(data_long, aes(x = condition, y = accuracy, group = sbj_ID)) +
  geom_line(linewidth=0.2) +
  geom_point(aes(color = condition), size = 3);
#the lower the hits_mean is, the higher rejs_mean is

#4 - plot of difference between hit & correct rejection accuracy
data_testing_2M_bygroup_means$diff <- data_testing_2M_bygroup_means$hits_mean-data_testing_2M_bygroup_means$rejs_mean;
plot(data_testing_2M_bygroup_means$diff,ylim=c(-1,1),ylab="Accuracy difference",main="Difference between hits & correct rejection accuracy",xlab="Participants",pch=19,yaxs="i",col="#0B775E",cex=1.5);
abline(h=0, lty=5);

#5 - plot of "yes" responses in 2M & accuracy
names(data_testing_2M_yes) <- c("sbj_ID","x_2_yes");
testing_all <- merge(data_testing_2M_means,data_testing_2M_yes, by="sbj_ID");
cor(testing_all$x_2,testing_all$x_2_yes); # r = -0.04
plot(testing_all$x_2_yes,testing_all$x_2,pch=19);
#more 2M yes doesn't give you a better score
testing_all <- merge(testing_all,data_testing_2M_hits_means, by="sbj_ID");
cor(testing_all$x_2_hits,testing_all$x_2_yes); # r = 0.89
plot(testing_all$x_2_yes,testing_all$x_2_hits,pch=19);
#more 2M yes means more hits, means higher scores

# testing accuracy*RTs
cor(data_testing_2M_means$x, data_testing_rt_means$x); # r = 
plot(data_testing_rt_means$x, data_testing_2M_means$x, pch=19);

cor(data_testing_2M_hits_means$x, data_testing_rt_means$x); # r = 
plot(data_testing_rt_means$x, data_testing_2M_hits_means$x, pch=19);

cor(data_testing_2M_rejs_means$x, data_testing_rt_means$x); # r = 
plot(data_testing_rt_means$x, data_testing_2M_rejs_means$x, pch=19);

# correlation between 1M & 2M
temp <- merge(data_testing_2M_means, data_testing_1M_means,by.x='sbj_ID',by.y='sbj_ID');
cor(temp$x_1, temp$x_2); # r=-0.12
# no corr between 1M & 2M scores

# testing d'
dprimes <- dPrime(data_testing$sbj_ID, data_testing$expected, data_testing$observed);
names(dprimes) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes);

data_testing_2M <- data_testing[data_testing$testing_condition == '2M',];
dprimes2M <- dPrime(data_testing_2M$sbj_ID, data_testing_2M$expected, data_testing_2M$observed);
names(dprimes2M) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes2M);
data_testing_2M_means$dprime <- dprimes2M$dprime;
data_testing_2M_means$c <- dprimes2M$c;

# testing strategy
library(tidyverse);
strats <- subset(data_testing, select = c(sbj_ID, strategy));
strats <- strats[!duplicated(strats),];

# boxplot for accuracy of participants saying they just used intuition
data_testing$intuition <- FALSE;
data_testing$intuition[data_testing$sbj_ID=='5d696d1c55742f001af29220'|data_testing$sbj_ID=='5e248b6f0c0b31718a9d3f31'|data_testing$sbj_ID=='5e2b03f0005f2a02c5a64f7b'|data_testing$sbj_ID=='5ebd8f8679146d0a116bc257'|data_testing$sbj_ID=='5f21c29511084913913af654'|data_testing$sbj_ID=='5f8af153e27f001bcc23ffc4'|data_testing$sbj_ID=='5faacca24cd0384c1fa08be1'|data_testing$sbj_ID=='5fade36bdde8092117469a42'|data_testing$sbj_ID=='5ffd4230d96f6b2649d31f72'|data_testing$sbj_ID=='604d5e61486bd0622d2102c0'|data_testing$sbj_ID=='60f9739250a5c6f6e4726336'|data_testing$sbj_ID=='611e00dc377e4fb7a27725e8'|data_testing$sbj_ID=='61242dd5be1a06b174975a1f'|data_testing$sbj_ID=='612cc44439ccefbbd5d4b278'|data_testing$sbj_ID=='613758e7a80409ba7f5affb6'|data_testing$sbj_ID=='613ca0a2040055a4e87c5d71'|data_testing$sbj_ID=='6166ef334de9e433e83bfb79'|data_testing$sbj_ID=='6413799cf7721ee0ce637e09'|data_testing$sbj_ID=='646e0d2370c16a7561ae7dcb'|data_testing$sbj_ID=='6492c23a1a7735dfaab2b095'|data_testing$sbj_ID=='64e8bd55c9089d5bf26c90cd'|data_testing$sbj_ID=='6505a9adbb769aeea736a2f5'|data_testing$sbj_ID=='654632f222cb15acd453c0d3'|data_testing$sbj_ID=='655f5b404a09c686df3b0143'|data_testing$sbj_ID=='655f8b959477c803eb906622'|data_testing$sbj_ID=='6597e935328d41ae3aeef33b'|data_testing$sbj_ID=='65a97afe116a650acc588c5b'|data_testing$sbj_ID=='65cf6d92ac6f7932b1470fb4'|data_testing$sbj_ID=='663e08a82c273a8ea28be4e7'] <- TRUE;
data_testing_intuition_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'& data_testing$intuition==TRUE], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'& data_testing$intuition==TRUE]), FUN=mean, na.rm=TRUE);
colnames(data_testing_intuition_2M_means)[colnames(data_testing_intuition_2M_means)=="Group.1"]="sbj_ID";
boxplot(data_testing_intuition_2M_means$x, ylab = "Accuracy score (in %)");
abline(h=0.5, lty=5);
summary(data_testing_intuition_2M_means$x); # mean:0.49


# Familiarity -------------------------------------------------------------
data_all_familiarity <- read.csv("exp2_familiarity_preprocessed.csv",header=T,sep=",");
data_all_familiarity <- subset(data_all_familiarity, select = -c(X)) # remove redundant column added by Pavlovia
data_familiarity <- data_all_familiarity[data_all_familiarity$sbj_ID %in% participants,]; # n = 196 participants
data_familiarity <- data_familiarity[!data_familiarity$sbj_ID %in% c('6488afe97766c9083ffc3171'),];

# make some variables factors
data_familiarity$sbj_ID <- as.factor(data_familiarity$sbj_ID);
data_familiarity$task <- as.factor(data_familiarity$task);
data_familiarity$correct <- as.logical(data_familiarity$correct);
data_familiarity$target <- as.factor(data_familiarity$target);
data_familiarity$confound <- as.factor(data_familiarity$confound);
summary(data_familiarity);

# familiarity accuracy boxplot
data_familiarity_means <- aggregate(data_familiarity$correct, list(data_familiarity$sbj_ID), FUN=mean);
colnames(data_familiarity_means)[colnames(data_familiarity_means)=="Group.1"]="sbj_ID";
par(mar=c(2,5,2,2))
boxplot(data_familiarity_means$x, ylab = "Familiarity score",ylim=c(0,1),cex.lab=2,cex.axis=1.75,yaxs="i");
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
summary(data_familiarity_means$x);
# min:0.4 Q1:0.5 med:0.57 mean:0.56 Q3:0.6 max:0.83
hist(data_familiarity_means$x); # mostly normally distributed
t.test(data_familiarity_means$x, mu=0.50);
# t=6.22, p=1.5e-8, CI = [0.54;0.58] -> sig above chance

# familiarity RTs
IDs <- list(data_familiarity$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[1]]),xlim=c(0,4000),ylim=c(0,0.003),xlab="Familiarity RTs (ms)",main="",xaxt = "n",col=cols[1],lwd=2,yaxs="i");
axis(1, at = c(0,500,1000,1500,2000,2500,3000,3500,4000));
for (x in 2:91) {
  lines(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[x]]),col=cols[x],lwd=2)
};
data_familiarity_rt_means <- aggregate(data_familiarity$rt, list(data_familiarity$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_familiarity_rt_means);
#min:218 Q1:1249 med:1595 mean:1582 Q3:1914 max:3391

# familiarity accuracy*RTs
cor(data_familiarity_means$x, data_familiarity_rt_means$x); # r = 0.31
plot(data_familiarity_rt_means$x, data_familiarity_means$x, xlab="Mean participant RT (in ms)", ylab="Mean participant familiarity score (in %)", pch=19, cex=2, cex.lab=1.45);

# familiarity accuracy*testing accuracy
cor(data_familiarity_means$x, data_testing_2M_means$x); # r = 0.06
cor(data_familiarity_means$x, data_testing_2M_hits_means$x); # r = -0.003
cor(data_familiarity_means$x, data_testing_2M_rejs_means$x); # r = 0.06


# BLP ---------------------------------------------------------------------
data_all_BLP <- read.csv("exp2_BLP_preprocessed.csv",header=T,sep=",");
data_all_BLP <- subset(data_all_BLP, select = -c(X)) # remove redundant column added by Pavlovia
data_BLP <- data_all_BLP[data_all_BLP$sbj_ID %in% participants,]; # n = 92 participants
data_BLP <- data_BLP[!data_BLP$sbj_ID %in% c('6488afe97766c9083ffc3171'),];

# standardise language responses
data_BLP[data_BLP == "polish"] <- "Polish";
data_BLP[data_BLP == "english"|data_BLP=="ENGLISH"|data_BLP=="Englsih"|data_BLP=="Englsh"] <- "English";
data_BLP[data_BLP == "portuguese"] <- "Portuguese";
data_BLP[data_BLP=="SPANISH"|data_BLP=="Spnsh"|data_BLP=="spanish"] <- "Spanish";
data_BLP[data_BLP == "ITALIAN"] <- "Italian";
data_BLP[data_BLP == "sotho"] <- "Sotho";
data_BLP[data_BLP == "Gree"] <- "Greek";
data_BLP[data_BLP == "tshivenda"] <- "Tshivenda";
data_BLP[data_BLP == "Gujrau"] <- "Gujarati"; # to check
data_BLP[data_BLP == "ukrainian"] <- "Ukrainian";
data_BLP[data_BLP == "SETSWANA"] <- "Setswana";
data_BLP[data_BLP == "afrikaans"] <- "Afrikaans";
data_BLP[data_BLP == "punjabi"] <- "Punjabi";
data_BLP[data_BLP == "siswati"] <- "Siswati";
data_BLP[data_BLP == "Germany"|data_BLP=="german"] <- "German";
data_BLP[data_BLP == "russian"] <- "Russian";
data_BLP[data_BLP == "Isiulu"] <- "IsiZulu";
data_BLP[data_BLP == "ZULU"|data_BLP=="zulu"] <- "Zulu";
data_BLP[data_BLP == "northern sotho"] <- "Northern Sotho";
data_BLP[data_BLP == "chinese"] <- "Chinese";
data_BLP[data_BLP == "sesotho"] <- "Sesotho";
data_BLP[data_BLP == "sepedi"] <- "Sepedi";
data_BLP[data_BLP == "N/A"] <- "n/a";

# correcting some participants' demographic information - correction based off of Prolific's information
data_BLP["Age"][data_BLP["sbj_ID"] == "60c4a402716a8f9074fcd92e"] <- "21";
data_BLP["Age"][data_BLP["sbj_ID"] == "6103cbc5310ffddfafa01661"] <- "25";
data_BLP["Age"][data_BLP["sbj_ID"] == "6598994f0e7e5db183bfe3ee"] <- "23";
data_BLP["Age"][data_BLP["sbj_ID"] == "66168e55cb60649609600268"] <- "22";


# make some variables factors
data_BLP$task <- as.factor(data_BLP$task)
data_BLP$sbj_ID <- as.factor(data_BLP$sbj_ID);
data_BLP$Age <- as.numeric(data_BLP$Age);
data_BLP$Gender <- as.factor(data_BLP$Gender);
data_BLP$Education <- as.factor(data_BLP$Education);
data_BLP$L1 <- as.factor(data_BLP$L1);
data_BLP$L2 <- as.factor(data_BLP$L2);
data_BLP$L3 <- as.factor(data_BLP$L3);
data_BLP$L4 <- as.factor(data_BLP$L4);
data_BLP$otherLs <- as.factor(data_BLP$otherLs);
data_BLP$AttentionL1 <- as.factor(data_BLP$AttentionL1);
data_BLP$AttentionL2 <- as.factor(data_BLP$AttentionL2);
data_BLP$AttentionL3 <- as.factor(data_BLP$AttentionL3);
data_BLP$AttentionL4 <- as.factor(data_BLP$AttentionL4);
summary(data_BLP);
# 47/44 M/F split
# Eng top L1 & L2 lang, by far most popular L2
# 6497e970e2621e753513a695 perfectly fluent in 4 langs at 24?

library(toolbox);
scores_list <- combineCols(data_BLP, cols=c('L1Score','L2Score','L3Score','L4Score'),by_name=TRUE); # combine scores into 1 list
data_BLP$temp_sbjID <- c(1:91); # necessary: R doesn't like format of Prolific IDs

# multilingual balance: variance
vars <- list();
for (i in 1:91) { # calculate variance for each participant
  temp <- unlist(scores_list[i]);
  var <- var(temp,na.rm=TRUE);
  vars <- append(vars, var)
};
data_BLP$lang_var <- vars;
data_BLP$lang_var <- as.numeric(data_BLP$lang_var);
plot(data_BLP$temp_sbjID,data_BLP$lang_var,pch=19,xlab="Subject number",ylab="Language score variance",ylim=c(0,15000),cex.lab=1.5,yaxs="i");

# multilingual balance: entropy
entropies <- list();
library(DescTools);
for (i in 1:91) { # calculate entropy for each participant
  temp <- unlist(scores_list[i]);
  entropy <- Entropy(temp,na.rm=TRUE);
  entropies <- append(entropies, entropy)
};
data_BLP$lang_ent <- entropies;
data_BLP$lang_ent <- as.numeric(data_BLP$lang_ent);
plot(data_BLP$temp_sbjID,data_BLP$lang_ent,pch=19,xlab="Subject number",ylab="Language score entropy",cex.lab=1.5,ylim=c(0,2.5),yaxs="i");
# looks like 3 groups: at 0 (monos), around 1, around 1.75

# multilingual balance: entropy - Gullifer & Titone (2018)
library(languageEntropy);
for (i in 1:91) { # transfrom 0-10 scores into 0-1
  temp <- unlist(scores_list[i]);
  total <- sum(temp)
  for (j in 1:4) {
    temp[j] <- temp[j]/total
  }
  scores_list[i] <- list(temp)
}
entropies_gul <- data.frame(t(sapply(scores_list,c)))
colnames(entropies_gul) <- c('L1Score','L2Score','L3Score','L4Score');
sbj_ID <- seq.int(91);
entropies_gul <- data.frame(sbj_ID, entropies_gul);
entropies_gul$L2Score[entropies_gul$L2Score==0] <- NA;
entropies_gul$L3Score[entropies_gul$L3Score==0] <- NA;
entropies_gul$L4Score[entropies_gul$L4Score==0] <- NA;
entropy_gul <- languageEntropy(entropies_gul, sbj_ID, L1Score, L2Score, L3Score, L4Score, 
                               contextName = "All");
data_BLP$lang_ent_gul <- entropy_gul$All.entropy;
cor(unlist(data_BLP$lang_ent),unlist(data_BLP$lang_ent_gul),method="pearson"); # r = 1 so same function

# corr of variance & entropy
cor(unlist(data_BLP$lang_var),unlist(data_BLP$lang_ent),method="pearson"); # r = -0.86 strongly negatively correlated

# multilingual experience: summing all language scores
data_BLP["L2Score"][is.na(data_BLP["L2Score"])] <- 0;
data_BLP["L3Score"][is.na(data_BLP["L3Score"])] <- 0;
data_BLP["L4Score"][is.na(data_BLP["L4Score"])] <- 0;
data_BLP$multi_exp <- data_BLP$L1Score + data_BLP$L2Score + data_BLP$L3Score + data_BLP$L4Score;
plot(data_BLP$temp_sbjID,data_BLP$multi_exp,pch=19,xlab="Subject number",ylab="Amount of total multilingual experience (out of 872)",ylim=c(0,872),cex.lab=1.5,yaxs="i");
# clustered around 300

# L1 - L2 score
data_BLP$L1_L2_diff <- data_BLP$L1Score - data_BLP$L2Score;
plot(data_BLP$temp_sbjID,data_BLP$L1_L2_diff,pch=19,xlab="Subject number",ylab="Score difference of L1 and L2",cex.lab=1.5,ylim=c(0,218),yaxs="i");
# very varied


# CLUSTERING #
complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]

# all without language dominance scores
png('exp2_corrPlot_all.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(51:66)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_all.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(51:66)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

par(mfrow=c(2,2));
hist(data_BLP$HistoryL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(data_BLP$UseL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(data_BLP$HistoryL2Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(data_BLP$UseL2Score, xlim=c(0,60), breaks=seq(0,60,2));
par(mfrow=c(1,1));

Hmisc::varclus(data_BLP[,19:38]); # Error: x matrix must be numeric

# all participants
#without language dominance scores
pca_varimax <- psych::principal(data_BLP[,51:66], nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax$scores[,c('RC3','RC1','RC2','RC15')]);
names(data_BLP)[116:119] <- c('RC3_L4','RC1_L3','RC2_use_L1vsL2','RC15_hist_L3');

complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]

png('exp2_corrPlot_pca.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(51:66,116:119)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_pca.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(51:66,116:119)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# code from Davide that doesn't work
source("C:/Users/annal/OneDrive/Documents/Me/SISSA/BASL/BASL analysis/FunnyPeopleFunction_RodriguezLaioClustering.R");
funnyPeople(scores=as.vector(ppt_in_pca_space_5), sbjId=rep(1:192,5), itemId=rep(1:5, each=30), outForMatlabFunction=F);

# adding testing scores and BLP metrics together
library(tidyverse);
data_BLP_extracted_all <- subset(data_BLP, select=c(sbj_ID,Gender,Age,HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC3_L4,RC1_L3,RC2_use_L1vsL2,RC15_hist_L3));
data_BLP_testing_all <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');

# corr of variance & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$lang_var); # r = -0.15
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2, xlab="Language score variance", ylab="2M accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$lang_var); # r = -0.18
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2_hits, xlab="Language score variance", ylab="2M hit accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$lang_var); # r = 0.04
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2_rejs, xlab="Language score variance", ylab="2M rejection accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

# corr of entropy & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$lang_ent); # r = 0.31
plot(data_BLP_testing_all$lang_ent, data_BLP_testing_all$x_2, xlab="Language score entropy", ylab="2M accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$lang_ent); # r = 0.24
plot(data_BLP_testing_all$lang_ent, data_BLP_testing_all$x_2_hits, xlab="Language score entropy", ylab="2M hit accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$lang_ent); # r = 0.04
plot(data_BLP_testing_all$lang_ent, data_BLP_testing_all$x_2_rejs, xlab="Language score entropy", ylab="2M rejection accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

# corr of multilingual experience & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$multi_exp); # r = 0.23
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2, xlab="Multilingual experience", ylab="2M accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$multi_exp); # r = 0.24
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2_hits, xlab="Multilingual experience", ylab="2M hit accuracy (in %)", cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_hits~data_BLP_testing_all$multi_exp), col = "red",lwd=2);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$multi_exp); # r = -0.04
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2_rejs, xlab="Multilingual experience", ylab="2M rejection accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

data_BLP_testing_all <- merge(data_BLP_testing_all, data_testing_2M_yes,by="sbj_ID");
cor(data_BLP_testing_all$x_2_yes, data_BLP_testing_all$multi_exp); # r = 0.16
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2_yes, xlab="Multilingual experience", ylab='2M "yes" responses', cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_yes~data_BLP_testing_all$multi_exp), col = "red",lwd=2);
abline(h=50, lty=5);

data_BLP_testing_all <- merge(data_BLP_testing_all, dprimes2M, by="sbj_ID");
cor(data_BLP_testing_all$c,data_BLP_testing_all$multi_exp); # r = -0.13
cor(data_BLP_testing_all$c,data_BLP_testing_all$L1_L2_diff); # r = 0.17
cor(data_BLP_testing_all$dprime,data_BLP_testing_all$multi_exp); # r = 0.20
cor(data_BLP_testing_all$dprime,data_BLP_testing_all$L1_L2_diff); # r = -0.19

# corr of L1-L2 score & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$L1_L2_diff); # r = -0.21
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2, xlab="L1-L2 difference", ylab="2M accuracy", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$L1_L2_diff); # r = -0.28
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2_hits, xlab="L1-L2 difference", ylab="Testing hit accuracy", cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_hits~data_BLP_testing_all$L1_L2_diff), col = "red",lwd=2);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$L1_L2_diff); # r = 0.09
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2_rejs, xlab="L1-L2 difference", ylab="Testing rejection accuracy", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_yes, data_BLP_testing_all$L1_L2_diff); # r = -0.20
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2_yes, xlab="L1-L2 difference", ylab='2M "yes" responses', cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_yes~data_BLP_testing_all$L1_L2_diff), col = "red",lwd=2);
abline(h=50, lty=5);

# dprimes - 2M
data_BLP_testing_dprimes2M <- list(dprimes2M,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC3_L4); # r=-0.04
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$R1_L3);
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC2_use_L1vsL2); # r=0.02
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC9_L4);

# dprimes - all
data_BLP_testing_dprimes <- list(dprimes,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC3_L4); # r=0.17
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC1_L3); # r=-.17
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC2_use_L1vsL2); # r=0.06
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC9_L4);

# correlation plot of testing scores and BLP metrics - TO FIX
png('exp2_corrPlot_BLPtesting.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_all[,c(2:30)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# 1M & 2M clustering
data_testing_1M2M_means <- merge(data_testing_1M_means,data_testing_2M_means,by.x='sbj_ID',by.y='sbj_ID');
data_BLP_testing_1M2M_means <- merge(data_testing_1M2M_means, data_BLP_extracted_all[,c('sbj_ID','lang_ent','multi_exp','L1_L2_diff','RC3_L4','RC1_L3','RC2_use_L1vsL2','RC15_hist_L3')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
png('exp2_corrPlot_1M2Mmeans.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_testing_1M2M_means[,c(2:10)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_1M2Mmeans.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_testing_1M2M_means[,c(2:10)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
# no corrs with x_1 and x_2

data_testing_1M2M_yes <- merge(data_testing_1M_yes,data_testing_2M_yes,by.x='sbj_ID',by.y='sbj_ID');
data_BLP_testing_1M2M_yes <- merge(data_testing_1M2M_yes, data_BLP_extracted_all[,c('sbj_ID','lang_ent','multi_exp','L1_L2_diff','RC3_L4','RC1_L3','RC2_use_L1vsL2','RC15_hist_L3')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
png('exp2_corrPlot_1M2Myes.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_testing_1M2M_yes[,c(2:10)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_1M2Myes.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_testing_1M2M_yes[,c(2:10)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# gender difference
data_BLP_testing_gender <- list(data_testing_2M_means,subset(data_BLP, select=c(sbj_ID,Gender))) %>% reduce(inner_join, by='sbj_ID');
boxplot(data_BLP_testing_gender$x_2~data_BLP_testing_gender$Gender, ylim=c(0,1), ylab = "Accuracy score - 2M",xlab="Gender");
abline(h=0.5, lty=5);
#no gender difference

# familiarity correlations
data_BLP_familiaritymeans <- merge(data_familiarity_means, data_BLP_extracted_all[,c('sbj_ID','lang_ent','multi_exp','L1_L2_diff','RC3_L4','RC1_L3','RC2_use_L1vsL2','RC15_hist_L3')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
png('exp2_corrPlot_familiarity.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_familiaritymeans[,c(2:9)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_familiarity.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_familiaritymeans[,c(2:9)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
# mean familiarity accuracy not correlated with any BLP variables


################
# LINEAR MODEL #
################
library(lme4);
library(emmeans);

# TESTING #
data_testing_lm <- merge(data_testing, data_BLP[,c('temp_sbjID','sbj_ID','Gender','Age','lang_ent','multi_exp','L1_L2_diff','RC3_L4','RC1_L3','RC2_use_L1vsL2','RC15_hist_L3')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);

#all testing conditions - 'yes' responses
lm_TestingConditions <- glmer(observed ~ scale(trialn) + testing_condition + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_TestingConditions); # all conditions sig
emmeans(lm_TestingConditions, pairwise ~ testing_condition, adjust = "tukey");
# 0M-1M: estimate=0.243, p=0.001
# 0M-2M: estimate=0.570, p<0.001
# 1M-2M: estimate=0.330, p<0.001
lm_Gender <- glmer(observed ~ scale(trialn) + testing_condition*Gender + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_Gender); # Gender non sig as main effect; 1M:Woman sig (0.047)
lm_Age <- glmer(observed ~ scale(trialn) + testing_condition*scale(Age) + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_Age); # Age non sig as main effect
lm_RC1 <- glmer(observed ~ scale(trialn) + testing_condition*RC1_L3 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC1); # RC1 marg. sig as main effect (p=0.09), sig 1M:RC1 (p=0.01), marg sig 2M*RC1 (0.06)
lm_RC3 <- glmer(observed ~ scale(trialn) + testing_condition*RC3_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC3); # RC3 marg. sig as main effect (p=0.06)
lm_RC2 <- glmer(observed ~ scale(trialn) + testing_condition*RC2_use_L1vsL2 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC2); # RC2 non sig as main effect (p=0.22) and interaction
lm_RC15 <- glmer(observed ~ scale(trialn) + testing_condition*RC15_hist_L3 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC15); # RC15 marg sig as main effect (p=0.07)
lm_ent <- glmer(observed ~ scale(trialn) + testing_condition*lang_ent + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_ent); # lang_ent sig (p=0.03), interactions non-sig
lm_multiexp <- glmer(observed ~ scale(trialn) + testing_condition*scale(multi_exp) + (1|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_multiexp); # multi_exp sig (p=0.002), 1M non sig, 2M marg sig (p=0.08)
lm_L1L2diff <- glmer(observed ~ scale(trialn) + testing_condition*scale(L1_L2_diff) + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_L1L2diff); # L1L2diff non sig (p=0.31)


#2M - accuracy
data_testing_lm_2M <- subset(data_testing_lm[data_testing$testing_condition=='2M',]);
lm_2M_Gender <- glmer(observed ~ scale(trialn) + expected*Gender + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_Gender); # Gender non sig
lm_2M_Age <- glmer(observed ~ scale(trialn) + expected*scale(Age) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_Age); # Age non sig (p=0.35), also for interaction (p=0.89)
lm_2M_RC1 <- glmer(observed ~ scale(trialn) + expected*RC1_L3 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC1); # RC1 non sig (p=0.67), also for interaction (p=0.30)
lm_2M_RC3 <- glmer(observed ~ scale(trialn) + expected*RC3_L4 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC3); # RC3 non sig (p=0.85), also for interaction (p=0.85)
lm_2M_RC2 <- glmer(observed ~ scale(trialn) + expected*RC2_use_L1vsL2 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC2); # RC2 non sig (p=0.39), also for interaction (p=0.83)
lm_2M_RC15 <- glmer(observed ~ scale(trialn) + expected*RC15_hist_L3 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC15); # RC15 non sig (p=0.24), also for interaction (p=0.39)
lm_2M_ent <- glmer(observed ~ scale(trialn) + expected*lang_ent + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_ent); # lang_ent non sig (p=0.14), also for interaction (p=0.71)
lm_2M_multiexp <- glmer(observed ~ scale(trialn) + expected*scale(multi_exp) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_multiexp); # multi_exp non sig (p=0.69), sig for interaction (p=0.03)
lm_2M_L1L2diff <- glmer(observed ~ scale(trialn) + expected*scale(L1_L2_diff) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_L1L2diff); # L1_L2_diff non sig (p=0.42), interaction sig (p=0.046)


# FAMILIARITY #
data_BLP_familiarity <- merge(data_familiarity, data_BLP_extracted_all[,c('sbj_ID','Gender','Age','lang_ent','multi_exp','L1_L2_diff','RC1_L3','RC3_L4','RC2_use_L1vsL2','RC15_hist_L3')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
lm_fam_Gender <- glmer(correct ~ scale(trialn) + Gender + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_Gender); # Gender non sig (p=0.64)
lm_fam_Age <- glmer(correct ~ scale(trialn) + scale(Age) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_Age); # Age non sig (p=0.58)
lm_fam_RC1 <- glmer(correct ~ scale(trialn) + RC1_L3 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC1); # RC1_L3 marg sig (p=0.05004)
lm_fam_RC3 <- glmer(correct ~ scale(trialn) + RC3_L4 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC3); # RC3_L4 non sig (p=0.41)
lm_fam_RC2 <- glmer(correct ~ scale(trialn) + RC2_use_L1vsL2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC2); # RC2_use_L1vsL2 non sig (p=0.94)
lm_fam_RC15 <- glmer(correct ~ scale(trialn) + RC15_hist_L3 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC15); # RC6_use_L4 non sig (p=0.90)
lm_fam_ent <- glmer(correct ~ scale(trialn) + lang_ent + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_ent); # lang_ent non sig (p=0.27)
lm_fam_multiexp <- glmer(correct ~ scale(trialn) + scale(multi_exp) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_multiexp); # multi_exp non sig (p=0.22)
lm_fam_L1L2diff <- glmer(correct ~ scale(trialn) + scale(L1_L2_diff) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_L1L2diff); # L1_L2_diff non sig (p=0.87)


# "YES" LMERS
data_BLP_testing_0M_yes <- merge(data_testing_0M_yes, subset(data_BLP,select=c('sbj_ID','Gender','lang_ent','multi_exp')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP_testing_0M_yes$x_0);
#min:0 Q1:41.25 med:52.5 mean:51.59 Q3:62.5 max:100
data_BLP_testing_1M_yes <- merge(data_testing_1M_yes, subset(data_BLP,select=c('sbj_ID','Gender','lang_ent','multi_exp')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP_testing_1M_yes$x_1);
#min:0 Q1:48.75 med:57.5 mean:57.31 Q3:66.25 max:100
data_BLP_testing_2M_yes <- merge(data_testing_2M_yes, subset(data_BLP,select=c('sbj_ID','Gender','lang_ent','multi_exp')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP_testing_2M_yes$x_2);
#min:0 Q1:52.5 med:65 mean:63.16 Q3:72.5 max:100

#Gender
data_BLP_testing_0M_yes_gender <- aggregate(data_BLP_testing_0M_yes$x_0, by=list(data_BLP_testing_0M_yes$Gender), FUN = mean);
names(data_BLP_testing_0M_yes_gender) <- c('Gender','mean_0M_yes');
data_BLP_testing_1M_yes_gender <- aggregate(data_BLP_testing_1M_yes$x_1, by=list(data_BLP_testing_1M_yes$Gender), FUN = mean);
names(data_BLP_testing_1M_yes_gender) <- c('Gender','mean_1M_yes');
data_BLP_testing_2M_yes_gender <- aggregate(data_BLP_testing_2M_yes$x_2, by=list(data_BLP_testing_2M_yes$Gender), FUN = mean);
names(data_BLP_testing_2M_yes_gender) <- c('Gender','mean_2M_yes');

plot(data_BLP_testing_0M_yes$Gender,data_BLP_testing_0M_yes$x_0,xlab="Gender",ylab="0M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
points(data_BLP_testing_0M_yes_gender$Gender,data_BLP_testing_0M_yes_gender$mean_0M_yes,type="b",pch=19,col='red',lwd=2);
abline(h=50,lty=5);
# 0M "yes" lower for women
plot(data_BLP_testing_1M_yes$Gender,data_BLP_testing_1M_yes$x_1,xlab="Gender",ylab="1M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
points(data_BLP_testing_1M_yes_gender$Gender,data_BLP_testing_1M_yes_gender$mean_1M_yes,type="b",pch=19,col='red',lwd=2);
abline(h=50,lty=5);
# 1M "yes" same for men & women
plot(data_BLP_testing_2M_yes$Gender,data_BLP_testing_2M_yes$x_2,xlab="Gender",ylab="2M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
points(data_BLP_testing_2M_yes_gender$Gender,data_BLP_testing_2M_yes_gender$mean_2M_yes,type="b",pch=19,col='red',lwd=2);
abline(h=50,lty=5);
# 2M "yes" same for men & women
# So women respond "yes" sig more in 1M than 0M

# RC1_L3
#plot 1
data_BLP_testing_0M_RC1_yes <- merge(data_testing_0M_yes, subset(data_BLP,select=c('sbj_ID','RC1_L3')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
data_BLP_testing_1M_RC1_yes <- merge(data_testing_1M_yes, subset(data_BLP,select=c('sbj_ID','RC1_L3')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
data_BLP_testing_2M_RC1_yes <- merge(data_testing_2M_yes, subset(data_BLP,select=c('sbj_ID','RC1_L3')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);

plot(data_BLP_testing_0M_RC1_yes$RC1_L3,data_BLP_testing_0M_RC1_yes$x_0,xlab="RC1_L3",ylab="0M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_0M_RC1_yes$x_0~data_BLP_testing_0M_RC1_yes$RC1_L3), col = "red",lwd=2);
abline(h=50,lty=5);
plot(data_BLP_testing_1M_RC1_yes$RC1_L3,data_BLP_testing_1M_RC1_yes$x_1,xlab="RC1_L3",ylab="1M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_1M_RC1_yes$x_1~data_BLP_testing_1M_RC1_yes$RC1_L3), col = "red",lwd=2);
abline(h=50,lty=5);
plot(data_BLP_testing_2M_RC1_yes$RC1_L3,data_BLP_testing_2M_RC1_yes$x_2,xlab="RC1_L3",ylab="2M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_2M_RC1_yes$x_2~data_BLP_testing_2M_RC1_yes$RC1_L3), col = "red",lwd=2);
abline(h=50,lty=5);
# L3 modulates "yes" responses in 0M: higher L3 --> more "yes"

#plot 2
library(effects);
L3_values <- c(-1,0,1,2);
L3_predictions <- data.frame(Effect(mod=lm_RC1, focal.predictors=c('testing_condition','RC1_L3'), xlevels=list(RC1_L3=L3_values)));
L3_predictions <- na.omit(L3_predictions);
L3_predictions$testing_condition <- as.numeric(L3_predictions$testing_condition)

par(mar=c(5,5,2,2))
with(subset(L3_predictions, RC1_L3=="-1"),
     plot(as.numeric(testing_condition), fit, type="b", lty=1, lwd=4, col=cols[4], ylim=c(0.4,0.7), xlab="Testing condition", ylab='Proportion of "yes" responses',cex.lab=2,xaxt="n",yaxt="n"))
axis(2,at=c(0.4,0.5,0.6,0.7),cex.axis=1.5)
axis(1,at=c(1,2,3),labels=c("0M","1M","2M"),cex.axis=1.5)
abline(h=0.5, lty=5, lwd=2);

with(subset(L3_predictions, RC1_L3=="0"),
     lines(as.numeric(testing_condition), fit, type="b", lty=2, lwd=4, col=cols[3]))

with(subset(L3_predictions, RC1_L3=="1"),
     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

with(subset(L3_predictions, RC1_L3=="2"),
     lines(as.numeric(testing_condition), fit, type="b", lty=4, lwd=4, col=cols[1]))

legend("bottomright",title="L3 score",c("Low","Average","High","Very high"),
       lty=c(1,2,3),lwd=4,col=c(cols[4],cols[3],cols[2],cols[1]),bty = "n",
       cex=1.5,y.intersp=0.75);


# entropy
#plot 1
plot(data_BLP_testing_0M_yes$lang_ent,data_BLP_testing_0M_yes$x_0,xlab="Multilingual entropy",ylab="0M 'yes' responses (in %)",ylim=c(0,100),xlim=c(0,2),pch=19,yaxs="i");
abline(lm(data_BLP_testing_0M_yes$x_0~data_BLP_testing_0M_yes$lang_ent), col = "red",lwd=2);
abline(h=50,lty=5);
plot(data_BLP_testing_1M_yes$lang_ent,data_BLP_testing_1M_yes$x_1,xlab="Multilingual entropy",ylab="1M 'yes' responses (in %)",ylim=c(0,100),xlim=c(0,2),pch=19,yaxs="i");
abline(lm(data_BLP_testing_1M_yes$x_1~data_BLP_testing_1M_yes$lang_ent), col = "red",lwd=2);
abline(h=50,lty=5);
plot(data_BLP_testing_2M_yes$lang_ent,data_BLP_testing_2M_yes$x_2,xlab="Multilingual entropy",ylab="2M 'yes' responses (in %)",ylim=c(0,100),xlim=c(0,2),pch=19,yaxs="i");
abline(lm(data_BLP_testing_2M_yes$x_2~data_BLP_testing_2M_yes$lang_ent), col = "red",lwd=2);
abline(h=50,lty=5);
# entropy modulates more at 0M
# more entropy = more "yes" responses, even more so at 0M

#plot 2
ent_values <- c(0,quantile(data_testing_lm$lang_ent, seq(.25,.75,.25)));
ent_predictions <- data.frame(Effect(mod=lm_ent, focal.predictors=c('testing_condition','lang_ent'), xlevels=list(lang_ent=ent_values)));
ent_predictions <- na.omit(ent_predictions)
ent_predictions$testing_condition <- as.numeric(ent_predictions$testing_condition)

par(mar=c(5,5,2,2))
with(subset(ent_predictions, lang_ent=="0"),
     plot(as.numeric(testing_condition), fit, type="b", lty=1, lwd=4, col=cols[4], ylim=c(0.4,0.7), xlab="Testing condition", ylab='Proportion of "yes" responses',cex.lab=2,xaxt="n",yaxt="n"))
axis(2,at=c(0.4,0.5,0.6,0.7),cex.axis=1.5)
axis(1,at=c(1,2,3),labels=c("0M","1M","2M"),cex.axis=1.5)
abline(h=0.5, lty=5, lwd=2);

value2 <- ent_predictions$lang_ent[4];
with(subset(ent_predictions, lang_ent==value2),
     lines(as.numeric(testing_condition), fit, type="b", lty=2, lwd=4, col=cols[3]))

#value3 <- ent_predictions$lang_ent[7]
#with(subset(ent_predictions, lang_ent==value3),
#     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

value4 <- ent_predictions$lang_ent[10]
with(subset(ent_predictions, lang_ent==value4),
     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

legend("bottomright",title="Multilingual entropy",c("Low","Average","High"),
       lty=c(1,2,3),lwd=4,col=c(cols[4],cols[3],cols[2]),bty = "n",
       cex=1.5,y.intersp=0.75);


# multi_exp
plot(data_BLP_testing_0M_yes$multi_exp,data_BLP_testing_0M_yes$x_0,xlab="Multilingual experience",ylab="0M 'yes' responses (in %)",ylim=c(0,100),xlim=c(0,650),pch=19,yaxs="i");
abline(lm(data_BLP_testing_0M_yes$x_0~data_BLP_testing_0M_yes$multi_exp), col = "red",lwd=2);
abline(h=50,lty=5);
plot(data_BLP_testing_1M_yes$multi_exp,data_BLP_testing_1M_yes$x_1,xlab="Multilingual experience",ylab="1M 'yes' responses (in %)",ylim=c(0,100),xlim=c(0,650),pch=19,yaxs="i");
abline(lm(data_BLP_testing_1M_yes$x_1~data_BLP_testing_1M_yes$multi_exp), col = "red",lwd=2);
abline(h=50,lty=5);
plot(data_BLP_testing_2M_yes$multi_exp,data_BLP_testing_2M_yes$x_2,xlab="Multilingual experience",ylab="2M 'yes' responses (in %)",ylim=c(0,100),xlim=c(0,650),pch=19,yaxs="i");
abline(lm(data_BLP_testing_2M_yes$x_2~data_BLP_testing_2M_yes$multi_exp), col = "red",lwd=2);
abline(h=50,lty=5);
# multi_exp modulates more at 0M
# more multi_exp = more "yes" responses, even more so at 0M

multiexp_values <- c(202.1,quantile(data_testing_lm$multi_exp, seq(.25,.75,.25)));
multiexp_predictions <- data.frame(Effect(mod=lm_multiexp, focal.predictors=c('testing_condition','multi_exp'), xlevels=list(multi_exp=multiexp_values)));
multiexp_predictions <- na.omit(multiexp_predictions)

par(mar=c(5,5,2,2))
with(subset(multiexp_predictions, multi_exp=="202.1"),
     plot(as.numeric(testing_condition), fit, type="b", lty=1, lwd=4, col=cols[4], ylim=c(0.2,0.7), xlab="Testing condition", ylab='Proportion of "yes" responses',cex.lab=2,xaxt="n",yaxt="n"))
axis(2,at=c(0.2,0.3,0.4,0.5,0.6,0.7),cex.axis=1.5)
axis(1,at=c(1,2,3),labels=c("0M","1M","2M"),cex.axis=1.5)
abline(h=0.5, lty=5, lwd=2);

with(subset(multiexp_predictions, multi_exp=="305.562"),
     lines(as.numeric(testing_condition), fit, type="b", lty=2, lwd=4, col=cols[3]))

#with(subset(multiexp_predictions, multi_exp=="373.212"),
#     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

with(subset(multiexp_predictions, multi_exp=="436.04"),
     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

legend("bottomright",title="Multilingual experience:",c("Low","Average","High"),
       lty=c(1,2,3),lwd=4,col=c(cols[4],cols[3],cols[2],cols[1]),bty = "n",
       cex=1.5,y.intersp=0.75);

# L1-L2 diff
L1_L2_diff_values <- c(0,quantile(data_testing_lm$L1_L2_diff, seq(.25,.75,.25)));
L1_L2_diff_predictions <- data.frame(Effect(mod=lm_L1L2diff, focal.predictors=c('testing_condition','L1_L2_diff'), xlevels=list(L1_L2_diff=L1_L2_diff_values)));
L1_L2_diff_predictions <- na.omit(L1_L2_diff_predictions)

# plot 2
with(subset(L1_L2_diff_predictions, L1_L2_diff=="0"),
     plot(as.numeric(testing_condition), fit, type="b", lty=1, lwd=6, col=cols[4], ylim=c(0.45,0.75), xlab="Testing condition", ylab='Proportion of "yes" responses',cex.lab=2,xaxt="n",yaxt="n"))
#with(subset(L1_L2_diff_predictions, L1_L2_diff=="0"),
#     polygon(c(testing_condition, testing_condition[3:1]), c(upper,lower[3:1]), col=rgb(t(col2rgb(cols[4])/255),alpha=0.5)));
axis(2,at=c(0.45,0.5,0.6,0.7),cex.axis=2)
axis(1,at=c(1,2,3),labels=c("0M","1M","2M"),cex.axis=2)
abline(h=0.5, lty=5, lwd=4);
with(subset(L1_L2_diff_predictions, L1_L2_diff>64&L1_L2_diff<67),
     lines(as.numeric(testing_condition), fit, type="b", lty=2, lwd=6, col=cols[3]))
#with(subset(L1_L2_diff_predictions, L1_L2_diff=="50.95"),
#     polygon(c(testing_condition, testing_condition[3:1]), c(upper,lower[3:1]), col=rgb(t(col2rgb(cols[3])/255),alpha=0.5)));
with(subset(L1_L2_diff_predictions, L1_L2_diff>105&L1_L2_diff<106),
     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=6, col=cols[2]))
#with(subset(L1_L2_diff_predictions, L1_L2_diff=="97.446"),
#     polygon(c(testing_condition, testing_condition[3:1]), c(upper,lower[3:1]), col=rgb(t(col2rgb(cols[2])/255),alpha=0.5)));
legend("topleft",title="Bilingual balance:",c("Balanced","Moderately balanced","Unbalanced"),
       lty=c(1,2,3),lwd=4,col=c(cols[4],cols[3],cols[2]),bty = "n",
       cex=1.5,y.intersp=0.75);


# 2M LMERS
#multi_exp
data_BLP_testing_2M_multiexp_means <- merge(data_testing_2M_means, subset(data_BLP,select=c('sbj_ID','multi_exp')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);

plot(data_BLP_testing_2M_multiexp_means$multi_exp,data_BLP_testing_2M_multiexp_means$x_2,xlab="Multilingual experience",ylab="2M scores",ylim=c(0.2,0.7),pch=19,yaxs="i",xaxs="i",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_2M_multiexp_means$x_2~data_BLP_testing_2M_multiexp_means$multi_exp), col = "red",lwd=2);
abline(h=0.5,lty=5);
# more multi experience -> higher scores

cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$x_2); # r = 0.47
plot(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$x_2,pch=19); # more rejs --> higher score
cor(data_BLP_testing_all$x_2,data_BLP_testing_all$multi_exp); # r = 0.23
plot(data_BLP_testing_all$x_2,data_BLP_testing_all$multi_exp,pch=19); # higher multi_exp --> higher score
cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$multi_exp); # r = -0.04
plot(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$multi_exp,pch=19);
cor(data_BLP_testing_all$x_2_hits,data_BLP_testing_all$multi_exp); # r = 0.24

cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$lang_ent); # r = 0.04
cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$L1_L2_diff); # r= 0.09
cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$RC3_L4); # r = -0.02
cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$RC1_L3); # r = 0.04
cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$RC2_use_L1vsL2); # r = -0.10
cor(data_BLP_testing_all$x_2_rejs,data_BLP_testing_all$RC15_hist_L3); # r = -0.14

cor(data_BLP_testing_all$x_2_hits,data_BLP_testing_all$x_2); # r = 0.41

# more multi_exp -> more 2M hits
plot(data_BLP_testing_all$multi_exp,data_BLP_testing_all$x_2_hits,pch=19,yaxs="i",ylab="Proportion of 2M hits",xlab="Amount of multilingual experience",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_all$x_2_hits~data_BLP_testing_all$multi_exp), col = "red",lwd=2);
abline(h=0.5,lty=5);

lm_2M_cong_multiexp <- glmer(observed ~ scale(trialn) + expected*scale(multi_exp) + (1+expected|sbj_ID), data=subset(data_testing_lm_2M,expected=="1"), family='binomial');
summary(lm_2M_cong_multiexp); # multi_exp sig (p=0.017)

# d' for different levels of multiexp
plot(data_BLP_testing_all$multi_exp,data_BLP_testing_all$dprime,pch=19,ylab="D Primes",xlab="Amount of multilingual experience");
abline(lm(data_BLP_testing_all$dprime~data_BLP_testing_all$multi_exp), col = "red",lwd=2);
abline(h=0,lty=5);
# more multiexp -> higher d' -> better able to discriminate (in)cong

low_multiexp <- data_BLP_testing_all[data_BLP_testing_all$multi_exp<350,];
summary(low_multiexp$dprime); # mean = -0.12
summary(low_multiexp$c); # mean = -0.31
summary(low_multiexp$hits); # mean = 0.29
summary(low_multiexp$rejs); # mean = 0.18
summary(low_multiexp$misses); # mean = 0.21
summary(low_multiexp$alarms); # mean = 0.32
plot(mean(low_multiexp$multi_exp),mean(low_multiexp$dprime),pch=19,xlim=c(250,600),ylim=c(-1.7,1));

med_multiexp <- data_BLP_testing_all[data_BLP_testing_all$multi_exp>350&data_BLP_testing_all$multi_exp<400,];
summary(med_multiexp$dprime); # mean = 0.09
summary(med_multiexp$c); # mean = -0.37
summary(med_multiexp$hits); # mean = 0.31
summary(med_multiexp$rejs); # mean = 0.21
summary(med_multiexp$misses); # mean = 0.19
summary(med_multiexp$alarms); # mean = 0.29
points(mean(med_multiexp$multi_exp),mean(med_multiexp$dprime),pch=19);

high_multiexp <- data_BLP_testing_all[data_BLP_testing_all$multi_exp>400,];
summary(high_multiexp$dprime); # mean = 0.11
summary(high_multiexp$c);# mean = -0.57
summary(high_multiexp$hits); # mean = 0.36
summary(high_multiexp$rejs); # mean = 0.15
summary(high_multiexp$misses); # mean = 0.14
summary(high_multiexp$alarms); # mean = 0.35
points(mean(high_multiexp$multi_exp),mean(high_multiexp$dprime),pch=19);
abline(h=0,lty=5);

#L1-L2 diff
data_BLP_testing_2M_L1L2_means <- merge(data_testing_2M_means, subset(data_BLP,select=c('sbj_ID','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
plot(data_BLP_testing_2M_L1L2_means$L1_L2_diff,data_BLP_testing_2M_L1L2_means$x_2,xlab="L1-L2 difference",ylab="2M scores",ylim=c(0.2,0.7),xlim=c(0,220),pch=19,yaxs="i",xaxs="i",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_2M_L1L2_means$x_2~data_BLP_testing_2M_L1L2_means$L1_L2_diff), col = "red",lwd=2);
abline(h=0.5,lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
# less balanced -> scores further below 50%


######################
# DENSITY CLUSTERING #
######################
library(viridis);
density_peak_clustering <- function(scores, 
                                     sbjId, #these are the "objects" 
                                     dimensions, #this would be the item in a psychological experiment
                                     threshold=.2
)
  
{
  #this just checks that the scores are numbers
  if (!is.numeric(scores)) stop('The score vector should be numeric');
  
  #this arranges the input data into a dataframe, in the wide format cause that's what the function 'dist', which we'll use below, needs 
  temp <- data.frame(dimension=dimensions, sbjId=sbjId, score=scores);
  tempWide <- reshape(temp, timevar="dimension", idvar="sbjId", direction="wide"); 
  
  #this method doesn't handle well missing data, so here I substitute them with the mean for that dimension
  for (j in 2:ncol(tempWide)) 
  {
    tempWide[,j][is.na(tempWide[,j])] <- rep(mean(tempWide[,j], na.rm=T), length(tempWide[,j][is.na(tempWide[,j])]));
  };
  
  #this prepares the core data frame:
  density_peaks <- data.frame(subject=tempWide$sbjId, ro=rep(0,length(tempWide$sbjId)), delta=rep(0,length(tempWide$sbjId)), cluster=rep(0,length(tempWide$sbjId)));
  
  #this computes the distance between points
  distances <- as.matrix(dist(tempWide[,2:ncol(tempWide)]));
  rownames(distances) <- tempWide$sbjId;
  colnames(distances) <- tempWide$sbjId;
  
  #this computes the density for each point, ro in R&L2014 terminology
  temp <- ifelse(distances > threshold*median(distances, na.rm=T), 0, 1); #here we take the median of the distance distribution as a reference point, but the method should be robust with respect to this arbitrary choice
  density_peaks$ro <- rowSums(temp, na.rm=T);
  
  #this computes the distance to the closest, higher-density point
  for(j in 1:nrow(density_peaks)) density_peaks$delta[j] <- min(distances[j,which(density_peaks$ro>density_peaks$ro[j])]); 
  #delta is 'Inf' by definition for the highest-density point, so we change it with max(delta)
  density_peaks$delta[density_peaks$ro==max(density_peaks$ro)] <- max(density_peaks$delta[density_peaks$delta!=Inf], na.rm=T);
  
  #plot the decision plot
  with(density_peaks, plot(jitter(ro,2), jitter(delta,2), type="n", axes=F, xlab='Number of relative neighbours (ro)', ylab='Minimal distance to higher density point (delta)'));
  axis(1);
  axis(2);
  with(density_peaks, text(jitter(ro,2), jitter(delta,2), as.character(subject)));
  
  #ask the user to identify the cluster centres  
  print("Pick up your cluster centres. Press ENTER when done.");
  scan(what="character") ->> centres;
  
  #assign the cluster centres their cluster ID  
  clusterCounter <- 1;
  for (j in 1:length(centres))
  {
    density_peaks$cluster[density_peaks$subject==centres[j]] <- clusterCounter;
    clusterCounter <- clusterCounter+1;
  };
  
  #assign all the other points their cluster ID  
  unassignedPoints <- which(density_peaks$cluster==0);
  unassignedPoints <- unassignedPoints[order(density_peaks$ro[unassignedPoints], decreasing=T)]; #here I order the unassigned points based on their density. This eliminates the risk that points are passed through the cluster assignment algorithm when its neighbours are still all unassigned themselves.
  for (j in unassignedPoints)
  {
    nearestHigherDensityNeighbour <- which(distances[j,] == min(distances[j,which(density_peaks$ro>density_peaks$ro[j])]));
    density_peaks[j,'cluster'] <- density_peaks[nearestHigherDensityNeighbour,'cluster'];
  }
  
  #this plots the points, color-coded by cluster, in a compressed, 2D space (via Multidimensional scaling) 
  temp <- cmdscale(distances, k=2);
  plot(temp[,1], temp[,2], bty='n', xlab='(Multidimensional scaling)', ylab='', main='', type='n');
  cluster_colors <- viridis(length(centres));
  for (j in 1:length(centres)) text(temp[density_peaks$cluster==j,1], temp[density_peaks$cluster==j,2], density_peaks$subject[density_peaks$cluster==j], col=cluster_colors[j]);
  
  # create the dataframe with delta, ro, and sbjId
  result <- data.frame(cluster = density_peaks$cluster, delta = density_peaks$delta, ro = density_peaks$ro, sbjId = density_peaks$subject)
  
  # return the result
  return(result)
};

data_BLP_clustering <- subset(data_BLP, select=c(temp_sbjID,RC1_L3,RC3_L4,RC2_use_L1vsL2,RC15_hist_L3));
data_clustering <- data.frame();
sbj_ID <- as.character(data_BLP_clustering$temp_sbjID);
for (x in 1:91) {
  temp_sbj_ID = sbj_ID[x]
  RC1_L3 = data_BLP_clustering[x,2]
  RC3_L4 = data_BLP_clustering[x,3]
  RC2_use_L1vsL2 = data_BLP_clustering[x,4]
  RC15_hist_L3 = data_BLP_clustering[x,5]
  temp <- data.frame('sbj_ID'=rep(temp_sbj_ID,4),
                     'scores'=c(RC1_L3,RC3_L4,RC2_use_L1vsL2,RC15_hist_L3),
                     'dimensions'=c('RC1_L3','RC3_L4','RC2_use_L1vsL2','RC15_hist_L3'))
  data_clustering <- rbind(data_clustering,temp)
};
summary(data_clustering);

result <- density_peak_clustering(data_clustering$scores,data_clustering$sbj_ID,data_clustering$dimensions);
# cluster centre: 81

# new clustering analysis based on new version of Laio clustering technique
#...


###################
# CLUSTERING TREE #
###################
library(Hmisc);
data_BLP_short <- subset(data_BLP, select=-c(sbj_ID,Age,Gender,Education,L1,L2,L3,L4,otherLs,task,AttentionL1,AttentionL2,AttentionL3,AttentionL4,temp_sbjID));
temp <- subset(data_BLP_short, select=c(HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC1_L3,RC3_L4,RC2_use_L1vsL2,RC15_hist_L3));
plot(varclus(as.matrix(temp)));



# remove datapoints if participant doesn't know additional languages
data_BLP$langfilter1 <- TRUE;
data_BLP$langfilter2 <- TRUE;
data_BLP$langfilter3 <- TRUE;
data_BLP$langfilter4 <- TRUE;
data_BLP$langfilter2[data_BLP$L2Score==0] <- FALSE;
data_BLP$langfilter3[data_BLP$L3Score==0] <- FALSE;
data_BLP$langfilter4[data_BLP$L4Score==0] <- FALSE;
data_BLP$L2Score[data_BLP$langfilter2==FALSE] <- NA;
data_BLP$L3Score[data_BLP$langfilter3==FALSE] <- NA;
data_BLP$L4Score[data_BLP$langfilter4==FALSE] <- NA;
ok2 <- ! is.na(data_BLP$L2Score);
ok3 <- ! is.na(data_BLP$L3Score);
ok4 <- ! is.na(data_BLP$L4Score);

# plot language scores per participant

# representative - ent
#Low ent: temp_sbjID 10
#High ent: temp_sbjID 43

cols2 <- paletteer_d("ggthemes::Classic_20");
#by temp_sbjID
plot(data_BLP$L1Score~data_BLP$temp_sbjID,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
axis(1, at = c(1:91));
points(data_BLP$L2Score~data_BLP$temp_sbjID,subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score~data_BLP$temp_sbjID,subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score~data_BLP$temp_sbjID,subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5);

#by lang_ent
sorted_order1 <- order(data_BLP$lang_ent);
plot(data_BLP$L1Score[sorted_order1]~data_BLP$temp_sbjID[sorted_order1],ylab="Language Score",ylim=c(0,230),xlab="Participants, by increasing lang_ent",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
points(data_BLP$L2Score[sorted_order1]~data_BLP$temp_sbjID[sorted_order1],subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score[sorted_order1]~data_BLP$temp_sbjID[sorted_order1],subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score[sorted_order1]~data_BLP$temp_sbjID[sorted_order1],subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5);

#by multi_exp
sorted_order2 <- order(data_BLP$multi_exp);
plot(data_BLP$L1Score[sorted_order2]~data_BLP$temp_sbjID[sorted_order2],ylab="Language Score",ylim=c(0,230),xlab="Participants, by increasing multi_exp",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
points(data_BLP$L2Score[sorted_order2]~data_BLP$temp_sbjID[sorted_order2],subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score[sorted_order2]~data_BLP$temp_sbjID[sorted_order2],subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score[sorted_order2]~data_BLP$temp_sbjID[sorted_order2],subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5);

#by L1_L2_diff - doesn't seem to work well
sorted_order3 <- order(data_BLP$L1_L2_diff);
plot(data_BLP$L1Score[sorted_order3]~data_BLP$temp_sbjID[sorted_order3],ylab="Language Score",ylim=c(0,230),xlab="Participants, by increasing L1_L2_diff",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
points(data_BLP$L2Score[sorted_order3]~data_BLP$temp_sbjID[sorted_order3],subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score[sorted_order3]~data_BLP$temp_sbjID[sorted_order3],subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score[sorted_order3]~data_BLP$temp_sbjID[sorted_order3],subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5)
