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
data_all_testing <- read.csv("testing_preprocessed_clean.csv",header=T,sep=",");
data_all_testing <- subset(data_all_testing, select = -c(X)) # remove redundant column added by Pavlovia
data_testing <- data_all_testing[data_all_testing$sbj_ID %in% participants,]; # n = 196 participants
data_testing <- data_testing[!data_testing$sbj_ID %in% c('615b41767003d4ece749ed9d', '5e8b66490d48450346bf2755','615b042301e3a24311563ee4'),]

# make some variables factors
data_testing$sbj_ID <- as.factor(data_testing$sbj_ID);
data_testing$task <- as.factor(data_testing$task);
data_testing$item <- as.factor(data_testing$item);
data_testing$testing_condition <- as.factor(data_testing$testing_condition);
data_testing$correct <- as.logical(data_testing$correct);

# testing RTs
data_testing_rt_means <- aggregate(data_testing$rt, list(data_testing$sbj_ID), FUN=mean, na.rm=TRUE);

# 0M yes responses boxplot
data_testing_0M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='0M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN = function(x) sum(x == 0));
colnames(data_testing_0M_yes)[colnames(data_testing_0M_yes)=="Group.1"]="sbj_ID";
colnames(data_testing_0M_yes)[colnames(data_testing_0M_yes)=="x"]="x_0";

# 0M scores
data_testing_0M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='0M'], list(data_testing$sbj_ID[data_testing$testing_condition=='0M']), FUN=mean, na.rm=TRUE);
colnames(data_testing_0M_means)[colnames(data_testing_0M_means)=="Group.1"]="sbj_ID";
colnames(data_testing_0M_means)[colnames(data_testing_0M_means)=="x"]="x_0";

# 1M yes responses boxplot
data_testing_1M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='1M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN = function(x) sum(x == 0));
colnames(data_testing_1M_yes)[colnames(data_testing_1M_yes)=="Group.1"]="sbj_ID";
colnames(data_testing_1M_yes)[colnames(data_testing_1M_yes)=="x"]="x_1";

# 1M scores
data_testing_1M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='1M'], list(data_testing$sbj_ID[data_testing$testing_condition=='1M']), FUN=mean, na.rm=TRUE);
colnames(data_testing_1M_means)[colnames(data_testing_1M_means)=="Group.1"]="sbj_ID";
colnames(data_testing_1M_means)[colnames(data_testing_1M_means)=="x"]="x_1";

# 2M yes responses boxplot
data_testing_2M_yes <- aggregate(data_testing$observed[data_testing$testing_condition=='2M'], by=list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN = function(x) sum(x == 0));
colnames(data_testing_2M_yes)[colnames(data_testing_2M_yes)=="Group.1"]="sbj_ID";
colnames(data_testing_2M_yes)[colnames(data_testing_2M_yes)=="x"]="x_2";

# yes responses across conditions
library(tidyverse);
data_testing_conditions <- list(data_testing_0M_yes,data_testing_1M_yes,data_testing_2M_yes) %>% reduce(inner_join, by='sbj_ID');

# 2M correct boxplot
data_testing_2M_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M']), FUN=mean, na.rm=TRUE);
colnames(data_testing_2M_means)[colnames(data_testing_2M_means)=="Group.1"]="sbj_ID";
colnames(data_testing_2M_means)[colnames(data_testing_2M_means)=="x"]="x_2";

# scores across conditions
library(tidyverse);
data_testing_conditions_scores <- list(data_testing_0M_means,data_testing_1M_means,data_testing_2M_means) %>% reduce(inner_join, by='sbj_ID');

# 2M - hits only
data_testing_2M_hits_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='0'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='0']), FUN=mean, na.rm=TRUE);
colnames(data_testing_2M_hits_means)[colnames(data_testing_2M_hits_means)=="Group.1"]="sbj_ID";
colnames(data_testing_2M_hits_means)[colnames(data_testing_2M_hits_means)=="x"]="x_2_hits";

# 2M - correct rejections only
data_testing_2M_rejs_means <- aggregate(data_testing$correct[data_testing$testing_condition=='2M'&data_testing$expected=='1'], list(data_testing$sbj_ID[data_testing$testing_condition=='2M'&data_testing$expected=='1']), FUN=mean, na.rm=TRUE);
colnames(data_testing_2M_rejs_means)[colnames(data_testing_2M_rejs_means)=="Group.1"]="sbj_ID";
colnames(data_testing_2M_rejs_means)[colnames(data_testing_2M_rejs_means)=="x"]="x_2_rejs";

# testing d'
dprimes <- dPrime(data_testing$sbj_ID, data_testing$expected, data_testing$observed);

data_testing_2M <- data_testing[data_testing$testing_condition == '2M',];
dprimes2M <- dPrime(data_testing_2M$sbj_ID, data_testing_2M$expected, data_testing_2M$observed);


# Familiarity -------------------------------------------------------------
data_all_familiarity <- read.csv("familiarity_preprocessed_clean.csv",header=T,sep=",");
data_all_familiarity <- subset(data_all_familiarity, select = -c(X)) # remove redundant column added by Pavlovia
data_familiarity <- data_all_familiarity[data_all_familiarity$sbj_ID %in% participants,]; # n = 196 participants
data_familiarity <- data_familiarity[!data_familiarity$sbj_ID %in% c('615b41767003d4ece749ed9d', '5e8b66490d48450346bf2755','615b042301e3a24311563ee4'),] # same participants excluded as for testing

# make some variables factors
data_familiarity$sbj_ID <- as.factor(data_familiarity$sbj_ID);
data_familiarity$task <- as.factor(data_familiarity$task);
data_familiarity$correct <- as.logical(data_familiarity$correct);
data_familiarity$target <- as.factor(data_familiarity$target);
data_familiarity$confound <- as.factor(data_familiarity$confound);

# familiarity accuracy boxplot
data_familiarity_means <- aggregate(data_familiarity$correct, list(data_familiarity$sbj_ID), FUN=mean);
colnames(data_familiarity_means)[colnames(data_familiarity_means)=="Group.1"]="sbj_ID";

# familiarity RTs
data_familiarity_rt_means <- aggregate(data_familiarity$rt, list(data_familiarity$sbj_ID), FUN=mean, na.rm=TRUE);


# BLP ---------------------------------------------------------------------
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
data_BLP[data_BLP == "ENGLISH"|data_BLP == "english"|data_BLP=="english "|data_BLP == "englis"|data_BLP == "eanglish"|data_BLP == "Enlish"] <- "English";
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
data_BLP[data_BLP == "XItsonga"] <- "Xitsonga";
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

# multilingual experience: summing all language scores
data_BLP["L2Score"][is.na(data_BLP["L2Score"])] <- 0;
data_BLP["L3Score"][is.na(data_BLP["L3Score"])] <- 0;
data_BLP["L4Score"][is.na(data_BLP["L4Score"])] <- 0;
data_BLP$multi_exp <- data_BLP$L1Score + data_BLP$L2Score + data_BLP$L3Score + data_BLP$L4Score;

# L1 - L2 score
data_BLP$L1_L2_diff <- data_BLP$L1Score - data_BLP$L2Score;

# proficiency plots
plot(data_BLP$ProficiencyL1Score[data_BLP$ProficiencyL1Score>1],pch=19,ylim=c(0,55)); # at ceiling mostly
plot(data_BLP$ProficiencyL2Score[data_BLP$ProficiencyL2Score>1],pch=19,ylim=c(0,55)); # quite high
plot(data_BLP$ProficiencyL3Score[data_BLP$ProficiencyL3Score>1],pch=19,ylim=c(0,55)); # extremely varied
plot(data_BLP$ProficiencyL4Score[data_BLP$ProficiencyL4Score>1],pch=19,ylim=c(0,55)); # extremely varied


# determining language groups by proficiency
#chose to set 5/6 as lower boundary for fluency -> so a minimum score of 45.8
data_BLP$langfilter1 <- TRUE;
data_BLP$langfilter1[data_BLP$ProficiencyL1Score<45.4] <- FALSE;

data_BLP$langfilter2 <- TRUE;
data_BLP$langfilter2[data_BLP$ProficiencyL2Score<45.4] <- FALSE;

data_BLP$langfilter3 <- TRUE;
data_BLP$langfilter3[data_BLP$ProficiencyL3Score<45.4] <- FALSE;

data_BLP$langfilter4 <- TRUE;
data_BLP$langfilter4[data_BLP$ProficiencyL4Score<45.4] <- FALSE;

#if they're only fluent in one language, they're a monolingual
data_BLP$lang_group <- 'mono';
#if they're fluent in two languages, they're a bilingual
data_BLP$lang_group[data_BLP$langfilter1+data_BLP$langfilter2+data_BLP$langfilter3+data_BLP$langfilter4==2] <- 'bi';
#if they're fluent in three languages, they're a trilingual
data_BLP$lang_group[data_BLP$langfilter1+data_BLP$langfilter2+data_BLP$langfilter3+data_BLP$langfilter4==3] <- 'tri';
#if they're fluent in four languages, they're a quadrilingual
data_BLP$lang_group[data_BLP$langfilter1+data_BLP$langfilter2+data_BLP$langfilter3+data_BLP$langfilter4==4] <- 'quadri';
data_BLP$lang_group <- as.factor(data_BLP$lang_group);
summary(data_BLP$lang_group);
#monolinguals: n=63
#bilinguals: n=115
#trilinguals: n=13
#quadrilinguals: n=2

data_BLP <- subset(data_BLP, select=-c(langfilter1,langfilter2,langfilter3,langfilter4))
data_BLP_monos <- subset(data_BLP[data_BLP$lang_group=='mono',]);
data_BLP_bis <- subset(data_BLP[data_BLP$lang_group=='bi',]);
data_BLP_tris <- subset(data_BLP[data_BLP$lang_group=='tri',]);
data_BLP_quadris <- subset(data_BLP[data_BLP$lang_group=='quadri',]);

# proficiency plots for each language group
library(paletteer);
cols2 <- paletteer_d("ggthemes::Classic_20");
par(mfrow=c(2,2));
#monolinguals
plot(data_BLP_monos$ProficiencyL1Score,pch=19,ylim=c(0,55),ylab="Monolingual L1 Proficiency",xlab='Participant',col=cols2[1]);
abline(h=45.4,lty=5);
plot(data_BLP_monos$ProficiencyL2Score,pch=19,ylim=c(0,55),ylab="Monolingual L2 Proficiency",xlab='Participant',col=cols2[2]);
abline(h=45.4,lty=5);
plot(data_BLP_monos$ProficiencyL3Score,pch=19,ylim=c(0,55),ylab="Monolingual L3 Proficiency",xlab='Participant',col=cols2[3]);
abline(h=45.4,lty=5);
plot(data_BLP_monos$ProficiencyL4Score,pch=19,ylim=c(0,55),ylab="Monolingual L4 Proficiency",xlab='Participant',col=cols2[4]);
abline(h=45.4,lty=5);

#bilinguals
plot(data_BLP_bis$ProficiencyL1Score,pch=19,ylim=c(0,55),ylab="Monolingual L1 Proficiency",xlab='Participant',col=cols2[1]);
abline(h=45.4,lty=5);
plot(data_BLP_bis$ProficiencyL2Score,pch=19,ylim=c(0,55),ylab="Monolingual L2 Proficiency",xlab='Participant',col=cols2[2]);
abline(h=45.4,lty=5);
plot(data_BLP_bis$ProficiencyL3Score,pch=19,ylim=c(0,55),ylab="Monolingual L3 Proficiency",xlab='Participant',col=cols2[3]);
abline(h=45.4,lty=5);
plot(data_BLP_bis$ProficiencyL4Score,pch=19,ylim=c(0,55),ylab="Monolingual L4 Proficiency",xlab='Participant',col=cols2[4]);
abline(h=45.4,lty=5);

#trilinguals
plot(data_BLP_tris$ProficiencyL1Score,pch=19,ylim=c(0,55),ylab="Monolingual L1 Proficiency",xlab='Participant',col=cols2[1]);
abline(h=45.4,lty=5);
plot(data_BLP_tris$ProficiencyL2Score,pch=19,ylim=c(0,55),ylab="Monolingual L2 Proficiency",xlab='Participant',col=cols2[2]);
abline(h=45.4,lty=5);
plot(data_BLP_tris$ProficiencyL3Score,pch=19,ylim=c(0,55),ylab="Monolingual L3 Proficiency",xlab='Participant',col=cols2[3]);
abline(h=45.4,lty=5);
plot(data_BLP_tris$ProficiencyL4Score,pch=19,ylim=c(0,55),ylab="Monolingual L4 Proficiency",xlab='Participant',col=cols2[4]);
abline(h=45.4,lty=5);

#quadrilinguals
plot(data_BLP_quadris$ProficiencyL1Score,pch=19,ylim=c(0,55),ylab="Monolingual L1 Proficiency",xlab='Participant',col=cols2[1]);
abline(h=45.4,lty=5);
plot(data_BLP_quadris$ProficiencyL2Score,pch=19,ylim=c(0,55),ylab="Monolingual L2 Proficiency",xlab='Participant',col=cols2[2]);
abline(h=45.4,lty=5);
plot(data_BLP_quadris$ProficiencyL3Score,pch=19,ylim=c(0,55),ylab="Monolingual L3 Proficiency",xlab='Participant',col=cols2[3]);
abline(h=45.4,lty=5);
plot(data_BLP_quadris$ProficiencyL4Score,pch=19,ylim=c(0,55),ylab="Monolingual L4 Proficiency",xlab='Participant',col=cols2[4]);
abline(h=45.4,lty=5);
par(mfrow=c(1,1));


# if have lower boundary at 4/6:
#monolinguals: n=18
#bilinguals: n=140
#trilinguals: n=25
#quadrilinguals: n=10



# CLUSTERING
complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]


# all participants
#without language dominance scores
pca_varimax2 <- psych::principal(data_BLP[,19:34], nfactors=16, rotate='varimax');
data_BLP <- cbind(data_BLP, pca_varimax2$scores[,c('RC1','RC9','RC2','RC6')]);
names(data_BLP)[117:120] <- c('RC1_L3','RC9_L4','RC2_use_L1vsL2','RC6_use_L4');

complete_cases <- complete.cases(data_BLP)
data_filtered <- data_BLP[complete_cases, ]


# monolinguals
#without language dominance scores
data_BLP_monos <- data_BLP_monos[, !is.na(colSums(data_BLP_monos != 0)) & colSums(data_BLP_monos != 0) > 0];
data_BLP_monos <- subset(data_BLP_monos, select = -c(AttentionL2,AttentionL3,AttentionL4));
pca_varimax3 <- psych::principal(data_BLP_monos[,13:28], nfactors=8, rotate='varimax');
#data_BLP_monos <- cbind(data_BLP, pca_varimax3$scores[,c('RC1','RC4','RC7','RC2')]);
#names(data_BLP_monos)[116:119] <- c('RC1_L4','RC4_L3','RC7_L2','RC2_L1vsL2');

# bilinguals
#without language dominance scores
data_BLP_bis <- data_BLP_bis[, !is.na(colSums(data_BLP_bis != 0)) & colSums(data_BLP_bis != 0) > 0];
data_BLP_bis <- subset(data_BLP_bis, select = -c(AttentionL3,AttentionL4));
pca_varimax4 <- psych::principal(data_BLP_bis[,15:30], nfactors=12, rotate='varimax');
data_BLP_bis <- cbind(data_BLP_bis, pca_varimax4$scores[,c('RC1','RC2','RC9')]);
names(data_BLP_bis)[76:78] <- c('RC1_L3','RC2_use_L1vsL2','RC6_L4');

# trilinguals
#without language dominance scores
data_BLP_tris <- data_BLP_tris[, !is.na(colSums(data_BLP_tris != 0)) & colSums(data_BLP_tris != 0) > 0];
data_BLP_tris <- subset(data_BLP_tris, select = -c(AttentionL4,ProficiencyL1Score)); # all max L1 proficiency - PCA not happy
pca_varimax5 <- psych::principal(data_BLP_tris[,17:31], nfactors=12, rotate='varimax');
data_BLP_tris <- cbind(data_BLP_tris, pca_varimax5$scores[,c('RC2','RC1','RC12','RC4')]);
names(data_BLP_tris)[96:99] <- c('RC2_L2vsL3','RC1_useL4vsprofL3','RC12_L4','RC4_use_L3');

# quadrilinguals
#without language dominance scores
data_BLP_quadris <- data_BLP_quadris[, !is.na(colSums(data_BLP_quadris != 0)) & colSums(data_BLP_quadris != 0) > 0];
data_BLP_quadris <- subset(data_BLP_quadris, select = -c(ProficiencyL1Score,ProficiencyL2Score,AttitudeL1Score)); # identical scores - PCA not happy
pca_varimax6 <- psych::principal(data_BLP_quadris[,19:31], nfactors=16, rotate='varimax');
#error: subscript out of bounds. Maybe due to n = 2
data_BLP_quadris <- cbind(data_BLP_quadris, pca_varimax6$scores[,c('RC15','RC2','RC12','RC11','RC3','RC4','RC10','RC1','RC13')]);
names(data_BLP_quadris)[79:87] <- c('RC15_use_L1vsL2','RC2_prof_morethanbi','RC12_L4','RC11_use_L4','RC3_prof_L2','RC4_use_L3','RC10_att_L3','RC1_hist_morethanmono','RC13_hist_L2');


# adding testing scores and BLP metrics together
library(tidyverse);
data_BLP_extracted_all <- subset(data_BLP, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL1Score,ProficiencyL2Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC1_L3,RC9_L4,RC2_use_L1vsL2,RC6_use_L4));
data_BLP_testing_all <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');

# dprimes - 2M
data_BLP_testing_dprimes2M <- list(dprimes2M,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes$RC1_L3);
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes$RC2_use_L1vsL2);
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes$RC6_use_L4);
cor(data_BLP_testing_dprimes2M$dprime,data_BLP_testing_dprimes$RC9_L4);

# dprimes - all
data_BLP_testing_dprimes <- list(dprimes,data_BLP_extracted_all) %>% reduce(inner_join, by='sbj_ID');
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC1_L3);
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC2_use_L1vsL2);
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC6_use_L4);
cor(data_BLP_testing_dprimes$dprime,data_BLP_testing_dprimes$RC9_L4);
summary(data_BLP_testing_all);



data_BLP_extracted_monos <- subset(data_BLP_monos, select=c(sbj_ID,HistoryL1Score,UseL1Score,ProficiencyL1Score,AttitudeL1Score,L1Score,lang_var,multi_exp));
data_BLP_testing_monos <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_monos) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_monos);

data_BLP_extracted_bis <- subset(data_BLP_bis, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,UseL1Score,UseL2Score,ProficiencyL1Score,ProficiencyL2Score,AttitudeL1Score,AttitudeL2Score,L1Score,L2Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC1_L3,RC2_use_L1vsL2,RC6_L4));
data_BLP_testing_bis <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_bis) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_bis);

data_BLP_extracted_tris <- subset(data_BLP_tris, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,HistoryL3Score,UseL1Score,UseL2Score,UseL3Score,ProficiencyL2Score,ProficiencyL3Score,AttitudeL1Score,AttitudeL2Score,AttitudeL3Score,L1Score,L2Score,L3Score,lang_var,lang_ent,multi_exp,L1_L2_diff,RC2_L2vsL3,RC1_useL4vsprofL3,RC12_L4,RC4_use_L3));
data_BLP_testing_tris <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_tris) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_tris);

data_BLP_extracted_quadris <- subset(data_BLP_quadris, select=c(sbj_ID,HistoryL1Score,HistoryL2Score,HistoryL3Score,HistoryL4Score,UseL1Score,UseL2Score,UseL3Score,UseL4Score,ProficiencyL3Score,ProficiencyL4Score,AttitudeL2Score,AttitudeL3Score,AttitudeL4Score,L1Score,L2Score,L3Score,L4Score,lang_var,lang_ent,multi_exp,L1_L2_diff));
data_BLP_testing_quadris <- list(data_testing_2M_means,data_testing_2M_hits_means,data_testing_2M_rejs_means,data_BLP_extracted_quadris) %>% reduce(inner_join, by='sbj_ID');
summary(data_BLP_testing_quadris);

# correlation plot of testing scores and BLP metrics
png('corrPlot3_all_prof.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_all[,c(2:31)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlot4_monos_prof.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_monos[,c(2:11)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlot5_bis_prof.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_bis[,c(2:21)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlot6_tris_prof.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_tris[,c(2:26)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();

png('corrPlot7_quadris_prof.png', width=1500, height=1500);
corrplot::corrplot(cor(data_BLP_testing_quadris[,c(2:25)]), type="lower", order="original", diag=T, method="circle", outline=F, addgrid.col=F, tl.col='black', tl.pos='ld', addCoef.col='black', number.cex=0.5);
dev.off();


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
boxplot(data_BLP_testing_conditions$x_2 ~ data_BLP_testing_conditions$group,xlab='Group (taking into account proficiency)',ylab='Accuracy',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # all at 50% mean, quite even
boxplot(data_BLP_testing_conditions$x_2_hits ~ data_BLP_testing_conditions$group,xlab='Group (taking into account proficiency)',ylab='Accuracy - hits',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # monos & bis together, tris & quadris a bit higher
boxplot(data_BLP_testing_conditions$x_2_rejs ~ data_BLP_testing_conditions$group,xlab='Group (taking into account proficiency)',ylab='Accuracy - correct rejections',cex.lab=1.5,ylim=c(0,1),yaxs="i");
abline(h=0.5, lty=5); # all aligned below mean

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
boxplot(data_BLP_testing_conditions_yes$x_2 ~ data_BLP_testing_conditions_yes$group,xlab='Group (taking into account proficiency)',ylab='Percent of yes responses - 2M',cex.lab=1.5,ylim=c(0,100),yaxs="i");
abline(h=50, lty=5); # all at 50% mean, quite even (monos a bit lower)

# testing accuracy in each language group
boxplot(data_BLP_testing_monos$x_2, ylim=c(0,1), ylab = "Accuracy score - 2M");
abline(h=0.5, lty=5);
summary(data_BLP_testing_monos$x_2);
#min:0.26 Q1:0.47 med:0.50 mean:0.50 Q3:0.56 max:0.71
hist(data_BLP_testing_monos$x_2);
t.test(data_BLP_testing_monos$x_2, mu=0.50);
#t=1, p=1, CI=[0.48,0.52]
plot(data_BLP_testing_monos$x_2,ylim=c(0,1),ylab = "Correct responses",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_bis$x_2, ylim=c(0,1), ylab = "Accuracy score - 2M");
abline(h=0.5, lty=5);
summary(data_BLP_testing_bis$x_2);
#min:0.32 Q1:0.44 med:0.50 mean:0.49 Q3:0.54 max:71
hist(data_BLP_testing_bis$x_2); # normally distributed
t.test(data_BLP_testing_bis$x_2, mu=0.50);
#t=-0.86, p=0.39, CI=[0.48,0.51]
plot(data_BLP_testing_bis$x_2,ylim=c(0,1),ylab = "Correct responses",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_tris$x_2, ylim=c(0,1), ylab = "Accuracy score - 2M");
abline(h=0.5, lty=5);
summary(data_BLP_testing_tris$x_2);
#min:0.41 Q1:0.47 med:0.50 mean:0.49 Q3:0.50 max:0.56
hist(data_BLP_testing_tris$x_2); # normally distributed
t.test(data_BLP_testing_tris$x_2, mu=0.50);
#t=-0.92, p=0.37, CI=[0.46,0.52]
plot(data_BLP_testing_tris$x_2,ylim=c(0,1),ylab = "Correct responses",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

boxplot(data_BLP_testing_quadris$x_2, ylim=c(0,1), ylab = "Accuracy score - 2M");
abline(h=0.5, lty=5);
summary(data_BLP_testing_quadris$x_2);
#min:0.56 Q1:0.57 med:0.57 mean:0.57 Q3:0.58 max:59
hist(data_BLP_testing_quadris$x_2);
t.test(data_BLP_testing_quadris$x_2, mu=0.50);
#t=5, p=0.13, CI=[0.39,0.76]
plot(data_BLP_testing_quadris$x_2,ylim=c(0,1),ylab = "Correct responses",xlab="Participants",pch=3,yaxs="i");
abline(h=0.5, lty=5);

# yes reponses in each language group
boxplot(data_BLP_testing_monos_yes$x_2, ylim=c(0,100), ylab = "Yes responses - 2M");
abline(h=50, lty=5);
summary(data_BLP_testing_monos_yes$x_2);
#min:12.50 Q1:46.25 med:52.50 mean:53.33 Q3:62.50 max:85.00
hist(data_BLP_testing_monos_yes$x_2); # normally distributed
t.test(data_BLP_testing_monos_yes$x_2, mu=50);
#t=2.1, p=0.04, CI=[50.17,56.50]
plot(data_BLP_testing_monos_yes$x_2,ylim=c(0,100),ylab = "Yes responses - 2M",xlab="Participants",pch=3,yaxs="i");
abline(h=50, lty=5);

boxplot(data_BLP_testing_bis_yes$x_2, ylim=c(0,100), ylab = "Yes responses - 2M");
abline(h=50, lty=5);
summary(data_BLP_testing_bis_yes$x_2);
#min:25 Q1:48.75 med:55 mean:54.98 Q3:62.50 max:85.00
hist(data_BLP_testing_bis_yes$x_2); # normally distributed
t.test(data_BLP_testing_bis_yes$x_2, mu=50);
#t=4.56, p=1.28e-5, CI=[52.82,57.14]
plot(data_BLP_testing_bis_yes$x_2,ylim=c(0,100),ylab = "Yes responses - 2M",xlab="Participants",pch=3,yaxs="i");
abline(h=50, lty=5);

boxplot(data_BLP_testing_tris_yes$x_2, ylim=c(0,100), ylab = "Yes responses - 2M");
abline(h=50, lty=5);
summary(data_BLP_testing_tris_yes$x_2);
#min:10 Q1:50 med:57.50 mean:54.04 Q3:65 max:70
hist(data_BLP_testing_tris_yes$x_2); # right-skewed
t.test(data_BLP_testing_tris_yes$x_2, mu=50);
#t=0.90, p=0.38, CI=[44.30,63.78]
plot(data_BLP_testing_tris_yes$x_2,ylim=c(0,100),ylab = "Yes responses - 2M",xlab="Participants",pch=3,yaxs="i");
abline(h=50, lty=5);

boxplot(data_BLP_testing_quadris_yes$x_2, ylim=c(0,100), ylab = "Yes responses - 2M");
abline(h=50, lty=5);
summary(data_BLP_testing_quadris_yes$x_2);
#min:55 Q1:56.88 med:58.75 mean:58.75 Q3:60.62 max:62.50
hist(data_BLP_testing_quadris_yes$x_2);
t.test(data_BLP_testing_quadris_yes$x_2, mu=50);
#t=2.33, p=0.26, CI=[11.10,106.40]
plot(data_BLP_testing_quadris_yes$x_2,ylim=c(0,100),ylab = "Yes responses - 2M",xlab="Participants",pch=3,yaxs="i");
abline(h=50, lty=5);

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
t.test(data_BLP_familiarity_conditions$x, mu=0.50);
#t=9.16 p<2.2e-16 CI=[0.55,0.58]


################
# LINEAR MODEL #
################
data_testing <- merge(data_testing, data_BLP[,c('sbj_ID','lang_group','RC1_L3','RC9_L4','RC2_use_L1vsL2','RC6_use_L4')], by.x='sbj_ID',by.y='sbj_ID', all.x=T);
library(lme4);
m1 <- glmer(observed ~ trialn + testing_condition*RC1_L3 + (1+testing_condition|sbj_ID), data=subset(data_testing, rt>300 & rt<3000), family='binomial');
summary(m1); # RC1 non significant as main effect and interaction
m2 <- glmer(observed ~ trialn + testing_condition*RC9_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing, rt>300 & rt<3000), family='binomial');
summary(m2); # RC9 non significant as main effect and interaction
m3 <- glmer(observed ~ trialn + testing_condition*RC2_use_L1vsL2 + (1+testing_condition|sbj_ID), data=subset(data_testing, rt>300 & rt<3000), family='binomial');
summary(m3); # failed to converge
m3 <- glmer(observed ~ scale(trialn) + testing_condition*RC2_use_L1vsL2 + (1|sbj_ID), data=subset(data_testing, rt>300 & rt<3000), family='binomial');
summary(m3);
m4 <- glmer(observed ~ trialn + testing_condition*RC6_use_L4 + (1+testing_condition|sbj_ID), data=subset(data_testing, rt>300 & rt<3000), family='binomial');
summary(m4); # RC9 non significant as main effect and interaction
m5 <- glmer(observed ~ trialn + testing_condition*lang_group + (1+testing_condition|sbj_ID), data=subset(data_testing, rt>300 & rt<3000), family='binomial');
summary(m5) # failed to converge


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
  with(density_peaks, plot(jitter(ro,200), jitter(delta,200), type="n", axes=F, xlab='Number of relative neighbours (ro)', ylab='Minimal distance to higher density point (delta)'));
  axis(1);
  axis(2);
  with(density_peaks, text(jitter(ro,200), jitter(delta,200), as.character(subject)));
  
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

data_BLP_clustering <- subset(data_BLP, select=c(temp_sbjID,lang_group,RC1_L3,RC9_L4,RC2_use_L1vsL2,RC6_use_L4));
data_clustering <- data.frame();
sbj_ID <- as.character(data_BLP_clustering$temp_sbjID);
for (x in 1:193) {
  temp_sbj_ID = sbj_ID[x]
  lang_group = data_BLP_clustering[x,2]
  RC1_L3 = data_BLP_clustering[x,3]
  RC9_L4 = data_BLP_clustering[x,4]
  RC2_use_L1vsL2 = data_BLP_clustering[x,5]
  RC6_use_L4 = data_BLP_clustering[x,6]
  temp <- data.frame('sbj_ID'=rep(temp_sbj_ID,5),
                     'scores'=c(lang_group,RC1_L3,RC9_L4,RC2_use_L1vsL2,RC6_use_L4),
                     'dimensions'=c('lang_group','RC1_L3','RC9_L4','RC2_use_L1vsL2','RC6_use_L4'))
  data_clustering <- rbind(data_clustering,temp)
};
summary(data_clustering);

result <- density_peak_clustering(data_clustering$scores,data_clustering$sbj_ID,data_clustering$dimensions)
# cluster centre: 135
# outlier: 149 (and maybe 145 too)