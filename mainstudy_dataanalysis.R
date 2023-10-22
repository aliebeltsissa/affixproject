setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");

participants <- list("5aa787c66219a30001c765f8", "5ae5db897edeb000014a85ee", "5b212164cfbf200001cfb3ad", "5b213220809d160001a2c36d", "5bcd11401662020001fe82c1", "5c19254b0b9f6b00014769ee", "5c1bfabab0fcc900019d9ff4", "5caccaed2f93d700157b4782", "5cbe02ab39447e0001745a5e", "5cefe8856e0eec00015971dd", "5d9a125f1714540016a40a27", "5dab6e7d80e1780016d5bc9b", "5dcb33ab0550ef819f508abf", "5e12048c7605fe8839180a14", "5e283f8ad48ecf000ddd0724", "5e2c6968e97bec29709a53c6", "5e3ff59bf2160b23942ada93", "5e42b6421f44d3143440b25c", "5e42f03607b468000d8eb912", "5e433ed3393e971e19f4735d", "5e577e79ce30ae13226e61ae", "5e6d3324f14d262fced5bbfe", "5e87b28549538b0fdf96b318", "5e89e89bf025be000c01eead", "5e8b66490d48450346bf2755", "5e8c57d9b4483e012006e7aa", "5e8e55509422bb10abed1f54", "5e9bd025eb6b380e1d66d04c", "5ea171c1a8782801263e7540", "5ea9611edec14d052ada0bae", "5ea9cd383b32cf15448a86ac", "5eaae42f19a24d05cbd6ccb4", "5eaf1c50f3540c614eb973a5", "5eb35dff41a381156be161c2", "5eb71c59c55b3b0ce571ae7c", "5ebc0c153f8b2e04d3833423", "5ec12ed7a66dbf01c7d740c1", "5ec1c01a8ccaaa5ec0080c91", "5ec6d06c67b0da0fb6f85e83", "5ecbb4c00bc62403dae2df59", "5ecd21dec04cca02c9032485", "5ed013f88fce6e0d858b732e", "5ee623674afa60375e30eec3", "5ee83da8817af0000d47448f", "5ee942381a22491bbb7170f8", "5eef3de3fb4e031bf546d887", "5efd2964d36f63162f263795", "5f0471a92ec97b6d1aec7739", "5f09d989eff16b266fba44c0", "5f0d65ef2ad0c60009209f0f", "5f0f93938935de000855898b", "5f11c9f84078cd0888177499", "5f18a80367ef6b0bbc5f3720", "5f19fa0f3e85b20d0336258c", "5f1e8dc7e2161c86cdcd220a", "5f219602670e5a0af2cf5237", "5f33289c1fe9181376ee67d9", "5f33c58329beab1f63c0dfaa", "5f350f459bf003464a03ea5e", "5f47e34858dd331165bf9f00", "5f5a713d37f71112463ab4d9", "5f5e7de4c81d3672642cd612", "5f6cd5ce1758e90f12ae1123", "5f708f5f0d32bb66960d4473", "5f784f5b98f4963cdf902340", "5f7bd801486f5e1ce581980f", "5f858743256d25036d9fa693", "5f91dc284909fe0b08f9e2e1", "5f99cee5a2a7d109a1624e10", "5fa4258658811d03fbc6ce8b", "5fa4725a186c050edc3bcc20", "5fa5793490f10705755818c0", "5fa59d4d5a29c90da975efe9", "5fc2d2d79da439201ab6addc", "5fc44d83862e3e79b02e0438", "5fc781689771f106330abf6a", "5fd2416e5061f30735e202e9", "5fd69a0014c3b25ee539f66b", "5fd9c5c67fa7c74ec42bb318", "5fdbf74c5474cd11e39eeaf3", "5fe2308a91773957e88b89be", "600e0dadada7da69afc5b3de", "600f0f9c3bfcdc077c924e51", "60123adc24c9f126819861b6", "601705a0246e51313e8ed38e", "601951245f481e000980504f", "601b5c79e845ac360826c9df", "601ffb441dc6d959b855eea5", "602bb123612bfe330818d4ef", "6042a56575ab0c1ccffc3152", "60491025dd8eb31e48a0ca8d", "60536ffae4f98513b671f482", "605aa0bb5fb71bbcf0808892", "60645fe61129208791535d15", "6065d7d47409810344f7e6bb", "60664619eac28843177fee96", "60670ac0fc7e169231369ab1", "606dc21c1ce7dc64af9d81fb", "6074768dc48e0753011d3d72", "607ea5504e74d104da5a108a", "60883a7e91c0be66dbb96fc8", "608858869a591bd129fbbc6c", "608c2e566d92c2aa3543e2d2", "608c64e14968cdd8dcbe1be4", "6092e2aac56871319199b6a5", "6093cacf9a39751eedd55916", "60957b300f08087b0af0031c", "60a3fe2d888e7a090d6d8f82", "60a68725b2b424dc0d7ce793", "60b7b8126c0c4524e913236e", "60bbe0da43325dadf2b1b6a9", "60c49e68081928c86ba7b98a", "60d478e72e8251287b641b2d", "60d7605d7af8d66774061717", "60db4aed5dd7b87124f51341", "60dee3200c7c3355c62326d9", "60e12640be1b69b66053d55b", "60e3b18d3d4205b4c52ada56", "60e9ea97d19e613e60a994da", "60eb26fb8db6845a14fe5a91", "60ec51c51a3158a50ded8a3e", "60edd136d544e7c8f5fac8a7", "60f030dca19a06db1b50d16a", "60f56f0103876eae7c0d870f", "60f579085ebf24f9c80f223e", "60f6b8f8e574e14634ead43e", "60f88d7fef1959734061e5a7", "60fd0f49858465796afd5da9", "6100174f92a7a0e5141b195e", "61001b6892ebd05a24fe82e1", "61055020201a7da5a704f7dd", "6107d788163252e3b5c348e3", "610834993bac40f050062896", "610958b8473c7b96e4bd207d", "610a52647a452dee7ca89360", "610d2275ba5f1ee0fdcee3e8", "610f2eabb45be8717fc155e0", "61125e23136464bd2cbbefc9", "61143bd22a1649da3b52ae32", "611bdb0fed7c9df6dce28c3f", "611cebb780fbae98c5bcc84d", "611dc53f0098557586e89b17", "611e7d1295185bf6f56fd951", "611e9c16e90a0d4c6f0d8df5", "611eafa6011b0423f7d7230f",
                     "611eeafa283a2d1f57537fea", "6120211d8e1eab16fcb7ad69", "6122966a93af160af481836c", "6124a4ba3df07e768bd9c90b", "61275a3158c67415afb971ff", "612a98181f4b6d1cf01f926c", "61301fcb49db2f170cb02b93", "6131f7010e926c9103558040", "613867f34e206e4f573bc6ef", "613a73d06cf1fcfef304d3fa", "613ab1e64acd61ebd0a7116d", "613f57084e80f056c78f9b7b", "6140f1c4ead758f1b72bbe2f", "6140ff9c5750f0081ca8d71f", "6144742e57a61e489cc9e978", "6147aed5b2a4f748dc2b6ba4", "614b323022fcd8b7408005a6", "614c80483d06dcf7ad552679", "614c8e5469405530dc27b9d5", "614dd6473c74b217ad73cc9c", "61520b079436973e05f72d33", "61548fa2b637194e04c9bc09", "6155e204cc071b306458dfff", "6156a440279fdf408ee663ae", "6156b68cc77b48d6693b361c", "615b042301e3a24311563ee4", "615b1ab789b14c9996251fb4", "615b41767003d4ece749ed9d", "615da9ee365ab7d547b98979", "615f371e6688c87e53e7acf5", "61616ce2bb94584e11c911af", "6163faf9d9ac4586fe776568", "616494f1ae4537c01914c758", "616631efeeac0979c1ba85a9", "616891e25a026e1f7262116c", "616eb493bb7e4ab4fa1de8d4", "6170821d1e8ffb9c893b28a4", "6171349b89a54d4823f9eca1", "617142c2a843eef6f8f148b6", "6171d922c871ba795b6a4827", "6172078b966225960be2a7b5", "617679054948369cb824d837", "63ee5d8aaee278de46b7d4cc", "6455490f7c5f35e4221a810a", "64764d56699f097a96ec6e5c", "64973d83e4fc64d6ae59c370", "64a288758b7c82ff2d18da75", "64ef422a4789bd6b6b9042ce", "65032a60861e9a17bc1a7444", "65089e7ce53888b0b3840c62", "650aee87054446f772acdfcc");

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
    contingencyTable <- xtabs(~ expectedResp[sbj==s] + observedResp[sbj==s]); 
    percVector <- contingencyTable[,2] / xtabs(~ expectedResp[sbj==s]);
    nTrials <- length(expectedResp);
    
    zhr <- ifelse( percVector[2]==1, qnorm( 1-(1/(2*nTrials))), qnorm(percVector[2]));
    zfar <- ifelse(percVector[1]==0, qnorm( 1/(2*nTrials) ), qnorm(percVector[1])); 
    dprimes[counter] <- round(zhr - zfar, digits = 3);
    log_beta[counter] <- round((zfar^2 - zhr^2)/2, digits = 3); #this is taken from Stanislaw and Todorov, PBR 1999. Log_beta=0 indicates no bias; negative values is bias for YES; positive values is bias for NO
    c[counter] <- round( -(zhr + zfar)/2, digits = 3); # this is taken again from Stanislaw and Todorov, PBR 1999, who note that c "...assumes that subjects respond yes when the decision variable exceeds the criterion and no otherwise; responses are based directly on the decision variable, which some researchers regard as more plausible than assuming that responses are based on a likelihood ratio [which the assumption behind beta] (Richardson, 1994). Another advantage of c is that it is unaffected by changes in d', whereas {3 is not (Ingham, 1970; Macmil- lan, 1993; McNicol, 1972, pp. 63--64)". Similarly to log_beta, c=0 is no bias, negative c is bias for YES, negative c is bias for NO.
    
    subjects[counter] <- s;
    
    counter <- counter + 1;
  };
  
  print(data.frame(sbj=subjects, dprime=dprimes, log_beta=log_beta, c=c));
};

###########
# TESTING #
###########

# import testing data
data_all_testing <- read.csv("testing_preprocessed_clean.csv",header=T,sep=",");
data_all_testing <- subset(data_all_testing, select = -c(X)) # remove redundant column added by Pavlovia
data_testing <- data_all_testing[data_all_testing$sbj_ID %in% participants,]; # n = 196 participants
data_testing <- data_testing[!data_testing$sbj_ID %in% c('615b41767003d4ece749ed9d', '5e8b66490d48450346bf2755','615b042301e3a24311563ee4'),]
# exclusion:
#1. said yes to all BLP use questions
#2-3. means RTs above 2s

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
# familiarity data: only 36% accuracy

# make some variables factors
data_testing$sbj_ID <- as.factor(data_testing$sbj_ID);
data_testing$task <- as.factor(data_testing$task);
data_testing$item <- as.factor(data_testing$item);
data_testing$testing_condition <- as.factor(data_testing$testing_condition);
data_testing$correct <- as.logical(data_testing$correct);
summary(data_testing);

# testing RTs
library(paletteer);
cols <- paletteer_d("palettesForR::Named");
IDs <- list(data_testing$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_testing$rt[data_testing$sbj_ID==IDs[1]],na.rm=TRUE),xlim=c(0,2200),ylim=c(0,0.007),xlab="RTs (ms)",main="",xaxt = "n",col=cols[1],yaxs="i",lwd=1,cex.lab=1.5);
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
for (x in 2:195) {
  lines(density(data_testing$rt[data_testing$sbj_ID==IDs[x]],na.rm=TRUE),col=cols[x],lwd=1)
};
data_testing_rt_means <- aggregate(data_testing$rt, list(data_testing$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_testing_rt_means);
plot(data_testing_rt_means$x, ylab="Mean participant RT (ms)",xlab="Participants",main="",xaxt = "n",pch=3,yaxs="i",ylim=c(0,2750))

# 0M yes responses boxplot
data_testing_0M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='0M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN = function(x) sum(x == 0));
colnames(data_testing_0M_yes)[colnames(data_testing_0M_yes)=="Group.1"]="sbj_ID";
colnames(data_testing_0M_yes)[colnames(data_testing_0M_yes)=="x"]="x_0";
boxplot(data_testing_0M_yes$x, ylab = "Percent of 'yes' responses");
abline(h=50, lty=5);

# 0M scores
data_testing_0M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='0M'], list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN=mean, na.rm=TRUE);
colnames(data_testing_0M_means)[colnames(data_testing_0M_means)=="Group.1"]="sbj_ID";
colnames(data_testing_0M_means)[colnames(data_testing_0M_means)=="x"]="x_0";
summary(data_testing_0M_means);
#min:0 Q1:0.40 med:0.50 mean:0.51 Q3:0.6 max:0.88
plot(data_testing_0M_means$x_0,pch=3,ylim=c(0,1));
abline(h=0.5, lty=5);
#6170821d1e8ffb9c893b28a4 at 0% -> 100% at 1M (!) and 44% at 2M
#quite a wide range of scores
hist(data_testing_0M_means$x_0); # normally distributed
t.test(data_testing_0M_means$x_0, mu=50);
#t=-4707 p<2.2e-16 CI=[0.48,0.53] -> not significantly different from 0

# 1M yes responses boxplot
data_testing_1M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='1M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN = function(x) sum(x == 0));
colnames(data_testing_1M_yes)[colnames(data_testing_1M_yes)=="Group.1"]="sbj_ID";
colnames(data_testing_1M_yes)[colnames(data_testing_1M_yes)=="x"]="x_1";
boxplot(data_testing_1M_yes$x, ylab = "Percent of 'yes' responses");
abline(h=50, lty=5);

# 1M scores
data_testing_1M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='1M'], list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN=mean, na.rm=TRUE);
colnames(data_testing_1M_means)[colnames(data_testing_1M_means)=="Group.1"]="sbj_ID";
colnames(data_testing_1M_means)[colnames(data_testing_1M_means)=="x"]="x_1";
summary(data_testing_1M_means);
#60d478e72e8251287b641b2d & 6170821d1e8ffb9c893b28a4 at 100%? -> they're at 0.5 and 0.44 respectively in 2M
plot(data_testing_1M_means$x_1,pch=3,ylim=c(0,1));
abline(h=0.5, lty=5);
#quite a wide range of scores
hist(data_testing_1M_means$x_1); # normally distributed
t.test(data_testing_1M_means$x_1, mu=50);
#t=-4879.5 p<2.2e-16 CI=[0.53,0.57]

# 2M yes responses boxplot
data_testing_2M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='2M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN = function(x) sum(x == 0));
colnames(data_testing_2M_yes)[colnames(data_testing_2M_yes)=="Group.1"]="sbj_ID";
colnames(data_testing_2M_yes)[colnames(data_testing_2M_yes)=="x"]="x_2";
boxplot(data_testing_2M_yes$x, ylab = "Percent of 'yes' responses");
abline(h=50, lty=5);

# yes responses across conditions
library(tidyverse);
data_testing_conditions <- list(data_testing_0M_yes,data_testing_1M_yes,data_testing_2M_yes) %>% reduce(inner_join, by='sbj_ID');
boxplot(data_testing_conditions$x_0,data_testing_conditions$x_1,data_testing_conditions$x_2, ylab='Percent of "yes" responses', xlab="Condition", names=c('0M','1M','2M'));
abline(h=50, lty=5);
conditions_table <- table(data_testing$testing_condition, data_testing$observed);
chisq.test(conditions_table);
# X-squared=307.32, df=2, p<2.2e-16

library(ggplot2);
conditions_dataframe <- as.data.frame(conditions_table);
ggplot(conditions_dataframe,
       aes(x = Var1,
           y = Freq,
           fill = Var2)) + 
  geom_bar(stat = "identity") +
  theme(axis.line = element_line()) +
  theme_classic() +
  scale_y_continuous(limits = c(0,8000), expand = c(0, 0)) +
  labs(x="Testing conditions", y="Frequency of responses", fill="Response") +
  scale_fill_manual(values = c("#F1BB7B","#FD6467"), labels=c("Yes","No"));

# 2M correct boxplot
data_testing_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN=mean, na.rm=TRUE);
colnames(data_testing_2M_means)[colnames(data_testing_2M_means)=="Group.1"]="sbj_ID";
colnames(data_testing_2M_means)[colnames(data_testing_2M_means)=="x"]="x_2";
boxplot(data_testing_2M_means$x_2, ylab = "Accuracy score");
abline(h=0.5, lty=5);
summary(data_testing_2M_means$x_2);
#min:0.26 Q1:0.44 med:0.50 mean:0.50 Q3:0.54 max:0.71
plot(data_testing_2M_means$x_2,pch=3,ylim=c(0,1));
abline(h=0.5, lty=5); 
#nicely clustered around 50%
hist(data_testing_2M_means$x_2); # normally distributed
t.test(data_testing_2M_means$x_2, mu=50);

# yes responses across conditions
library(tidyverse);
data_testing_conditions_scores <- list(data_testing_0M_means,data_testing_1M_means,data_testing_2M_means) %>% reduce(inner_join, by='sbj_ID');
summary(data_testing_conditions_scores);
boxplot(data_testing_conditions_scores$x_0,data_testing_conditions_scores$x_1,data_testing_conditions_scores$x_2, ylab='Percent of correct responses', xlab="Condition", ylim=c(0,1), names=c('0M','1M','2M'));
abline(h=0.5, lty=5);

# 2M - hits only
data_testing_2M_hits_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='0'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='0']), FUN=mean, na.rm=TRUE);
colnames(data_testing_2M_hits_means)[colnames(data_testing_2M_hits_means)=="Group.1"]="sbj_ID";
boxplot(data_testing_2M_hits_means$x, ylab = "Accuracy score - 2M hits");
abline(h=0.5, lty=5);
summary(data_testing_2M_hits_means$x);
# min:0.12 Q1:0.53 med:0.65 mean:0.64 Q3:0.71 max:1
hist(data_testing_2M_hits_means$x); # normally distributed
t.test(data_testing_2M_hits_means$x, mu=50);
# significantly above chance: t=-4444, p<2.2e-16, CI=[0.62,0.66]
plot(data_testing_2M_hits_means$x,ylim=c(0,1),ylab = "Hits",xlab="Participants",main="2M testing accuracy",pch=3,yaxs="i",col="#3B9AB2");
abline(h=0.5, lty=5);

# 2M - correct rejections only
data_testing_2M_rejs_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='1'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='1']), FUN=mean, na.rm=TRUE);
colnames(data_testing_2M_rejs_means)[colnames(data_testing_2M_rejs_means)=="Group.1"]="sbj_ID";
boxplot(data_testing_2M_rejs_means$x, ylim=c(0,1), ylab = "Accuracy score - 2M correct rejections");
abline(h=0.5, lty=5);
summary(data_testing_2M_rejs_means$x);
# min:0.0 Q1:0.24 med:0.35 mean:0.36 Q3:0.47 max:0.94
hist(data_testing_2M_rejs_means$x); # normally distributed
t.test(data_testing_2M_rejs_means$x, mu=50);
# significantly below chance: t=-4174, p<2.2e-16, CI=[0.33,0.38]
plot(data_testing_2M_rejs_means$x,ylim=c(0,1),ylab = "Correct rejections",xlab="Participants",pch=3,yaxs="i",col="#E1AF00");
abline(h=0.5, lty=5);

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
colnames(data_testing_2M_bygroup_means)[colnames(data_testing_2M_bygroup_means)=="x.x"]="hits_mean";
colnames(data_testing_2M_bygroup_means)[colnames(data_testing_2M_bygroup_means)=="x.y"]="rejs_mean";
data_long <- reshape2::melt(data_testing_2M_bygroup_means, id.vars = "sbj_ID", variable.name = "condition", value.name = "accuracy");
ggplot(data_long, aes(x = condition, y = accuracy, group = sbj_ID)) +
  geom_line(size=0.2) +
  geom_point(aes(color = condition), size = 3);

#4 - plot of difference between hit & correct rejection accuracy
data_testing_2M_bygroup_means$diff <- data_testing_2M_bygroup_means$hits_mean-data_testing_2M_bygroup_means$rejs_mean;
plot(data_testing_2M_bygroup_means$diff,ylim=c(-1,1),ylab="Accuracy difference",main="Difference between hits & correct rejection accuracy",xlab="Participants",pch=19,yaxs="i",col="#0B775E",cex=1.5);
abline(h=0, lty=5);

# testing accuracy*RTs
cor(data_testing_2M_means$x, data_testing_rt_means$x); # r = 0.04
plot(data_testing_rt_means$x, data_testing_2M_means$x, pch=19);

cor(data_testing_2M_hits_means$x, data_testing_rt_means$x); # r = 0.04
plot(data_testing_rt_means$x, data_testing_2M_hits_means$x, pch=19);

cor(data_testing_2M_rejs_means$x, data_testing_rt_means$x); # r = -0.01
plot(data_testing_rt_means$x, data_testing_2M_rejs_means$x, pch=19);

# testing d'
dprimes <- dPrime(data_testing$sbj_ID, data_testing$expected, data_testing$observed);
summary(dprimes)

data_testing_2M <- data_testing[data_testing$testing_condition == '2M',];
dprimes2M <- dPrime(data_testing_2M$sbj_ID, data_testing_2M$expected, data_testing_2M$observed);
# ERROR: subscript out of bounds?
summary(data_testing_2M);

# testing strategy
library(tidyverse)
strats <- subset(data_testing, select = c(sbj_ID, strategy));
strats <- strats[!duplicated(strats),];

# boxplot for accuracy of participants saying they just used intuition
data_testing$intuition <- FALSE;
data_testing$intuition[data_testing$sbj_ID=='6172078b966225960be2a7b5'|data_testing$sbj_ID=='5ee83da8817af0000d47448f'|data_testing$sbj_ID=='5ed013f88fce6e0d858b732e'|data_testing$sbj_ID=='5f858743256d25036d9fa693'|data_testing$sbj_ID=='60a68725b2b424dc0d7ce793'|data_testing$sbj_ID=='5eaf1c50f3540c614eb973a5'|data_testing$sbj_ID=='5fa59d4d5a29c90da975efe9'|data_testing$sbj_ID=='5e89e89bf025be000c01eead'|data_testing$sbj_ID=='5f11c9f84078cd0888177499'|data_testing$sbj_ID=='5fe2308a91773957e88b89be'|data_testing$sbj_ID=='605aa0bb5fb71bbcf0808892'|data_testing$sbj_ID=='60645fe61129208791535d15'|data_testing$sbj_ID=='60d7605d7af8d66774061717'|data_testing$sbj_ID=='5ae5db897edeb000014a85ee'|data_testing$sbj_ID=='5fa5793490f10705755818c0'|data_testing$sbj_ID=='5fd2416e5061f30735e202e9'|data_testing$sbj_ID=='60ec51c51a3158a50ded8a3e'|data_testing$sbj_ID=='5fc781689771f106330abf6a'|data_testing$sbj_ID=='5e8e55509422bb10abed1f54'|data_testing$sbj_ID=='5f18a80367ef6b0bbc5f3720'|data_testing$sbj_ID=='5f0d65ef2ad0c60009209f0f'|data_testing$sbj_ID=='617142c2a843eef6f8f148b6'|data_testing$sbj_ID=='611e9c16e90a0d4c6f0d8df5'|data_testing$sbj_ID=='5b213220809d160001a2c36d'|data_testing$sbj_ID=='6155e204cc071b306458dfff'|data_testing$sbj_ID=='60a3fe2d888e7a090d6d8f82'|data_testing$sbj_ID=='61125e23136464bd2cbbefc9'|data_testing$sbj_ID=='5ec6d06c67b0da0fb6f85e83'|data_testing$sbj_ID=='5dcb33ab0550ef819f508abf'|data_testing$sbj_ID=='613867f34e206e4f573bc6ef'|data_testing$sbj_ID=='5f219602670e5a0af2cf5237'|data_testing$sbj_ID=='614c8e5469405530dc27b9d5'|data_testing$sbj_ID=='6156b68cc77b48d6693b361c'|data_testing$sbj_ID=='60f030dca19a06db1b50d16a'|data_testing$sbj_ID=='611cebb780fbae98c5bcc84d'|data_testing$sbj_ID=='5eb35dff41a381156be161c2'|data_testing$sbj_ID=='611eeafa283a2d1f57537fea'|data_testing$sbj_ID=='5f91dc284909fe0b08f9e2e1'|data_testing$sbj_ID=='5ecd21dec04cca02c9032485'] <- TRUE;
data_testing_intuition_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'& data_testing$intuition==TRUE], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'& data_testing$intuition==TRUE]), FUN=mean, na.rm=TRUE);
colnames(data_testing_intuition_2M_means)[colnames(data_testing_intuition_2M_means)=="Group.1"]="sbj_ID";
boxplot(data_testing_intuition_2M_means$x, ylab = "Accuracy score (in %)");
abline(h=0.5, lty=5);
summary(data_testing_intuition_2M_means); # mean: 48%

###############
# FAMILIARITY #
###############
data_all_familiarity <- read.csv("familiarity_preprocessed_clean.csv",header=T,sep=",");
data_all_familiarity <- subset(data_all_familiarity, select = -c(X)) # remove redundant column added by Pavlovia
data_familiarity <- data_all_familiarity[data_all_familiarity$sbj_ID %in% participants,]; # n = 196 participants
data_familiarity <- data_familiarity[!data_familiarity$sbj_ID %in% c('615b41767003d4ece749ed9d', '5e8b66490d48450346bf2755','615b042301e3a24311563ee4'),] # same participants excluded as for testing

familiarity_missing <- data_familiarity[data_familiarity$sbj_ID=='6156b68cc77b48d6693b361c',];
# this participant only has 27 datapoints instead of 28 somehow

# looking at data from participant 5aa787c66219a30001c765f8
temp2 <- data_familiarity[data_familiarity$sbj_ID=='5aa787c66219a30001c765f8',];
summary(temp2);

# make some variables factors
data_familiarity$sbj_ID <- as.factor(data_familiarity$sbj_ID);
data_familiarity$task <- as.factor(data_familiarity$task);
data_familiarity$correct <- as.logical(data_familiarity$correct);
data_familiarity$target <- as.factor(data_familiarity$target);
data_familiarity$confound <- as.factor(data_familiarity$confound);

# familiarity accuracy boxplot
data_familiarity_means <- aggregate(data_familiarity$correct, list(data_familiarity$sbj_ID), FUN=mean);
boxplot(data_familiarity_means$x, ylab = "Familiarity score");
abline(h=0.5, lty=5);
summary(data_familiarity_means$x);
# min:0.29 Q1:0.50 med:0.57 mean:0.57 Q3:0.64 max:0.86
hist(data_familiarity_means$x); # normally distributed
t.test(data_familiarity_means$x, mu=50);
# t = -6768, p < 2.2e-16, CI = [0.55, 0.58]
# significantly above chance

# familiarity RTs
IDs <- list(data_familiarity$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[1]]),xlim=c(0,4000),ylim=c(0,0.005),xlab="Familiarity RTs (ms)",main="",xaxt = "n",col=cols[1],lwd=2,yaxs="i");
axis(1, at = c(0,500,1000,1500,2000,2500,3000,3500,4000));
for (x in 2:193) {
  lines(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[x]]),col=cols[x],lwd=2)
};
legend("topright",title="Participant:",legend=c(1:193),fill=cols,bty = "n",
       cex=0.75,y.intersp=0.5);
data_familiarity_rt_means <- aggregate(data_familiarity$rt, list(data_familiarity$sbj_ID), FUN=mean, na.rm=TRUE);

# familiarity accuracy*RTs
cor(data_familiarity_means$x, data_familiarity_rt_means$x); # r = 0.20
plot(data_familiarity_rt_means$x, data_familiarity_means$x, xlab="Mean participant RT (in ms)", ylab="Mean participant familiarity score (in %)", pch=19, cex=2, cex.lab=1.45);

# familiarity accuracy*testing accuracy
cor(data_familiarity_means$x, data_testing_2M_means$x); # r = 0.11
cor(data_familiarity_means$x, data_testing_2M_hits_means$x); # r = 0.12
cor(data_familiarity_means$x, data_testing_2M_rejs_means$x); # r = -0.02

#######
# BLP #
#######
data_all_BLP <- read.csv("BLP_preprocessed.csv",header=T,sep=",");
data_all_BLP <- subset(data_all_BLP, select = -c(X)) # remove redundant column added by Pavlovia
data_BLP <- data_all_BLP[data_all_BLP$sbj_ID %in% participants,]; # n = 196 participants
data_BLP <- data_BLP[!data_BLP$sbj_ID %in% c('615b41767003d4ece749ed9d','5e8b66490d48450346bf2755','615b042301e3a24311563ee4'),] # same participants excluded as for testing
data_BLP <- subset(data_BLP, select = -c(AoAgioL1, AoAgioL2, AoAgioL3, AoAgioL4, anniInstrL1, anniInstrL2, anniInstrL3, anniInstrL4, anniPaeseL1, anniPaeseL2, anniPaeseL3, anniPaeseL4, anniFamigliaL1, anniFamigliaL2, anniFamigliaL3, anniFamigliaL4, anniLavoroL1, anniLavoroL2, anniLavoroL3, anniLavoroL4, PercAmiciL1, PercAmiciL2, PercAmiciL3, PercAmiciL4, PercFamigliaL1, PercFamigliaL2, PercFamigliaL3, PercFamigliaL4, PercLavoroL1, PercLavoroL2, PercLavoroL3, PercLavoroL4, PercStessoL1, PercStessoL2, PercStessoL3, PercStessoL4, PercCalcoliL1, PercCalcoliL2, PercCalcoliL3, PercCalcoliL4, ProfParlaL1, ProfParlaL2, ProfParlaL3, ProfParlaL4, ProfCapisceL1, ProfCapisceL2, ProfCapisceL3, ProfCapisceL4, ProfLeggeL1, ProfLeggeL2, ProfLeggeL3, ProfLeggeL4, ProfScriveL1, ProfScriveL2, ProfScriveL3, ProfScriveL4, AttMiStessoL1, AttMiStessoL2, AttMiStessoL3, AttMiStessoL4, AttCulturaL1, AttCulturaL2, AttCulturaL3, AttCulturaL4, AttLivNativoL1, AttLivNativoL2, AttLivNativoL3, AttLivNativoL4, AttMadrelinguaL1, AttMadrelinguaL2, AttMadrelinguaL3, AttMadrelinguaL4));

# standardise language responses
data_BLP[data_BLP == "polish"|data_BLP == "POLISH"] <- "Polish";
data_BLP[data_BLP == "portuguese"|data_BLP == "Portugal"] <- "Portuguese";
data_BLP[data_BLP == "italian"] <- "Italian";
data_BLP[data_BLP == "spanish"] <- "Spanish";
data_BLP[data_BLP == "greek"|data_BLP=="Greece"] <- "Greek";
data_BLP[data_BLP == "french"|data_BLP=="fRANCH"] <- "French";
data_BLP[data_BLP == "arabic"] <- "Arabic";
data_BLP[data_BLP == "ENGLISH"|data_BLP == "english"|data_BLP == "englis"|data_BLP == "eanglish"|data_BLP == "Enlish"] <- "English";
data_BLP[data_BLP == "xhosa"|data_BLP=="XHOSA"] <- "Xhosa";
data_BLP[data_BLP == "tshivenda"] <- "Tshivenda";
data_BLP[data_BLP == "SETSWANA"] <- "Setswana";
data_BLP[data_BLP == "zulu"] <- "Zulu";
data_BLP[data_BLP == "TSWANA"] <- "Tswana";
data_BLP[data_BLP == "sotho"] <- "Sotho";
data_BLP[data_BLP == "SHONA"] <- "Shona";
data_BLP[data_BLP == "hungarian"] <- "Hungarian";
data_BLP[data_BLP == "afrikaans"|data_BLP=="AFRIKAANS"] <- "Afrikaans";
data_BLP[data_BLP == "german"|data_BLP=="GERMAN"|data_BLP=="germany"|data_BLP=="Deustch"] <- "German";
data_BLP[data_BLP == "sweedish"] <- "Swedish";
data_BLP[data_BLP == "Deutch"] <- "Dutch"; # probably - maybe Deutsch?
data_BLP[data_BLP == "SESOTHO"] <- "Sesotho";
data_BLP[data_BLP == "RUSSIAN"|data_BLP=="russian"] <- "Russian";
data_BLP[data_BLP == "tswana"] <- "Tswana";
data_BLP[data_BLP == "SEPEDI"|data_BLP=="sepedi"] <- "Sepedi";
data_BLP[data_BLP == "N/A"] <- "n/a";

# correcting some participants' demographic information - correction based off of Prolific's information
data_BLP["Age"][data_BLP["sbj_ID"] == "5aa787c66219a30001c765f8"] <- "24";
data_BLP["Gender"][data_BLP["sbj_ID"] == "5aa787c66219a30001c765f8"] <- "Man";
data_BLP["Gender"][data_BLP["sbj_ID"] == "5bcd11401662020001fe82c1"] <- "Man";
data_BLP["Gender"][data_BLP["sbj_ID"] == "5e3ff59bf2160b23942ada93"] <- "Man";
data_BLP["Age"][data_BLP["sbj_ID"] == "5e577e79ce30ae13226e61ae"] <- "24";
data_BLP["Age"][data_BLP["sbj_ID"] == "5e8c57d9b4483e012006e7aa"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "5ecbb4c00bc62403dae2df59"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "5ee942381a22491bbb7170f8"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "5f219602670e5a0af2cf5237"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "5f47e34858dd331165bf9f00"] <- "21";
data_BLP["Gender"][data_BLP["sbj_ID"] == "5f5a713d37f71112463ab4d9"] <- "Woman";
data_BLP["Age"][data_BLP["sbj_ID"] == "5f99cee5a2a7d109a1624e10"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "5fa4725a186c050edc3bcc20"] <- "23";
data_BLP["Age"][data_BLP["sbj_ID"] == "5fc2d2d79da439201ab6addc"] <- "24";
data_BLP["Age"][data_BLP["sbj_ID"] == "5fc44d83862e3e79b02e0438"] <- "24";
data_BLP["Age"][data_BLP["sbj_ID"] == "5fd9c5c67fa7c74ec42bb318"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "6065d7d47409810344f7e6bb"] <- "24";
data_BLP["Age"][data_BLP["sbj_ID"] == "60883a7e91c0be66dbb96fc8"] <- "23";
data_BLP["Age"][data_BLP["sbj_ID"] == "608c2e566d92c2aa3543e2d2"] <- "22";
data_BLP["Age"][data_BLP["sbj_ID"] == "60e3b18d3d4205b4c52ada56"] <- "24";
data_BLP["Gender"][data_BLP["sbj_ID"] == "60e9ea97d19e613e60a994da"] <- "Man";
data_BLP["Age"][data_BLP["sbj_ID"] == "611eafa6011b0423f7d7230f"] <- "20";
data_BLP["Age"][data_BLP["sbj_ID"] == "612a98181f4b6d1cf01f926c"] <- "21";
data_BLP["Age"][data_BLP["sbj_ID"] == "61301fcb49db2f170cb02b93"] <- "25";
data_BLP["Age"][data_BLP["sbj_ID"] == "6156b68cc77b48d6693b361c"] <- "21";
data_BLP["Age"][data_BLP["sbj_ID"] == "616891e25a026e1f7262116c"] <- "22";
data_BLP["Gender"][data_BLP["sbj_ID"] == "616eb493bb7e4ab4fa1de8d4"] <- "Woman";
data_BLP["Age"][data_BLP["sbj_ID"] == "6171d922c871ba795b6a4827"] <- "23";

# participants having declared they speak a load of languages to Prolific:
#60ec51c51a3158a50ded8a3e
#6093cacf9a39751eedd55916
#5eaae42f19a24d05cbd6ccb4
# what to do with these? Trust what they've declared here?

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
# maybe exclude 614e230ff8700b32ea648508: very high (though not perfect) scores across 4 Ls

library(toolbox);
scores_list <- combineCols(data_BLP, cols=c('L1Score','L2Score','L3Score','L4Score'),by_name=TRUE); # combine scores into 1 list
data_BLP$temp_sbjID <- c(1:193); # necessary: R doesn't like format of Prolific IDs

# multilingual balance: variance
vars <- list();
for (i in 1:193) { # calculate variance for each participant
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
for (i in 1:193) { # calculate entropy for each participant
  temp <- unlist(scores_list[i]);
  entropy <- Entropy(temp,na.rm=TRUE);
  entropies <- append(entropies, entropy)
};
data_BLP$lang_ent <- entropies;
data_BLP$lang_ent <- as.numeric(data_BLP$lang_ent);
plot(data_BLP$temp_sbjID,data_BLP$lang_ent,pch=19,xlab="Subject number",ylab="Language score entropy",cex.lab=1.5,ylim=c(0,2.5),yaxs="i");
# some outliers very close to 0 - the monolinguals

# corr of variance & entropy
cor(unlist(data_BLP$lang_var),unlist(data_BLP$lang_ent),method="pearson"); # r = -0.86 strongly negatively correlated

# multilingual experience: summing all language scores
data_BLP["L2Score"][is.na(data_BLP["L2Score"])] <- 0;
data_BLP["L3Score"][is.na(data_BLP["L3Score"])] <- 0;
data_BLP["L4Score"][is.na(data_BLP["L4Score"])] <- 0;
data_BLP$multi_exp <- data_BLP$L1Score + data_BLP$L2Score + data_BLP$L3Score + data_BLP$L4Score;
plot(data_BLP$temp_sbjID,data_BLP$multi_exp,pch=19,xlab="Subject number",ylab="Amount of total multilingual experience (out of 872)",ylim=c(0,872),cex.lab=1.5,yaxs="i");

# L1 - L2 score
data_BLP$L1_L2_diff <- data_BLP$L1Score - data_BLP$L2Score;
plot(data_BLP$temp_sbjID,data_BLP$L1_L2_diff,pch=19,xlab="Subject number",ylab="Score difference of L1 and L2",cex.lab=1.5,ylim=c(0,218),yaxs="i");

# corr of variance & accuracy
cor(data_testing_2M_means$x, data_BLP$lang_var); # r = -0.06
plot(data_BLP$lang_var, data_testing_2M_means$x, xlab="Language score variance", ylab="Testing accuracy (in %)", pch=19);

cor(data_testing_2M_hits_means$x, data_BLP$lang_var); # r = -0.08
plot(data_BLP$lang_var, data_testing_2M_hits_means$x, xlab="Language score variance", ylab="Testing hit accuracy (in %)", pch=19);

cor(data_testing_2M_rejs_means$x, data_BLP$lang_var); # r = 0.03
plot(data_BLP$lang_var, data_testing_2M_rejs_means$x, xlab="Language score variance", ylab="Testing rejection accuracy (in %)", pch=19);

# corr of entropy & accuracy
cor(data_testing_2M_means$x, data_BLP$lang_ent); # r = 0.007
plot(data_BLP$lang_ent, data_testing_2M_means$x, xlab="Language score entropy", ylab="Testing accuracy (in %)", cex.lab=1.5,pch=19);

cor(data_testing_2M_hits_means$x, data_BLP$lang_ent); # r = 0.12
plot(data_BLP$lang_ent, data_testing_2M_hits_means$x, xlab="Language score entropy", ylab="Testing hit accuracy (in %)", cex.lab=1.5,pch=19);

cor(data_testing_2M_rejs_means$x, data_BLP$lang_ent); # r = -0.11
plot(data_BLP$lang_ent, data_testing_2M_rejs_means$x, xlab="Language score entropy", ylab="Testing rejection accuracy (in %)", cex.lab=1.5,pch=19);

# corr of multilingual experience & accuracy
cor(data_testing_2M_means$x, data_BLP$multi_exp); # r = 0.02
plot(data_BLP$multi_exp, data_testing_2M_means$x, xlab="Language score entropy", ylab="Testing accuracy (in %)", cex.lab=1.5,pch=19);

cor(data_testing_2M_hits_means$x, data_BLP$multi_exp); # r = 0.12
plot(data_BLP$multi_exp, data_testing_2M_hits_means$x, xlab="Language score entropy", ylab="Testing hit accuracy (in %)", cex.lab=1.5,pch=19);

cor(data_testing_2M_rejs_means$x, data_BLP$multi_exp); # r = -0.10
plot(data_BLP$multi_exp, data_testing_2M_rejs_means$x, xlab="Language score entropy", ylab="Testing rejection accuracy (in %)", cex.lab=1.5,pch=19);

# corr of L1-L2 score & accuracy
cor(data_testing_2M_means$x, data_BLP$L1_L2_diff); # r = -0.008
plot(data_BLP$L1_L2_diff, data_testing_2M_means$x, xlab="Language score entropy", ylab="Testing accuracy (in %)", cex.lab=1.5,pch=19);

cor(data_testing_2M_hits_means$x, data_BLP$L1_L2_diff); # r = -0.17
plot(data_BLP$L1_L2_diff, data_testing_2M_hits_means$x, xlab="Language score entropy", ylab="Testing hit accuracy (in %)", cex.lab=1.5,pch=19);

cor(data_testing_2M_rejs_means$x, data_BLP$L1_L2_diff); # r = 0.15
plot(data_BLP$L1_L2_diff, data_testing_2M_rejs_means$x, xlab="Language score entropy", ylab="Testing rejection accuracy (in %)", cex.lab=1.5,pch=19);

# variance of BLP variables
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

# count number of participants in each category
#monolinguals: n=4
data_BLP_monos <- subset(data_BLP[data_BLP$L2Score==0,]);

#bilinguals: n=80
data_BLP_bis <- subset(data_BLP[data_BLP$L2Score!=0&data_BLP$L3Score==0,]);

#trilinguals: n=58
data_BLP_tris <- subset(data_BLP[data_BLP$L2Score!=0&data_BLP$L3Score!=0&data_BLP$L4Score==0,]);

#quadrilinguals: n=51
data_BLP_quadris <- subset(data_BLP[data_BLP$L2Score!=0&data_BLP$L3Score!=0&data_BLP$L4Score!=0,]);

# CLUSTERING
complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]

# all with language dominance scores
png('corrPlot.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(19:38)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlotClustering.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(19:38)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# all without language dominance scores
png('corrPlot2.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(19:34)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlotClustering2.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(19:34)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

par(mfrow=c(2,2));
hist(data_BLP$HistoryL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(data_BLP$UseL1Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(data_BLP$HistoryL2Score, xlim=c(0,60), breaks=seq(0,60,2));
hist(data_BLP$UseL2Score, xlim=c(0,60), breaks=seq(0,60,2));
par(mfrow=c(1,1));

Hmisc::varclus(data_BLP[,19:38]); # Error: x matrix must be numeric

# all participants
#with language dominance scores
pca_varimax <- psych::principal(data_BLP[,19:38], nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax$scores[,c('RC12','RC1','RC2', 'RC7','RC3','RC6')]);
names(data_BLP)[116:121] <- c('RC12_L3','RC1_L4','RC2_use_L1vsL2','RC7_hist_L2','RC3_prof_L2','RC6_use_L4');
summary(ppt_in_pca_space_5);
cor(ppt_in_pca_space_5);

#without language dominance scores
pca_varimax2 <- psych::principal(data_BLP[,19:34], nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax2$scores[,c('RC1','RC9','RC2','RC6')]);
names(data_BLP)[116:119] <- c('RC1_L3','RC9_L4','RC2_use_L1vsL2','RC6_use_L4');
summary(ppt_in_pca_space_5);
cor(ppt_in_pca_space_5);

# monolinguals
#without language dominance scores
data_BLP_monos <- data_BLP_monos[, !is.na(colSums(data_BLP_monos != 0)) & colSums(data_BLP_monos != 0) > 0];
data_BLP_monos <- subset(data_BLP_monos, select = -c(AttentionL2,AttentionL3,AttentionL4));
pca_varimax3 <- psych::principal(data_BLP_monos[,13:17], nfactors=5, rotate='varimax');
# the PCA doesn't want to run due to NAs but there are none?
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
names(data_BLP_quadris)[79:87] <- c('RC15_use_L1vsL2','RC2_prof_morethanbi','RC12_L4','RC11_use_L4','RC3_prof_L2','RC4_use_L3','RC10_att_L3','RC1_hist_morethanmono','R13_hist_l2');

source("C:/Users/annal/OneDrive/Documents/Me/SISSA/BASL/BASL analysis/FunnyPeopleFunction_RodriguezLaioClustering.R");
funnyPeople(scores=as.vector(ppt_in_pca_space_5), sbjId=rep(1:192,5), itemId=rep(1:5, each=30), outForMatlabFunction=F);

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
cols2 <- paletteer_d("ggthemes::Classic_20");
plot(data_BLP$L1Score~data_BLP$temp_sbjID,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
axis(1, at = c(1:193));
points(data_BLP$L2Score~data_BLP$temp_sbjID,subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score~data_BLP$temp_sbjID,subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score~data_BLP$temp_sbjID,subset=ok2,pch=19,col=cols2[4]);
legend("bottomleft",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5)