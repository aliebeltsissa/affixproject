# SETUP --------------------------------------------------------------
# clear workspace
rm(list=ls());
ls();

# load required libraries
library(lme4);
library(Hmisc);
library(stats);
library(toolbox);
library(emmeans);
library(effects);
library(BayesRS);
library(ggplot2);
library(viridis);
#library(lmerTest);
library(tidyverse);
library(DescTools);
library(paletteer);
library(extrafont);
library(BayesFactor);


# set global font
font_import();
loadfonts();
par(family="CMU Serif");

# set colour scheme
cols <- paletteer_d("MetBrewer::Degas");
cols2 <- paletteer_d("palettesForR::Named");

# define d' function
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

# set working directory
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");

# set participant IDs
participants <- list("5aa787c66219a30001c765f8","5ae5db897edeb000014a85ee","5b212164cfbf200001cfb3ad","5b213220809d160001a2c36d","5bcd11401662020001fe82c1","5c19254b0b9f6b00014769ee","5c1bfabab0fcc900019d9ff4","5caccaed2f93d700157b4782","5cbe02ab39447e0001745a5e","5cefe8856e0eec00015971dd","5d9a125f1714540016a40a27","5dab6e7d80e1780016d5bc9b","5dcb33ab0550ef819f508abf","5e12048c7605fe8839180a14","5e283f8ad48ecf000ddd0724","5e2c6968e97bec29709a53c6","5e3ff59bf2160b23942ada93","5e42b6421f44d3143440b25c","5e42f03607b468000d8eb912","5e433ed3393e971e19f4735d","5e577e79ce30ae13226e61ae","5e6d3324f14d262fced5bbfe","5e87b28549538b0fdf96b318","5e89e89bf025be000c01eead","5e8b66490d48450346bf2755","5e8c57d9b4483e012006e7aa","5e8e55509422bb10abed1f54","5e9bd025eb6b380e1d66d04c","5ea171c1a8782801263e7540","5ea9611edec14d052ada0bae","5ea9cd383b32cf15448a86ac","5eaae42f19a24d05cbd6ccb4","5eaf1c50f3540c614eb973a5","5eb35dff41a381156be161c2","5eb71c59c55b3b0ce571ae7c","5ebc0c153f8b2e04d3833423","5ec12ed7a66dbf01c7d740c1","5ec1c01a8ccaaa5ec0080c91","5ec6d06c67b0da0fb6f85e83","5ecbb4c00bc62403dae2df59","5ecd21dec04cca02c9032485","5ed013f88fce6e0d858b732e","5ee623674afa60375e30eec3","5ee83da8817af0000d47448f","5ee942381a22491bbb7170f8","5eef3de3fb4e031bf546d887","5efd2964d36f63162f263795","5f0471a92ec97b6d1aec7739","5f09d989eff16b266fba44c0","5f0d65ef2ad0c60009209f0f","5f0f93938935de000855898b","5f11c9f84078cd0888177499","5f18a80367ef6b0bbc5f3720","5f19fa0f3e85b20d0336258c","5f1e8dc7e2161c86cdcd220a","5f219602670e5a0af2cf5237","5f33289c1fe9181376ee67d9","5f33c58329beab1f63c0dfaa","5f350f459bf003464a03ea5e","5f47e34858dd331165bf9f00","5f5a713d37f71112463ab4d9","5f5e7de4c81d3672642cd612","5f6cd5ce1758e90f12ae1123","5f708f5f0d32bb66960d4473","5f784f5b98f4963cdf902340","5f7bd801486f5e1ce581980f","5f858743256d25036d9fa693","5f91dc284909fe0b08f9e2e1","5f99cee5a2a7d109a1624e10","5fa4258658811d03fbc6ce8b","5fa4725a186c050edc3bcc20","5fa5793490f10705755818c0","5fa59d4d5a29c90da975efe9","5fc2d2d79da439201ab6addc","5fc44d83862e3e79b02e0438","5fc781689771f106330abf6a","5fd2416e5061f30735e202e9","5fd69a0014c3b25ee539f66b","5fd9c5c67fa7c74ec42bb318","5fdbf74c5474cd11e39eeaf3","5fe2308a91773957e88b89be","600e0dadada7da69afc5b3de","600f0f9c3bfcdc077c924e51","60123adc24c9f126819861b6","601705a0246e51313e8ed38e","601951245f481e000980504f","601b5c79e845ac360826c9df","601ffb441dc6d959b855eea5","602bb123612bfe330818d4ef","6042a56575ab0c1ccffc3152","60491025dd8eb31e48a0ca8d","60536ffae4f98513b671f482","605aa0bb5fb71bbcf0808892","60645fe61129208791535d15","6065d7d47409810344f7e6bb","60664619eac28843177fee96","60670ac0fc7e169231369ab1","606dc21c1ce7dc64af9d81fb","6074768dc48e0753011d3d72","607ea5504e74d104da5a108a","60883a7e91c0be66dbb96fc8","608858869a591bd129fbbc6c","608c2e566d92c2aa3543e2d2","608c64e14968cdd8dcbe1be4","6092e2aac56871319199b6a5","6093cacf9a39751eedd55916","60957b300f08087b0af0031c","60a3fe2d888e7a090d6d8f82","60a68725b2b424dc0d7ce793","60b7b8126c0c4524e913236e","60bbe0da43325dadf2b1b6a9","60c49e68081928c86ba7b98a","60d478e72e8251287b641b2d","60d7605d7af8d66774061717","60db4aed5dd7b87124f51341","60dee3200c7c3355c62326d9","60e12640be1b69b66053d55b","60e3b18d3d4205b4c52ada56","60e9ea97d19e613e60a994da","60eb26fb8db6845a14fe5a91","60ec51c51a3158a50ded8a3e","60edd136d544e7c8f5fac8a7","60f030dca19a06db1b50d16a","60f56f0103876eae7c0d870f","60f579085ebf24f9c80f223e","60f6b8f8e574e14634ead43e","60f88d7fef1959734061e5a7","60fd0f49858465796afd5da9","6100174f92a7a0e5141b195e","61001b6892ebd05a24fe82e1","61055020201a7da5a704f7dd","6107d788163252e3b5c348e3","610834993bac40f050062896","610958b8473c7b96e4bd207d","610a52647a452dee7ca89360","610d2275ba5f1ee0fdcee3e8","610f2eabb45be8717fc155e0","61125e23136464bd2cbbefc9","61143bd22a1649da3b52ae32","611bdb0fed7c9df6dce28c3f","611cebb780fbae98c5bcc84d","611dc53f0098557586e89b17","611e7d1295185bf6f56fd951","611e9c16e90a0d4c6f0d8df5","611eafa6011b0423f7d7230f",
                     "611eeafa283a2d1f57537fea","6120211d8e1eab16fcb7ad69","6122966a93af160af481836c","6124a4ba3df07e768bd9c90b","61275a3158c67415afb971ff","612a98181f4b6d1cf01f926c","61301fcb49db2f170cb02b93","6131f7010e926c9103558040","613867f34e206e4f573bc6ef","613a73d06cf1fcfef304d3fa","613ab1e64acd61ebd0a7116d","613f57084e80f056c78f9b7b","6140f1c4ead758f1b72bbe2f","6140ff9c5750f0081ca8d71f","6144742e57a61e489cc9e978","6147aed5b2a4f748dc2b6ba4","614b323022fcd8b7408005a6","614c80483d06dcf7ad552679","614c8e5469405530dc27b9d5","614dd6473c74b217ad73cc9c","61520b079436973e05f72d33","61548fa2b637194e04c9bc09","6155e204cc071b306458dfff","6156a440279fdf408ee663ae","6156b68cc77b48d6693b361c","615b042301e3a24311563ee4","615b1ab789b14c9996251fb4","615b41767003d4ece749ed9d","615da9ee365ab7d547b98979","615f371e6688c87e53e7acf5","61616ce2bb94584e11c911af","6163faf9d9ac4586fe776568","616494f1ae4537c01914c758","616631efeeac0979c1ba85a9","616891e25a026e1f7262116c","616eb493bb7e4ab4fa1de8d4","6170821d1e8ffb9c893b28a4","6171349b89a54d4823f9eca1","617142c2a843eef6f8f148b6","6171d922c871ba795b6a4827","6172078b966225960be2a7b5","617679054948369cb824d837","63ee5d8aaee278de46b7d4cc","6455490f7c5f35e4221a810a","64764d56699f097a96ec6e5c","64973d83e4fc64d6ae59c370","64a288758b7c82ff2d18da75","64ef422a4789bd6b6b9042ce","65032a60861e9a17bc1a7444","65089e7ce53888b0b3840c62","650aee87054446f772acdfcc");


# TESTING ------------------------------------------------------------
# importing testing data
data_all_testing <- read.csv("testing_preprocessed_clean.csv",header=T,sep=",");
data_all_testing <- subset(data_all_testing, select = -c(X)) # remove redundant column added by Pavlovia
data_testing <- data_all_testing[data_all_testing$sbj_ID %in% participants,]; # n = 196 participants

# make some variables factors
data_testing$sbj_ID <- as.factor(data_testing$sbj_ID);
data_testing$task <- as.factor(data_testing$task);
data_testing$item <- as.factor(data_testing$item);
data_testing$testing_condition <- as.factor(data_testing$testing_condition);
data_testing$correct <- as.logical(data_testing$correct);

# change coding: 0 into 'within_lang' and 1 into 'between_lang'
data_expected <- replace(data_testing$expected, data_testing$expected == 0, 'within_lang');
data_expected <- replace(data_expected, data_expected == 1, 'between_lang');
data_testing$expected <- data_expected;
data_testing$expected <- as.factor(data_testing$expected);

data_observed <- replace(data_testing$observed, data_testing$observed == 0, 'within_lang');
data_observed <- replace(data_observed, data_observed == 1, 'between_lang');
data_testing$observed <- data_observed;
data_testing$observed <- as.factor(data_testing$observed);

# exclude 1 participant said "yes" to all BLP use questions
data_testing <- data_testing[!data_testing$sbj_ID %in% c('615b41767003d4ece749ed9d'),];
# now n=195

## testing RTs =======================================================
IDs <- list(data_testing$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_testing$rt[data_testing$sbj_ID==IDs[1]],na.rm=TRUE),xlim=c(0,2200),ylim=c(0,0.01),xlab="RTs (ms)",main="",xaxt = "n",col=cols2[27],yaxs="i",lwd=1,cex.lab=1.5);
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
for (x in 2:195) {
  lines(density(data_testing$rt[data_testing$sbj_ID==IDs[x]],na.rm=TRUE),col=cols2[x+26],lwd=1)
}; # good, centered around 800ms
data_testing_rt_means <- aggregate(data_testing$rt, list(data_testing$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_testing_rt_means$x); # good med & mean
plot(data_testing_rt_means$x, ylab="Mean participant RT (ms)",xlab="Participants",main="",xaxt = "n",pch=3,yaxs="i",ylim=c(0,2750))
# looks healthy overall

## problematic participant RTs ##
summary(data_testing$rt[data_testing$sbj_ID=="5e8b66490d48450346bf2755"]);
plot(data_testing$rt[data_testing$sbj_ID=="5e8b66490d48450346bf2755"],ylim=c(2000,170000),pch=19);
# exclude 5e8b66490d48450346bf2755: mean RT of 2627 slow, lots of slow trials, max of 162188 VERY slow
data_testing <- data_testing[!data_testing$sbj_ID %in% c('5e8b66490d48450346bf2755'),];
data_testing_rt_means <- data_testing_rt_means[!data_testing_rt_means$Group.1 %in% c('5e8b66490d48450346bf2755'),]
# now n=194

summary(data_testing$rt[data_testing$sbj_ID=="615b042301e3a24311563ee4"]);
plot(data_testing$rt[data_testing$sbj_ID=="615b042301e3a24311563ee4"],ylim=c(2000,170000),pch=19);
# exclude 615b042301e3a24311563ee4: mean RT of 2080 slow, lots of slow trials, max of 62155 very slow
data_testing <- data_testing[!data_testing$sbj_ID %in% c('615b042301e3a24311563ee4'),];
data_testing_rt_means <- data_testing_rt_means[!data_testing_rt_means$Group.1 %in% c('615b042301e3a24311563ee4'),]
# now n=193
summary(data_testing_rt_means$x);
#min=158; Q1=815; med=961; mean=955; Q3=1147; max=1694


## Testing responses =================================================
# due to technical issue: n(0M)=40, n(1M)=37, n(2M)=34
total_0M <- 40;
total_1M <- 37;
total_2M <- 34;

# yes responses globally
mean_yes <- aggregate(data_testing$observed,by=list(data_testing$sbj_ID), FUN=function(x) sum(x == 'within_lang'));
names(mean_yes) <- c("sbj_ID", "yes");
summary(mean_yes$yes);
# no one responding only "yes" or never "yes"


### 0M responses #####################################################
# 0M "YES" boxplot
data_testing_0M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='0M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN = function(x) sum(x == 'within_lang'));
names(data_testing_0M_yes) <- c("sbj_ID","yes_0M");
data_testing_0M_yes$yes_0M <- data_testing_0M_yes$yes_0M/total_0M*100; #transform into percent
summary(data_testing_0M_yes$yes_0M);
#min:12.5 Q1:40.0 med:50.0 mean:49.44 Q3:60.0 max:100
t.test(data_testing_0M_yes$yes_0M, mu=50);
#t=-0.53 p=0.60 CI=[47.37;51.52] -> 0M "yes" not sig above chance
boxplot(data_testing_0M_yes$yes_0M, ylab = "0M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);
data_testing <- merge(data_testing,data_testing_0M_yes,by="sbj_ID");

# 0M scores
data_testing_0M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='0M'], list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN=mean, na.rm=TRUE);
names(data_testing_0M_means) <- c("sbj_ID","x_0");
summary(data_testing_0M_means$x_0);
#min:0 Q1:0.40 med:0.50 mean:0.51 Q3:0.60 max:0.88
var(data_testing_0M_means$x_0);
#var=0.02
plot(data_testing_0M_means$x_0,pch=3,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # clustered around 50%

hist(data_testing_0M_means$x_0); # normally distributed
t.test(data_testing_0M_means$x_0, mu=0.5);
#t=0.53 p=0.60 CI=[0.48;0.53] -> 0M scores sig not diff from chance


### 1M responses #####################################################
# 1M "YES" boxplot
data_testing_1M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='1M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN = function(x) sum(x == 'within_lang'));
names(data_testing_1M_yes) <- c("sbj_ID","yes_1M");
data_testing_1M_yes$yes_1M <- data_testing_1M_yes$yes_1M/total_1M*100; #transform into percent
summary(data_testing_1M_yes$yes_1M);
#min:10.8 Q1:46.0 med:56.8 mean:55.0 Q3:62.2 max:100
t.test(data_testing_1M_yes$yes_1M, mu=50);
#t=4.94 p=1.69e-6 CI=[53.01;57.01] -> sig above chance
boxplot(data_testing_1M_yes$yes_1M, ylab = "1M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);
data_testing <- merge(data_testing,data_testing_1M_yes,by="sbj_ID");

# 1M scores
data_testing_1M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='1M'], list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN=mean, na.rm=TRUE);
names(data_testing_1M_means) <- c("sbj_ID","x_1");
summary(data_testing_1M_means$x_1);
#min:0.11 Q1:0.46 med:0.57 mean:0.55 Q3:0.62 max:1
var(data_testing_1M_means$x_1);
#var=0.02
plot(data_testing_1M_means$x_1,pch=3,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5);
# clustered slightly above chance
hist(data_testing_1M_means$x_1); # normally distributed
t.test(data_testing_1M_means$x_1, mu=0.5);
#t=4.94 p=1.69e-6 CI=[0.53;0.57] -> sig above chance


### 2M responses #####################################################
# 2M "YES" boxplot
data_testing_2M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='2M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN = function(x) sum(x == 'within_lang'));
names(data_testing_2M_yes) <- c("sbj_ID","yes_2M");
data_testing_2M_yes$yes_2M <- data_testing_2M_yes$yes_2M/total_2M*100; #transform into percent
summary(data_testing_2M_yes$yes_2M);
#min:11.8 Q1:55.9 med:64.7 mean:64.0 Q3:73.5 max:100
t.test(data_testing_2M_yes$yes_2M, mu=50);
#t=13.5 p<2.2-16 CI=[62.00;66.07] -> sig above chance
boxplot(data_testing_2M_yes$yes_2M, ylab = "2M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);
data_testing <- merge(data_testing,data_testing_2M_yes,by="sbj_ID");

data_testing_2M_aggr <- data_testing %>% 
  mutate(correct01 = case_when(correct == TRUE ~ 1,
                               correct == FALSE ~ 0),
         yesno01 = case_when(observed == 'between_lang' ~ 0,
                             observed == 'within_lang' ~ 1)) %>% 
  filter(testing_condition == '2M') %>% 
  group_by(expected, sbj_ID) %>% 
  dplyr::summarise(meanCorrect = mean(correct01), se = sd(correct01/sqrt(n())),
                   meanYes = mean(yesno01), se = sd(yesno01/sqrt(n()))) %>% 
  mutate(meanNo = 1 - meanYes)

ggplot(data_testing_2M_aggr, aes(x=expected, y=meanCorrect)) +
  geom_boxplot();
ggplot(data_testing_2M_aggr, aes(x=expected, y=meanYes)) +
  geom_boxplot();
ggplot(data_testing_2M_aggr, aes(x=expected, y=meanNo)) +
  geom_boxplot();

ggplot(data_testing_2M_aggr, aes(x=expected, y=meanCorrect, fill=expected)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_violin(alpha=0.75) +
  geom_boxplot(width=0.1) +
  scale_fill_manual(values=c(cols2[100],cols2[200]),
                    name="String nature",labels=c("Between-language","Within-language")) +
  labs(x = "String nature", y = 'Proportion of correct responses') +
  scale_x_discrete(labels=c("Between-language", "Within-language")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 20, color = "black"),
        text=element_text(family="CMU Serif",size=20),
        legend.position = "none");

ggplot(data_testing_2M_aggr, aes(x=expected, y=meanYes, fill=expected)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_violin(alpha=0.75) +
  geom_boxplot(width=0.1) +
  scale_fill_manual(values=c(cols2[100],cols2[200]),
                    name="String nature",labels=c("Between-language","Within-language")) +
  labs(x = "String nature", y = 'Proportion of "yes" responses') +
  scale_x_discrete(labels=c("Between-language", "Within-language")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 20, color = "black"),
        text=element_text(family="CMU Serif",size=20),
        legend.position = "none");

ggplot(data_testing_2M_aggr, aes(x=expected, y=meanNo, fill=expected)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_violin(alpha=0.75) +
  geom_boxplot(width=0.1) +
  scale_fill_manual(values=c(cols2[100],cols2[200]),
                    name="String nature",labels=c("Between-language","Within-language")) +
  labs(x = "String nature", y = 'Proportion of "no" responses') +
  scale_x_discrete(labels=c("Between-language", "Within-language")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 20, color = "black"),
        text=element_text(family="CMU Serif",size=20),
        legend.position = "none");


# 2M scores
data_testing_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN=mean, na.rm=TRUE);
names(data_testing_2M_means) <- c("sbj_ID","score_2M");
par(mar=c(2,5,2,2));
boxplot(data_testing_2M_means$score_2M, ylab = "2M accuracy score",yaxs="i",
        family="CMU Serif",ylim=c(0,1),cex.lab=2,cex.axis=1.75,width=2);
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
summary(data_testing_2M_means$score_2M);
#min:0.26 Q1:0.44 med:0.50 mean:0.50 Q3:0.56 max:0.71
var(data_testing_2M_means$score_2M); #var=0.006
plot(data_testing_2M_means$score_2M,pch=3,ylim=c(0,1));
abline(h=0.5, lty=5); # clustered around chance
hist(data_testing_2M_means$score_2M); # normally distributed
t.test(data_testing_2M_means$score_2M, mu=0.50);
#t=-0.83 p=0.41 CI=[0.48;0.51] df = 192 -> not sig different from chance
data_testing <- merge(data_testing,data_testing_2M_means,by="sbj_ID");

# d' computations
data_testing_2M <- data_testing[data_testing$testing_condition == '2M',];

data_testing_2M$expected_bi[data_testing_2M$expected == "between_lang"] <- 0;
data_testing_2M$expected_bi[data_testing_2M$expected == "within_lang"] <- 1;
data_testing_2M$observed_bi[data_testing_2M$observed == "between_lang"] <- 0;
data_testing_2M$observed_bi[data_testing_2M$observed == "within_lang"] <- 1;

dprimes2M <- dPrime(data_testing_2M$sbj_ID, data_testing_2M$expected_bi, data_testing_2M$observed_bi);
names(dprimes2M) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes2M);
# mean(d') = -0.02, mean(c) = -0.37
data_testing <- merge(data_testing,dprimes2M,by="sbj_ID");
cor.test(data_testing$dprime,data_testing$c,method="pearson"); 
# t = 21.60, df = 21421, p-value < 2.2e-16, CI=[0.13;0.16]
# more "YES" responses helps you respond more accurately


### "YES" responses across conditions ################################
# evaluating the differences between conditions
data_testing_conditions <- merge(data_testing_0M_yes,data_testing_1M_yes, by='sbj_ID');
data_testing_conditions <- merge(data_testing_conditions,data_testing_2M_yes, by='sbj_ID');
par(mar=c(5, 5, 4, 2) + 0.1)
boxplot(data_testing_conditions$yes_0M,data_testing_conditions$yes_1M,data_testing_conditions$yes_2M, ylab='Percent of "yes" responses', xlab="Condition", names=c('0M','1M','2M'),ylim=c(0,100),yaxs="i",cex.lab=2,cex.axis=1.75);
abline(h=50, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
conditions_table <- table(data_testing$testing_condition, data_testing$observed);
chisq.test(conditions_table);
# X-squared=308, df=2, p<2.2e-16
data_testing_conditions <- data_testing_conditions %>%
  gather(condition, score, -sbj_ID);
data_testing_conditions$score <- data_testing_conditions$score/100;

# plotting all "yes" responses across conditions
ggplot(data_testing_conditions, aes(x = condition, y = score, color = condition)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_jitter(width = 0.1, height = 0, alpha = 0.3,color= "black",size=2) +
  labs(x = "Condition", y = 'Proportion of "yes" responses') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28)) +
  scale_y_continuous(expand = c(0, 0),breaks=seq(0,1,0.2)) +
  expand_limits(y = 1.05) +
  stat_summary(geom = "point",fun = "mean",col = "red",size = 4,shape = 19) +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = 0.1,col="red",position = position_dodge(width = 0.5)) +
  scale_x_discrete(labels=c("0M", "1M", "2M"));

# 2M accuracy*RTs
cor.test(data_testing_2M_means$score_2M, data_testing_rt_means$x, method="pearson"); # r = 0.04 ()
plot(data_testing_2M_means$score_2M~data_testing_rt_means$x,
     xlab="Reaction times (ms)",ylab="2M score",pch=19);

# strategies used
strats <- subset(data_testing, select = c(sbj_ID, strategy));
strats <- strats[!duplicated(strats),];
write.csv(strats,"BASL_exp1_strats.csv", row.names = FALSE)

# those having used chunks
chunkID_strategists <- list('5caccaed2f93d700157b4782','5e577e79ce30ae13226e61ae','5e8c57d9b4483e012006e7aa','5eaae42f19a24d05cbd6ccb4','5ecbb4c00bc62403dae2df59','5ee942381a22491bbb7170f8','5f18a80367ef6b0bbc5f3720','5f5a713d37f71112463ab4d9','5fc2d2d79da439201ab6addc','600f0f9c3bfcdc077c924e51','60123adc24c9f126819861b6','601705a0246e51313e8ed38e','601ffb441dc6d959b855eea5','60491025dd8eb31e48a0ca8d','60664619eac28843177fee96','60db4aed5dd7b87124f51341','60f6b8f8e574e14634ead43e','60fd0f49858465796afd5da9','6144742e57a61e489cc9e978','61520b079436973e05f72d33','615b1ab789b14c9996251fb4','615da9ee365ab7d547b98979','616891e25a026e1f7262116c','63ee5d8aaee278de46b7d4cc','6455490f7c5f35e4221a810a');
data_chunkIDstrategists <- data_testing[data_testing$sbj_ID %in% chunkID_strategists,];
boxplot(data_chunkIDstrategists$score_2M, ylab = "Accuracy score (in %)");
abline(h=0.5, lty=5);
summary(data_chunkIDstrategists$score_2M);
# min:0.32 Q1:0.47 med:0.50 mean:0.52 Q3:0.56 max:0.71
t.test(data_chunkIDstrategists$score_2M, mu=0.50);
#t=10.87 p<2.2e-16 CI=[0.51;0.52] -> sig different from chance
summary(data_chunkIDstrategists$dprime);
summary(data_chunkIDstrategists$c);
# dprime:0.10 c:-0.34

# those having used their intuition
intuition_strategists <- list('5aa787c66219a30001c765f8','5ae5db897edeb000014a85ee','5b213220809d160001a2c36d','5bcd11401662020001fe82c1','5c1bfabab0fcc900019d9ff4','5dab6e7d80e1780016d5bc9b','5dcb33ab0550ef819f508abf','5e12048c7605fe8839180a14','5e3ff59bf2160b23942ada93','5e89e89bf025be000c01eead','5e8e55509422bb10abed1f54','5e9bd025eb6b380e1d66d04c','5ea9611edec14d052ada0bae','5ea9cd383b32cf15448a86ac','5eaf1c50f3540c614eb973a5','5eb35dff41a381156be161c2','5ec6d06c67b0da0fb6f85e83','5ecd21dec04cca02c9032485','5ed013f88fce6e0d858b732e','5ee623674afa60375e30eec3','5ee83da8817af0000d47448f','5f0471a92ec97b6d1aec7739','5f0d65ef2ad0c60009209f0f','5f11c9f84078cd0888177499','5f18a80367ef6b0bbc5f3720','5f19fa0f3e85b20d0336258c','5f1e8dc7e2161c86cdcd220a','5f219602670e5a0af2cf5237','5f47e34858dd331165bf9f00','5f5e7de4c81d3672642cd612','5f708f5f0d32bb66960d4473','5f858743256d25036d9fa693','5f91dc284909fe0b08f9e2e1','5fa5793490f10705755818c0','5fa59d4d5a29c90da975efe9','5fc44d83862e3e79b02e0438','5fc781689771f106330abf6a','5fd2416e5061f30735e202e9','5fd9c5c67fa7c74ec42bb318','5fe2308a91773957e88b89be','600e0dadada7da69afc5b3de','6042a56575ab0c1ccffc3152','605aa0bb5fb71bbcf0808892','60645fe61129208791535d15','606dc21c1ce7dc64af9d81fb','608858869a591bd129fbbc6c','60957b300f08087b0af0031c','60a3fe2d888e7a090d6d8f82','60a68725b2b424dc0d7ce793','60bbe0da43325dadf2b1b6a9','60d7605d7af8d66774061717','60dee3200c7c3355c62326d9','60ec51c51a3158a50ded8a3e','60f030dca19a06db1b50d16a','6100174f92a7a0e5141b195e','61001b6892ebd05a24fe82e1','610f2eabb45be8717fc155e0','61125e23136464bd2cbbefc9','611bdb0fed7c9df6dce28c3f','611cebb780fbae98c5bcc84d','611e9c16e90a0d4c6f0d8df5','611eeafa283a2d1f57537fea','6131f7010e926c9103558040','613867f34e206e4f573bc6ef','613a73d06cf1fcfef304d3fa','6140ff9c5750f0081ca8d71f','614c80483d06dcf7ad552679','614c8e5469405530dc27b9d5','614dd6473c74b217ad73cc9c','6155e204cc071b306458dfff','6156a440279fdf408ee663ae','6156b68cc77b48d6693b361c','61616ce2bb94584e11c911af','6170821d1e8ffb9c893b28a4','6171349b89a54d4823f9eca1','617142c2a843eef6f8f148b6','6171d922c871ba795b6a4827','6172078b966225960be2a7b5','65032a60861e9a17bc1a7444','65089e7ce53888b0b3840c62');
data_intuitionstrategists <- data_testing[data_testing$sbj_ID %in% intuition_strategists,];
boxplot(data_intuitionstrategists$score_2M, ylab = "Accuracy score (in %)");
abline(h=0.5, lty=5);
summary(data_intuitionstrategists$score_2M); 
# min:0.26 Q1:0.46 med:0.50 mean:0.49 Q3:0.56 max:0.62
t.test(data_intuitionstrategists$score_2M, mu=0.50);
#t=-9.94 p<2.2e-16 CI=[0.491;0.494] -> sig different from chance
summary(data_intuitionstrategists$dprime);
summary(data_intuitionstrategists$c);
# dprime:-0.04 c:-0.31


# FAMILIARITY --------------------------------------------------------
data_all_familiarity <- read.csv("exp1_familiarity_preprocessed.csv",header=T,sep=",");
data_all_familiarity <- subset(data_all_familiarity, select = -c(X)) # remove redundant column added by Pavlovia
data_familiarity <- data_all_familiarity[data_all_familiarity$sbj_ID %in% participants,]; # n = 187 participants
data_familiarity <- data_familiarity[!data_familiarity$sbj_ID %in% c('615b042301e3a24311563ee4','5e8b66490d48450346bf2755','615b41767003d4ece749ed9d'),];

# make some variables factors
data_familiarity$sbj_ID <- as.factor(data_familiarity$sbj_ID);
data_familiarity$task <- as.factor(data_familiarity$task);
data_familiarity$correct <- as.logical(data_familiarity$correct);
data_familiarity$target <- as.factor(data_familiarity$target);
data_familiarity$confound <- as.factor(data_familiarity$confound);

# familiarity accuracy boxplot
data_familiarity_means <- aggregate(data_familiarity$correct, list(data_familiarity$sbj_ID), FUN=mean);
colnames(data_familiarity_means)[colnames(data_familiarity_means)=="Group.1"]="sbj_ID";
par(mar=c(2,5,2,2));
boxplot(data_familiarity_means$x, ylab = "Familiarity score",ylim=c(0,1),
        cex.lab=2,cex.axis=1.75,yaxs="i",width=2);
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1); # back to default
summary(data_familiarity_means$x);
# min:0.29 Q1:0.50 med:0.57 mean:0.57 Q3:0.64 max:0.86
hist(data_familiarity_means$x); # mostly normally distributed
t.test(data_familiarity_means$x, mu=0.50);
# t=9.16, p<2.2e-16, CI = [0.55;0.58] -> sig above chance
var(data_familiarity_means$x); #var = 0.01

# familiarity accuracy violin plot
ggplot(data_familiarity_means, aes(x="score", y=x, fill="score")) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_violin(alpha=0.75) +
  geom_boxplot(width=0.1) +
  ylim(0,1) +
  scale_fill_manual(values=cols2[350]) +
  labs(y = 'Proportion of correct familiarity responses') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 20, color = "black"),
        text=element_text(family="CMU Serif",size=20),
        legend.position = "none",
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank());

# familiarity RTs
IDs <- list(data_familiarity$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[1]]),xlim=c(0,4000),ylim=c(0,0.01),xlab="Familiarity RTs (ms)",main="",xaxt = "n",col=cols2[1],lwd=2,yaxs="i");
axis(1, at = c(0,500,1000,1500,2000,2500,3000,3500,4000));
for (x in 2:193) {
  lines(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[x]]),col=cols2[x],lwd=2)
};
data_familiarity_rt_means <- aggregate(data_familiarity$rt, list(data_familiarity$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_familiarity_rt_means$x);
#min:223 Q1:1275 med:1671 mean:1892 Q3:2140 max:9185

# familiarity accuracy*RTs
cor.test(data_familiarity_means$x, data_familiarity_rt_means$x, method="pearson") # r = 0.20
# slower at responding = better accuracy
plot(data_familiarity_rt_means$x, data_familiarity_means$x, xlab="Mean participant RT (in ms)", ylab="Mean participant familiarity score (in %)", pch=19, cex=2, cex.lab=1.45);

# familiarity accuracy*testing accuracy
cor.test(data_familiarity_means$x, data_testing_2M_means$score_2M, method="pearson"); # r = 0.11
# higher familiarity = better 2M scores

# familiarity accuracy by testing strategy
data_strategistsfam <- data_familiarity_means;
data_strategistsfam$strat[data_strategistsfam$sbj_ID %in% intuition_strategists] <- 'intuition';
data_strategistsfam$strat[data_strategistsfam$sbj_ID %in% chunkID_strategists] <- 'chunks';
data_strategistsfam$strat[data_strategistsfam$sbj_ID %in% chunkID_strategists] <- 'chunks';
data_strategistsfam$strat <- data_strategistsfam$strat %>% replace_na('other');

boxplot(data_strategistsfam$x[data_strategistsfam$strat=='chunks'],ylab = "Familiarity score (chunk strategists)",ylim=c(0,1),cex.lab=2,cex.axis=1.75,yaxs="i");
abline(h=0.5, lty=5);
summary(data_strategistsfam$x[data_strategistsfam$strat=='chunks']);
# min:0.46 Q1:0.54 med:0.57 mean:0.58 Q3:0.61 max:0.75
t.test(data_strategistsfam$x[data_strategistsfam$strat=='chunks'],mu=0.50);
#t=5.23 p=2.3e-5 CI=[0.55;0.61] df=24 -> sig above chance

boxplot(data_strategistsfam$x[data_strategistsfam$strat=='intuition'],ylab = "Familiarity score (intuition strategists)",ylim=c(0,1),cex.lab=2,cex.axis=1.75,yaxs="i");
abline(h=0.5, lty=5);
summary(data_strategistsfam$x[data_strategistsfam$strat=='intuition']);
# min:0.29 Q1:0.50 med:0.57 mean:0.55 Q3:0.64 max:0.79
t.test(data_strategistsfam$x[data_strategistsfam$strat=='intuition'],mu=0.50);
#t=4.07 p=0.0001 CI=[0.53;0.57] df=78 -> sig above chance

par(mar=c(5,5,2,2));
boxplot(data_strategistsfam$x~data_strategistsfam$strat,ylab = "Familiarity score",xlab="Testing strategy",ylim=c(0.28,0.9),cex.lab=2,cex.axis=1.75,yaxs="i");
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1); # back to default


# BLP ----------------------------------------------------------------
data_all_BLP <- read.csv("exp1_BLP_preprocessed.csv",header=T,sep=",");
data_all_BLP <- subset(data_all_BLP, select = -c(X)); # remove redundant column added by Pavlovia
data_BLP <- data_all_BLP[data_all_BLP$sbj_ID %in% participants,]; # n = 190 participants
data_BLP <- subset(data_BLP, select = -c(AoAgioL1, AoAgioL2, AoAgioL3, AoAgioL4, anniInstrL1, anniInstrL2, anniInstrL3, anniInstrL4, anniPaeseL1, anniPaeseL2, anniPaeseL3, anniPaeseL4, anniFamigliaL1, anniFamigliaL2, anniFamigliaL3, anniFamigliaL4, anniLavoroL1, anniLavoroL2, anniLavoroL3, anniLavoroL4, PercAmiciL1, PercAmiciL2, PercAmiciL3, PercAmiciL4, PercFamigliaL1, PercFamigliaL2, PercFamigliaL3, PercFamigliaL4, PercLavoroL1, PercLavoroL2, PercLavoroL3, PercLavoroL4, PercStessoL1, PercStessoL2, PercStessoL3, PercStessoL4, PercCalcoliL1, PercCalcoliL2, PercCalcoliL3, PercCalcoliL4, ProfParlaL1, ProfParlaL2, ProfParlaL3, ProfParlaL4, ProfCapisceL1, ProfCapisceL2, ProfCapisceL3, ProfCapisceL4, ProfLeggeL1, ProfLeggeL2, ProfLeggeL3, ProfLeggeL4, ProfScriveL1, ProfScriveL2, ProfScriveL3, ProfScriveL4, AttMiStessoL1, AttMiStessoL2, AttMiStessoL3, AttMiStessoL4, AttCulturaL1, AttCulturaL2, AttCulturaL3, AttCulturaL4, AttLivNativoL1, AttLivNativoL2, AttLivNativoL3, AttLivNativoL4, AttMadrelinguaL1, AttMadrelinguaL2, AttMadrelinguaL3, AttMadrelinguaL4));
data_BLP <- data_BLP[!data_BLP$sbj_ID %in% c('615b042301e3a24311563ee4','5e8b66490d48450346bf2755','615b41767003d4ece749ed9d'),];

BLP_correction <- function(data_BLP)
{
  data_BLP[data_BLP == "polish"|data_BLP == "POLISH"] <- "Polish";
  data_BLP[data_BLP == "english"|data_BLP=="ENGLISH"|data_BLP=="Englsih"|data_BLP=="Englsh"|data_BLP=="British"|data_BLP=="Engllish"|data_BLP=="ENGLISH "|data_BLP=="English "|data_BLP=="ENGLISH"|data_BLP=="english"|data_BLP=="english "|data_BLP=="englis"|data_BLP=="eanglish"|data_BLP=="Enlish"] <- "English";
  data_BLP[data_BLP == "portuguese"|data_BLP == "portuguese"|data_BLP == "Portugal"|data_BLP=="Potuguese"] <- "Portuguese";
  data_BLP[data_BLP =="SPANISH"|data_BLP=="Spnsh"|data_BLP=="spanish"] <- "Spanish";
  data_BLP[data_BLP == "ITALIAN"|data_BLP=="italian"] <- "Italian";
  data_BLP[data_BLP == "sotho"] <- "Sotho";
  data_BLP[data_BLP == "greek"|data_BLP=="Greece"] <- "Greek";
  data_BLP[data_BLP == "tshivenda"] <- "Tshivenda";
  data_BLP[data_BLP == "Gujrau"] <- "Gujarati"; # to check
  data_BLP[data_BLP == "ukrainian"|data_BLP=="ukranian"] <- "Ukrainian";
  data_BLP[data_BLP == "SETSWANA"] <- "Setswana";
  data_BLP[data_BLP == "afrikaans"] <- "Afrikaans";
  data_BLP[data_BLP == "punjabi"] <- "Punjabi";
  data_BLP[data_BLP == "siswati"] <- "Siswati";
  data_BLP[data_BLP == "Germany"|data_BLP=="german"|data_BLP=="germany"|data_BLP=="GERMANY"|data_BLP=="GERMAN"|data_BLP=="Deustch"|data_BLP == "Deutch"] <- "German";
  data_BLP[data_BLP == "russian"] <- "Russian";
  data_BLP[data_BLP == "Isiulu"] <- "IsiZulu";
  data_BLP[data_BLP == "ZULU"|data_BLP=="zulu"] <- "Zulu";
  data_BLP[data_BLP == "northern sotho"] <- "Northern Sotho";
  data_BLP[data_BLP == "chinese"] <- "Chinese";
  data_BLP[data_BLP == "sesotho"|data_BLP=="SESOTHO"] <- "Sesotho";
  data_BLP[data_BLP == "sepedi"] <- "Sepedi";
  data_BLP[data_BLP == "TSHIVENDA"] <- "Tshivenda";
  data_BLP[data_BLP == "arabic"] <- "Arabic";
  data_BLP[data_BLP == "XHOSA"|data_BLP=="xhosa"] <- "Xhosa";
  data_BLP[data_BLP == "french"|data_BLP=="fRANCH"] <- "French";
  data_BLP[data_BLP == "hungarian"] <- "Hungarian";
  data_BLP[data_BLP == "POLISH"] <- "Polish";
  data_BLP[data_BLP == "croatian"] <- "Croatian";
  data_BLP[data_BLP == "bosnian"] <- "Bosnian";
  data_BLP[data_BLP == "madarin"] <- "Mandarin";
  data_BLP[data_BLP == "Icelandic and German"] <- "Icelandic";
  data_BLP[data_BLP == "a little bit of russian"|data_BLP=="RUSSIAN"|data_BLP=="russian"] <- "Russian";
  data_BLP[data_BLP == "NDEBELE"] <- "Ndebele";
  data_BLP[data_BLP == "urdu"] <- "Urdu";
  data_BLP[data_BLP == "latvian"] <- "Latvian";
  data_BLP[data_BLP == "Malayam"] <- "Malayan";
  data_BLP[data_BLP == "swahili"] <- "Swahili";
  data_BLP[data_BLP == "serbian"] <- "Serbian";
  data_BLP[data_BLP == "SEPEDI"|data_BLP=="sepedit"] <- "Sepedi";
  data_BLP[data_BLP == "japanese"] <- "Japanese";
  data_BLP[data_BLP == "TSWANA"|data_BLP=="tswana"] <- "Tswana";
  data_BLP[data_BLP == "SHONA"] <- "Shona";
  data_BLP[data_BLP == "sweedish"] <- "Swedish";
  data_BLP[data_BLP == "XItsonga"] <- "Xitsonga";
  data_BLP[data_BLP == "N/A"|data_BLP=="---"] <- "n/a";
  data_BLP["L1"][is.na(data_BLP["L1"])] <- "n/a";
  data_BLP["L2"][is.na(data_BLP["L2"])] <- "n/a";
  data_BLP["L3"][is.na(data_BLP["L3"])] <- "n/a";
  data_BLP["L4"][is.na(data_BLP["L4"])] <- "n/a";
  
  # correcting some participants' demographic information - correction based off of Prolific's information
  data_BLP["Age"][data_BLP["sbj_ID"] == "5aa787c66219a30001c765f8"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5e577e79ce30ae13226e61ae"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5e8c57d9b4483e012006e7aa"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5ecbb4c00bc62403dae2df59"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5ee942381a22491bbb7170f8"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5f219602670e5a0af2cf5237"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5f47e34858dd331165bf9f00"] <- "21";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5f99cee5a2a7d109a1624e10"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5fa4725a186c050edc3bcc20"] <- "23";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5fc2d2d79da439201ab6addc"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5fc44d83862e3e79b02e0438"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5fd9c5c67fa7c74ec42bb318"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6065d7d47409810344f7e6bb"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "60883a7e91c0be66dbb96fc8"] <- "23";
  data_BLP["Age"][data_BLP["sbj_ID"] == "608c2e566d92c2aa3543e2d2"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "60e3b18d3d4205b4c52ada56"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "611eafa6011b0423f7d7230f"] <- "20";
  data_BLP["Age"][data_BLP["sbj_ID"] == "612a98181f4b6d1cf01f926c"] <- "21";
  data_BLP["Age"][data_BLP["sbj_ID"] == "61301fcb49db2f170cb02b93"] <- "25";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6156b68cc77b48d6693b361c"] <- "21";
  data_BLP["Age"][data_BLP["sbj_ID"] == "616891e25a026e1f7262116c"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6171d922c871ba795b6a4827"] <- "23";
  data_BLP["Gender"][data_BLP["sbj_ID"] == "5aa787c66219a30001c765f8"] <- "Man";
  data_BLP["Gender"][data_BLP["sbj_ID"] == "5bcd11401662020001fe82c1"] <- "Man";
  data_BLP["Gender"][data_BLP["sbj_ID"] == "5e3ff59bf2160b23942ada93"] <- "Man";
  data_BLP["Gender"][data_BLP["sbj_ID"] == "5f5a713d37f71112463ab4d9"] <- "Woman";
  data_BLP["Gender"][data_BLP["sbj_ID"] == "60e9ea97d19e613e60a994da"] <- "Man";
  data_BLP["Gender"][data_BLP["sbj_ID"] == "616eb493bb7e4ab4fa1de8d4"] <- "Woman";
  
  return (data_BLP)
};

data_BLP <- BLP_correction(data_BLP);

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
# 112/78 M/F split
# mean age = 22.96
# Portuguese top L1
# English top L2

scores_list <- subset(data_BLP, select=c('sbj_ID','L1Score','L2Score','L3Score','L4Score')); # combine scores into 1 list
write.csv(scores_list,"BASL_exp1_scores.csv", row.names = FALSE);
use_scores_list <- subset(data_BLP, select=c('sbj_ID','UseL1Score','UseL2Score','UseL3Score','UseL4Score')); # combine use scores into 1 list
write.csv(use_scores_list,"BASL_exp1_usescores.csv", row.names = FALSE);

# correlations of BLP scores
BLP_scores <- subset(data_BLP,select=c(HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,
                                       UseL1Score,UseL2Score,UseL3Score,UseL4Score,
                                       ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,
                                       AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score));

png('exp1_corrPlot_BLP.png', width=1000, height=1000);
corrplot::corrplot(cor(BLP_scores),type="lower", order="original", diag=T, method="color", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black',number.cex=1.5,tl.cex=1.5);
dev.off();

png('exp1_corrPlot_BLP_hclust.png', width=1000, height=1000);
corrplot::corrplot(cor(BLP_scores),type="lower", order="hclust", diag=T, method="color", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=1.5,tl.cex=1.5);
dev.off();

# BLP scores PCA
pca_varimax <- psych::principal(BLP_scores, nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax$scores[,c('RC1','RC9','RC2','RC8','RC3')]);
colnames(data_BLP)[which(names(data_BLP) == "RC1")] <- "RC1_L3";
colnames(data_BLP)[which(names(data_BLP) == "RC9")] <- "RC9_L4";
colnames(data_BLP)[which(names(data_BLP) == "RC2")] <- "RC2_use_L1vsL2";
colnames(data_BLP)[which(names(data_BLP) == "RC8")] <- "RC8_hist_L2"
colnames(data_BLP)[which(names(data_BLP) == "RC3")] <- "RC3_prof_L2"


## Multilingual scores ===============================================
multilingual_metrics <- data.frame();
for (i in 1:193) {
  temp <- scores_list[which(scores_list$sbj_ID==unique(scores_list$sbj_ID)[i]),];
  sbj_ID <- temp$sbj_ID[1];
  temp_scores <- as.list(temp);
  temp_scores <- temp_scores[-1];
  temp_scores <- unlist(temp_scores);
  
  use_temp <- use_scores_list[which(use_scores_list$sbj_ID==unique(use_scores_list$sbj_ID)[i]),];
  use_temp_scores <- as.list(use_temp);
  use_temp_scores <- use_temp_scores[-1];
  use_temp_scores <- unlist(use_temp_scores);
  
  # variance
  variance <- var(temp_scores,na.rm=TRUE);
  
  # entropy
  entropy <- Entropy(temp_scores,na.rm=TRUE);
  use_entropy <- Entropy(use_temp_scores,na.rm=TRUE);
  
  # multilingual experience
  multiexp <- sum(temp_scores);
  
  # L1 - L2 score
  L1L2 <- abs(temp_scores[[1]]-temp_scores[[2]]);
  
  multilingual_metrics <- rbind(multilingual_metrics, 
                                list(sbj_ID,variance,entropy,use_entropy,multiexp,L1L2));
};
names(multilingual_metrics) <- c("sbj_ID","var","ent","use_ent","multiexp","L1_L2_diff");
data_BLP <- merge(data_BLP,multilingual_metrics,by="sbj_ID");

# import cosine similarity scores
cossim <- read.csv("distances_exp1_NOLOWSCORES.csv",header=T,sep=",");
cossim <- subset(cossim, select = -c(X)); # remove redundant column added by Python
names(cossim) <- c('sbj_ID','cossim');
data_BLP <- merge(data_BLP,cossim,by="sbj_ID");

use_cossim <- read.csv("distances_exp1_usescores.csv",header=T,sep=",");
use_cossim <- subset(use_cossim, select = -c(X)); # remove redundant column added by Python
names(use_cossim) <- c('sbj_ID','use_cossim');
data_BLP <- merge(data_BLP,use_cossim,by="sbj_ID");

# multilingual category
data_BLP$category <- "mono";
data_BLP$category[data_BLP$L2Score>0] <- "bi";
data_BLP$category[data_BLP$L3Score>0] <- "tri";
data_BLP$category[data_BLP$L4Score>0] <- "quadri";
data_BLP$category <- factor(data_BLP$category,levels=c("mono","bi","tri","quadri"));
summary(data_BLP);
# n(mono) = 4
# n(bi) = 80
# n(tri) = 58
# n(quadri) = 51

# same-script vs different-script multilinguals
diff_script_sbjID <- c('5cbe02ab39447e0001745a5e','5e3ff59bf2160b23942ada93','6147aed5b2a4f748dc2b6ba4');
# n=3
mixed_script_sbjID <- c('5ea171c1a8782801263e7540','5ea9611edec14d052ada0bae','5eb35dff41a381156be161c2','5f0f93938935de000855898b','5f7bd801486f5e1ce581980f','5fc2d2d79da439201ab6addc','5fc44d83862e3e79b02e0438','5fd9c5c67fa7c74ec42bb318','600f0f9c3bfcdc077c924e51','602bb123612bfe330818d4ef','6093cacf9a39751eedd55916','61055020201a7da5a704f7dd','611bdb0fed7c9df6dce28c3f','6163faf9d9ac4586fe776568','616eb493bb7e4ab4fa1de8d4','63ee5d8aaee278de46b7d4cc','64ef422a4789bd6b6b9042ce');
# n=17
sbj_IDs_included <- list(unique(data_BLP$sbj_ID))[[1]];
sbj_IDs_included <- as.character(sbj_IDs_included);
same_script_sbjID <- sbj_IDs_included[!sbj_IDs_included %in% diff_script_sbjID];
same_script_sbjID <- same_script_sbjID[!same_script_sbjID %in% mixed_script_sbjID];
# n=173
data_BLP$script[data_BLP$sbj_ID %in% same_script_sbjID] <- 'same';
data_BLP$script[data_BLP$sbj_ID %in% mixed_script_sbjID] <- 'mixed/diff';
data_BLP$script[data_BLP$sbj_ID %in% diff_script_sbjID] <- 'mixed/diff';
data_BLP$script <- factor(data_BLP$script,levels=c("same","mixed/diff"));

# looking at each metric individually
#var
summary(data_BLP$var);
#min=452, Q1=5659, med=7727, mean=7209, Q3=9172, max=11570
var(data_BLP$var);
#var = 6580066
plot(data_BLP$var,pch=19);

#ent
summary(data_BLP$ent);
#min=0, Q1=0.95, med=1.32, mean=1.29, Q3=1.58, max=1.99
var(data_BLP$ent);
#var = 0.18
plot(data_BLP$ent,pch=19);

cor.test(data_BLP$var,data_BLP$ent,method="pearson"); 
# t = -22.851, df = 191, p-value < 2.2e-16, CI=[-0.89;-0.81], est=-0.86 (***)

#use_ent
summary(data_BLP$use_ent);
#min=0, Q1=0.65, med=0.96, mean=0.94, Q3=1.28, max=1.95
var(data_BLP$use_ent);
#var = 0.17
plot(data_BLP$use_ent,pch=19);

#multiexp
summary(data_BLP$multiexp);
#min=167, Q1=310 med=351, mean=368, Q3=425, max=592
var(data_BLP$multiexp);
#var = 6460
plot(data_BLP$multiexp,pch=19);

#L1_L2_diff
summary(data_BLP$L1_L2_diff);
#min=0.09, Q1=52, med=78, mean=76, Q3=97, Q4=208
var(data_BLP$L1_L2_diff);
#var = 1724
plot(data_BLP$L1_L2_diff,pch=19);

#cossim
summary(data_BLP$cossim);
#min=0.86, Q1=0.92, med=0.95, mean=0.95, Q3=0.97, max=1
var(data_BLP$cossim);
#var = 0.001
plot(data_BLP$cossim,pch=19);

#use_cossim
summary(data_BLP$use_cossim);
#min=0.63, Q1=0.76, med=0.82, mean=0.83, Q3=0.88, max=1
var(data_BLP$use_cossim);
#var = 0.007
plot(data_BLP$use_cossim,pch=19);

#ent & multiexp
par(mar=c(5,5,2,2));
plot(data_BLP$ent,data_BLP$multiexp,pch=19,yaxs="i",
     ylab="Multilingual experience",xlab="Entropy",
     cex.lab=1.5);
cor.test(data_BLP$ent,data_BLP$multiexp,method="pearson"); 
# t = 37.295, df = 191, p-value < 2.2e-16, CI=[0.92;0.95], est=0.94 (***)
text(0.25,500,"r = 0.94",cex=1.5); 

#cossim & multiexp
plot(data_BLP$cossim,data_BLP$multiexp,pch=19,yaxs="i",
     ylab="Multilingual experience",xlab="Cosine similarity",
     cex.lab=1.5);
cor.test(data_BLP$cossim,data_BLP$multiexp,method="pearson"); 
# t = -1.6814, df = 191, p-value = 0.09432, CI=[-0.26;0.02], est=-0.12 ()
text(0.87,550,"r = -0.12",cex=1.5);

#ent & use_ent
plot(data_BLP$ent,data_BLP$use_ent,pch=19,
     ylab="Use entropy",xlab="Entropy",cex.lab=1.5);
abline(a=0,b=1, col = "blue",lwd=2);
cor.test(data_BLP$ent,data_BLP$use_ent,method="pearson"); 
# t = 15.149, df = 191, p-value < 2.2e-16, CI=[0.67;0.80], est=0.74 (***)
text(0.25,1.75,"r = 0.74",cex=1.5);

# correlations of multilingual metrics
M <- cor(subset(data_BLP,select=c('var','ent','use_ent','multiexp','L1_L2_diff','cossim','use_cossim')));
png('exp1_corrPlot_multimetrics.png', width=1000, height=1000);
corrplot::corrplot(M,type="lower", order="original", diag=T, method="color", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black',number.cex=1.5,tl.cex=1.5);
dev.off();

png('exp1_corrPlot_multimetrics_hclust.png', width=1000, height=1000);
corrplot::corrplot(M,type="lower", order="hclust", diag=T, method="color", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=1.5,tl.cex=1.5);
dev.off();

# export BLP dataframe
write.csv(data_BLP,"BASL_exp1_BLP.csv", row.names = FALSE);


## COMBINING BLP & TESTING SCORES ====================================
data_BLP_shortened <- subset(data_BLP, select=c(sbj_ID,Gender,Age,
                                                HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,
                                                UseL1Score,UseL2Score,UseL3Score,UseL4Score,
                                                ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,
                                                AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,
                                                L1Score,L2Score,L3Score,L4Score,category,script,
                                                var,ent,use_ent,multiexp,L1_L2_diff,cossim,use_cossim,
                                                RC1_L3,RC9_L4,RC2_use_L1vsL2,RC8_hist_L2,RC3_prof_L2));
data_BLP_testing <- list(data_testing,data_BLP_shortened) %>% reduce(inner_join, by='sbj_ID');
data_BLP_familiarity <- list(data_familiarity,data_BLP_shortened) %>% reduce(inner_join, by='sbj_ID');

# correlations of BLP metrics with testing scores
M <- cor(subset(data_BLP_testing,select=c(score_2M,dprime,c,
                                          var,ent,use_ent,multiexp,L1_L2_diff,cossim,use_cossim,
                                          RC1_L3,RC9_L4,RC2_use_L1vsL2,RC8_hist_L2,RC3_prof_L2)));
png('exp1_corrPlot_BLP_testing.png', width=1000, height=1000);
corrplot::corrplot(M,type="lower", order="original", diag=T, method="color", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black',number.cex=1.5,tl.cex=1.5);
dev.off();

png('exp1_corrPlot_BLP_testing_hclust.png', width=1000, height=1000);
corrplot::corrplot(M,type="lower", order="hclust", diag=T, method="color", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=1.5,tl.cex=1.5);
dev.off();

# export BLP testing dataframe
write.csv(data_BLP_testing,"BASL_exp1_BLPtesting.csv", row.names = FALSE);


# LINEAR MODELLING ---------------------------------------------------
## "YES" responses LMERs =============================================
lm_TestingConditions <- glmer(observed ~ testing_condition + (1+testing_condition|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_TestingConditions); # all conditions sig
effect_conditions <- as.data.frame(effect('testing_condition',
                                          lm_TestingConditions, confint=list(alpha=.95)),
                                   xlevels = list(testing_condition=c('0M','1M','2M')));

lm_Gender <- glmer(observed ~ scale(trialn) + testing_condition*Gender + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_Gender); 
# Gender non sig as main effect (Other p=0.80; Woman p=0.23)
# 1M:Other marg. sig (0.09); 2M:Other sig (p=0.02)

lm_Age <- glmer(observed ~ scale(trialn) + testing_condition*scale(Age) + (1+testing_condition|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_Age); 
# Age sig as main effect (0.03); 
# 1M:Age marg. sig (p=0.05); 2M:Age sig (p=0.01)

lm_RC1 <- glmer(observed ~ scale(trialn) + testing_condition*RC1_L3 + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_RC1); 
# RC1 non sig as main effect (p=0.15)
# 1M:RC1 non sig (p=0.34), 2M*RC1 non sig (0.19)

lm_RC9 <- glmer(observed ~ testing_condition*RC9_L4 + (1+testing_condition|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_RC9); 
# RC9 non sig as main effect (p=0.18)
# 1M:RC9 non sig (p=0.44); 2M:RC9 non sig (p=0.54)

lm_RC2 <- glmer(observed ~ scale(trialn) + testing_condition*RC2_use_L1vsL2 + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_RC2); 
# RC2 non sig as main effect (p=0.21)
# 1M:RC2 non sig (p=0.55); 2M:RC2 non sig (p=0.51)

lm_RC8 <- glmer(observed ~ scale(trialn) + testing_condition*RC8_hist_L2 + (1+testing_condition|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_RC8); 
# RC8 sig as main effect (p=0.02)
# 1M:RC8 non sig (p=0.33); 2M:RC8 non sig (p=0.86)

lm_RC3 <- glmer(observed ~ scale(trialn) + testing_condition*RC3_prof_L2 + (1+testing_condition|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_RC3); 
# RC3 non sig as main effect (p=0.12)
# 1M:RC3 sig (p=0.03); 2M:RC3 sig (0.004)

lm_ent <- glmer(observed ~ testing_condition*ent + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_ent); 
# ent non sig as main effect (p=0.66)
# 1M:ent non sig (p=0.22); 2M:ent marg. sig (p=0.07)

lm_use_ent <- glmer(observed ~ testing_condition*use_ent + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_use_ent); 
# use_ent non sig as main effect (p=0.34)
# 1M:use_ent non sig (p=0.22); 2M:use_ent non sig (p=0.17)

lm_multiexp <- glmer(observed ~ scale(trialn) + testing_condition*scale(multiexp) + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_multiexp); 
# multiexp non sig as main effect (p=0.42)
# 1M:multiexp non sig (p=0.21); 2M:multiexp non sig (p=0.19)

lm_L1L2diff <- glmer(observed ~ testing_condition*scale(L1_L2_diff) + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_L1L2diff); 
# L1L2diff non sig as main effect (p=0.99)
# 1M:L1L2 sig (p=0.01); 2M:L1L2 sig (p=0.0003)

lm_cossim <- glmer(observed ~ testing_condition*cossim + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_cossim); 
# cossim non sig as main effect (p=0.95)
# 1M:cossim non sig (p=0.90); 2M:cossim non sig (p=0.71)

lm_use_cossim <- glmer(observed ~ testing_condition*use_cossim + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial',control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=2e5)));
summary(lm_use_cossim); 
# use_cossim non sig as main effect (p=0.34)
# 1M:use_cossim non sig (p=0.26); 2M:use_cossim non sig (p=0.21)

lm_script <- glmer(observed ~ scale(trialn) + testing_condition*script + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial');
summary(lm_script); 
# script non sig as main effect (p=0.49)
# 1M:script non sig (p=0.99)
# 2M:script sig (p=0.04)

lm_category <- glmer(observed ~ testing_condition*category + (1|sbj_ID), data=subset(data_BLP_testing, rt>300 & rt<3000), family='binomial',control=glmerControl(optimizer="bobyqa",optCtrl=list(maxfun=2e5)));
summary(lm_category); 
# category non sig as main effect (bi p=0.42; tri p=0.82; quadri p=0.63)
# 1M:category sig (bi p=0.004; tri p=0.02; quadri p=0.01)
# 2M:category sig (bi p=4e-5; tri p=0.001; quadri p=0.0002)


## 2M accuracy LMERs =================================================
lm_2M <- glmer(observed ~ scale(trialn) + expected + (1+expected|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M);
effect_2M <- as.data.frame(effect('expected',lm_2M,confint=list(alpha=.95)),
                           xlevels = list(expected=c(0,1)));

lm_2M_Gender <- glmer(observed ~ scale(trialn) + expected*Gender + (1+expected|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_Gender); 
# Gender non sig as main effect (Other p=0.37; Woman p=0.44); 
# expected:Gender non sig (Other p=0.25; Womanp=0.37)

lm_2M_Age <- glmer(observed ~ scale(trialn) + expected*scale(Age) + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_Age); 
# Age non sig as main effect (p=0.43)
# expected:Age non sig (p=0.50)

lm_2M_RC1 <- glmer(observed ~ scale(trialn) + expected*RC1_L3 + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_RC1); 
# RC1 non sig as main effect (p=0.64)
# expected:RC1 non sig (p=0.73)

lm_2M_RC9 <- glmer(observed ~ scale(trialn) + expected*RC9_L4 + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_RC9); 
# RC9 non sig as main effect (p=0.51)
# expected:RC9 non sig (p=0.51)

lm_2M_RC2 <- glmer(observed ~ scale(trialn) + expected*RC2_use_L1vsL2 + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_RC2); 
# RC2 non sig as main effect (p=0.16)
# expected:RC2 non sig (p=0.96)

lm_2M_RC8 <- glmer(observed ~ scale(trialn) + expected*RC8_hist_L2 + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_RC8); 
# RC8 sig as main effect (p=0.049)
# expected:RC8 non sig (p=0.83)

lm_2M_RC3 <- glmer(observed ~ scale(trialn) + expected*RC3_prof_L2 + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_RC3); 
# RC3 sig as main effect (p=0.02)
# expected:RC3 marg. sig (p=0.08)

lm_2M_ent <- glmer(observed ~ scale(trialn) + expected*ent + (1+expected|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_ent); 
# ent non sig as main effect (p=0.15)
# expected:ent non sig(p=0.92)

lm_2M_use_ent <- glmer(observed ~ scale(trialn) + expected*use_ent + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_use_ent); 
# use_ent non sig as main effect (p=0.17)
# expected:use_ent non sig (p=0.64)

lm_2M_multiexp <- glmer(observed ~ scale(trialn) + expected*scale(multiexp) + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_multiexp); 
# multiexp non sig as main effect (p=0.17)
# expected:multiexp non sig (p=0.79)

lm_2M_L1L2diff <- glmer(observed ~ scale(trialn) + expected*scale(L1_L2_diff) + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_L1L2diff); 
# L1L2diff sig as main effect (p=0.03)
# expected:L1L2diff non sig (p=0.66)

lm_2M_cossim <- glmer(observed ~ scale(trialn) + expected*scale(cossim) + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_cossim); 
# cossim non sig as main effect (p=0.62)
# expected:cossim non sig (0.19)

lm_2M_use_cossim <- glmer(observed ~ scale(trialn) + expected*scale(use_cossim) + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_use_cossim); 
# use_cossim non sig as main effect (p=0.84)
# expected:use_cossim non sig (p=0.54)

lm_2M_script <- glmer(observed ~ scale(trialn) + expected*script + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_script); 
# script non sig as main effect (p=25)
# expected:script marg. sig (p=0.59)

lm_2M_category <- glmer(observed ~ expected*category + (1|sbj_ID), data=data_BLP_testing[data_BLP_testing$testing_condition=='2M',], family='binomial');
summary(lm_2M_category); 
# category sig as main effect (bi p=0.02;tri p=0.03; quadri p=0.03)
# expected:category non sig (expected:bi p=0.66;expected:tri p=0.53; expected:quadri p=0.83)


## Familiarity LMERs =================================================
data_BLP_familiarity$correct_numerical <- as.numeric(data_BLP_familiarity$correct);

lm_fam_Gender <- glmer(correct ~ scale(trialn) + Gender + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_Gender); 
# Gender marg. sig (Other p=0.06; Woman p=0.82)

lm_fam_Age <- glmer(correct ~ scale(trialn) + scale(Age) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_Age); 
# Age marg. sig (p=0.056)

lm_fam_RC1 <- glmer(correct ~ scale(trialn) + RC1_L3 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC1); 
# RC1_L3 non sig (p=0.34)

lm_fam_RC9 <- glmer(correct ~ scale(trialn) + RC9_L4 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC9); 
# RC9_L4 non sig (p=0.50)

lm_fam_RC2 <- glmer(correct ~ scale(trialn) + RC2_use_L1vsL2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC2); 
# RC2_use_L1vsL2 non sig (p=0.52)

lm_fam_RC8 <- glmer(correct ~ scale(trialn) + RC8_hist_L2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC8); 
# RC8_hist_L2 non sig (p=0.41)

lm_fam_RC3 <- glmer(correct ~ scale(trialn) + RC3_prof_L2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC3); 
# RC3_prof_L2 marg. sig (p=0.07)

lm_fam_ent <- glmer(correct ~ scale(trialn) + ent + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_ent); 
# ent non sig (p=0.72)

lm_fam_use_ent <- glmer(correct ~ scale(trialn) + use_ent + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_use_ent); 
# use_ent non sig (p=0.86)

lm_fam_multiexp <- glmer(correct ~ scale(trialn) + scale(multiexp) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_multiexp); 
# multiexp non sig (p=0.63)

lm_fam_L1L2diff <- glmer(correct ~ scale(trialn) + scale(L1_L2_diff) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_L1L2diff); 
# L1_L2_diff non sig (p=0.36)

lm_fam_cossim <- glmer(correct ~ scale(trialn) + cossim + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_cossim); 
# cossim non sig (p=0.32)

lm_fam_use_cossim <- glmer(correct ~ scale(trialn) + use_cossim + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_use_cossim); 
# use_cossim non sig (p=0.53)

lm_fam_script <- glmer(correct ~ scale(trialn) + script + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_script); 
# script non sig (p=0.13)

lm_fam_category <- glmer(correct ~ scale(trialn) + category + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_category); 
# category non sig (bi p=0.52; tri p=0.44; quadri p=0.69)


## BH corrections of glmers ==========================================
# TO UPDATE
# "YES" responses glmers
p_values_yes <- c(summary(lm_TestingConditions)$coefficients[, "Pr(>|z|)"],
                  summary(lm_Gender)$coefficients[, "Pr(>|z|)"],
                  summary(lm_Age)$coefficients[, "Pr(>|z|)"],
                  summary(lm_RC1)$coefficients[, "Pr(>|z|)"],
                  summary(lm_RC3)$coefficients[, "Pr(>|z|)"],
                  summary(lm_RC2)$coefficients[, "Pr(>|z|)"],
                  summary(lm_RC7)$coefficients[, "Pr(>|z|)"],
                  summary(lm_RC9)$coefficients[, "Pr(>|z|)"],
                  summary(lm_ent)$coefficients[, "Pr(>|z|)"],
                  summary(lm_use_ent)$coefficients[, "Pr(>|z|)"],
                  summary(lm_multiexp)$coefficients[, "Pr(>|z|)"],
                  summary(lm_L1L2diff)$coefficients[, "Pr(>|z|)"],
                  summary(lm_script)$coefficients[, "Pr(>|z|)"],
                  summary(lm_category)$coefficients[, "Pr(>|z|)"]);

corrected_p_values_yes <- p.adjust(p_values_yes, method = "BH");

corrected_results_yes <- data.frame(
  Model = c(rep("lm_TestingConditions",4), 
            rep(c("lm_Gender","lm_Age", "lm_RC1","lm_RC3","lm_RC2","lm_RC7","lm_RC9"),each=7),
            rep(c("lm_ent","lm_use_ent"),each=6),
            rep(c("lm_multiexp","lm_L1L2diff"),each=7),
            rep("lm_script",6),
            rep("lm_script",12)),
  model_levels = c(c("(Intercept)","scale(trialn)","1M","2M"), 
                   rep(c('(Intercept)','scale(trialn)','1M','2M','pred_var','1M:pred_var','2M:pred_var'),7),
                   rep(c('(Intercept)','1M','2M','pred_var','1M:pred_var','2M_pred_var'),2),
                   rep(c('(Intercept)','scale(trialn)','1M','2M','pred_var','1M:pred_var','2M:pred_var'),2),
                   c('(Intercept)','1M','2M','pred_var','1M:pred_var','2M_pred_var'),
                   c('(Intercept)','1M','2M','bi','tri','quadri','1M:bi','2M:bi','1M:tri','2M:tri','1M:quadri','2M:quadri')),
  Coefficient = c(summary(lm_TestingConditions)$coefficients[, "Estimate"],
                  summary(lm_Gender)$coefficients[, "Estimate"],
                  summary(lm_Age)$coefficients[, "Estimate"],
                  summary(lm_RC1)$coefficients[, "Estimate"],
                  summary(lm_RC3)$coefficients[, "Estimate"],
                  summary(lm_RC2)$coefficients[, "Estimate"],
                  summary(lm_RC7)$coefficients[, "Estimate"],
                  summary(lm_RC9)$coefficients[, "Estimate"],
                  summary(lm_ent)$coefficients[, "Estimate"],
                  summary(lm_use_ent)$coefficients[, "Estimate"],
                  summary(lm_multiexp)$coefficients[, "Estimate"],
                  summary(lm_L1L2diff)$coefficients[, "Estimate"],
                  summary(lm_script)$coefficients[, "Estimate"],
                  summary(lm_category)$coefficients[, "Estimate"]),
  p_value = p_values_yes,
  corrected_p_value = corrected_p_values_yes
);

# 2M accuracy glmers
p_values_2M <- c(summary(lm_2M_Gender)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_Age)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_RC1)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_RC3)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_RC2)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_RC7)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_RC9)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_ent)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_use_ent)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_multiexp)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_L1L2diff)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_cossim)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_use_cossim)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_script)$coefficients[, "Pr(>|z|)"],
                 summary(lm_2M_category)$coefficients[, "Pr(>|z|)"]);

corrected_p_values_2M <- p.adjust(p_values_2M, method = "BH");

corrected_results_2M <- data.frame(
  Model = rep(c("lm_2M_Gender", "lm_2M_Age", "lm_2M_RC1","lm_2M_RC3","lm_2M_RC2",
                "lm_2M_RC7","lm_2M_RC9","lm_2M_ent","lm_2M_use_ent","lm_2M_multiexp",
                "lm_2M_L1L2diff","lm_2M_cossim","lm_2M_use_cossim","lm_2M_script","lm_2M_category"), each = length(p_values_2M) / 14),
  model_levels = rep(c('(Intercept)','scale(trialn)','expected','pred_var_level1','expected:pred_var'),14),
  Coefficient = c(summary(lm_2M_Gender)$coefficients[, "Estimate"],
                  summary(lm_2M_Age)$coefficients[, "Estimate"],
                  summary(lm_2M_RC1)$coefficients[, "Estimate"],
                  summary(lm_2M_RC3)$coefficients[, "Estimate"],
                  summary(lm_2M_RC2)$coefficients[, "Estimate"],
                  summary(lm_2M_RC7)$coefficients[, "Estimate"],
                  summary(lm_2M_RC9)$coefficients[, "Estimate"],
                  summary(lm_2M_ent)$coefficients[, "Estimate"],
                  summary(lm_2M_use_ent)$coefficients[, "Estimate"],
                  summary(lm_2M_multiexp)$coefficients[, "Estimate"],
                  summary(lm_2M_L1L2diff)$coefficients[, "Estimate"],
                  summary(lm_2M_cossim)$coefficients[, "Estimate"],
                  summary(lm_2M_use_cossim)$coefficients[, "Estimate"],
                  summary(lm_2M_script)$coefficients[, "Estimate"]),
  p_value = p_values_2M,
  corrected_p_value = corrected_p_values_2M
);

# familiarity glmers
p_values_fam <- c(summary(lm_fam_Gender)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_Age)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_RC1)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_RC3)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_RC2)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_RC7)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_RC9)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_ent)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_use_ent)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_multiexp)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_L1L2diff)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_cossim)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_use_cossim)$coefficients[, "Pr(>|z|)"],
                  summary(lm_fam_script)$coefficients[, "Pr(>|z|)"]);

corrected_p_values_fam <- p.adjust(p_values_fam, method = "BH");

corrected_results_fam <- data.frame(
  Model = rep(c("lm_fam_Gender", "lm_fam_Age", "lm_fam_RC1","lm_fam_RC3","lm_fam_RC2",
                "lm_fam_RC7","lm_fam_RC9","lm_fam_ent","lm_fam_use_ent","lm_fam_multiexp",
                "lm_fam_L1L2diff","lm_fam_cossim","lm_fam_use_cossim","lm_fam_script"), each = length(p_values_fam) / 13),
  model_levels = rep(c('(Intercept)','scale(trialn)','pred_var_level1'),14),
  Coefficient = c(summary(lm_fam_Gender)$coefficients[, "Estimate"],
                  summary(lm_fam_Age)$coefficients[, "Estimate"],
                  summary(lm_fam_RC1)$coefficients[, "Estimate"],
                  summary(lm_fam_RC3)$coefficients[, "Estimate"],
                  summary(lm_fam_RC2)$coefficients[, "Estimate"],
                  summary(lm_fam_RC7)$coefficients[, "Estimate"],
                  summary(lm_fam_RC9)$coefficients[, "Estimate"],
                  summary(lm_fam_ent)$coefficients[, "Estimate"],
                  summary(lm_fam_use_ent)$coefficients[, "Estimate"],
                  summary(lm_fam_multiexp)$coefficients[, "Estimate"],
                  summary(lm_fam_L1L2diff)$coefficients[, "Estimate"],
                  summary(lm_fam_cossim)$coefficients[, "Estimate"],
                  summary(lm_fam_use_cossim)$coefficients[, "Estimate"],
                  summary(lm_fam_script)$coefficients[, "Estimate"]),
  p_value = p_values_fam,
  corrected_p_value = corrected_p_values_fam
);


## Exploration of significant effects ================================
data_testing_conditions_BLP <- merge(data_testing_conditions,subset(data_BLP,select=c(sbj_ID,Gender,Age,RC2_use_L1vsL2,RC8_hist_L2,RC3_prof_L2,multiexp,L1_L2_diff,ent)),by="sbj_ID");

# "YES" - testing conditions
ggplot(data_testing_conditions, aes(x=condition, y=score, fill=condition)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_violin(alpha=0.75) +
  geom_boxplot(width=0.1) +
  ylim(0,1) +
  scale_fill_manual(values=c(cols2[100],cols2[200],"#004D40FF")) +
  labs(x = "Testing condition", y = 'Proportion of "yes" responses') +
  scale_x_discrete(labels=c("0M", "1M", "2M")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 20, color = "black"),
        text=element_text(family="CMU Serif",size=20),
        legend.position = "none");



# "YES" - Gender
ggplot(data_testing_conditions_BLP, aes(x=condition,y=score,color=Gender,group=interaction(condition,Gender))) +
  scale_color_manual(values=c(cols2[400],cols2[300],cols2[200])) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_boxplot(alpha = 0.1, width=0.75, lwd=1.5, show.legend=FALSE) +
  geom_point(position = position_dodge(width=0.75),size=4) +
  labs(x = "Condition", y = 'Proportion of "yes" responses') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28),
        legend.position=c(0.1,0.8),legend.background=element_rect(fill=NA)) +
  scale_y_continuous(expand = c(0, 0),breaks=seq(0,1,0.2)) +
  expand_limits(y = 1.05) +
  scale_x_discrete(labels=c("0M", "1M", "2M"));
# too few Gender = Other datapoints to be meaningful

# "YES" - Age
effect_Age <- as.data.frame(effect('testing_condition*scale(Age)',
                                   lm_Age, confint=list(alpha=.95)),
                            xlevels = list(Age = 18:25,
                                           testing_condition=c('0M','1M','2M')))

ggplot(effect_Age, aes(x=Age,y=fit)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_line(aes(color = testing_condition), lwd = 2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, fill = testing_condition), alpha = .5) +
  scale_color_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                     name="Condition",labels=c("0M","1M","2M")) +
  scale_fill_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                    name="Condition",labels=c("0M","1M","2M")) +
  labs(x = "Age", y = 'Proportion of "yes" responses', title = 'Fitted Line - Lme4') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28),
        legend.position=c(0.1,0.1),legend.background=element_rect(fill=NA)) 
# older = strongly morpheme familiarity effect

# "YES" - RC8
effect_RC8 <- as.data.frame(effect('testing_condition*RC8_hist_L2',
                                   lm_RC8, confint=list(alpha=.95)),
                            xlevels = list(RC8_hist_L2 = -2.1:3.1,
                                           testing_condition=c('0M','1M','2M')))

ggplot(effect_RC8, aes(x=RC8_hist_L2,y=fit)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_line(aes(color = testing_condition), lwd = 2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, fill = testing_condition), alpha = .5) +
  scale_color_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                     name="Condition",labels=c("0M","1M","2M")) +
  scale_fill_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                    name="Condition",labels=c("0M","1M","2M")) +
  labs(x = "RC8: L2 History", y = 'Proportion of "yes" responses', title = 'Fitted Line - Lme4') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28),
        legend.position=c(0.1,0.8),legend.background=element_rect(fill=NA)) 
# Earlier bilingual = more "yes" responses overall

# "YES" - RC3
effect_RC3 <- as.data.frame(effect('testing_condition*RC3_prof_L2',
                                        lm_RC3, confint=list(alpha=.95)),
                                 xlevels = list(RC3_prof_L2 = -4.1:1.6,
                                                testing_condition=c('0M','1M','2M')))

ggplot(effect_RC3, aes(x=RC3_prof_L2,y=fit)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_line(aes(color = testing_condition), lwd = 2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, fill = testing_condition), alpha = .5) +
  scale_color_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                     name="Condition",labels=c("0M","1M","2M")) +
  scale_fill_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                    name="Condition",labels=c("0M","1M","2M")) +
  labs(x = "RC3: L2 Proficiency", y = 'Proportion of "yes" responses', title = 'Fitted Line - Lme4') +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28),
        legend.position=c(0.1,0.9),legend.background=element_rect(fill=NA)) 
# More proficient L2 = stronger morpheme familiarity effect

# "YES" - L1L2diff
effect_L1L2diff <- as.data.frame(effect('testing_condition*scale(L1_L2_diff)',
                                        lm_L1L2diff, confint=list(alpha=.95)),
                                 xlevels = list(L1_L2_diff = 0:210,
                                                testing_condition=c('0M','1M','2M')))

ggplot(effect_L1L2diff, aes(x = L1_L2_diff, y = fit)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_line(aes(color = testing_condition), lwd = 2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, fill = testing_condition), alpha = .5) +
  scale_color_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                     name="Condition",labels=c("0M","1M","2M")) +
  scale_fill_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                    name="Condition",labels=c("0M","1M","2M")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28),
        legend.position=c(0.9,0.9),legend.background=element_rect(fill=NA)) +
  labs(x = 'Bilingual balance (L1-L2 difference)', y = 'Proportion of "yes" responses', title = 'Fitted Line - Lme4')
# More bilingual balance = stronger morph familiarity effect

# "YES" - ent
effect_ent <- as.data.frame(effect('testing_condition*ent',
                                        lm_ent, confint=list(alpha=.95)),
                                 xlevels = list(ent = 0:2,
                                                testing_condition=c('0M','1M','2M')))

ggplot(effect_ent, aes(x = ent, y = fit)) +
  geom_hline(yintercept=0.5, linetype="dashed", 
             color = "darkgray",lwd=1.25) +
  geom_line(aes(color = testing_condition), lwd = 2) +
  geom_ribbon(aes(ymin = lower, ymax = upper, fill = testing_condition), alpha = .5) +
  scale_color_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                     name="Condition",labels=c("0M","1M","2M")) +
  scale_fill_manual(values=c(cols2[100],cols2[200],"#004D40FF"),
                    name="Condition",labels=c("0M","1M","2M")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text = element_text(family = "CMU Serif", size = 28, color = "black"),
        text=element_text(family="CMU Serif",size=28),
        legend.position=c(0.1,0.9),legend.background=element_rect(fill=NA)) +
  labs(x = 'Multilingual balance (entropy)', y = 'Proportion of "yes" responses', title = 'Fitted Line - Lme4')
# More multilingual balance = stronger morph familiarity effect?


# 2M - RC8
par(mar=c(5,5,2,2));
plot(data_BLP_testing$RC8_hist_L2,data_BLP_testing$yes_2M,pch=19,
     xlab="RC8: L2 History",ylab='Percent of "yes" responses',cex.lab=2);
abline(lm(data_BLP_testing$yes_2M~data_BLP_testing$RC8_hist_L2), col = "red",lwd=2);
abline(h=50, lty=5);

# 2M - RC3
plot(data_BLP_testing$RC3_prof_L2,data_BLP_testing$yes_2M,pch=19,
     xlab="RC3: L2 Proficiency",ylab='Percent of "yes" responses',cex.lab=2);
abline(lm(data_BLP_testing$yes_2M~data_BLP_testing$RC8_hist_L2), col = "red",lwd=2);
abline(h=50, lty=5);

plot(data_BLP_testing$RC3_prof_L2,data_BLP_testing$score_2M,pch=19,
     xlab="RC3: L2 Proficiency",ylab='2M accuracy',cex.lab=2);
abline(lm(data_BLP_testing$score_2M~data_BLP_testing$RC8_hist_L2), col = "red",lwd=2);
abline(h=0.5, lty=5);

# 2M - L1L2diff
plot(data_BLP_testing$L1_L2_diff,data_BLP_testing$yes_2M,pch=19,
     xlab="Bilingual balance: L1-L2 difference",ylab='Percent of "yes" responses',cex.lab=2);
abline(lm(data_BLP_testing$yes_2M~data_BLP_testing$L1_L2_diff), col = "red",lwd=2);
abline(h=50, lty=5);


# 2M - script
plot(data_BLP_testing$script,data_BLP_testing$score_2M,pch=19,
     xlab="Script type",ylab='2M accuracy',cex.lab=2);
abline(h=0.5, lty=5);

# 2M - category
plot(data_BLP_testing$category,data_BLP_testing$yes_2M,pch=19,
     xlab="Multilingual category",ylab='2M "yes" responses',cex.lab=2);
abline(h=50, lty=5);

t.test(data_BLP_testing$yes_2M[data_BLP_testing$category=='mono'],mu=50);
#t=-3.29 p=0.001 CI=[45.30;48.82] -> sig below chance
t.test(data_BLP_testing$yes_2M[data_BLP_testing$category=='bi'],mu=50);
#t=100.02 p<2.2e-16 CI=[64.09;64.66] -> sig above chance
t.test(data_BLP_testing$yes_2M[data_BLP_testing$category=='tri'],mu=50);
#t=75.18 p<2.2e-16 CI=[63.19;63.89] -> sig above chance
t.test(data_BLP_testing$yes_2M[data_BLP_testing$category=='quadri'],mu=50);
#t=81.42 p<2.2e-16 CI=[64.97;65.71] -> sig above chance

plot(data_BLP_testing$category,data_BLP_testing$score_2M,pch=19,
     xlab="Multilingual category",ylab='2M accuracy',cex.lab=2);
abline(h=0.5, lty=5);

# familiarity - Gender
data_BLP_familiarity <- merge(data_BLP_familiarity,data_familiarity_means,by="sbj_ID");
colnames(data_BLP_familiarity)[which(names(data_BLP_familiarity) == "x")] <- "familiarity_mean";

plot(data_BLP_familiarity$Gender,data_BLP_familiarity$familiarity_mean,pch=19,
     xlab="Gender",ylab='Mean familiarity score',cex.lab=2);
abline(h=0.5, lty=5);
# too few Gender = Other datapoints to be meaningful

# familiarity - Age
plot(data_BLP_familiarity$Age,data_BLP_familiarity$familiarity_mean,pch=19,
     xlab="Age",ylab='Mean familiarity score',cex.lab=2);
abline(h=0.5, lty=5);
abline(lm(data_BLP_familiarity$familiarity_mean~data_BLP_familiarity$Age), col = "red",lwd=2);

# familiarity - RC3
plot(data_BLP_familiarity$RC3_prof_L2,data_BLP_familiarity$familiarity_mean,pch=19,
     xlab="RC3: L2 Proficiency",ylab='Mean familiarity score',cex.lab=2);
abline(h=0.5, lty=5);
abline(lm(data_BLP_familiarity$familiarity_mean~data_BLP_familiarity$RC3_prof_L2), col = "red",lwd=2);

par(mar=c(5, 4, 4, 2) + 0.1) # back to default


## CLUSTERING TREE ===================================================
data_BLP_short <- subset(data_BLP, select=c(HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,
                                            UseL1Score,UseL2Score,UseL3Score,UseL4Score,
                                            ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,
                                            AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,
                                            L1Score,L2Score,L3Score,L4Score,
                                            var,ent,use_ent,cossim,use_cossim,multiexp,L1_L2_diff,
                                            RC1_L3,RC9_L4,RC2_use_L1vsL2,RC8_hist_L2,RC3_prof_L2));
plot(varclus(as.matrix(data_BLP_short)))
















