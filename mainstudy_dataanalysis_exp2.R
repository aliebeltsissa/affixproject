#################### BUILDING ALL DATAFRAMES ####################
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");

# participants list too many characters to be dealt by R in one line
participants1 <- list('579e18fc4a84da00014c6f4f','5b6aa4aa0d748b0001fb5260','5c1a6bd8f9250d0001b7c589','5c437f6a4fe4f800016e3d52','5c840aedbad8fb000106cb44','5d696d1c55742f001af29220','5db16ce33990ed0014564873','5e248b6f0c0b31718a9d3f31','5e2b03f0005f2a02c5a64f7b','5e6449ae5932461d728d2152','5e8b85a61e16e9057a996e36','5e9dad3fd8d8010ac6a18620','5ebd8f8679146d0a116bc257','5ecba4b6ef75d53505406d57','5ed14691e983f5067842fd20','5eee55e93867d30a7771e616','5ef0b54037a90c618ad9e97f','5eff8b9ad19111064484eff7','5f1165307d03fb0009716b8e','5f21c29511084913913af654','5f316280965ec564c886f978','5f35782429beab53ef93cc2d','5f3d119b77d8ba0009a79558','5f5a5d4618746310515e2828','5f6f3d061214fe49ec2b9619','5f8af153e27f001bcc23ffc4','5f8b724dc36e8c2ac6d5fb6e','5f9c2359530d3e067a300bd6','5faacca24cd0384c1fa08be1','5fade36bdde8092117469a42','5fb2946df797088a8c405c2e','5ff3a2554cfb7d507511d89f','5ffab69a57132749844b8020','5ffd4230d96f6b2649d31f72','60204c263941fb63d9d794bc','602d2adcef81ce6b843da09b','60379326171365000ac6ae93','6046435099c3d00becdb2dfb','604d5e61486bd0622d2102c0','6057a8fe2d302939fc759940','60907b8091341e8724ba80ed','60a18093c5c040498d3addf8','60a8bd22d03adbe92cbb9a5e','60bf28df4926a8b6391df575','60c4a402716a8f9074fcd92e','60c715c89bb47f3847a690f0','60c873a65a9883b52f70db6c','60ca0b60979a23c83652c303','60cef349a1fff159b5d4853e','60d26e7cd9f0761e4d12b9f8','60d9dfd4dcc09cf57dc92cb1','60db9c9850c39eea109ef1d3','60e586145b73b702a608bace','60e5ac4f3d93f294f5fa543b','60f9739250a5c6f6e4726336','6102ee48644f517877d64d2b','6103cbc5310ffddfafa01661','6106ac34408681f3b0d07396','610d45e26c9b141264755d3c','61118c6d3c980e8b5b50e2fa','6117bb7900c0ba81f079a4ee','611d180283c1129def9284e6','611e00dc377e4fb7a27725e8','611e125063d1a52330225838','611fd297eb06449f7f0a06b9','61200d0d71bd5c0f9f9716b2','61242dd5be1a06b174975a1f','61248a51eefb6797024ecb85','612cc44439ccefbbd5d4b278','612cd9f34adcee82f65685a1','613054cf8dffc8bbb1fc9cc4','6134d182408816f4c1284496','6135f6887f5dd1472f7d3d6e','6136a1e1159dc808ad660d89','613758e7a80409ba7f5affb6','613ca0a2040055a4e87c5d71','6148b49d6ac652cefd310332','615c1372e7e639775817487e','6166ef334de9e433e83bfb79','616ad7ac6299f99ce33cdc78','616b567b3e605b7245a9aead','61717173748006894b2b54ff','6171946a19f6673fb215c0c7','6171f219ee27aa0e23d076aa','61758dd4ab7ec0d91a929f3d','628ed30ae7ff849e8bc91c86','631a1795de5efe7d3395caa3','63c5335da2b625ab1ade7e7c','6413799cf7721ee0ce637e09','646e0d2370c16a7561ae7dcb','6488afe97766c9083ffc3171','649264e0b601af80c5677791','6492c23a1a7735dfaab2b095','6495a5f76daf70e418baf5f7','6497e970e2621e753513a695','64e7533f36d388e8b31d3309','64e8bd55c9089d5bf26c90cd','64e8c14bbe184c20cb9d0583','64e9d6f596308448ac67bb95');
participants2 <- list('64f61553b5635b5e00595923','64f7a35c5f6503caaa59f79f','64fc701b223abd16ad5c940e','650330fa0cbc534b423f41e9','6505a9adbb769aeea736a2f5','650aed9eb9cc2c717ba70c30','6511e688100fd33b378fa688','651c59ec0cb6fef4208190f5','651eda4af4a809dbba0bb002','65352001dbe3e18eae5a8300','65361483b7f9881afa9b4cda','653d2df588326f6f627b8cb5','653fb764c9aed77c01457531','654632f222cb15acd453c0d3','65523123662559399b1aa48a','6557def45fc0ffbd46ad01de','655f5b404a09c686df3b0143','655f8b959477c803eb906622','65672c69a3737224f1d0bbfa','65774d879c53cc867fbe070c','657bfe6e245848c8fef0b389','6597e935328d41ae3aeef33b','6598994f0e7e5db183bfe3ee','659ada2d6df23a57d8e56752','65a97217d4fb858939a16b0f','65a97afe116a650acc588c5b','65abe33e1c79ea32da32ab0f','65ae78fc9cd81e8e26612cb2','65b901451577b2a0f18bc7ab','65b96f3bbecf5e7d0f5853cd','65c23d4dbad7238169292b54','65cba84263ac644fa79702ca','65cf6d92ac6f7932b1470fb4','65dce7715387badaf80e875d','65e7259b24116547c5512668','65f33b94cd6885d54029582d','65f7be6ac59662b24ac0f9b0','65fae6b84fa6b3101d2ca4b1','65fb18ef1c73590e7aaf1d48','65fc949678623ac83f926940','66031000461c44484ac359a8','660310c1b1a7ea09dee682e2','660678406bba1ade08345803','6606800e185d326591af6f7a','6606c9d692990fbf223f63bb','660c0d70a8f60acced0c8cc8','660c265dce47171c0dd7d359','66156fd87e14e8a60c007e17','66168e55cb60649609600268','6616a8636a12b432e8d914b5','6617af3304fe756a213cce24','661c24ab06db7f1ff0146700','661ff04db0e4a8222d5c4dd7','66271b4aaaf60fd058302f09','6634e4d4f1950b4dcd44d4d9','6634f754adfec54a4b1aaed4','66383ecf52e239b6f2ad54f4','663a5bb8f7f79c7e04abc9b3','663e08a82c273a8ea28be4e7','664b550820b57425a150d8e2','664b7cd6b5a772dd1eddca37','664f48afa42c9a4a7ed2bb88','664f70fcf77160132d600e2c','6658f0a58f1ee667f4264a93','6659ca4701d47b95a09ba736','6659ebda18cf5c43dbcc7354','665d94712b964d877bf9f132','665f79d15be62c63a74883d6','6661bf2ef4b2d0892ad7a007','6662d40766c8aa595834461d','666306b0bf2de127943c419f','6666a56ce75a18f29904e527','6666cf176a54945ba62e8ca9','6667488c5f46f3da0c085419','666f0fb7d9900bb03f5d99a1','666fd8b3dc9f2e1de77b5db4','6672ee650699d871b742ca6b','667437b20a6f1d1ebf68714b','667972671949d2e1c0c9ff54','667d631ef036f8ef4ff2f4f3','667dd7126e7a9073e0af73fd','6681625ff9dfa8a95bb0359d','6682b6d8a001b7f57c513ecc','66844cc1407c6afd0e100482','668553fe2efd22c91cf88fb9','6685e1541643171c04ec0e35','668992b2f868cb89829346c2','6692b87aad65e83d4230c307','6693f13e028361f102a9ed86','66951e094b5bd0caf94e844f','669cc52163cce3554e97d184','615c47639c04e360b0a76f58');
participants <- c(participants1,participants2);

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
data_testing <- data_all_testing[data_all_testing$sbj_ID %in% participants,]; # n = 190 participants
# all participants to be excluded:
data_testing <- data_testing[!data_testing$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3','6488afe97766c9083ffc3171','666f0fb7d9900bb03f5d99a1','660310c1b1a7ea09dee682e2','5faacca24cd0384c1fa08be1', '65f7be6ac59662b24ac0f9b0', '664b7cd6b5a772dd1eddca37'),];

# make some variables factors
data_testing$sbj_ID <- as.factor(data_testing$sbj_ID);
data_testing$task <- as.factor(data_testing$task);
data_testing$item <- as.factor(data_testing$item);
data_testing$testing_condition <- as.factor(data_testing$testing_condition);
data_testing$correct <- as.logical(data_testing$correct);

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

data_testing_rt_means <- aggregate(data_testing$rt, list(data_testing$sbj_ID), FUN=mean, na.rm=TRUE);

data_testing_0M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='0M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN = function(x) sum(x == 1));
names(data_testing_0M_yes) <- c("sbj_ID","x_0");
data_testing_0M_yes$x_0 <- data_testing_0M_yes$x_0/40*100; #transform into percent
data_testing_0M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='0M'], list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN=mean, na.rm=TRUE);
names(data_testing_0M_means) <- c("sbj_ID","x_0");

data_testing_1M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='1M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN = function(x) sum(x == 1));
names(data_testing_1M_yes) <- c("sbj_ID","x_1");
data_testing_1M_yes$x_1 <- data_testing_1M_yes$x_1/40*100; #transform into percent
data_testing_1M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='1M'], list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN=mean, na.rm=TRUE);
names(data_testing_1M_means) <- c("sbj_ID","x_1");

data_testing_2M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='2M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN = function(x) sum(x == 1));
names(data_testing_2M_yes) <- c("sbj_ID","x_2");
data_testing_2M_yes$x_2 <- data_testing_2M_yes$x_2/40*100; #transform into percent
data_testing_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN=mean, na.rm=TRUE);
names(data_testing_2M_means) <- c("sbj_ID","x_2");
data_testing_2M_hits_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='1'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='1']), FUN=sum, na.rm=TRUE);
names(data_testing_2M_hits_means) <- c("sbj_ID","x_2_hits");
data_testing_2M_hits_means$x_2_hits <- data_testing_2M_hits_means$x_2_hits/20;
data_testing_2M_rejs_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='0'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='0']), FUN=sum, na.rm=TRUE);
names(data_testing_2M_rejs_means) <- c("sbj_ID","x_2_rejs");
data_testing_2M_rejs_means$x_2_rejs <- data_testing_2M_rejs_means$x_2_rejs/20;

# 2M - all response types
library(tidyverse);
misses <- list();
for (i in 1:184) { # calculate misses for each participant
  temp <- data_testing[data_testing$sbj_ID==i&data_testing$testing_condition=='2M',];
  miss <- temp %>%
    summarize(count = sum(expected == 1 & observed == 0));
  miss <- miss/40;
  misses <- append(misses, miss)
};
data_testing_2M_means$misses <- misses;
data_testing_2M_means$misses <- as.numeric(data_testing_2M_means$misses);

hits <- list();
for (i in 1:184) { # calculate hits for each participant
  temp <- data_testing[data_testing$sbj_ID==i&data_testing$testing_condition=='2M',];
  hit <- temp %>%
    summarize(count = sum(expected == 1 & observed == 1));
  hit <- hit/40
  hits <- append(hits, hit)
};
data_testing_2M_means$hits <- hits;
data_testing_2M_means$hits <- as.numeric(data_testing_2M_means$hits);

rejs <- list();
for (i in 1:184) { # calculate correct rejections for each participant
  temp <- data_testing[data_testing$sbj_ID==i&data_testing$testing_condition=='2M',];
  rej <- temp %>%
    summarize(count = sum(expected == 0 & observed == 0));
  rej <- rej/40
  rejs <- append(rejs, rej)
};
data_testing_2M_means$rejs <- rejs;
data_testing_2M_means$rejs <- as.numeric(data_testing_2M_means$rejs);

alarms <- list();
for (i in 1:184) { # calculate false alarms for each participant
  temp <- data_testing[data_testing$sbj_ID==i&data_testing$testing_condition=='2M',];
  alarm <- temp %>%
    summarize(count = sum(expected == 0 & observed == 1));
  alarm <- alarm/40
  alarms <- append(alarms, alarm)
};
data_testing_2M_means$alarms <- alarms;
data_testing_2M_means$alarms <- as.numeric(data_testing_2M_means$alarms);

data_testing_2M <- data_testing[data_testing$testing_condition == '2M',];
dprimes2M <- dPrime(data_testing_2M$sbj_ID, data_testing_2M$expected, data_testing_2M$observed);
names(dprimes2M) <- c("sbj_ID","dprime","log_beta","c");
data_testing_2M_means$dprime <- dprimes2M$dprime;
data_testing_2M_means$c <- dprimes2M$c;

# Familiarity ----------------------------------------------------------
data_all_familiarity <- read.csv("exp2_familiarity_preprocessed.csv",header=T,sep=",");
data_all_familiarity <- subset(data_all_familiarity, select = -c(X)) # remove redundant column added by Pavlovia
data_familiarity <- data_all_familiarity[data_all_familiarity$sbj_ID %in% participants,]; # n = 187 participants
data_familiarity <- data_familiarity[!data_familiarity$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3','6488afe97766c9083ffc3171','666f0fb7d9900bb03f5d99a1','660310c1b1a7ea09dee682e2','5faacca24cd0384c1fa08be1', '65f7be6ac59662b24ac0f9b0', '664b7cd6b5a772dd1eddca37'),];

# make some variables factors
data_familiarity$sbj_ID <- as.factor(data_familiarity$sbj_ID);
data_familiarity$task <- as.factor(data_familiarity$task);
data_familiarity$correct <- as.logical(data_familiarity$correct);
data_familiarity$target <- as.factor(data_familiarity$target);
data_familiarity$confound <- as.factor(data_familiarity$confound);

data_familiarity_means <- aggregate(data_familiarity$correct, list(data_familiarity$sbj_ID), FUN=mean);
colnames(data_familiarity_means)[colnames(data_familiarity_means)=="Group.1"]="sbj_ID";

# BLP -----------------------------------------------------------------
data_all_BLP <- read.csv("exp2_BLP_preprocessed.csv",header=T,sep=",");
data_all_BLP <- subset(data_all_BLP, select = -c(X)); # remove redundant column added by Pavlovia
data_BLP <- data_all_BLP[data_all_BLP$sbj_ID %in% participants,]; # n = 92 participants
data_BLP <- data_BLP[!data_BLP$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3','6488afe97766c9083ffc3171','666f0fb7d9900bb03f5d99a1','660310c1b1a7ea09dee682e2','5faacca24cd0384c1fa08be1', '65f7be6ac59662b24ac0f9b0', '664b7cd6b5a772dd1eddca37'),];

correction_general <- function(database,wrong,right)
{
  database[database == wrong] <- right;
  return (database)
}

correction_specific <- function(database,sbj_ID,variable,right)
{
  database[variable][database["sbj_ID"]==sbj_ID] <- right;
  return (database)
}

BLP_correction <- function(data_BLP)
{
  data_BLP <- correction_general(data_BLP,"polish","Polish");
  data_BLP <- correction_general(data_BLP,"english","English");
  data_BLP <- correction_general(data_BLP,"ENGLISH","English");
  data_BLP <- correction_general(data_BLP,"Englsih","English");
  data_BLP <- correction_general(data_BLP,"Englsh","English");
  data_BLP <- correction_general(data_BLP,"British","English");
  data_BLP <- correction_general(data_BLP,"Englsh","English");
  data_BLP <- correction_general(data_BLP,"ENGLISH","English");
  data_BLP <- correction_general(data_BLP,"portuguese","Portuguese");
  data_BLP <- correction_general(data_BLP,"Potuguese","Portuguese");
  data_BLP <- correction_general(data_BLP,"SPANISH","Spanish");
  data_BLP <- correction_general(data_BLP,"Spnsh","Spanish");
  data_BLP <- correction_general(data_BLP,"spanish","Spanish");
  data_BLP <- correction_general(data_BLP,"ITALIAN","Italian");
  data_BLP <- correction_general(data_BLP,"italian","Italian");
  data_BLP <- correction_general(data_BLP,"sotho","Sotho");
  data_BLP <- correction_general(data_BLP,"Gree","Greek");
  data_BLP <- correction_general(data_BLP,"GREEK","Greek");
  data_BLP <- correction_general(data_BLP,"tshivenda","Tshivenda");
  data_BLP <- correction_general(data_BLP,"Gujrau","Gujarati");
  data_BLP <- correction_general(data_BLP,"ukrainian","Ukrainian");
  data_BLP <- correction_general(data_BLP,"ukranian","Ukrainian");
  data_BLP <- correction_general(data_BLP,"SETSWANA","Setswana");
  data_BLP <- correction_general(data_BLP,"afrikaans","Afrikaans");
  data_BLP <- correction_general(data_BLP,"punjabi","Punjabi");
  data_BLP <- correction_general(data_BLP,"siswati","Siswati");
  data_BLP <- correction_general(data_BLP,"Germany","German");
  data_BLP <- correction_general(data_BLP,"german","German");
  data_BLP <- correction_general(data_BLP,"germany","German");
  data_BLP <- correction_general(data_BLP,"GERMANY","German");
  data_BLP <- correction_general(data_BLP,"GERMAN","German");
  data_BLP <- correction_general(data_BLP,"russian","Russian");
  data_BLP <- correction_general(data_BLP,"Isiulu","IsiZulu");
  data_BLP <- correction_general(data_BLP,"ZULU","Zulu");
  data_BLP <- correction_general(data_BLP,"zulu","Zulu");
  data_BLP <- correction_general(data_BLP,"northern sotho","Northern Sotho");
  data_BLP <- correction_general(data_BLP,"chinese","Chinese");
  data_BLP <- correction_general(data_BLP,"sesotho","Sesotho");
  data_BLP <- correction_general(data_BLP,"sepedi","Sepedi");
  data_BLP <- correction_general(data_BLP,"TSHIVENDA","Tshivenda");
  data_BLP <- correction_general(data_BLP,"XHOSA","Xhosa");
  data_BLP <- correction_general(data_BLP,"french","French");
  data_BLP <- correction_general(data_BLP,"cantonese","Cantonese");
  data_BLP <- correction_general(data_BLP,"hungarian","Hungarian");
  data_BLP <- correction_general(data_BLP,"POLISH","Polish");
  data_BLP <- correction_general(data_BLP,"croatian","Croatian");
  data_BLP <- correction_general(data_BLP,"bosnian","Bosnian");
  data_BLP <- correction_general(data_BLP,"madarin","Mandarin");
  data_BLP <- correction_general(data_BLP,"Icelandic and German","Icelandic");
  data_BLP <- correction_general(data_BLP,"a little bit of russian","Russian");
  data_BLP <- correction_general(data_BLP,"NDEBELE","Ndebele");
  data_BLP <- correction_general(data_BLP,"urdu","Urdu");
  data_BLP <- correction_general(data_BLP,"latvian","Latvian");
  data_BLP <- correction_general(data_BLP,"Malayam","Malayan");
  data_BLP <- correction_general(data_BLP,"swahili","Swahili");
  data_BLP <- correction_general(data_BLP,"serbian","Serbian");
  data_BLP <- correction_general(data_BLP,"SEPEDI","Sepedi");
  data_BLP <- correction_general(data_BLP,"japanese","Japanese");
  data_BLP <- correction_general(data_BLP,"N/A","n/a");
  data_BLP <- correction_general(data_BLP,"---","n/a");
  data_BLP <- correction_general(data_BLP,"n.a","n/a");
  data_BLP <- correction_general(data_BLP,"na","n/a");
  data_BLP["L1"][is.na(data_BLP["L1"])] <- "n/a";
  data_BLP["L2"][is.na(data_BLP["L2"])] <- "n/a";
  data_BLP["L3"][is.na(data_BLP["L3"])] <- "n/a";
  data_BLP["L4"][is.na(data_BLP["L4"])] <- "n/a";
  
  # correcting some participants' demographic information - correction based off of Prolific's information
  data_BLP <- correction_specific(data_BLP,"60c4a402716a8f9074fcd92e","Age","21");
  data_BLP <- correction_specific(data_BLP,"6103cbc5310ffddfafa01661","Age","25");
  data_BLP <- correction_specific(data_BLP,"6598994f0e7e5db183bfe3ee","Age","23");
  data_BLP <- correction_specific(data_BLP,"66168e55cb60649609600268","Age","22");
  data_BLP <- correction_specific(data_BLP,"579e18fc4a84da00014c6f4f","Age","23");
  data_BLP <- correction_specific(data_BLP,"5c1a6bd8f9250d0001b7c589","Age","24");
  data_BLP <- correction_specific(data_BLP,"5f6f3d061214fe49ec2b9619","Age","22");
  data_BLP <- correction_specific(data_BLP,"60ca0b60979a23c83652c303","Age","24");
  data_BLP <- correction_specific(data_BLP,"653fb764c9aed77c01457531","Age","20");
  data_BLP <- correction_specific(data_BLP,"6557def45fc0ffbd46ad01de","Age","18");
  data_BLP <- correction_specific(data_BLP,"657bfe6e245848c8fef0b389","Age","20");
  data_BLP <- correction_specific(data_BLP,"65abe33e1c79ea32da32ab0f","Age","19");
  data_BLP <- correction_specific(data_BLP,"65f33b94cd6885d54029582d","Age","23");
  data_BLP <- correction_specific(data_BLP,"6634e4d4f1950b4dcd44d4d9","Age","19");
  data_BLP <- correction_specific(data_BLP,"664b7cd6b5a772dd1eddca37","Age","25");
  data_BLP <- correction_specific(data_BLP,"6659ca4701d47b95a09ba736","Age","19");
  data_BLP <- correction_specific(data_BLP,"667dd7126e7a9073e0af73fd","Age","23");
  data_BLP <- correction_specific(data_BLP,"6681625ff9dfa8a95bb0359d","Age","21");
  
  # one participant entered data for an n/a
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","HistoryL3Score",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","UseL3Score",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AttitudeL3Score",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","L3Score",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AoAL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AoEaseL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","yearsEduL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","yearsCountryL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","yearsFamilyL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","yearsWorkL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","PercFriendsL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","PercFamilyL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","PercWorkL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","PercSelfL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","PercCountL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","ProfSpeakL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","ProfUnderstandL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","ProfReadL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AttentionL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","ProfWriteL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AttSelfL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AttCultureL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AttNativeLevelL3",0);
  data_BLP <- correction_specific(data_BLP,"60379326171365000ac6ae93","AttMothertongueL3",0);
  
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

library(toolbox);
scores_list <- combineCols(data_BLP, cols=c('L1Score','L2Score','L3Score','L4Score'),by_name=TRUE); # combine scores into 1 list
use_scores_list <- combineCols(data_BLP, cols=c('UseL1Score','UseL2Score','UseL3Score','UseL4Score'),by_name=TRUE); # combine use scores into 1 list

# multilingual balance: variance
vars <- list();
for (i in 1:184) { # calculate variance for each participant
  temp <- unlist(scores_list[i]);
  var <- var(temp,na.rm=TRUE);
  vars <- append(vars, var)
};
data_BLP$lang_var <- vars;
data_BLP$lang_var <- as.numeric(data_BLP$lang_var);

# multilingual balance: entropy
entropies <- list();
library(DescTools);
for (i in 1:184) { # calculate entropy for each participant
  temp <- unlist(scores_list[i]);
  entropy <- Entropy(temp,na.rm=TRUE);
  entropies <- append(entropies, entropy)
};
data_BLP$lang_ent <- entropies;
data_BLP$lang_ent <- as.numeric(data_BLP$lang_ent);

# multilingual experience: summing all language scores
data_BLP["L2Score"][is.na(data_BLP["L2Score"])] <- 0;
data_BLP["L3Score"][is.na(data_BLP["L3Score"])] <- 0;
data_BLP["L4Score"][is.na(data_BLP["L4Score"])] <- 0;
data_BLP$multi_exp <- data_BLP$L1Score + data_BLP$L2Score + data_BLP$L3Score + data_BLP$L4Score;

# L1 - L2 score
data_BLP$L1_L2_diff <- abs(data_BLP$L1Score - data_BLP$L2Score);

# cosine similarity
cossims <- read.csv("distances_exp2.csv",header=T,sep=",");
cossims <- subset(cossims, select = -c(X)); # remove redundant column added by Python
names(cossims) <- c('sbj_ID','cosine_similarity');
data_BLP <- merge(data_BLP,cossims,by="sbj_ID");

pca_varimax <- psych::principal(data_BLP[,31:46], nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax$scores[,c('RC1','RC3','RC2','RC7','RC9')]);
names(data_BLP)[116:120] <- c('RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4');

data_BLP_extracted_all <- subset(data_BLP, select=c(sbj_ID,Gender,Age,HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,cosine_similarity,multi_exp,L1_L2_diff,RC1_L4,RC3_L3,RC2_use_L1vsL2,RC7_hist_L2,RC9_use_L4));
data_BLP_testing_all <- list(data_testing_2M_means,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');
names(data_testing_2M_yes) <- c("sbj_ID","x_2_yes");
data_BLP_testing_all <- merge(data_BLP_testing_all, data_testing_2M_yes,by="sbj_ID");
data_BLP_testing_dprimes2M <- list(dprimes2M,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');

# LMERS
library(lme4);
library(emmeans);

# TESTING #
data_testing_lm <- merge(data_testing, data_BLP[,c('sbj_ID','Gender','Age','L2Score','lang_ent','multi_exp','L1_L2_diff','cosine_similarity','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);

#all testing conditions - 'yes' responses
lm_TestingConditions <- glmer(observed ~ scale(trialn) + testing_condition + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
emmeans(lm_TestingConditions, pairwise ~ testing_condition, adjust = "tukey");
lm_Gender <- glmer(observed ~ scale(trialn) + testing_condition*Gender + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_Age <- glmer(observed ~ scale(trialn) + testing_condition*scale(Age) + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_RC1 <- glmer(observed ~ scale(trialn) + testing_condition*RC1_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_RC3 <- glmer(observed ~ scale(trialn) + testing_condition*RC3_L3 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_RC2 <- glmer(observed ~ scale(trialn) + testing_condition*RC2_use_L1vsL2 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_RC7 <- glmer(observed ~ scale(trialn) + testing_condition*RC7_hist_L2 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_RC9 <- glmer(observed ~ scale(trialn) + testing_condition*RC9_use_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_ent <- glmer(observed ~ scale(trialn) + testing_condition*lang_ent + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_use_ent <- glmer(observed ~ scale(trialn) + testing_condition*lang_use_ent + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_multiexp <- glmer(observed ~ scale(trialn) + testing_condition*scale(multi_exp) + (1|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_L1L2diff <- glmer(observed ~ scale(trialn) + testing_condition*scale(L1_L2_diff) + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
lm_cossim <- glmer(observed ~ scale(trialn) + testing_condition*cosine_similarity + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000, L2Score>0), family='binomial');

#2M - accuracy
data_testing_lm_2M <- subset(data_testing_lm[data_testing$testing_condition=='2M',]);
lm_2M_Gender <- glmer(observed ~ scale(trialn) + expected*Gender + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_Age <- glmer(observed ~ scale(trialn) + expected*scale(Age) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_RC1 <- glmer(observed ~ scale(trialn) + expected*RC1_L4 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_RC3 <- glmer(observed ~ scale(trialn) + expected*RC3_L3 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_RC2 <- glmer(observed ~ scale(trialn) + expected*RC2_use_L1vsL2 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_RC7 <- glmer(observed ~ scale(trialn) + expected*RC7_hist_L2 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_RC9 <- glmer(observed ~ scale(trialn) + expected*RC9_use_L4 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_ent <- glmer(observed ~ scale(trialn) + expected*lang_ent + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_multiexp <- glmer(observed ~ scale(trialn) + expected*scale(multi_exp) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_L1L2diff <- glmer(observed ~ scale(trialn) + expected*scale(L1_L2_diff) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
lm_2M_cossim <- glmer(observed ~ scale(trialn) + expected*cosine_similarity + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');

# FAMILIARITY #
data_BLP_familiarity <- merge(data_familiarity, data_BLP_extracted_all[,c('sbj_ID','Gender','Age','lang_ent','multi_exp','L1_L2_diff','cosine_similarity','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
lm_fam_Gender <- glmer(correct ~ scale(trialn) + Gender + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_Age <- glmer(correct ~ scale(trialn) + scale(Age) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_RC1 <- glmer(correct ~ scale(trialn) + RC1_L4 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_RC3 <- glmer(correct ~ scale(trialn) + RC3_L3 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_RC2 <- glmer(correct ~ scale(trialn) + RC2_use_L1vsL2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_RC7 <- glmer(correct ~ scale(trialn) + RC7_hist_L2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_RC9 <- glmer(correct ~ scale(trialn) + RC9_use_L4 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_ent <- glmer(correct ~ scale(trialn) + lang_ent + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_multiexp <- glmer(correct ~ scale(trialn) + scale(multi_exp) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_L1L2diff <- glmer(correct ~ scale(trialn) + scale(L1_L2_diff) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
lm_fam_cossim <- glmer(correct ~ scale(trialn) + cosine_similarity + (1|sbj_ID), data=data_BLP_familiarity[data_BLP_familiarity$L2Score>0,], family='binomial');

data_BLP_testing_0M_yes <- merge(data_testing_0M_yes, subset(data_BLP,select=c('sbj_ID','RC7_hist_L2','multi_exp','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
data_BLP_testing_1M_yes <- merge(data_testing_1M_yes, subset(data_BLP,select=c('sbj_ID','RC7_hist_L2','multi_exp','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
data_BLP_testing_2M_yes <- merge(data_testing_2M_yes, subset(data_BLP,select=c('sbj_ID','RC7_hist_L2','multi_exp','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);









#################### FULL SCRIPT ####################
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject");

# participants list too many characters to be dealt by R in one line
participants1 <- list('579e18fc4a84da00014c6f4f','5b6aa4aa0d748b0001fb5260','5c1a6bd8f9250d0001b7c589','5c437f6a4fe4f800016e3d52','5c840aedbad8fb000106cb44','5d696d1c55742f001af29220','5db16ce33990ed0014564873','5e248b6f0c0b31718a9d3f31','5e2b03f0005f2a02c5a64f7b','5e6449ae5932461d728d2152','5e8b85a61e16e9057a996e36','5e9dad3fd8d8010ac6a18620','5ebd8f8679146d0a116bc257','5ecba4b6ef75d53505406d57','5ed14691e983f5067842fd20','5eee55e93867d30a7771e616','5ef0b54037a90c618ad9e97f','5eff8b9ad19111064484eff7','5f1165307d03fb0009716b8e','5f21c29511084913913af654','5f316280965ec564c886f978','5f35782429beab53ef93cc2d','5f3d119b77d8ba0009a79558','5f5a5d4618746310515e2828','5f6f3d061214fe49ec2b9619','5f8af153e27f001bcc23ffc4','5f8b724dc36e8c2ac6d5fb6e','5f9c2359530d3e067a300bd6','5faacca24cd0384c1fa08be1','5fade36bdde8092117469a42','5fb2946df797088a8c405c2e','5ff3a2554cfb7d507511d89f','5ffab69a57132749844b8020','5ffd4230d96f6b2649d31f72','60204c263941fb63d9d794bc','602d2adcef81ce6b843da09b','60379326171365000ac6ae93','6046435099c3d00becdb2dfb','604d5e61486bd0622d2102c0','6057a8fe2d302939fc759940','60907b8091341e8724ba80ed','60a18093c5c040498d3addf8','60a8bd22d03adbe92cbb9a5e','60bf28df4926a8b6391df575','60c4a402716a8f9074fcd92e','60c715c89bb47f3847a690f0','60c873a65a9883b52f70db6c','60ca0b60979a23c83652c303','60cef349a1fff159b5d4853e','60d26e7cd9f0761e4d12b9f8','60d9dfd4dcc09cf57dc92cb1','60db9c9850c39eea109ef1d3','60e586145b73b702a608bace','60e5ac4f3d93f294f5fa543b','60f9739250a5c6f6e4726336','6102ee48644f517877d64d2b','6103cbc5310ffddfafa01661','6106ac34408681f3b0d07396','610d45e26c9b141264755d3c','61118c6d3c980e8b5b50e2fa','6117bb7900c0ba81f079a4ee','611d180283c1129def9284e6','611e00dc377e4fb7a27725e8','611e125063d1a52330225838','611fd297eb06449f7f0a06b9','61200d0d71bd5c0f9f9716b2','61242dd5be1a06b174975a1f','61248a51eefb6797024ecb85','612cc44439ccefbbd5d4b278','612cd9f34adcee82f65685a1','613054cf8dffc8bbb1fc9cc4','6134d182408816f4c1284496','6135f6887f5dd1472f7d3d6e','6136a1e1159dc808ad660d89','613758e7a80409ba7f5affb6','613ca0a2040055a4e87c5d71','6148b49d6ac652cefd310332','615c1372e7e639775817487e','6166ef334de9e433e83bfb79','616ad7ac6299f99ce33cdc78','616b567b3e605b7245a9aead','61717173748006894b2b54ff','6171946a19f6673fb215c0c7','6171f219ee27aa0e23d076aa','61758dd4ab7ec0d91a929f3d','628ed30ae7ff849e8bc91c86','631a1795de5efe7d3395caa3','63c5335da2b625ab1ade7e7c','6413799cf7721ee0ce637e09','646e0d2370c16a7561ae7dcb','6488afe97766c9083ffc3171','649264e0b601af80c5677791','6492c23a1a7735dfaab2b095','6495a5f76daf70e418baf5f7','6497e970e2621e753513a695','64e7533f36d388e8b31d3309','64e8bd55c9089d5bf26c90cd','64e8c14bbe184c20cb9d0583','64e9d6f596308448ac67bb95');
participants2 <- list('64f61553b5635b5e00595923','64f7a35c5f6503caaa59f79f','64fc701b223abd16ad5c940e','650330fa0cbc534b423f41e9','6505a9adbb769aeea736a2f5','650aed9eb9cc2c717ba70c30','6511e688100fd33b378fa688','651c59ec0cb6fef4208190f5','651eda4af4a809dbba0bb002','65352001dbe3e18eae5a8300','65361483b7f9881afa9b4cda','653d2df588326f6f627b8cb5','653fb764c9aed77c01457531','654632f222cb15acd453c0d3','65523123662559399b1aa48a','6557def45fc0ffbd46ad01de','655f5b404a09c686df3b0143','655f8b959477c803eb906622','65672c69a3737224f1d0bbfa','65774d879c53cc867fbe070c','657bfe6e245848c8fef0b389','6597e935328d41ae3aeef33b','6598994f0e7e5db183bfe3ee','659ada2d6df23a57d8e56752','65a97217d4fb858939a16b0f','65a97afe116a650acc588c5b','65abe33e1c79ea32da32ab0f','65ae78fc9cd81e8e26612cb2','65b901451577b2a0f18bc7ab','65b96f3bbecf5e7d0f5853cd','65c23d4dbad7238169292b54','65cba84263ac644fa79702ca','65cf6d92ac6f7932b1470fb4','65dce7715387badaf80e875d','65e7259b24116547c5512668','65f33b94cd6885d54029582d','65f7be6ac59662b24ac0f9b0','65fae6b84fa6b3101d2ca4b1','65fb18ef1c73590e7aaf1d48','65fc949678623ac83f926940','66031000461c44484ac359a8','660310c1b1a7ea09dee682e2','660678406bba1ade08345803','6606800e185d326591af6f7a','6606c9d692990fbf223f63bb','660c0d70a8f60acced0c8cc8','660c265dce47171c0dd7d359','66156fd87e14e8a60c007e17','66168e55cb60649609600268','6616a8636a12b432e8d914b5','6617af3304fe756a213cce24','661c24ab06db7f1ff0146700','661ff04db0e4a8222d5c4dd7','66271b4aaaf60fd058302f09','6634e4d4f1950b4dcd44d4d9','6634f754adfec54a4b1aaed4','66383ecf52e239b6f2ad54f4','663a5bb8f7f79c7e04abc9b3','663e08a82c273a8ea28be4e7','664b550820b57425a150d8e2','664b7cd6b5a772dd1eddca37','664f48afa42c9a4a7ed2bb88','664f70fcf77160132d600e2c','6658f0a58f1ee667f4264a93','6659ca4701d47b95a09ba736','6659ebda18cf5c43dbcc7354','665d94712b964d877bf9f132','665f79d15be62c63a74883d6','6661bf2ef4b2d0892ad7a007','6662d40766c8aa595834461d','666306b0bf2de127943c419f','6666a56ce75a18f29904e527','6666cf176a54945ba62e8ca9','6667488c5f46f3da0c085419','666f0fb7d9900bb03f5d99a1','666fd8b3dc9f2e1de77b5db4','6672ee650699d871b742ca6b','667437b20a6f1d1ebf68714b','667972671949d2e1c0c9ff54','667d631ef036f8ef4ff2f4f3','667dd7126e7a9073e0af73fd','6681625ff9dfa8a95bb0359d','6682b6d8a001b7f57c513ecc','66844cc1407c6afd0e100482','668553fe2efd22c91cf88fb9','6685e1541643171c04ec0e35','668992b2f868cb89829346c2','6692b87aad65e83d4230c307','6693f13e028361f102a9ed86','66951e094b5bd0caf94e844f','669cc52163cce3554e97d184','615c47639c04e360b0a76f58');
participants <- c(participants1,participants2);

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
data_testing <- data_all_testing[data_all_testing$sbj_ID %in% participants,]; # n = 190 participants
data_testing <- data_testing[!data_testing$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3','6488afe97766c9083ffc3171','666f0fb7d9900bb03f5d99a1','660310c1b1a7ea09dee682e2','5faacca24cd0384c1fa08be1', '65f7be6ac59662b24ac0f9b0', '664b7cd6b5a772dd1eddca37'),];

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
plot(density(data_testing$rt[data_testing$sbj_ID==IDs[1]],na.rm=TRUE),xlim=c(0,2200),ylim=c(0,0.01),xlab="RTs (ms)",main="",xaxt = "n",col=cols2[27],yaxs="i",lwd=1,cex.lab=1.5);
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
for (x in 2:184) {
  lines(density(data_testing$rt[data_testing$sbj_ID==IDs[x]],na.rm=TRUE),col=cols2[x+26],lwd=1)
};
# good, centered around 800ms
data_testing_rt_means <- aggregate(data_testing$rt, list(data_testing$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_testing_rt_means$x);
#min:212 Q1:730 med:922 mean:915 Q3:1093 max:1534
# good med & mean
plot(data_testing_rt_means$x, ylab="Mean participant RT (ms)",xlab="Participants",main="",xaxt = "n",pch=3,yaxs="i",ylim=c(0,2750))
# looks healthy overall

# PARTICIPANT EXCLUSIONS #
summary(data_testing$rt[data_testing$sbj_ID=="5e6449ae5932461d728d2152"]);
#min:490 Q1:1102 med:1250 mean:1502 Q3:1567 max:21759
plot(data_testing$rt[data_testing$sbj_ID=="5e6449ae5932461d728d2152"],ylim=c(2000,22000));
plot(data_testing$rt[data_testing$sbj_ID=="5e6449ae5932461d728d2152"&data_testing$rt>2000]);
# include 5e6449ae5932461d728d2152: mean RT of 1502 slow, but only 10 trials too slow

summary(data_testing$rt[data_testing$sbj_ID=="667d631ef036f8ef4ff2f4f3"]);
#min:641 Q1:1034 med:1532 mean:1986 Q3:2182 max:21398
plot(data_testing$rt[data_testing$sbj_ID=="667d631ef036f8ef4ff2f4f3"],ylim=c(2000,22000));
plot(data_testing$rt[data_testing$sbj_ID=="667d631ef036f8ef4ff2f4f3"&data_testing$rt>2000]);
# exclude 667d631ef036f8ef4ff2f4f3: mean RT of 1986 slow, and 35 trials too slow
data_testing <- data_testing[!data_testing$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3'),];
data_testing_rt_means <- data_testing_rt_means[!data_testing_rt_means$Group.1 %in% c('667d631ef036f8ef4ff2f4f3'),]

summary(data_testing$rt[data_testing$sbj_ID=="6488afe97766c9083ffc3171"]);
#exclude 6488afe97766c9083ffc3171: mean RT of 175ms too fast
data_testing <- data_testing[!data_testing$sbj_ID %in% c('6488afe97766c9083ffc3171'),];
data_testing_rt_means <- data_testing_rt_means[!data_testing_rt_means$Group.1 %in% c('6488afe97766c9083ffc3171'),]

plot(data_testing$rt[data_testing$sbj_ID=="660c265dce47171c0dd7d359"]);
#fine to include: very long with the first item (50s!) but others all around 1s afterwards

# yes responses globally
mean_yes <- aggregate(data_testing$observed,by=list(data_testing$sbj_ID), FUN=function(x) sum(x == 1));
names(mean_yes) <- c("sbj_ID", "yes");
summary(mean_yes$yes);
#min:0 Q1:61 med:68 mean:70 Q3:79 max:120
#never said "yes": 660310c1b1a7ea09dee682e2
#always said "yes": 5faacca24cd0384c1fa08be1, 65f7be6ac59662b24ac0f9b0, 664b7cd6b5a772dd1eddca37

# 0M yes responses boxplot
data_testing_0M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='0M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN = function(x) sum(x == 1));
names(data_testing_0M_yes) <- c("sbj_ID","x_0");
data_testing_0M_yes$x_0 <- data_testing_0M_yes$x_0/40*100; #transform into percent
summary(data_testing_0M_yes$x_0);
#min:7.5 Q1:42.5 med:52.5 mean:52.3 Q3:62.5 max:87.5
t.test(data_testing_0M_yes$x_0, mu=50);
#t=1.83 p=0.07 CI=[49.8;54.4] -> 0M "yes" not sig above chance
boxplot(data_testing_0M_yes$x, ylab = "0M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);

# 0M scores
data_testing_0M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='0M'], list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN=mean, na.rm=TRUE);
names(data_testing_0M_means) <- c("sbj_ID","x_0");
summary(data_testing_0M_means$x_0);
#min:0.13 Q1:0.38 med:0.48 mean:0.48 Q3:0.58 max:0.93
var(data_testing_0M_means$x_0);
#var=0.02
plot(data_testing_0M_means$x_0,pch=3,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # clustered around 50%

hist(data_testing_0M_means$x_0); # normally distributed
t.test(data_testing_0M_means$x_0, mu=0.5);
#t=-1.9 p=0.053 CI=[0.46;0.50] -> 0M scores not sig below chance

# 1M yes responses boxplot
data_testing_1M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='1M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN = function(x) sum(x == 1));
names(data_testing_1M_yes) <- c("sbj_ID","x_1");
data_testing_1M_yes$x_1 <- data_testing_1M_yes$x_1/40*100; #transform into percent
summary(data_testing_1M_yes$x_1);
#min:18 Q1:50 med:57.5 mean:58.0 Q3:67.5 max:90
t.test(data_testing_1M_yes$x_1, mu=50);
#t=8.1 p=5.7e-14 CI=[56.10;60.00] -> sig above chance
boxplot(data_testing_1M_yes$x, ylab = "1M Percent of 'yes' responses",ylim=c(0,100),yaxs="i");
abline(h=50, lty=5);

# 1M scores
data_testing_1M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='1M'], list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN=mean, na.rm=TRUE);
names(data_testing_1M_means) <- c("sbj_ID","x_1");
summary(data_testing_1M_means$x_1);
#min:0.18 Q1:0.50 med:0.58 mean:0.58 Q3:0.68 max:0.90
var(data_testing_1M_means$x_1);
#var=0.02
plot(data_testing_1M_means$x_1,pch=3,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5);
# clustered slightly above chance
hist(data_testing_1M_means$x_1); # normally distributed
t.test(data_testing_1M_means$x_1, mu=0.5);
#t=8.1 p=5.7e-14 CI=[0.56;0.60] -> sig above chance

# 2M yes responses boxplot
data_testing_2M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='2M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN = function(x) sum(x == 1));
names(data_testing_2M_yes) <- c("sbj_ID","x_2");
data_testing_2M_yes$x_2 <- data_testing_2M_yes$x_2/40*100; #transform into percent
summary(data_testing_2M_yes$x_2);
#min:30 Q1:52.5 med:62.5 mean:63.1 Q3:72.5 max:95
t.test(data_testing_2M_yes$x_2, mu=50);
#t=12.4 p<2.2-16 CI=[61.00;65.14] -> sig above chance
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
# X-squared=177, df=2, p<2.2e-16
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
par(mar=c(2,5,2,2));
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
#t=-0.81 p=0.42 CI=[0.48;0.51] -> not sig different from chance

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
# min:0.2 Q1:0.5 med:0.65 mean:0.63 Q3:0.75 max:1
hist(data_testing_2M_hits_means$x_2_hits); # normally distributed
t.test(data_testing_2M_hits_means$x_2_hits, mu=0.50);
# t=10.8, p<2.2e-16, CI=[0.60;0.65] -> sig above chance
plot(data_testing_2M_hits_means$x_2_hits,ylim=c(0,1),ylab = "Hits",xlab="Participants",main="2M testing accuracy",pch=3,yaxs="i",col="#3B9AB2");
abline(h=0.5, lty=5);

# 2M - correct rejections only
data_testing_2M_rejs_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='0'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='0']), FUN=sum, na.rm=TRUE);
names(data_testing_2M_rejs_means) <- c("sbj_ID","x_2_rejs");
data_testing_2M_rejs_means$x_2_rejs <- data_testing_2M_rejs_means$x_2_rejs/20;
boxplot(data_testing_2M_rejs_means$x_2_rejs, ylim=c(0,1), ylab = "Accuracy score - 2M correct rejections",boxwex=1.5,yaxs="i",cex.lab=1.5);
abline(h=0.5, lty=5);
par(mar=c(5, 4, 4, 2) + 0.1) # back to default
summary(data_testing_2M_rejs_means$x_2_rejs);
# min:0.1 Q1:0.25 med:0.35 mean:0.36 Q3:0.50 max:0.80
hist(data_testing_2M_rejs_means$x_2_rejs); # normally distributed
t.test(data_testing_2M_rejs_means$x_2_rejs, mu=0.50);
# t=-11.06, p<2.2e-16, CI=[0.34;0.39] -> sig below chance
plot(data_testing_2M_rejs_means$x_2_rejs,ylim=c(0,1),ylab = "Correct rejections",xlab="Participants",pch=3,yaxs="i",col="#E1AF00");
abline(h=0.5, lty=5);

# 2M - all response types
library(tidyverse);
misses <- data.frame();
for (i in 1:184) { # calculate misses for each participant
  temp <- data_testing[data_testing$sbj_ID==participants[i]&data_testing$testing_condition=='2M',];
  miss <- temp %>%
    summarize(count = sum(expected == 1 & observed == 0));
  miss <- miss/40;
  miss <- data.frame(sbj_ID=participants[[i]], misses=miss[[1]])
  misses <- rbind(misses, miss)
};
data_testing_2M_means <- merge(data_testing_2M_means,misses,by="sbj_ID");
data_testing_2M_means$misses <- as.numeric(data_testing_2M_means$misses);
summary(data_testing_2M_means$misses);
# min:0 Q1:0.13 med:0.18 mean:0.19 Q3:0.25 max:0.40

hits <- data.frame();
for (i in 1:184) { # calculate hits for each participant
  temp <- data_testing[data_testing$sbj_ID==participants[i]&data_testing$testing_condition=='2M',];
  hit <- temp %>%
    summarize(count = sum(expected == 1 & observed == 1));
  hit <- hit/40
  hit <- data.frame(sbj_ID=participants[[i]], hits=hit[[1]])
  hits <- rbind(hits, hit)
};
data_testing_2M_means <- merge(data_testing_2M_means,hits,by="sbj_ID");
data_testing_2M_means$hits <- as.numeric(data_testing_2M_means$hits);
summary(data_testing_2M_means$hits);
# min:0.10 Q1:0.25 med:0.33 mean:0.31 Q3:0.38 max:0.5

rejs <- data.frame();
for (i in 1:184) { # calculate correct rejections for each participant
  temp <- data_testing[data_testing$sbj_ID==participants[i]&data_testing$testing_condition=='2M',];
  rej <- temp %>%
    summarize(count = sum(expected == 0 & observed == 0));
  rej <- rej/40
  rej <- data.frame(sbj_ID=participants[[i]], rejs=rej[[1]])
  rejs <- rbind(rejs, rej)
};
data_testing_2M_means <- merge(data_testing_2M_means,rejs,by="sbj_ID");
data_testing_2M_means$rejs <- as.numeric(data_testing_2M_means$rejs);
summary(data_testing_2M_means$rejs);
# min:0.03 Q1:0.13 med:0.18 mean:0.18 Q3:0.25 max:0.40

alarms <- data.frame();
for (i in 1:184) { # calculate false alarms for each participant
  temp <- data_testing[data_testing$sbj_ID==participants[i]&data_testing$testing_condition=='2M',];
  alarm <- temp %>%
    summarize(count = sum(expected == 0 & observed == 1));
  alarm <- alarm/40
  alarm <- data.frame(sbj_ID=participants[[i]], alarms=alarm[[1]])
  alarms <- rbind(alarms, alarm)
};
data_testing_2M_means <- merge(data_testing_2M_means,alarms,by="sbj_ID");
data_testing_2M_means$alarms <- as.numeric(data_testing_2M_means$alarms);
summary(data_testing_2M_means$alarms);
# min:0.1 Q1:0.25 med:0.33 mean:0.32 Q3:0.38 max:0.48

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
data_long <- reshape2::melt(subset(data_testing_2M_means, select = c(sbj_ID,hits,rejs)), id.vars = "sbj_ID", variable.name = "condition", value.name = "accuracy");
ggplot(data_long, aes(x = condition, y = accuracy, group = sbj_ID)) +
  geom_line(linewidth=0.2) +
  geom_point(aes(color = condition), size = 3);
#the lower the hits_mean is, the higher rejs_mean is

#4 - plot of difference between hit & correct rejection accuracy
data_testing_2M_bygroup_means <- data_testing_2M_means;
data_testing_2M_bygroup_means$diff <- data_testing_2M_bygroup_means$hits-data_testing_2M_bygroup_means$rejs;
plot(data_testing_2M_bygroup_means$diff,ylim=c(-1,1),ylab="Accuracy difference",main="Difference between hits & correct rejection accuracy",xlab="Participants",pch=19,yaxs="i",col="#0B775E",cex=1.5);
abline(h=0, lty=5);

#5 - plot of "yes" responses in 2M & accuracy
names(data_testing_2M_yes) <- c("sbj_ID","x_2_yes");
testing_all <- merge(data_testing_2M_means,data_testing_2M_yes, by="sbj_ID");
cor(testing_all$x_2,testing_all$x_2_yes); # r = -0.05
plot(testing_all$x_2_yes,testing_all$x_2,pch=19);
#more 2M yes doesn't give you a better score
testing_all <- merge(testing_all,data_testing_2M_hits_means, by="sbj_ID");
cor(testing_all$x_2_hits,testing_all$x_2_yes); # r = 0.89
plot(testing_all$x_2_yes,testing_all$x_2_hits,pch=19);
#more 2M yes means more hits, means higher scores

# testing accuracy*RTs
cor(data_testing_2M_means$x, data_testing_rt_means$x); # r = 0.09
plot(data_testing_rt_means$x, data_testing_2M_means$x, pch=19);

cor(data_testing_2M_hits_means$x, data_testing_rt_means$x); # r = 0.18
plot(data_testing_rt_means$x, data_testing_2M_hits_means$x, pch=19);

cor(data_testing_2M_rejs_means$x, data_testing_rt_means$x); # r = -0.08
plot(data_testing_rt_means$x, data_testing_2M_rejs_means$x, pch=19);

# correlation between 1M & 2M
temp <- merge(data_testing_2M_means, data_testing_1M_means,by.x='sbj_ID',by.y='sbj_ID');
cor(temp$x_1, temp$x_2); # r = -0.13
# no corr between 1M & 2M scores

# testing d'
dprimes <- dPrime(data_testing$sbj_ID, data_testing$expected, data_testing$observed);
names(dprimes) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes);

data_testing_2M <- data_testing[data_testing$testing_condition == '2M',];
dprimes2M <- dPrime(data_testing_2M$sbj_ID, data_testing_2M$expected, data_testing_2M$observed);
names(dprimes2M) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes2M);
#d':-0.03 c:-0.35
data_testing_2M_means <- merge(data_testing_2M_means,subset(dprimes2M,select=c(sbj_ID,dprime,c)),by="sbj_ID");

#people with d' > 0
good_participants <- data_testing_2M_means[data_testing_2M_means$dprime>0,];
# n = 79
summary(good_participants$x_2);
#min:0.53 Q1:0.53 med:0.55 mean:0.56 Q3:0.58 max:0.70
#hits: mean = 0.35
#misses: mean = 0.15
#rejs: mean = 0.22
#alarms: mean = 0.28
summary(good_participants$dprime);
#min:0.12 Q1:0.15 med:0.29 mean:0.35 Q3:0.48 max:0.99
summary(good_participants$c);
#min:-1.58 Q1:-0.57 med:-0.30 mean:-0.35 Q3:-0.06 max:0.50

# testing strategy
strats <- subset(data_testing, select = c(sbj_ID, strategy));
strats <- strats[!duplicated(strats),];

# excluding participant having taken a video of training
data_testing <- data_testing[!data_testing$sbj_ID %in% c('666f0fb7d9900bb03f5d99a1'),];
data_testing_rt_means <- data_testing_rt_means[!data_testing_rt_means$Group.1 %in% c('666f0fb7d9900bb03f5d99a1'),]

# boxplot for accuracy of participants saying they just used intuition
intuition_sbjIDs <- list('579e18fc4a84da00014c6f4f','5c840aedbad8fb000106cb44','5d696d1c55742f001af29220','5e248b6f0c0b31718a9d3f31','5e2b03f0005f2a02c5a64f7b','5ebd8f8679146d0a116bc257','5eee55e93867d30a7771e616','5f1165307d03fb0009716b8e','5f21c29511084913913af654','5f35782429beab53ef93cc2d','5f6f3d061214fe49ec2b9619','5f8af153e27f001bcc23ffc4','5f8b724dc36e8c2ac6d5fb6e','5fade36bdde8092117469a42','5ffd4230d96f6b2649d31f72','60379326171365000ac6ae93','604d5e61486bd0622d2102c0','60907b8091341e8724ba80ed','60a18093c5c040498d3addf8','60c873a65a9883b52f70db6c','60ca0b60979a23c83652c303','60d9dfd4dcc09cf57dc92cb1','60db9c9850c39eea109ef1d3','60e586145b73b702a608bace','60e5ac4f3d93f294f5fa543b','60f9739250a5c6f6e4726336','6102ee48644f517877d64d2b','6106ac34408681f3b0d07396','610d45e26c9b141264755d3c','611e00dc377e4fb7a27725e8','61242dd5be1a06b174975a1f','61248a51eefb6797024ecb85','612cc44439ccefbbd5d4b278','612cd9f34adcee82f65685a1','613758e7a80409ba7f5affb6','613ca0a2040055a4e87c5d71','6166ef334de9e433e83bfb79','61717173748006894b2b54ff','6413799cf7721ee0ce637e09','646e0d2370c16a7561ae7dcb','6492c23a1a7735dfaab2b095','6497e970e2621e753513a695','64e8bd55c9089d5bf26c90cd','6505a9adbb769aeea736a2f5','650aed9eb9cc2c717ba70c30','65352001dbe3e18eae5a8300','653fb764c9aed77c01457531','654632f222cb15acd453c0d3','65523123662559399b1aa48a','6557def45fc0ffbd46ad01de','655f5b404a09c686df3b0143','655f8b959477c803eb906622','657bfe6e245848c8fef0b389','6597e935328d41ae3aeef33b','6598994f0e7e5db183bfe3ee','659ada2d6df23a57d8e56752','65a97afe116a650acc588c5b','65b96f3bbecf5e7d0f5853cd','65cf6d92ac6f7932b1470fb4','65f33b94cd6885d54029582d','66031000461c44484ac359a8','6606c9d692990fbf223f63bb','66168e55cb60649609600268','661ff04db0e4a8222d5c4dd7','663e08a82c273a8ea28be4e7','664f48afa42c9a4a7ed2bb88','6659ca4701d47b95a09ba736','665f79d15be62c63a74883d6','6662d40766c8aa595834461d','6666cf176a54945ba62e8ca9','6667488c5f46f3da0c085419','6672ee650699d871b742ca6b','667dd7126e7a9073e0af73fd','6681625ff9dfa8a95bb0359d','66844cc1407c6afd0e100482','6693f13e028361f102a9ed86','66951e094b5bd0caf94e844f','669cc52163cce3554e97d184');
data_testing$intuition <- FALSE;
data_testing$intuition[data_testing$sbj_ID %in% intuition_sbjIDs] <- TRUE;
data_testing_intuition_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'& data_testing$intuition==TRUE], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'& data_testing$intuition==TRUE]), FUN=mean, na.rm=TRUE);
colnames(data_testing_intuition_2M_means)[colnames(data_testing_intuition_2M_means)=="Group.1"]="sbj_ID";
boxplot(data_testing_intuition_2M_means$x, ylab = "Accuracy score (in %)");
abline(h=0.5, lty=5);
summary(data_testing_intuition_2M_means$x);
# min:0.30 Q1:0.45 med:0.50 mean:0.49 Q3:0.53 max:0.68

dprimes_intuition <- dPrime(data_testing$sbj_ID[data_testing$intuition==TRUE&data_testing$testing_condition=='2M'], data_testing$expected[data_testing$intuition==TRUE&data_testing$testing_condition=='2M'], data_testing$observed[data_testing$intuition==TRUE&data_testing$testing_condition=='2M']);
names(dprimes_intuition) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes_intuition);
# dprime:-0.07 c:-0.31

intuition_2M <- data_testing_2M_means[data_testing_2M_means$sbj_ID %in% intuition_sbjIDs,];
summary(intuition_2M$hits); # mean = 0.30
summary(intuition_2M$rejs); # mean = 0.18
summary(intuition_2M$misses); # mean = 0.20
summary(intuition_2M$alarms); # mean = 0.32

# participants saying they used previously familiarised chunks
chunks_sbjIDs <- list('5e9dad3fd8d8010ac6a18620','5ed14691e983f5067842fd20','5ef0b54037a90c618ad9e97f','5f316280965ec564c886f978','602d2adcef81ce6b843da09b','6046435099c3d00becdb2dfb','6057a8fe2d302939fc759940','60bf28df4926a8b6391df575','60d26e7cd9f0761e4d12b9f8','6136a1e1159dc808ad660d89','6148b49d6ac652cefd310332','615c1372e7e639775817487e','616ad7ac6299f99ce33cdc78','6171946a19f6673fb215c0c7','61758dd4ab7ec0d91a929f3d','628ed30ae7ff849e8bc91c86','6495a5f76daf70e418baf5f7','64e8c14bbe184c20cb9d0583','64e9d6f596308448ac67bb95','64f7a35c5f6503caaa59f79f','65361483b7f9881afa9b4cda','65672c69a3737224f1d0bbfa','65b96f3bbecf5e7d0f5853cd','65c23d4dbad7238169292b54','65dce7715387badaf80e875d','65e7259b24116547c5512668','65fae6b84fa6b3101d2ca4b1','660678406bba1ade08345803','660c265dce47171c0dd7d359','66156fd87e14e8a60c007e17','661c24ab06db7f1ff0146700','6634f754adfec54a4b1aaed4','664f70fcf77160132d600e2c','6661bf2ef4b2d0892ad7a007','666306b0bf2de127943c419f','668992b2f868cb89829346c2','6692b87aad65e83d4230c307');
data_testing$chunks <- FALSE;
data_testing$chunks[data_testing$sbj_ID %in% chunks_sbjIDs] <- TRUE;
data_testing_chunks_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'& data_testing$chunks==TRUE], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'& data_testing$chunks==TRUE]), FUN=mean, na.rm=TRUE);
colnames(data_testing_chunks_2M_means)[colnames(data_testing_chunks_2M_means)=="Group.1"]="sbj_ID";
boxplot(data_testing_chunks_2M_means$x, ylab = "Accuracy score (in %)");
abline(h=0.5, lty=5);
summary(data_testing_chunks_2M_means$x); 
# min:0.33 Q1:0.43 med:0.53 mean:0.50 Q3:0.55 max:0.65
dprimes_chunks <- dPrime(data_testing$sbj_ID[data_testing$chunks==TRUE&data_testing$testing_condition=='2M'], data_testing$expected[data_testing$chunks==TRUE&data_testing$testing_condition=='2M'], data_testing$observed[data_testing$chunks==TRUE&data_testing$testing_condition=='2M']);
names(dprimes_chunks) <- c("sbj_ID","dprime","log_beta","c");
summary(dprimes_chunks);
# dprime:0.03 c:-0.41

chunks_2M <- data_testing_2M_means[data_testing_2M_means$sbj_ID %in% chunks_sbjIDs,];
summary(chunks_2M$hits); # mean = 0.33
summary(chunks_2M$rejs); # mean = 0.18
summary(chunks_2M$misses); # mean = 0.17
summary(chunks_2M$alarms); # mean = 0.32

# So d' of participants saying they used chunks in their testing 
#strategy higher than participants saying they used intuition!



# Familiarity -------------------------------------------------------------
data_all_familiarity <- read.csv("exp2_familiarity_preprocessed.csv",header=T,sep=",");
data_all_familiarity <- subset(data_all_familiarity, select = -c(X)) # remove redundant column added by Pavlovia
data_familiarity <- data_all_familiarity[data_all_familiarity$sbj_ID %in% participants,]; # n = 187 participants
data_familiarity <- data_familiarity[!data_familiarity$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3','6488afe97766c9083ffc3171','666f0fb7d9900bb03f5d99a1','660310c1b1a7ea09dee682e2','5faacca24cd0384c1fa08be1', '65f7be6ac59662b24ac0f9b0', '664b7cd6b5a772dd1eddca37'),];

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
# min:0.37 Q1:0.5 med:0.57 mean:0.57 Q3:0.63 max:0.93
hist(data_familiarity_means$x); # mostly normally distributed
t.test(data_familiarity_means$x, mu=0.50);
# t=10.2, p<2.2e-16, CI = [0.56;0.59] -> sig above chance

# familiarity RTs
IDs <- list(data_familiarity$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[1]]),xlim=c(0,4000),ylim=c(0,0.01),xlab="Familiarity RTs (ms)",main="",xaxt = "n",col=cols2[1],lwd=2,yaxs="i");
axis(1, at = c(0,500,1000,1500,2000,2500,3000,3500,4000));
for (x in 2:184) {
  lines(density(data_familiarity$rt[data_familiarity$sbj_ID==IDs[x]]),col=cols2[x],lwd=2)
};
data_familiarity_rt_means <- aggregate(data_familiarity$rt, list(data_familiarity$sbj_ID), FUN=mean, na.rm=TRUE);
summary(data_familiarity_rt_means$x);
#min:154 Q1:1213 med:1655 mean:1681 Q3:1982 max:4519

# familiarity accuracy*RTs
cor(data_familiarity_means$x, data_familiarity_rt_means$x); # r = 0.30
plot(data_familiarity_rt_means$x, data_familiarity_means$x, xlab="Mean participant RT (in ms)", ylab="Mean participant familiarity score (in %)", pch=19, cex=2, cex.lab=1.45);

# familiarity accuracy*testing accuracy
cor(data_familiarity_means$x, data_testing_2M_means$x); # r = 0.02
cor(data_familiarity_means$x, data_testing_2M_hits_means$x); # r = 0.04
cor(data_familiarity_means$x, data_testing_2M_rejs_means$x); # r = -0.02


# BLP ---------------------------------------------------------------------
data_all_BLP <- read.csv("exp2_BLP_preprocessed.csv",header=T,sep=",");
data_all_BLP <- subset(data_all_BLP, select = -c(X)); # remove redundant column added by Pavlovia
data_BLP <- data_all_BLP[data_all_BLP$sbj_ID %in% participants,]; # n = 190 participants
data_BLP <- data_BLP[!data_BLP$sbj_ID %in% c('667d631ef036f8ef4ff2f4f3','6488afe97766c9083ffc3171','666f0fb7d9900bb03f5d99a1','660310c1b1a7ea09dee682e2','5faacca24cd0384c1fa08be1', '65f7be6ac59662b24ac0f9b0', '664b7cd6b5a772dd1eddca37'),];

BLP_correction <- function(data_BLP)
{
  data_BLP[data_BLP == "polish"] <- "Polish";
  data_BLP[data_BLP == "english"|data_BLP=="ENGLISH"|data_BLP=="Englsih"|data_BLP=="Englsh"|data_BLP=="British"|data_BLP=="Engllish"|data_BLP=="ENGLISH "] <- "English";
  data_BLP[data_BLP == "portuguese"|data_BLP=="Potuguese"] <- "Portuguese";
  data_BLP[data_BLP =="SPANISH"|data_BLP=="Spnsh"|data_BLP=="spanish"] <- "Spanish";
  data_BLP[data_BLP == "ITALIAN"|data_BLP=="italian"] <- "Italian";
  data_BLP[data_BLP == "sotho"] <- "Sotho";
  data_BLP[data_BLP == "Gree"|data_BLP=="GREEK"] <- "Greek";
  data_BLP[data_BLP == "tshivenda"] <- "Tshivenda";
  data_BLP[data_BLP == "Gujrau"] <- "Gujarati"; # to check
  data_BLP[data_BLP == "ukrainian"|data_BLP=="ukranian"] <- "Ukrainian";
  data_BLP[data_BLP == "SETSWANA"] <- "Setswana";
  data_BLP[data_BLP == "afrikaans"] <- "Afrikaans";
  data_BLP[data_BLP == "punjabi"] <- "Punjabi";
  data_BLP[data_BLP == "siswati"] <- "Siswati";
  data_BLP[data_BLP == "Germany"|data_BLP=="german"|data_BLP=="germany"|data_BLP=="GERMANY"] <- "German";
  data_BLP[data_BLP == "russian"] <- "Russian";
  data_BLP[data_BLP == "Isiulu"] <- "IsiZulu";
  data_BLP[data_BLP == "ZULU"|data_BLP=="zulu"] <- "Zulu";
  data_BLP[data_BLP == "northern sotho"] <- "Northern Sotho";
  data_BLP[data_BLP == "chinese"] <- "Chinese";
  data_BLP[data_BLP == "sesotho"] <- "Sesotho";
  data_BLP[data_BLP == "sepedi"] <- "Sepedi";
  data_BLP[data_BLP == "TSHIVENDA"] <- "Tshivenda";
  data_BLP[data_BLP == "XHOSA"] <- "Xhosa";
  data_BLP[data_BLP == "french"] <- "French";
  data_BLP[data_BLP == "hungarian"] <- "Hungarian";
  data_BLP[data_BLP == "POLISH"] <- "Polish";
  data_BLP[data_BLP == "croatian"] <- "Croatian";
  data_BLP[data_BLP == "bosnian"] <- "Bosnian";
  data_BLP[data_BLP == "madarin"] <- "Mandarin";
  data_BLP[data_BLP == "Icelandic and German"] <- "Icelandic";
  data_BLP[data_BLP == "a little bit of russian"] <- "Russian";
  data_BLP[data_BLP == "NDEBELE"] <- "Ndebele";
  data_BLP[data_BLP == "urdu"] <- "Urdu";
  data_BLP[data_BLP == "latvian"] <- "Latvian";
  data_BLP[data_BLP == "Malayam"] <- "Malayan";
  data_BLP[data_BLP == "swahili"] <- "Swahili";
  data_BLP[data_BLP == "serbian"] <- "Serbian";
  data_BLP[data_BLP == "SEPEDI"] <- "Sepedi";
  data_BLP[data_BLP == "japanese"] <- "Japanese";
  data_BLP[data_BLP == "N/A"|data_BLP=="---"] <- "n/a";
  data_BLP["L1"][is.na(data_BLP["L1"])] <- "n/a";
  data_BLP["L2"][is.na(data_BLP["L2"])] <- "n/a";
  data_BLP["L3"][is.na(data_BLP["L3"])] <- "n/a";
  data_BLP["L4"][is.na(data_BLP["L4"])] <- "n/a";
  
  # correcting some participants' demographic information - correction based off of Prolific's information
  data_BLP["Age"][data_BLP["sbj_ID"] == "60c4a402716a8f9074fcd92e"] <- "21";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6103cbc5310ffddfafa01661"] <- "25";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6598994f0e7e5db183bfe3ee"] <- "23";
  data_BLP["Age"][data_BLP["sbj_ID"] == "66168e55cb60649609600268"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "579e18fc4a84da00014c6f4f"] <- "23";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5c1a6bd8f9250d0001b7c589"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "5f6f3d061214fe49ec2b9619"] <- "22";
  data_BLP["Age"][data_BLP["sbj_ID"] == "60ca0b60979a23c83652c303"] <- "24";
  data_BLP["Age"][data_BLP["sbj_ID"] == "653fb764c9aed77c01457531"] <- "20";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6557def45fc0ffbd46ad01de"] <- "18";
  data_BLP["Age"][data_BLP["sbj_ID"] == "657bfe6e245848c8fef0b389"] <- "20";
  data_BLP["Age"][data_BLP["sbj_ID"] == "65abe33e1c79ea32da32ab0f"] <- "19";
  data_BLP["Age"][data_BLP["sbj_ID"] == "65f33b94cd6885d54029582d"] <- "23";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6634e4d4f1950b4dcd44d4d9"] <- "19";
  data_BLP["Age"][data_BLP["sbj_ID"] == "664b7cd6b5a772dd1eddca37"] <- "25";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6659ca4701d47b95a09ba736"] <- "19";
  data_BLP["Age"][data_BLP["sbj_ID"] == "667dd7126e7a9073e0af73fd"] <- "23";
  data_BLP["Age"][data_BLP["sbj_ID"] == "6681625ff9dfa8a95bb0359d"] <- "21";
  
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
# 93/91 M/F split
# mean age = 22.22
# Eng top L1 & L2 lang, by far most popular L2

library(toolbox);
scores_list <- combineCols(data_BLP, cols=c('L1Score','L2Score','L3Score','L4Score'),by_name=TRUE); # combine scores into 1 list
use_scores_list <- combineCols(data_BLP, cols=c('UseL1Score','UseL2Score','UseL3Score','UseL4Score'),by_name=TRUE); # combine use scores into 1 list

# multilingual balance: variance
vars <- list();
for (i in 1:184) { # calculate variance for each participant
  temp <- unlist(scores_list[i]);
  var <- var(temp,na.rm=TRUE);
  vars <- append(vars, var)
};
data_BLP$lang_var <- vars;
data_BLP$lang_var <- as.numeric(data_BLP$lang_var);
plot(data_BLP$sbj_ID,data_BLP$lang_var,pch=19,xlab="Subject number",ylab="Language score variance",ylim=c(0,15000),cex.lab=1.5,yaxs="i");

# multilingual balance: entropy
entropies <- list();
test <- list(200,200,200);
test2 <- unlist(test);
test_ent <- Entropy(test2);
test_ent
#89, 0, 0, 0 -> 0
#50,45,55,50 -> 1.97
#46,45,55,46 -> 1.99
#100,20,50,80 -> 1.81
#100, 20 -> 0.65
#100, 99 -> 0.99
#100, 99, 99 -> 1.58
# Entropy: maybe need something that doesn't penalise an NA? exclude monos?
library(DescTools);
for (i in 1:184) { # calculate entropy for each participant
  temp <- unlist(scores_list[i]);
  entropy <- Entropy(temp,na.rm=TRUE);
  entropies <- append(entropies, entropy)
};
data_BLP$lang_ent <- entropies;
data_BLP$lang_ent <- as.numeric(data_BLP$lang_ent);
plot(data_BLP$sbj_ID,data_BLP$lang_ent,pch=19,xlab="Subject number",ylab="Language score entropy",cex.lab=1.5,ylim=c(0,2.5),yaxs="i");
# looks like 3 groups: at 0 (monos), around 1, around 1.5, around 2

# multilingual balance: USE entropy
use_entropies <- list();
for (i in 1:184) { # calculate entropy for each participant
  temp <- unlist(use_scores_list[i]);
  use_entropy <- Entropy(temp,na.rm=TRUE);
  use_entropies <- append(use_entropies, use_entropy)
};
data_BLP$lang_use_ent <- use_entropies;
data_BLP$lang_use_ent <- as.numeric(data_BLP$lang_use_ent);
summary(data_BLP$lang_use_ent);
plot(data_BLP$sbj_ID,data_BLP$lang_use_ent,pch=19,xlab="Subject number",ylab="Language use score entropy",cex.lab=1.5,ylim=c(0,2),yaxs="i");

# multilingual balance: entropy - Gullifer & Titone (2018)
library(languageEntropy);
for (i in 1:184) { # transfrom 0-10 scores into 0-1
  temp <- unlist(scores_list[i]);
  total <- sum(temp)
  for (j in 1:4) {
    temp[j] <- temp[j]/total
  }
  scores_list[i] <- list(temp)
}
entropies_gul <- data.frame(t(sapply(scores_list,c)))
colnames(entropies_gul) <- c('L1Score','L2Score','L3Score','L4Score');
sbj_ID <- seq.int(187);
entropies_gul <- data.frame(sbj_ID, entropies_gul);
entropies_gul$L2Score[entropies_gul$L2Score==0] <- NA;
entropies_gul$L3Score[entropies_gul$L3Score==0] <- NA;
entropies_gul$L4Score[entropies_gul$L4Score==0] <- NA;
entropy_gul <- languageEntropy(entropies_gul, sbj_ID, L1Score, L2Score, L3Score, L4Score, 
                               contextName = "All");
data_BLP$lang_ent_gul <- entropy_gul$All.entropy;
cor(unlist(data_BLP$lang_ent),unlist(data_BLP$lang_ent_gul),method="pearson"); # r = 1 so same function

# corr of variance & entropy
cor(unlist(data_BLP$lang_var),unlist(data_BLP$lang_ent),method="pearson"); # r = -0.83 strongly negatively correlated

# multilingual experience: summing all language scores
data_BLP["L2Score"][is.na(data_BLP["L2Score"])] <- 0;
data_BLP["L3Score"][is.na(data_BLP["L3Score"])] <- 0;
data_BLP["L4Score"][is.na(data_BLP["L4Score"])] <- 0;
data_BLP$multi_exp <- data_BLP$L1Score + data_BLP$L2Score + data_BLP$L3Score + data_BLP$L4Score;
plot(data_BLP$sbj_ID,data_BLP$multi_exp,pch=19,xlab="Subject number",ylab="Amount of total multilingual experience (out of 872)",ylim=c(0,872),cex.lab=1.5,yaxs="i");
# clustered around 400

# L1 - L2 score
data_BLP$L1_L2_diff <- abs(data_BLP$L1Score - data_BLP$L2Score);
plot(data_BLP$sbj_ID,data_BLP$L1_L2_diff,pch=19,xlab="Subject number",ylab="Score difference of L1 and L2",cex.lab=1.5,ylim=c(0,218),yaxs="i");
# very varied

# cosine similarity
cossim <- read.csv("distances_exp2.csv",header=T,sep=",");
cossim <- subset(cossim, select = -c(X)); # remove redundant column added by Python
names(cossim) <- c('sbj_ID','cosine_similarity');
data_BLP <- merge(data_BLP,cossim,by="sbj_ID");
cor(data_BLP$lang_ent,data_BLP$cosine_similarity); # r = -0.41
summary(data_BLP$cossine_similarity);
#min:0.72 Q1:0.91 med:0.96 mean:0.94 Q3:0.99 max:1
plot(data_BLP$sbj_ID,data_BLP$cosine_similarity,pch=19,xlab="Subject number",ylab="Cosine similarity (multilingual balance)",cex.lab=1.5,yaxs="i");

#use
cossim_use <- read.csv("distances_use_exp2.csv",header=T,sep=",");
cossim_use <- subset(cossim_use, select = -c(X)); # remove redundant column added by Python
names(distances) <- c('sbj_ID','use_cosine_similarity');
data_BLP <- merge(data_BLP,cossim_use,by="sbj_ID");
cor(data_BLP$lang_use_ent,data_BLP$use_cosine_similarity); # r = -0.10


# CLUSTERING #
complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]

# all without language dominance scores
png('exp2_corrPlot_all.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(31:46)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_all.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(31:46)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
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
pca_varimax <- psych::principal(data_BLP[,31:46], nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax$scores[,c('RC1','RC3','RC2','RC7','RC9')]);
names(data_BLP)[116:120] <- c('RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4');

complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]

png('exp2_corrPlot_pca.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(31:46,117:121)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_pca.png', width=1000, height=1000);
corrplot::corrplot(cor(data_filtered[,c(31:46,117:121)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# code from Davide that doesn't work
source("C:/Users/annal/OneDrive/Documents/Me/SISSA/BASL/BASL analysis/FunnyPeopleFunction_RodriguezLaioClustering.R");
funnyPeople(scores=as.vector(ppt_in_pca_space_5), sbjId=rep(1:184,5), itemId=rep(1:5, each=30), outForMatlabFunction=F);

# adding testing scores and BLP metrics together
library(tidyverse);
data_BLP_extracted_all <- subset(data_BLP, select=c(sbj_ID,Gender,Age,HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,multi_exp,L1_L2_diff,cosine_similarity,RC1_L4,RC3_L3,RC2_use_L1vsL2,RC7_hist_L2,RC9_use_L4));
data_BLP_testing_all <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');

# corr of variance & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$lang_var); # r = -0.05
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2, xlab="Language score variance", ylab="2M accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$lang_var); # r = -0.13
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2_hits, xlab="Language score variance", ylab="2M hit accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$lang_var); # r = 0.08
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2_rejs, xlab="Language score variance", ylab="2M rejection accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

# corr of entropy & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$lang_ent); # r = 0.14
plot(data_BLP_testing_all$lang_ent, data_BLP_testing_all$x_2, xlab="Language score entropy", ylab="2M accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$lang_ent); # r = 0.18
plot(data_BLP_testing_all$lang_ent, data_BLP_testing_all$x_2_hits, xlab="Language score entropy", ylab="2M hit accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$lang_ent); # r = -0.05
plot(data_BLP_testing_all$lang_ent, data_BLP_testing_all$x_2_rejs, xlab="Language score entropy", ylab="2M rejection accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

# corr of cosine similarity & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$cosine_similarity); # r = -0.19
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2, xlab="Language score variance", ylab="2M accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$cosine_similarity); # r = 0.01
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2_hits, xlab="Language score variance", ylab="2M hit accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$cosine_similarity); # r = -0.19
plot(data_BLP_testing_all$lang_var, data_BLP_testing_all$x_2_rejs, xlab="Language score variance", ylab="2M rejection accuracy (in %)", pch=19);
abline(h=0.5, lty=5);

# corr of multilingual experience & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$multi_exp); # r = 0.10
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2, xlab="Multilingual experience", ylab="2M accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$multi_exp); # r = 0.18
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2_hits, xlab="Multilingual experience", ylab="2M hit accuracy (in %)", cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_hits~data_BLP_testing_all$multi_exp), col = "red",lwd=2);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$multi_exp); # r = -0.08
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2_rejs, xlab="Multilingual experience", ylab="2M rejection accuracy (in %)", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

names(data_testing_2M_yes) <- c("sbj_ID","x_2_yes");
data_BLP_testing_all <- merge(data_BLP_testing_all, data_testing_2M_yes,by="sbj_ID");
cor(data_BLP_testing_all$x_2_yes, data_BLP_testing_all$multi_exp); # r = 0.15
plot(data_BLP_testing_all$multi_exp, data_BLP_testing_all$x_2_yes, xlab="Multilingual experience", ylab='2M "yes" responses', cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_yes~data_BLP_testing_all$multi_exp), col = "red",lwd=2);
abline(h=50, lty=5);

# corr of L1-L2 score & accuracy
cor(data_BLP_testing_all$x_2, data_BLP_testing_all$L1_L2_diff); # r = -0.04
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2, xlab="L1-L2 difference", ylab="2M accuracy", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_hits, data_BLP_testing_all$L1_L2_diff); # r = -0.21
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2_hits, xlab="L1-L2 difference", ylab="Testing hit accuracy", cex.lab=1.5,pch=19);
abline(lm(data_BLP_testing_all$x_2_hits~data_BLP_testing_all$L1_L2_diff), col = "red",lwd=2);
abline(h=0.5, lty=5);

cor(data_BLP_testing_all$x_2_rejs, data_BLP_testing_all$L1_L2_diff); # r = 0.16
plot(data_BLP_testing_all$L1_L2_diff, data_BLP_testing_all$x_2_rejs, xlab="L1-L2 difference", ylab="Testing rejection accuracy", cex.lab=1.5,pch=19);
abline(h=0.5, lty=5);

# dprimes - 2M
cor(data_BLP_testing_all$c,data_BLP_testing_all$multi_exp); # r = -0.14
cor(data_BLP_testing_all$c,data_BLP_testing_all$L1_L2_diff); # r = 0.20
cor(data_BLP_testing_all$c,data_BLP_testing_all$lang_ent); # r = -0.13
cor(data_BLP_testing_all$c,data_BLP_testing_all$cosine_similarity); # r = -0.11
cor(data_BLP_testing_all$dprime,data_BLP_testing_all$multi_exp); # r = 0.09
cor(data_BLP_testing_all$dprime,data_BLP_testing_all$L1_L2_diff); # r = -0.04
cor(data_BLP_testing_all$dprime,data_BLP_testing_all$lang_ent); # r = 0.12
cor(data_BLP_testing_all$dprime,data_BLP_testing_all$cosine_similarity); # r = -0.19

data_BLP_testing_dprimes2M <- list(dprimes2M,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC1_L4); # r = -0.01
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC3_L3); # r = 0.04
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC2_use_L1vsL2); # r = -0.01
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC7_hist_L2); # r = -0.03
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes2M$RC9_use_L4); # r = 0.04

# correlation plot of testing scores and BLP metrics
png('exp2_corrPlot_BLPtesting.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_all[,c(2,12:43)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

# 1M & 2M clustering - weird stuff
data_testing_1M2M_means <- merge(data_testing_1M_means,data_testing_2M_means,by.x='sbj_ID',by.y='sbj_ID');
data_BLP_testing_1M2M_means <- merge(data_testing_1M2M_means, data_BLP_extracted_all[,c('sbj_ID','lang_ent','multi_exp','L1_L2_diff','cosine_similarity','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
png('exp2_corrPlot_1M2Mmeans.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_testing_1M2M_means[,c(2:14)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_1M2Mmeans.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_testing_1M2M_means[,c(2:14)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
# no corrs with x_1 and x_2

# more weird stuff
data_testing_1M2M_yes <- merge(data_testing_1M_yes,data_testing_2M_yes,by.x='sbj_ID',by.y='sbj_ID');
data_BLP_testing_1M2M_yes <- merge(data_testing_1M2M_yes, data_BLP_extracted_all[,c('sbj_ID','lang_ent','multi_exp','L1_L2_diff','cosine_similarity','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
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
data_BLP_familiaritymeans <- merge(data_familiarity_means, data_BLP_extracted_all[,c('sbj_ID','lang_ent','multi_exp','L1_L2_diff','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
png('exp2_corrPlot_familiarity.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_familiaritymeans[,c(2:9)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('exp2_corrPlotClustering_familiarity.png', width=1000, height=1000);
corrplot::corrplot(cor(data_BLP_familiaritymeans[,c(2:9)]), type="lower", order="hclust", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();
# mean familiarity accuracy not correlated with any BLP variables

# analysis of good best participant characteristics
good_participants_BLP <- merge(good_participants, data_BLP[data_BLP$sbj_ID %in% good_participants$sbj_ID,], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP);
summary(good_participants_BLP);

#Age
hist(data_BLP$Age,main = "Age: full vs good participants",xlab = "Age",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$Age,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#HistL1
hist(data_BLP$HistoryL1Score,main = "HistL1: full vs good participants",xlab = "HistL1",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$HistoryL1Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#HistL2
hist(data_BLP$HistoryL2Score,main = "HistL2: full vs good participants",xlab = "HistL2",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$HistoryL2Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#HistL3
hist(data_BLP$HistoryL3Score,main = "HistL3: full vs good participants",xlab = "HistL3",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$HistoryL3Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#HistL4
hist(data_BLP$HistoryL4Score,main = "HistL4: full vs good participants",xlab = "HistL4",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$HistoryL4Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#UseL1
hist(data_BLP$UseL1Score,main = "UseL1: full vs good participants",xlab = "UseL1",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$UseL1Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#UseL2
hist(data_BLP$UseL2Score,main = "UseL2: full vs good participants",xlab = "UseL2",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$UseL2Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#UseL3
hist(data_BLP$UseL3Score,main = "UseL3: full vs good participants",xlab = "UseL3",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$UseL3Score,breaks = 6,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#UseL4
hist(data_BLP$UseL4Score,main = "UseL4: full vs good participants",xlab = "UseL4",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$UseL4Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#ProfL1
hist(data_BLP$ProficiencyL1Score,main = "ProfL1: full vs good participants",xlab = "ProfL1",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$ProficiencyL1Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#ProfL2
hist(data_BLP$ProficiencyL2Score,main = "ProfL2: full vs good participants",xlab = "ProfL2",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$ProficiencyL2Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#ProfL3
hist(data_BLP$ProficiencyL3Score,main = "ProfL3: full vs good participants",xlab = "ProfL3",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$ProficiencyL3Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#ProfL4
hist(data_BLP$ProficiencyL4Score,main = "ProfL4: full vs good participants",xlab = "ProfL4",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$ProficiencyL4Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#AttL1
hist(data_BLP$AttitudeL1Score,main = "AttL1: full vs good participants",xlab = "AttL1",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$AttitudeL1Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#AttL2
hist(data_BLP$AttitudeL2Score,main = "AttL2: full vs good participants",xlab = "AttL2",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$AttitudeL2Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#AttL3
hist(data_BLP$AttitudeL3Score,main = "AttL3: full vs good participants",xlab = "AttL3",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$AttitudeL3Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#AttL4
hist(data_BLP$AttitudeL4Score,main = "AttL4: full vs good participants",xlab = "AttL4",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$AttitudeL4Score,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#ent
hist(data_BLP$lang_ent,main = "ent: full vs good participants",xlab = "ent",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$lang_ent,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#multi_exp
hist(data_BLP$multi_exp,main = "multi_exp: full vs good participants",xlab = "multi_exp",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$multi_exp,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#L1L2diff
hist(data_BLP$L1_L2_diff,main = "L1L2diff: full vs good participants",xlab = "L1L2diff",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$L1_L2_diff,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#vector_distance
hist(data_BLP$vector_distance,main = "Vector distance: full vs good participants",xlab = "L1L2diff",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$vector_distance,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#RC1_L4
hist(data_BLP$RC1_L4,main = "RC1_L4: full vs good participants",xlab = "RC1_L4",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$RC1_L4,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#RC3_L3
hist(data_BLP$RC3_L3,main = "RC3_L3: full vs good participants",xlab = "RC3_L3",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$RC3_L3,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#RC2_use_L1vsL2
hist(data_BLP$RC2_use_L1vsL2, main = "RC2_use_L1vsL2: full vs good participants",xlab = "RC2_use_L1vsL2",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$RC2_use_L1vsL2,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#RC7_hist_L2
hist(data_BLP$RC7_hist_L2,main = "RC7_hist_L2: full vs good participants",xlab = "RC7_hist_L2",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$RC7_hist_L2,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));
#RC9_use_L4
hist(data_BLP$RC9_use_L4,main = "RC9_use_L4: full vs good participants",xlab = "RC9_use_L4",col = rgb(0.35, 0.11, 0.02, 0.75));
hist(good_participants_BLP$RC9_use_L4,add = TRUE,col = rgb(0.25, 0.54, 0.47, 0.75));

# none of these seem to be different for the good participants



################
# LINEAR MODEL #
################
library(lme4);
library(emmeans);
library(BayesFactor);

# TESTING #
data_testing_lm <- merge(data_testing, data_BLP[,c('sbj_ID','Gender','Age','L2Score','lang_ent','multi_exp','L1_L2_diff','cosine_similarity','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);

#all testing conditions - 'yes' responses
lm_TestingConditions <- glmer(observed ~ scale(trialn) + testing_condition + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_TestingConditions); # all conditions sig
emmeans(lm_TestingConditions, pairwise ~ testing_condition, adjust = "tukey");
# 0M-1M: estimate=-0.252, p<0.0001
# 0M-2M: estimate=-0.546, p<0.0001
# 1M-2M: estimate=-0.295, p<0.0001
lm_Gender <- glmer(observed ~ scale(trialn) + testing_condition*Gender + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_Gender); # Gender non sig as main effect (p=0.88); 1M:Woman sig (0.03)
lm_Age <- glmer(observed ~ scale(trialn) + testing_condition*scale(Age) + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_Age); # Age non sig as main effect (0.78); 2M:Age sig (p=0.048)
lm_RC1 <- glmer(observed ~ scale(trialn) + testing_condition*RC1_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC1); # RC1 marg. sig as main effect (p=0.07), non sig 1M:RC1 (p=0.51), non sig 2M*RC1 (0.31)
lm_RC3 <- glmer(observed ~ scale(trialn) + testing_condition*RC3_L3 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC3); # RC3 non sig as main effect (p=0.25); marg. sig 1M:RC3 (p=0.08); non sig 2M:RC3 (p=0.72)
lm_RC2 <- glmer(observed ~ scale(trialn) + testing_condition*RC2_use_L1vsL2 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC2); # RC2 non sig as main effect (p=0.85); non sig 1M:RC2 (p=0.19); sig 2M:RC2 (p=0.043)
lm_RC7 <- glmer(observed ~ scale(trialn) + testing_condition*RC7_hist_L2 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC7); # RC7 sig as main effect (p=0.03); non sig 1M:RC7 (p=0.87); non sig 2M:RC7 (p=0.87)
lm_RC9 <- glmer(observed ~ scale(trialn) + testing_condition*RC9_use_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_RC9); # RC9 non sig as main effect (p=0.81); 1M:RC9 non sig (p=0.58); 2M:RC9 non sig (0.74)
lm_ent <- glmer(observed ~ scale(trialn) + testing_condition*lang_ent + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_ent); # lang_ent marg. sig as main effect (p=0.07); 1M:ent marg. sig (p=0.07); 2M:ent non sig (p=0.75)
lm_use_ent <- glmer(observed ~ scale(trialn) + testing_condition*lang_use_ent + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_use_ent); # lang_use_ent marg. sig as main effect (p=0.06); 1M:use_ent marg. sig (p=0.07); 2M:use_ent non sig (p=0.67)
lm_multiexp <- glmer(observed ~ scale(trialn) + testing_condition*scale(multi_exp) + (1|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_multiexp); # multi_exp sig (p=0.0008); 1M:multiexp sig (p=0.02); 2M:multiexp non sig (p=0.52)
lm_L1L2diff <- glmer(observed ~ scale(trialn) + testing_condition*scale(L1_L2_diff) + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000), family='binomial');
summary(lm_L1L2diff); # L1L2diff sig (p=0.04); 1M:L1L2 non sig (p=0.36); 2M:L1L2 non sig (p=0.23)
lm_cossim <- glmer(observed ~ scale(trialn) + testing_condition*cosine_similarity + (1+testing_condition|sbj_ID), data=subset(data_testing_lm, rt>300 & rt<3000, L2Score>0), family='binomial');
summary(lm_cossim); # cossim non sig (p=0.23); 1M:cossim non sig (p=0.14); 2M:cossim non sig (p=0.64)

#2M - accuracy
data_testing_lm_2M <- subset(data_testing_lm[data_testing$testing_condition=='2M',]);
lm_2M_Gender <- glmer(observed ~ scale(trialn) + expected*Gender + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_Gender); # Gender non sig (p=0.31); expected:Gender non sig (p=0.58)
lm_2M_Age <- glmer(observed ~ scale(trialn) + expected*scale(Age) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_Age); # Age non sig (p=0.13); expected:Age non sig (p=0.74)
lm_2M_RC1 <- glmer(observed ~ scale(trialn) + expected*RC1_L4 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC1); # RC1 non sig (p=0.73); expected:RC1 non sig (p=0.88)
lm_2M_RC3 <- glmer(observed ~ scale(trialn) + expected*RC3_L3 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC3); # RC3 non sig (p=0.81); expected:RC3 non sig (p=0.41)
lm_2M_RC2 <- glmer(observed ~ scale(trialn) + expected*RC2_use_L1vsL2 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC2); # RC2 marg. sig (p=0.06); expected:RC2 non sig (p=0.94)
lm_2M_RC7 <- glmer(observed ~ scale(trialn) + expected*RC7_hist_L2 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC7); # RC7 marg. sig (p=0.06); expected:RC7 non sig (p=0.93)
lm_2M_RC9 <- glmer(observed ~ scale(trialn) + expected*RC9_use_L4 + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_RC9); # R9 non sig (p=0.18); expected:RC9 non sig (p=0.38)
lm_2M_ent <- glmer(observed ~ scale(trialn) + expected*lang_ent + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_ent); # lang_ent non sig (p=0.48); expected:ent marg. sig(p=0.07)
# without monos: lang_ent non sig (p=0.32); expected:ent non sig (p=0.64)
lm_2M_multiexp <- glmer(observed ~ scale(trialn) + expected*scale(multi_exp) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_multiexp); # multi_exp non sig (p=0.27); expected:multiexp non sig (p=0.16)
lm_2M_L1L2diff <- glmer(observed ~ scale(trialn) + expected*scale(L1_L2_diff) + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_L1L2diff); # L1_L2_diff sig (p=0.02); expected:L1L2diff non sig (p=0.67)
lm_2M_cossim <- glmer(observed ~ scale(trialn) + expected*cosine_similarity + (1+expected|sbj_ID), data=data_testing_lm_2M, family='binomial');
summary(lm_2M_cossim); # w/ monos: cossim sig as main effect (p=0.01); expected:cossim sig (p=0.008)
# w/out monos: cossim sig as main effect (p=0.007); expected:cossim sig (p=0.038)

# FAMILIARITY #
data_BLP_familiarity <- merge(data_familiarity, data_BLP_extracted_all[,c('sbj_ID','Gender','Age','L2Score','lang_ent','multi_exp','L1_L2_diff','cosine_similarity','RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
data_BLP_familiarity$correct_numerical <- as.numeric(data_BLP_familiarity$correct);
lm_fam_Gender <- glmer(correct ~ scale(trialn) + Gender + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_Gender); # Gender non sig (p=0.66)
lm_fam_Age <- glmer(correct ~ scale(trialn) + scale(Age) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_Age); # Age non sig (p=0.13)
lm_fam_RC1 <- glmer(correct ~ scale(trialn) + RC1_L4 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC1); # RC1_L4 non sig (p=0.96)
lm_fam_RC3 <- glmer(correct ~ scale(trialn) + RC3_L3 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC3); # RC3_L3 non sig (p=0.19)
lm_fam_RC2 <- glmer(correct ~ scale(trialn) + RC2_use_L1vsL2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC2); # RC2_use_L1vsL2 non sig (p=0.71)
lm_fam_RC7 <- glmer(correct ~ scale(trialn) + RC7_hist_L2 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_RC7); # RC7_hist_L2 non sig (p=0.70)
lm_fam_RC9 <- glmer(correct ~ scale(trialn) + RC9_use_L4 + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_R9); # PROBLEM
lm_fam_ent <- glmer(correct ~ scale(trialn) + lang_ent + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_ent); # lang_ent marg. sig (p=0.09)
lm_fam_use_ent <- glmer(correct ~ scale(trialn) + lang_use_ent + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_use_ent); # use_ent non sig (p=0.13)
lm_fam_multiexp <- glmer(correct ~ scale(trialn) + scale(multi_exp) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_multiexp); # multi_exp non sig (p=0.25)
lm_fam_L1L2diff <- glmer(correct ~ scale(trialn) + scale(L1_L2_diff) + (1|sbj_ID), data=data_BLP_familiarity, family='binomial');
summary(lm_fam_L1L2diff); # L1_L2_diff non sig (p=0.62)

##### FIND OUT HOW TO RUN
library(BayesRS);
dat.str <- data.frame(iv = c("trialn","L1_L2_diff"),
                      type = c("cont"),
                      sbj_ID = c(1));
modelrun(data_BLP_familiarity,dv='correct',dat.str=dat.str)[[1]];



lm_fam_cossim <- glmer(correct ~ scale(trialn) + cosine_similarity + (1|sbj_ID), data=data_BLP_familiarity[data_BLP_familiarity$L2Score>0,], family='binomial');
summary(lm_fam_cossim); # cossim non sig (p=0.11 w/ monos, p=0.18 w/out)

# "YES" LMERS
data_BLP_testing_0M_yes <- merge(data_testing_0M_yes, subset(data_BLP,select=c('sbj_ID','RC7_hist_L2','multi_exp','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP_testing_0M_yes$x_0);
#min:0 Q1:42.5 med:52.5 mean:52.63 Q3:62.5 max:100
data_BLP_testing_1M_yes <- merge(data_testing_1M_yes, subset(data_BLP,select=c('sbj_ID','RC7_hist_L2','multi_exp','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP_testing_1M_yes$x_1);
#min:0 Q1:50 med:57.5 mean:58.41 Q3:67.5 max:100
data_BLP_testing_2M_yes <- merge(data_testing_2M_yes, subset(data_BLP,select=c('sbj_ID','RC7_hist_L2','multi_exp','L1_L2_diff')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);
summary(data_BLP_testing_2M_yes$x_2);
#min:0 Q1:52.5 med:62.5 mean:63.34 Q3:72.5 max:100

# RC7
data_BLP_testing_0M_yes_RC7 <- aggregate(data_BLP_testing_0M_yes$x_0, by=list(data_BLP_testing_0M_yes$RC7_hist_L2), FUN = mean);
names(data_BLP_testing_0M_yes_RC7) <- c('RC7_hist_L2','mean_0M_yes');
data_BLP_testing_1M_yes_RC7 <- aggregate(data_BLP_testing_1M_yes$x_1, by=list(data_BLP_testing_1M_yes$RC7_hist_L2), FUN = mean);
names(data_BLP_testing_1M_yes_RC7) <- c('RC7_hist_L2','mean_1M_yes');
data_BLP_testing_2M_yes_RC7 <- aggregate(data_BLP_testing_2M_yes$x_2, by=list(data_BLP_testing_2M_yes$RC7_hist_L2), FUN = mean);
names(data_BLP_testing_2M_yes_RC7) <- c('RC7_hist_L2','mean_2M_yes');

plot(data_BLP_testing_0M_yes$RC7_hist_L2,data_BLP_testing_0M_yes$x_0,xlab="RC7_hist_L2",ylab="0M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_0M_yes_RC7$mean_0M_yes~data_BLP_testing_0M_yes_RC7$RC7_hist_L2), col = "red",lwd=2);
abline(h=50,lty=5);
# higher L2 hist (younger bi) -> more 0M "yes"
# later bis better at "no" to 0M
plot(data_BLP_testing_1M_yes$RC7_hist_L2,data_BLP_testing_1M_yes$x_1,xlab="RC7_hist_L2",ylab="1M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_1M_yes_RC7$mean_1M_yes~data_BLP_testing_1M_yes_RC7$RC7_hist_L2), col = "red",lwd=2);
abline(h=50,lty=5);
# higher L2 hist (younger bi) -> more 1M "yes"
# earlier bis better at "yes" to 1M
plot(data_BLP_testing_2M_yes$RC7_hist_L2,data_BLP_testing_2M_yes$x_2,xlab="RC7_hist_L2",ylab="2M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_2M_yes_RC7$mean_2M_yes~data_BLP_testing_2M_yes_RC7$RC7_hist_L2), col = "red",lwd=2);
abline(h=50,lty=5);
# higher L2 hist (younger bi) -> more 2M "yes"
# earlier bis better at "yes" to 2M

# multiexp
data_BLP_testing_0M_yes_multiexp <- aggregate(data_BLP_testing_0M_yes$x_0, by=list(data_BLP_testing_0M_yes$multi_exp), FUN = mean);
names(data_BLP_testing_0M_yes_multiexp) <- c('multiexp','mean_0M_yes');
data_BLP_testing_1M_yes_multiexp <- aggregate(data_BLP_testing_1M_yes$x_1, by=list(data_BLP_testing_1M_yes$multi_exp), FUN = mean);
names(data_BLP_testing_1M_yes_multiexp) <- c('multiexp','mean_1M_yes');
data_BLP_testing_2M_yes_multiexp <- aggregate(data_BLP_testing_2M_yes$x_2, by=list(data_BLP_testing_2M_yes$multi_exp), FUN = mean);
names(data_BLP_testing_2M_yes_multiexp) <- c('multiexp','mean_2M_yes');

cor(data_BLP_testing_dprimes2M$multi_exp,data_BLP_testing_dprimes2M$c); # r = -0.09

plot(data_BLP_testing_0M_yes$multi_exp,data_BLP_testing_0M_yes$x_0,xlab="Multilingual experience",ylab="0M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_0M_yes_multiexp$mean_0M_yes~data_BLP_testing_0M_yes_multiexp$multiexp), col = "red",lwd=2);
abline(h=50,lty=5);
# more multiexp -> more 0M "yes"
plot(data_BLP_testing_1M_yes$multi_exp,data_BLP_testing_1M_yes$x_1,xlab="Multilingual experience",ylab="1M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_1M_yes_multiexp$mean_1M_yes~data_BLP_testing_1M_yes_multiexp$multiexp), col = "red",lwd=2);
abline(h=50,lty=5);
# more multiexp -> more 2M "yes"
plot(data_BLP_testing_2M_yes$multi_exp,data_BLP_testing_2M_yes$x_2,xlab="Multilingual experience",ylab="2M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_2M_yes_multiexp$mean_2M_yes~data_BLP_testing_2M_yes_multiexp$multiexp), col = "red",lwd=2);
abline(h=50,lty=5);
# more multiexp -> more 2M "yes"

#plot 2
library(effects);
summary(data_BLP$multi_exp);
multiexp_values <- c(200,320,380,600);
multiexp_predictions <- data.frame(Effect(mod=lm_multiexp, focal.predictors=c('testing_condition','multi_exp'), xlevels=list(multi_exp=multiexp_values)));
multiexp_predictions <- na.omit(multiexp_predictions);
multiexp_predictions$testing_condition <- as.numeric(multiexp_predictions$testing_condition);

par(mar=c(5,5,2,2))
with(subset(multiexp_predictions, multi_exp=="200"),
     plot(as.numeric(testing_condition), fit, type="b", lty=1, lwd=4, col=cols[4], ylim=c(0.2,0.8), xlab="Testing condition", ylab='Proportion of "yes" responses',cex.lab=2,xaxt="n",yaxt="n"))
axis(2,at=c(0.4,0.5,0.6,0.7),cex.axis=1.5)
axis(1,at=c(1,2,3),labels=c("0M","1M","2M"),cex.axis=1.5)
abline(h=0.5, lty=5, lwd=2);

with(subset(multiexp_predictions, multi_exp=="320"),
     lines(as.numeric(testing_condition), fit, type="b", lty=2, lwd=4, col=cols[3]))

with(subset(multiexp_predictions, multi_exp=="380"),
     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

with(subset(multiexp_predictions, multi_exp=="600"),
     lines(as.numeric(testing_condition), fit, type="b", lty=4, lwd=4, col=cols[1]))

legend("bottomright",title="Multilingual experience",c("Low","Average","High","Very high"),
       lty=c(1,2,3,4),lwd=4,col=c(cols[4],cols[3],cols[2],cols[1]),bty = "n",
       cex=1.5,y.intersp=0.75);
# Very high balance: no difference between 0M and 1M, want to see 2M to say "yes"

# L1L2diff
data_BLP_testing_0M_yes_L1L2diff <- aggregate(data_BLP_testing_0M_yes$x_0, by=list(data_BLP_testing_0M_yes$L1_L2_diff), FUN = mean);
names(data_BLP_testing_0M_yes_L1L2diff) <- c('L1L2diff','mean_0M_yes');
data_BLP_testing_1M_yes_L1L2diff <- aggregate(data_BLP_testing_1M_yes$x_1, by=list(data_BLP_testing_1M_yes$L1_L2_diff), FUN = mean);
names(data_BLP_testing_1M_yes_L1L2diff) <- c('L1L2diff','mean_1M_yes');
data_BLP_testing_2M_yes_L1L2diff <- aggregate(data_BLP_testing_2M_yes$x_2, by=list(data_BLP_testing_2M_yes$L1_L2_diff), FUN = mean);
names(data_BLP_testing_2M_yes_L1L2diff) <- c('L1L2diff','mean_2M_yes');

cor(data_BLP_testing_dprimes2M$L1_L2_diff,data_BLP_testing_dprimes2M$c); # r = 0.19

plot(data_BLP_testing_0M_yes$L1_L2_diff,data_BLP_testing_0M_yes$mean_0M_yes,xlab="L1-L2 difference",ylab="0M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_0M_yes_L1L2diff$mean_0M_yes~data_BLP_testing_0M_yes_L1L2diff$L1L2diff), col = "red",lwd=2);
abline(h=50,lty=5);
# more balance -> more 0M "yes"
plot(data_BLP_testing_1M_yes$L1_L2_diff,data_BLP_testing_1M_yes$x_1,xlab="L1-L2 difference",ylab="1M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_1M_yes_L1L2diff$mean_1M_yes~data_BLP_testing_1M_yes_L1L2diff$L1L2diff), col = "red",lwd=2);
abline(h=50,lty=5);
# not really any effect
plot(data_BLP_testing_2M_yes$L1_L2_diff,data_BLP_testing_2M_yes$x_2,xlab="L1-L2 difference",ylab="2M 'yes' responses (in %)",ylim=c(0,100),pch=19,yaxs="i");
abline(lm(data_BLP_testing_2M_yes_L1L2diff$mean_2M_yes~data_BLP_testing_2M_yes_L1L2diff$L1L2diff), col = "red",lwd=2);
abline(h=50,lty=5);
# more balance -> more 2M "yes"

#plot 2
library(effects);
summary(data_BLP$L1_L2_diff);
L1L2diff_values <- c(-20,0,70,120);
L1L2diff_predictions <- data.frame(Effect(mod=lm_L1L2diff, focal.predictors=c('testing_condition','L1_L2_diff'), xlevels=list(L1_L2_diff=L1L2diff_values)));
L1L2diff_predictions <- na.omit(L1L2diff_predictions);
L1L2diff_predictions$testing_condition <- as.numeric(L1L2diff_predictions$testing_condition);

par(mar=c(5,5,2,2))
with(subset(L1L2diff_predictions, L1_L2_diff=="-20"),
     plot(as.numeric(testing_condition), fit, type="b", lty=1, lwd=4, col=cols[4], ylim=c(0.2,0.8), xlab="Testing condition", ylab='Proportion of "yes" responses',cex.lab=2,xaxt="n",yaxt="n"))
axis(2,at=c(0.4,0.5,0.6,0.7),cex.axis=1.5)
axis(1,at=c(1,2,3),labels=c("0M","1M","2M"),cex.axis=1.5)
abline(h=0.5, lty=5, lwd=2);

with(subset(L1L2diff_predictions, L1_L2_diff=="0"),
     lines(as.numeric(testing_condition), fit, type="b", lty=2, lwd=4, col=cols[3]))

with(subset(L1L2diff_predictions, L1_L2_diff=="70"),
     lines(as.numeric(testing_condition), fit, type="b", lty=3, lwd=4, col=cols[2]))

with(subset(L1L2diff_predictions, L1_L2_diff=="120"),
     lines(as.numeric(testing_condition), fit, type="b", lty=4, lwd=4, col=cols[1]))

legend("bottomright",title="L1-L2 difference",c("More L2","Balanced","More L1","Much more L1"),
       lty=c(1,2,3,4),lwd=4,col=c(cols[4],cols[3],cols[2],cols[1]),bty = "n",
       cex=1.5,y.intersp=0.75);


# 2M LMERS
#ent
data_BLP_testing_2M_ent_means <- merge(data_testing_2M_means, subset(data_BLP,select=c('sbj_ID','lang_ent')), by.x='sbj_ID',by.y='sbj_ID', all.x=T);

plot(data_BLP_testing_2M_ent_means$lang_ent,data_BLP_testing_2M_ent_means$x_2,xlab="Language entropy",ylab="2M scores",ylim=c(0.2,0.7),pch=19,yaxs="i",xaxs="i",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_2M_ent_means$x_2~data_BLP_testing_2M_ent_means$lang_ent), col = "red",lwd=2);
abline(h=0.5,lty=5);

plot(data_BLP_testing_all$lang_ent,data_BLP_testing_all$x_2_hits,pch=19,yaxs="i",ylab="Proportion of 2M hits",xlab="Language entropy",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_all$x_2_hits~data_BLP_testing_all$lang_ent), col = "red",lwd=2);
abline(h=0.5,lty=5);

lm_2M_cong_ent <- glmer(observed ~ scale(trialn) + expected*scale(lang_ent) + (1+expected|sbj_ID), data=subset(data_testing_lm_2M,expected=="1"), family='binomial');
summary(lm_2M_cong_ent); # ent sig (p=0.049)
# more ent -> more 2M hits

# d' for different levels of ent
plot(data_BLP_testing_all$lang_ent,data_BLP_testing_all$dprime,pch=19,ylab="D Primes",xlab="Language entropy",yaxs="i",xaxs="i",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_all$dprime~data_BLP_testing_all$lang_ent), col = "red",lwd=2);
abline(h=0,lty=5);
# lower ent -> negative d'

summary(data_BLP$lang_ent);
low_ent <- data_BLP_testing_all[data_BLP_testing_all$lang_ent<0.66,];
summary(low_ent$dprime); # mean = -0.23
summary(low_ent$c); # mean = -0.26
summary(low_ent$hits); # mean = 0.28
summary(low_ent$rejs); # mean = 0.18
summary(low_ent$misses); # mean = 0.22
summary(low_ent$alarms); # mean = 0.32
plot(mean(low_ent$lang_ent),mean(low_ent$dprime),pch=19,xlim=c(-0.1,2),ylim=c(-0.3,0.2),xlab="Language entropy",ylab="D prime");

med_ent <- data_BLP_testing_all[data_BLP_testing_all$lang_ent>0.66&data_BLP_testing_all$lang_ent<1.33,];
summary(med_ent$dprime); # mean = 0.01
summary(med_ent$c); # mean = -0.39
summary(med_ent$hits); # mean = 0.32
summary(med_ent$rejs); # mean = 0.18
summary(med_ent$misses); # mean = 0.18
summary(med_ent$alarms); # mean = 0.32
points(mean(med_ent$lang_ent),mean(med_ent$dprime),pch=19);

high_ent <- data_BLP_testing_all[data_BLP_testing_all$lang_ent>1.33,];
summary(high_ent$dprime); # mean = -0.01
summary(high_ent$c);# mean = -0.37
summary(high_ent$hits); # mean = 0.32
summary(high_ent$rejs); # mean = 0.18
summary(high_ent$misses); # mean = 0.18
summary(high_ent$alarms); # mean = 0.32
points(mean(high_ent$lang_ent),mean(high_ent$dprime),pch=19);
abline(h=0,lty=5);

#vector distance
plot(data_BLP_testing_all$vector_distance,data_BLP_testing_all$x_2,pch=19,xlab="Cosine similarity",ylab="2M score",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_all$x_2~data_BLP_testing_all$vector_distance), col = "red",lwd=2);
abline(h=0.5,lty=5);
cor(data_BLP_testing_all$vector_distance,data_BLP_testing_all$multi_exp); # r = -0.15
legend("bottomleft","Pearson's r = -0.15",bty="n");

plot(data_BLP_testing_all$vector_distance[data_BLP_testing_all$L2Score>0],data_BLP_testing_all$x_2[data_BLP_testing_all$L2Score>0],pch=19);
abline(lm(data_BLP_testing_all$x_2[data_BLP_testing_all$L2Score>0]~data_BLP_testing_all$vector_distance[data_BLP_testing_all$L2Score>0]), col = "red",lwd=2);
abline(h=0.5,lty=5);

plot(data_BLP_testing_all$vector_distance,data_BLP_testing_all$dprime,pch=19,xlab="Cosine similarity",ylab="D prime in the 2M condition",cex.lab=2,cex.axis=1.75);
abline(lm(data_BLP_testing_all$dprime~data_BLP_testing_all$vector_distance), col = "red",lwd=2);
abline(h=0,lty=5);
cor(data_BLP_testing_all$vector_distance,data_BLP_testing_all$dprime); # r = -0.19
legend("bottomleft","Pearson's r = -0.19",bty="n");


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

data_BLP_clustering <- subset(data_BLP, select=c(sbj_ID,RC1_L4,RC3_L3,RC2_use_L1vsL2,RC7_hist_L2,RC9_use_L4));
data_clustering <- data.frame();
sbj_ID <- as.character(data_BLP_clustering$sbj_ID);
for (x in 1:187) {
  sbj_ID = sbj_ID[x]
  RC1_L4 = data_BLP_clustering[x,2]
  RC3_L3 = data_BLP_clustering[x,3]
  RC2_use_L1vsL2 = data_BLP_clustering[x,4]
  RC7_hist_L2 = data_BLP_clustering[x,5]
  RC9_use_L4 = data_BLP_clustering[x,6]
  temp <- data.frame('sbj_ID'=rep(sbj_ID,5),
                     'scores'=c(RC1_L4,RC3_L3,RC2_use_L1vsL2,RC7_hist_L2,RC9_use_L4),
                     'dimensions'=c('RC1_L4','RC3_L3','RC2_use_L1vsL2','RC7_hist_L2','RC9_use_L4'))
  data_clustering <- rbind(data_clustering,temp)
};
summary(data_clustering);

result <- density_peak_clustering(data_clustering$scores,data_clustering$sbj_ID,data_clustering$dimensions);
# cluster centres: 144, 153
# now just 153

# error message

# new clustering analysis based on new version of Laio clustering technique
#...


###################
# CLUSTERING TREE #
###################
library(Hmisc);
data_BLP_short <- subset(data_BLP, select=-c(sbj_ID,Age,Gender,Education,L1,L2,L3,L4,otherLs,task,AttentionL1,AttentionL2,AttentionL3,AttentionL4,sbj_ID));
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
#by sbj_ID
plot(data_BLP$L1Score~data_BLP$sbj_ID,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
axis(1, at = c(1:188));
points(data_BLP$L2Score~data_BLP$sbj_ID,subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score~data_BLP$sbj_ID,subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score~data_BLP$sbj_ID,subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5);

#by lang_ent
sorted_order1 <- order(data_BLP$lang_ent);
plot(data_BLP$L1Score[sorted_order1]~data_BLP$sbj_ID[sorted_order1],ylab="Language Score",ylim=c(0,230),xlab="Participants, by increasing lang_ent",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
points(data_BLP$L2Score[sorted_order1]~data_BLP$sbj_ID[sorted_order1],subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score[sorted_order1]~data_BLP$sbj_ID[sorted_order1],subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score[sorted_order1]~data_BLP$sbj_ID[sorted_order1],subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5);

#by multi_exp
sorted_order2 <- order(data_BLP$multi_exp);
plot(data_BLP$L1Score[sorted_order2]~data_BLP$sbj_ID[sorted_order2],ylab="Language Score",ylim=c(0,230),xlab="Participants, by increasing multi_exp",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
points(data_BLP$L2Score[sorted_order2]~data_BLP$sbj_ID[sorted_order2],subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score[sorted_order2]~data_BLP$sbj_ID[sorted_order2],subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score[sorted_order2]~data_BLP$sbj_ID[sorted_order2],subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5);

#by L1_L2_diff - doesn't seem to work well
sorted_order3 <- order(data_BLP$L1_L2_diff);
plot(data_BLP$L1Score[sorted_order3]~data_BLP$sbj_ID[sorted_order3],ylab="Language Score",ylim=c(0,230),xlab="Participants, by increasing L1_L2_diff",main="",pch=19,cex.lab=1.5,col=cols2[1],xaxt="n",yaxs="i");
points(data_BLP$L2Score[sorted_order3]~data_BLP$sbj_ID[sorted_order3],subset=ok2,pch=19,col=cols2[2]);
points(data_BLP$L3Score[sorted_order3]~data_BLP$sbj_ID[sorted_order3],subset=ok2,pch=19,col=cols2[3]);
points(data_BLP$L4Score[sorted_order3]~data_BLP$sbj_ID[sorted_order3],subset=ok2,pch=19,col=cols2[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols2[1],cols2[2],cols2[3],cols2[4]),bty = "n",
       cex=1,y.intersp=0.5);
abline(h=218, lty=5)
