getwd()
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Participant_Responses");

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
# PILOT 1 #
###########

# import participant files
all_data = data.frame()
all_data2 = data.frame()
for (x in 22:1) { # for 22 participants
  name <- sprintf("./Participant_%s/sbj%s_responses.tsv", x, x)
  temp <- read.table(name,header=T,sep=",");
  all_data <- rbind(temp,all_data2)
  all_data2 <- data.frame(all_data)
}

# initial data frame structure look
dim(all_data);
head(all_data);
summary(all_data);
all_data$response <- as.factor(all_data$response);
all_data$condition <- as.factor(all_data$condition);

# creation of expected & observed columns
all_data$expected <- 0
all_data$expected[all_data$condition == 1] <- 1
all_data$observed <- 0
all_data$observed[all_data$response == "no"] <- 1

# d'
dprimes <- dPrime(all_data$sbjID, all_data$expected, all_data$observed);
dim(dprimes);
summary(dprimes);

mean_data <- data.frame(mean_RTs = c(344.5735,461.22575,187.264,505.766,260.111,211.34025,530.5685), 
                        mean_scores = c(42.5,57.5,35.0,42.5,50.0,37.5,52.5),
                        dprimes = c(-0.379,0.399,-0.842,-0.399,0,-0.639,0.15),
                        bias = c(0.9760934,1.1383759,1.4249877,0.8784445,1,0.9587321,1.0941417));
head(mean_data);
summary(mean_data);
plot(mean_data$dprimes, mean_data$bias);
plot(mean_data$dprimes, mean_data$mean_RTs);
plot(mean_data$dprimes, mean_data$mean_scores);
plot(mean_data$bias, mean_data$mean_RTs);
plot(mean_data$bias, mean_data$mean_scores);
res <- cor.test(mean_data$bias, mean_data$mean_RTs, 
                method = "pearson");
res;
plot(density(mean_data$bias));

# Pilot 1 accuracy boxplot with mean scores
boxplot(mean_data$mean_scores, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);
summary(mean_data$mean_scores);

# Pilot 1 BLP data
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Pilot1_data");
BLP_data_pilot1 <- read.table("BLP_preprocessed_pilot1.csv",header=T,sep=",");
dim(BLP_data_pilot1);
head(BLP_data_pilot1);
summary(BLP_data_pilot1);

BLP_data_pilot1$Sex <- as.factor(BLP_data_pilot1$Sex); # convert basic info into factors
BLP_data_pilot1$MaxEdu <- as.factor(BLP_data_pilot1$MaxEdu);
BLP_data_pilot1$L1 <- as.factor(BLP_data_pilot1$L1);
BLP_data_pilot1$L2 <- as.factor(BLP_data_pilot1$L2);
BLP_data_pilot1$L3 <- as.factor(BLP_data_pilot1$L3);
BLP_data_pilot1$L4 <- as.factor(BLP_data_pilot1$L4);
BLP_data_pilot1$AttentionCheck <- as.factor(BLP_data_pilot1$AttentionCheck);

str(BLP_data_pilot1);
summary(BLP_data_pilot1);

# remove datapoints if participant doesn't know additional languages
BLP_data_pilot1$langfilter1 <- TRUE;
BLP_data_pilot1$langfilter2 <- TRUE;
BLP_data_pilot1$langfilter3 <- TRUE;
BLP_data_pilot1$langfilter4 <- TRUE;
BLP_data_pilot1$langfilter2[BLP_data_pilot1$L2Score==0] <- FALSE;
BLP_data_pilot1$langfilter3[BLP_data_pilot1$L3Score==0] <- FALSE;
BLP_data_pilot1$langfilter4[BLP_data_pilot1$L4Score==0] <- FALSE;
BLP_data_pilot1$L2Score[BLP_data_pilot1$langfilter2==FALSE] <- NA;
BLP_data_pilot1$L3Score[BLP_data_pilot1$langfilter3==FALSE] <- NA;
BLP_data_pilot1$L4Score[BLP_data_pilot1$langfilter4==FALSE] <- NA;
ok2 <- ! is.na(BLP_data_pilot1$L2Score);
ok3 <- ! is.na(BLP_data_pilot1$L3Score);
ok4 <- ! is.na(BLP_data_pilot1$L4Score);

# plot language scores per participant
plot(BLP_data_pilot1$L1Score~BLP_data_pilot1$ID.partecipante,ylab="Language Score",ylim=c(0,218),xlab="Participant",main="",pch=19,cex=2,col="#F1BB7B",yaxs="i");
points(BLP_data_pilot1$L2Score~BLP_data_pilot1$ID.partecipante,subset=ok2,pch=19,cex=2,col="#FD6467");
points(BLP_data_pilot1$L3Score~BLP_data_pilot1$ID.partecipante,subset=ok3,pch=19,cex=2,col="#5B1A18");
points(BLP_data_pilot1$L4Score~BLP_data_pilot1$ID.partecipante,subset=ok4,pch=19,cex=2,col="#D67236");
legend("right",title="Language:",c("L1","L2","L3","L4"),fill=c("#F1BB7B","#FD6467","#5B1A18","#D67236"),bty = "n",
       cex=0.75,y.intersp=0.5);

# Pilot 1 RTs
plot(density(all_data$RT[all_data$sbjID==1]),xlim=c(0,16000),ylim=c(0,0.00055),xlab="RTs (ms)",main="",xaxt = "n",col="cadetblue");
axis(1, at = c(0,2000,4000,6000,8000,10000,12000,14000,16000));
lines(density(all_data$RT[all_data$sbjID==2]),col="coral");
lines(density(all_data$RT[all_data$sbjID==3]),col="darkgoldenrod");
lines(density(all_data$RT[all_data$sbjID==4]),col="darkgreen");
lines(density(all_data$RT[all_data$sbjID==5]),col="indianred4");
lines(density(all_data$RT[all_data$sbjID==6]),col="lightslateblue");
lines(density(all_data$RT[all_data$sbjID==7]),col="navy");
legend("topright",title="Participant:",c("1","2","3","4","5","6","7"),fill=c("cadetblue","coral","darkgoldenrod","darkgreen","indianred4","lightslateblue","navy"),bty = "n",
       cex=0.75,y.intersp=0.5);

# d primes
dprimes <- dPrime(all_data$sbjID[all_data$sbjID<8], all_data$expected[all_data$sbjID>8], all_data$observed[all_data$sbjID>8]);
dim(dprimes);
summary(dprimes);

###########
# PILOT 2 #
###########

# Pilot 2 accuracy boxplot
mean_data2 <- data.frame(mean_scores2 = c(35,52.5,52.5,65,52.5,47.5,35,57.5));
summary(mean_data2$mean_scores2);
boxplot(mean_data2$mean_scores2, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);

# Pilot 2 RTs
plot(density(all_data$RT[all_data$sbjID==8]),xlim=c(0,16000),ylim=c(0,0.0005),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00",yaxs="i");
axis(1, at = c(0,2000,4000,6000,8000,10000,12000,14000,16000));
lines(density(all_data$RT[all_data$sbjID==9]),col="#56B4E9");
lines(density(all_data$RT[all_data$sbjID==10]),col="#009E73");
lines(density(all_data$RT[all_data$sbjID==11]),col="#F0E442");
lines(density(all_data$RT[all_data$sbjID==12]),col="#0072B2");
lines(density(all_data$RT[all_data$sbjID==13]),col="#D55E00");
lines(density(all_data$RT[all_data$sbjID==14]),col="#CC79A7");
lines(density(all_data$RT[all_data$sbjID==15]),col="#999999")
legend("topright",title="Participant:",c("8","9","10","11","12","13","14","15"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7","#999999"),bty = "n",
       cex=0.75,y.intersp=0.5)

# Pilot 2 BLP scores
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Pilot2_data");
BLP_data2 <- read.table("BLP_preprocessed_pilot2.csv",header=T,sep=",");
dim(BLP_data2);
head(BLP_data2);
summary(BLP_data2);
BLP_data2$Sex <- as.factor(BLP_data2$Sex);
BLP_data2$MaxEdu <- as.factor(BLP_data2$MaxEdu);
BLP_data2$L1 <- as.factor(BLP_data2$L1);
BLP_data2$L2 <- as.factor(BLP_data2$L2);
BLP_data2$L3 <- as.factor(BLP_data2$L3);
BLP_data2$L4 <- as.factor(BLP_data2$L4);
BLP_data2$AttentionCheck <- as.factor(BLP_data2$AttentionCheck);
summary(BLP_data2);
str(BLP_data2);
library(dplyr);
BLP_data_pilot2 <- BLP_data2 %>% filter(ID.partecipante>7);
summary(BLP_data_pilot2);

# remove datapoints if participant doesn't know additional languages
BLP_data_pilot2$langfilter1 <- TRUE;
BLP_data_pilot2$langfilter2 <- TRUE;
BLP_data_pilot2$langfilter3 <- TRUE;
BLP_data_pilot2$langfilter4 <- TRUE;
BLP_data_pilot2$langfilter2[BLP_data_pilot2$L2Score==0] <- FALSE;
BLP_data_pilot2$langfilter3[BLP_data_pilot2$L3Score==0] <- FALSE;
BLP_data_pilot2$langfilter4[BLP_data_pilot2$L4Score==0] <- FALSE;
BLP_data_pilot2$L2Score[BLP_data_pilot2$langfilter2==FALSE] <- NA;
BLP_data_pilot2$L3Score[BLP_data_pilot2$langfilter3==FALSE] <- NA;
BLP_data_pilot2$L4Score[BLP_data_pilot2$langfilter4==FALSE] <- NA;
ok2 <- ! is.na(BLP_data_pilot2$L2Score);
ok3 <- ! is.na(BLP_data_pilot2$L3Score);
ok4 <- ! is.na(BLP_data_pilot2$L4Score);

# plot language scores per participant
plot(BLP_data_pilot2$L1Score~BLP_data_pilot2$ID.partecipante,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex=2,col="#F1BB7B",yaxs="i");
points(BLP_data_pilot2$L2Score~BLP_data_pilot2$ID.partecipante,subset=ok2,pch=19,cex=2,col="#FD6467");
points(BLP_data_pilot2$L3Score~BLP_data_pilot2$ID.partecipante,subset=ok3,pch=19,cex=2,col="#5B1A18");
points(BLP_data_pilot2$L4Score~BLP_data_pilot2$ID.partecipante,subset=ok4,pch=19,cex=2,col="#D67236");
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c("#F1BB7B","#FD6467","#5B1A18","#D67236"),bty = "n",
       cex=0.75,y.intersp=0.5);

# familiarity
familiarity_data_pilot2 <- read.table("preprocessed_familiarity_pilot2.tsv",header=T,sep=",");
dim(familiarity_data_pilot2);
head(familiarity_data_pilot2);
summary(familiarity_data_pilot2);
boxplot(familiarity_data_pilot2$familiarity_score, ylab = "Familiarity score");
abline(h=50, lty=5);
summary(familiarity_data_pilot2$familiarity_score)

# d primes
dprimes <- dPrime(all_data$sbjID[all_data$sbjID>7 & all_data$sbjID<16], all_data$expected[all_data$sbjID>7 & all_data$sbjID<16], all_data$observed[all_data$sbjID>7 & all_data$sbjID<16]);
dim(dprimes);
summary(dprimes);

###########
# PILOT 3 #
###########

# Pilot 3 accuracy boxplot
mean_data3 <- data.frame(mean_scores3 = c(50,57.5,40,50,52.5,50,57.5));
summary(mean_data3$mean_scores3);
boxplot(mean_data3$mean_scores3, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);

# Pilot 3 RTs
plot(density(all_data$RT[all_data$sbjID==16]),xlim=c(0,2200),ylim=c(0,0.003),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00",yaxs="i");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
lines(density(all_data$RT[all_data$sbjID==17]),col="#56B4E9");
lines(density(all_data$RT[all_data$sbjID==18]),col="#009E73");
lines(density(all_data$RT[all_data$sbjID==19]),col="#F0E442");
lines(density(all_data$RT[all_data$sbjID==20]),col="#0072B2");
lines(density(all_data$RT[all_data$sbjID==21]),col="#D55E00");
lines(density(all_data$RT[all_data$sbjID==22]),col="#CC79A7");
legend("topright",title="Participant:",c("16","17","18","19","20","21","22"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7"),bty = "n",
       cex=0.75,y.intersp=0.5)
# still get some RTs way above 2s: this is because the trials with a response of over 2s are still recorded

# Pilot 3 BLP scores
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Pilot3_data");
BLP_data3 <- read.table("BLP_preprocessed_pilot3.csv",header=T,sep=",");
dim(BLP_data3);
head(BLP_data3);
summary(BLP_data3);
BLP_data3$Sex <- as.factor(BLP_data3$Sex);
BLP_data3$MaxEdu <- as.factor(BLP_data3$MaxEdu);
BLP_data3$L1 <- as.factor(BLP_data3$L1);
BLP_data3$L2 <- as.factor(BLP_data3$L2);
BLP_data3$L3 <- as.factor(BLP_data3$L3);
BLP_data3$L4 <- as.factor(BLP_data3$L4);
BLP_data3$AttentionCheck <- as.factor(BLP_data3$AttentionCheck);
summary(BLP_data3);
str(BLP_data3);
library(dplyr);
BLP_data_pilot3 <- BLP_data3 %>% filter(ID.partecipante>15);
summary(BLP_data_pilot3);

# remove datapoints if participant doesn't know additional languages
BLP_data_pilot3$langfilter1 <- TRUE;
BLP_data_pilot3$langfilter2 <- TRUE;
BLP_data_pilot3$langfilter3 <- TRUE;
BLP_data_pilot3$langfilter4 <- TRUE;
BLP_data_pilot3$langfilter2[BLP_data_pilot3$L2Score==0] <- FALSE;
BLP_data_pilot3$langfilter3[BLP_data_pilot3$L3Score==0] <- FALSE;
BLP_data_pilot3$langfilter4[BLP_data_pilot3$L4Score==0] <- FALSE;
BLP_data_pilot3$L2Score[BLP_data_pilot3$langfilter2==FALSE] <- NA;
BLP_data_pilot3$L3Score[BLP_data_pilot3$langfilter3==FALSE] <- NA;
BLP_data_pilot3$L4Score[BLP_data_pilot3$langfilter4==FALSE] <- NA;
ok2 <- ! is.na(BLP_data_pilot3$L2Score);
ok3 <- ! is.na(BLP_data_pilot3$L3Score);
ok4 <- ! is.na(BLP_data_pilot3$L4Score);

# plot language scores per participant
plot(BLP_data_pilot3$L1Score~BLP_data_pilot3$ID.partecipante,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex=2,col="#F1BB7B",yaxs="i");
points(BLP_data_pilot3$L2Score~BLP_data_pilot3$ID.partecipante,subset=ok2,pch=19,cex=2,col="#FD6467");
points(BLP_data_pilot3$L3Score~BLP_data_pilot3$ID.partecipante,subset=ok3,pch=19,cex=2,col="#5B1A18");
points(BLP_data_pilot3$L4Score~BLP_data_pilot3$ID.partecipante,subset=ok4,pch=19,cex=2,col="#D67236");
legend("topright",title="Language:",c("L1","L2","L3","L4"),fill=c("#F1BB7B","#FD6467","#5B1A18","#D67236"),bty = "n",
       cex=0.75,y.intersp=0.5);

# familiarity
familiarity_data_pilot3 <- read.table("preprocessed_familiarity_pilot3.tsv",header=T,sep=",");
dim(familiarity_data_pilot3);
head(familiarity_data_pilot3);
summary(familiarity_data_pilot3); # med & mean at 50: maybe worried about timeout? Change instructions?
boxplot(familiarity_data_pilot3$familiarity_score, ylab = "Familiarity score");
abline(h=50, lty=5);
summary(familiarity_data_pilot3$familiarity_score)

# d primes
dprimes <- dPrime(all_data$sbjID[all_data$sbjID>15], all_data$expected[all_data$sbjID>15], all_data$observed[all_data$sbjID>15]);
dim(dprimes);
summary(dprimes);

###########
# PILOT 4 #
###########
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject")
data_pilot4 <- read.csv("Prolific_preprocessed.csv",header=T,sep=",");
data_pilot4 = subset(data_pilot4, select = -c(X)) # remove redundant column added by Pavlovia
dim(data_pilot4);
head(data_pilot4);
summary(data_pilot4);

# standardise language responses
data_pilot4[data_pilot4 == "italiano" | data_pilot4 == "italiana" | data_pilot4 == "Italiano" | data_pilot4 == "Italiana"] <- "Italian";
data_pilot4[data_pilot4 == "portoghese" | data_pilot4 == "Portoghese" | data_pilot4 == "Portuguese"] <- "Portuguese";
data_pilot4[data_pilot4 == "Francese" | data_pilot4 == "francese"] <- "French";
data_pilot4[data_pilot4 == "inglese" | data_pilot4 == "Inglese"] <- "English";
data_pilot4[data_pilot4 == "Spagnolo" | data_pilot4 == "spagnolo"] <- "Spanish";
data_pilot4[data_pilot4 == "Bulgaro"] <- "Bulgarian";
data_pilot4[data_pilot4 == "Coreano"] <- "Korean";
data_pilot4[data_pilot4 == "Piemontese"] <- "Piedmontese";
data_pilot4[data_pilot4 == "napoletano"] <- "Neapolitan";
data_pilot4[data_pilot4 == "Dialetto di Carovigno"] <- "Carovignian dialect";
data_pilot4[data_pilot4 == "russo"] <- "Russian";
data_pilot4[data_pilot4 == "Cinese"] <- "Chinese";
data_pilot4[data_pilot4 == "tedesco" | data_pilot4 == "Tedesco"] <- "German"

# make some variables factors
data_pilot4$sbj_ID <- as.factor(data_pilot4$sbj_ID);
data_pilot4$task <- as.factor(data_pilot4$task);
data_pilot4$target <- as.factor(data_pilot4$target);
data_pilot4$confound <- as.factor(data_pilot4$confound);
data_pilot4$item <- as.factor(data_pilot4$item);
data_pilot4$correct <- as.logical(data_pilot4$correct);
data_pilot4$Sex <- as.factor(data_pilot4$Sex);
data_pilot4$Education <- as.factor(data_pilot4$Education);
data_pilot4$L1 <- as.factor(data_pilot4$L1);
data_pilot4$L2 <- as.factor(data_pilot4$L2);
data_pilot4$L3 <- as.factor(data_pilot4$L3);
data_pilot4$L4 <- as.factor(data_pilot4$L4);
data_pilot4$otherLs <- as.factor(data_pilot4$otherLs);
data_pilot4$AttentionL1 <- as.factor(data_pilot4$AttentionL1);
data_pilot4$AttentionL2 <- as.factor(data_pilot4$AttentionL2);
data_pilot4$AttentionL3 <- as.factor(data_pilot4$AttentionL3);
data_pilot4$AttentionL4 <- as.factor(data_pilot4$AttentionL4);
summary(data_pilot4);

# boxplot of all pilot 4 testing data
data_pilot4_testing <- subset(data_pilot4, task=='testing',select=c(sbj_ID,task,trialn,expected,observed,correct,rt,item));
data_pilot4_testing_means <- aggregate(data_pilot4_testing$correct[complete.cases(data_pilot4_testing$correct)], list(data_pilot4_testing$sbj_ID[complete.cases(data_pilot4_testing$correct)]), FUN=sum);
data_pilot4_testing_means$x<-(data_pilot4_testing_means$x)*10/4;
boxplot(data_pilot4_testing_means$x, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);

# split into different pilot 4 versions: 4.1 is with 4 training reps, 4.1 is with 8
data_pilot4.1 <- subset(data_pilot4, sbj_ID=='5fb7b8880045d6396a86c803'|sbj_ID=='5f4cc4ea00dba58ecd5a98a4'|sbj_ID=='615c43b800752a4f3d0fd1f0'|sbj_ID=='6175a0a52e748285b3476b27'|sbj_ID=='60b55a6d44e17d6f0b810cdd'|sbj_ID=='60d87fdab51e54fe4863f97f'|sbj_ID=='60ba2011cd8052508d401296'|sbj_ID=='5ee7b7c9eef92207297a0ad4'|sbj_ID=='614060a52d7c64c27ef9887c'|sbj_ID=='5d97c38dce449e001244dc15'|sbj_ID=='5ed54d02957bee0c0de36cac'|sbj_ID=='61158a5c1d8390415ff117a8'|sbj_ID=='5e823b35726b2a9508db127c'|sbj_ID=='5caca6b4a9acb200011a6547'|sbj_ID=='5cf14e1eb4397d0001f94e20'|sbj_ID=='5cb4adc019ee7300189e8547'|sbj_ID=='5f3161410f87706425490ae1'|sbj_ID=='5e8783b0fde5153fbd9dca43'|sbj_ID=='60c9c6e1728092717b93abde'|sbj_ID=='5feb64b3341f42bb63200e36');
data_pilot4.2 <- subset(data_pilot4, sbj_ID=='60f1846c851ee5a978a0e015'|sbj_ID=='60fd703ecd62eb39eb07c328'|sbj_ID=='60ddf71e95896d2595f0e1a5'|sbj_ID=='605c9355001a5eb6d51e657d'|sbj_ID=='5f11ccbc1a1a2c08b4a99efb'|sbj_ID=='5fb3f38909fc360164f7c98d'|sbj_ID=='60a45e33f404ba8cb7a19cfe'|sbj_ID=='608abc6251feb3ddc3b2e01d'|sbj_ID=='608edc13472b2dbc27b369fa'|sbj_ID=='612d5712d75b6c46b4cefc63'|sbj_ID=='5e82e99b37d333a1474dda93'|sbj_ID=='613d091096ca434d703f77c5'|sbj_ID=='609568823ff056b77e565445'|sbj_ID=='5e80c7d61a07dd7b0d8f0111'|sbj_ID=='59aaf4b1321f870001d16f6c'|sbj_ID=='6048158f62550615002408af'|sbj_ID=='6161f43ddd46e845e7b3fab8'|sbj_ID=='5ec806f532fe7d2afa2e315b'|sbj_ID=='5e99d95e0f50aa04266ad4ad'|sbj_ID=='5c5e04ca6539fe00016e1afa');

# PILOT 4.1
dim(data_pilot4.1);
head(data_pilot4.1);
summary(data_pilot4.1);

# testing
data_pilot4.1_testing <- subset(data_pilot4.1, task=='testing',select=c(sbj_ID,task,trialn,expected,observed,correct,rt,item,testing_strategy));

# testing boxplot
data_pilot4.1_testing_means <- aggregate(data_pilot4.1_testing$correct, list(data_pilot4.1_testing$sbj_ID), FUN=sum); # this doesn't work
data_pilot4.1_testing_means$x <- (data_pilot4.1_testing_means$x)*10/4;
boxplot(data_pilot4.1_testing_means$x, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);

# testing d'
dprimes <- dPrime(data_pilot4.1_testing$sbj_ID, data_pilot4.1_testing$expected, data_pilot4.1_testing$observed);
summary(dprimes);

# testing RTs
library(paletteer);
cols <- paletteer_d("ggthemes::Classic_20");
IDs <- list(data_pilot4.1_testing$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_pilot4.1_testing$rt[data_pilot4.1_testing$sbj_ID==IDs[1]]),xlim=c(0,2200),ylim=c(0,0.005),xlab="RTs (ms)",main="",xaxt = "n",col=cols[1],yaxs="i");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
for (x in 2:20) {
  lines(density(data_pilot4.1_testing$rt[data_pilot4.1_testing$sbj_ID==IDs[x]]),col=cols[x])
};
legend("topright",title="Participant:",legend=c(1:20),fill=cols,bty = "n",
       cex=0.75,y.intersp=0.5);

# testing accuracy*RTs


# testing strategy
pilot4.1_strats <- list(data_pilot4.1_testing$testing_strategy);
pilot4.1_strats <- sapply(pilot4.1_strats, unique);
  
# familiarity
data_pilot4.1_familiarity <- subset(data_pilot4.1, task=='familiarity',select=c(sbj_ID,task,trialn,target,confound,expected,observed,correct,rt));
data_pilot4.1_familiarity_means <- aggregate(data_pilot4.1_familiarity$correct, list(data_pilot4.1_familiarity$sbj_ID), FUN=sum);
data_pilot4.1_familiarity_means$x<-(data_pilot4.1_familiarity_means$x)*10/3;
boxplot(data_pilot4.1_familiarity_means$x, ylab = "Familiarity score (in %)");
abline(h=50, lty=5);

# familiarity RTs
IDs <- list(data_pilot4.1_familiarity$sbj_ID);
IDs <- sapply(IDs, unique);
summary(data_pilot4.1_familiarity$rt[data_pilot4.1_familiarity$sbj_ID==IDs[15]]) # this participant has super fast RTs
plot(density(data_pilot4.1_familiarity$rt[data_pilot4.1_familiarity$sbj_ID==IDs[1]]),xlim=c(0,4000),ylim=c(0,0.005),xlab="Familiarity RTs (ms)",main="",xaxt = "n",col=cols[1],yaxs="i");
axis(1, at = c(0,500,1000,1500,2000,2500,3000,3500,4000));
for (x in 2:20) {
  lines(density(data_pilot4.1_familiarity$rt[data_pilot4.1_familiarity$sbj_ID==IDs[x]]),col=cols[x])
};
legend("topright",title="Participant:",legend=c(1:20),fill=cols,bty = "n",
       cex=0.75,y.intersp=0.5);

# familiarity accuracy*RTs


# BLP
data_pilot4.1_BLP <- subset(data_pilot4.1, task=='BLP',select=-c(trialn,target,confound,expected,observed,correct,rt,item));

# remove datapoints if participant doesn't know additional languages
data_pilot4.1_BLP$langfilter1 <- TRUE;
data_pilot4.1_BLP$langfilter2 <- TRUE;
data_pilot4.1_BLP$langfilter3 <- TRUE;
data_pilot4.1_BLP$langfilter4 <- TRUE;
data_pilot4.1_BLP$langfilter2[data_pilot4.1_BLP$L2Score==0] <- FALSE;
data_pilot4.1_BLP$langfilter3[data_pilot4.1_BLP$L3Score==0] <- FALSE;
data_pilot4.1_BLP$langfilter4[data_pilot4.1_BLP$L4Score==0] <- FALSE;
data_pilot4.1_BLP$L2Score[data_pilot4.1_BLP$langfilter2==FALSE] <- NA;
data_pilot4.1_BLP$L3Score[data_pilot4.1_BLP$langfilter3==FALSE] <- NA;
data_pilot4.1_BLP$L4Score[data_pilot4.1_BLP$langfilter4==FALSE] <- NA;
ok2 <- ! is.na(data_pilot4.1_BLP$L2Score);
ok3 <- ! is.na(data_pilot4.1_BLP$L3Score);
ok4 <- ! is.na(data_pilot4.1_BLP$L4Score);

# plot language scores per participant
data_pilot4.1_BLP$temp_sbjID <- c(1:20) # necessary: R doesn't like format of Prolific IDs
plot(data_pilot4.1_BLP$L1Score~data_pilot4.1_BLP$temp_sbjID,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex=2,col=cols[1],xaxt="n",yaxs="i");
axis(1, at = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20));
points(data_pilot4.1_BLP$L2Score~data_pilot4.1_BLP$temp_sbjID,subset=ok2,pch=19,cex=2,col=cols[2]);
points(data_pilot4.1_BLP$L3Score~data_pilot4.1_BLP$temp_sbjID,subset=ok2,pch=19,cex=2,col=cols[3]);
points(data_pilot4.1_BLP$L4Score~data_pilot4.1_BLP$temp_sbjID,subset=ok2,pch=19,cex=2,col=cols[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols[1],cols[2],cols[3],cols[4]),bty = "n",
       cex=0.75,y.intersp=0.5);

# multilingual balance: variance
library(toolbox);
scores_list <- combineCols(data_pilot4.1_BLP, cols=c('L1Score','L2Score','L3Score','L4Score'),by_name=TRUE); # combine scores into 1 list
vars <- list();
for (i in 1:20) { # calculate variance for each participant
  temp <- unlist(scores_list[i]);
  var <- var(temp,na.rm=TRUE);
  vars <- append(vars, var)
};
data_pilot4.1_BLP$lang_var <- vars;
as.numeric(data_pilot4.1_BLP$lang_var);
plot(data_pilot4.1_BLP$temp_sbjID,data_pilot4.1_BLP$lang_var,pch=19,xlab="Subject number",ylab="Language score variance",ylim=c(0,13000),yaxs="i");

# multilingual balance: entropy
entropies <- list();
test <- c(1,2,3,4)
Entropy(test)
library(DescTools);
for (i in 1:20) { # calculate entropy for each participant
  temp <- unlist(scores_list[i]);
  entropy <- Entropy(table(temp,useNA = "no"))
  entropies <- append(entropies, entropy)
};
data_pilot4.1_BLP$lang_ent <- entropies;
as.numeric(data_pilot4.1_BLP$lang_ent);

# corr of variance & entropy
cor(unlist(data_pilot4.1_BLP$lang_var),unlist(data_pilot4.1_BLP$lang_ent),method="pearson"); # r = -0.44 so moderately negatively correlated

# multilingual experience: summing all language scores
data_pilot4.1_BLP["L2Score"][is.na(data_pilot4.1_BLP["L2Score"])] <- 0;
data_pilot4.1_BLP["L3Score"][is.na(data_pilot4.1_BLP["L3Score"])] <- 0;
data_pilot4.1_BLP["L4Score"][is.na(data_pilot4.1_BLP["L4Score"])] <- 0;
data_pilot4.1_BLP$multi_exp <- data_pilot4.1_BLP$L1Score + data_pilot4.1_BLP$L2Score + data_pilot4.1_BLP$L3Score + data_pilot4.1_BLP$L4Score;
plot(data_pilot4.1_BLP$temp_sbjID,data_pilot4.1_BLP$multi_exp,pch=19,xlab="Subject number",ylab="Amount of total multilingual experience (out of 872)",ylim=c(0,872),yaxs="i");

# L1 - L2 score
data_pilot4.1_BLP$L1_L2_diff <- data_pilot4.1_BLP$L1Score - data_pilot4.1_BLP$L2Score;
plot(data_pilot4.1_BLP$temp_sbjID,data_pilot4.1_BLP$L1_L2_diff,pch=19,xlab="Subject number",ylab="Score difference of L1 and L2",ylim=c(0,218),yaxs="i");

# PILOT 4.2
dim(data_pilot4.2);
head(data_pilot4.2);
summary(data_pilot4.2);

# testing
data_pilot4.2_testing <- subset(data_pilot4.2, task=='testing',select=c(sbj_ID,task,trialn,expected,observed,correct,rt,item,testing_strategy));

# testing boxplot
data_pilot4.2_testing_means <- aggregate(data_pilot4.2_testing$correct, list(data_pilot4.2_testing$sbj_ID), FUN=sum);
data_pilot4.2_testing_means$x<-(data_pilot4.2_testing_means$x)*10/4;
boxplot(data_pilot4.2_testing_means$x, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);

# testing d'
dprimes <- dPrime(data_pilot4.2_testing$sbj_ID, data_pilot4.2_testing$expected, data_pilot4.2_testing$observed);
summary(dprimes);

# testing RTs
IDs <- list(data_pilot4.2_testing$sbj_ID);
IDs <- sapply(IDs, unique);
plot(density(data_pilot4.2_testing$rt[data_pilot4.2_testing$sbj_ID==IDs[1]]),xlim=c(0,2200),ylim=c(0,0.0035),xlab="RTs (ms)",main="",xaxt = "n",col=cols[1],yaxs="i");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200));
for (x in 2:20) {
  lines(density(data_pilot4.2_testing$rt[data_pilot4.2_testing$sbj_ID==IDs[x]]),col=cols[x])
};
legend("topright",title="Participant:",legend=c(1:20),fill=cols,bty = "n",
       cex=0.75,y.intersp=0.5);

# testing accuracy*RTs


# testing strategy
pilot4.2_strats <- list(data_pilot4.2_testing$testing_strategy);
pilot4.2_strats <- sapply(pilot4.2_strats, unique);

# familiarity
data_pilot4.2_familiarity <- subset(data_pilot4.2, task=='familiarity',select=c(sbj_ID,task,trialn,target,confound,expected,observed,correct,rt));
data_pilot4.2_familiarity_means <- aggregate(data_pilot4.2_familiarity$correct, list(data_pilot4.2_familiarity$sbj_ID), FUN=sum);
data_pilot4.2_familiarity_means$x<-(data_pilot4.2_familiarity_means$x)*10/3;
boxplot(data_pilot4.2_familiarity_means$x, ylab = "Familiarity score (in %)");
abline(h=50, lty=5);

# familiarity RTs
IDs <- list(data_pilot4.2_familiarity$sbj_ID);
IDs <- sapply(IDs, unique);
summary(data_pilot4.2_familiarity$rt[data_pilot4.2_familiarity$sbj_ID==IDs[1]]) # this participant has super fast RTs
summary(data_pilot4.2_familiarity$rt[data_pilot4.2_familiarity$sbj_ID==IDs[10]]) # this participant has super fast RTs
summary(data_pilot4.2_familiarity$rt[data_pilot4.2_familiarity$sbj_ID==IDs[12]]) # this participant has super fast RTs
plot(density(data_pilot4.2_familiarity$rt[data_pilot4.2_familiarity$sbj_ID==IDs[1]]),xlim=c(0,4000),ylim=c(0,0.005),xlab="RTs (ms)",main="",xaxt = "n",col=cols[1],yaxs="i");
axis(1, at = c(0,500,1000,1500,2000,2500,3000,3500,4000));
for (x in 2:20) {
  lines(density(data_pilot4.2_familiarity$rt[data_pilot4.2_familiarity$sbj_ID==IDs[x]]),col=cols[x])
};
legend("topright",title="Participant:",legend=c(1:20),fill=cols,bty = "n",
       cex=0.75,y.intersp=0.5);

# familiarity accuracy*RTs


# BLP
data_pilot4.2_BLP <- subset(data_pilot4.2, task=='BLP',select=-c(trialn,target,confound,expected,observed,correct,rt,item));

# remove datapoints if participant doesn't know additional languages
data_pilot4.2_BLP$langfilter1 <- TRUE;
data_pilot4.2_BLP$langfilter2 <- TRUE;
data_pilot4.2_BLP$langfilter3 <- TRUE;
data_pilot4.2_BLP$langfilter4 <- TRUE;
data_pilot4.2_BLP$langfilter2[data_pilot4.2_BLP$L2Score==0] <- FALSE;
data_pilot4.2_BLP$langfilter3[data_pilot4.2_BLP$L3Score==0] <- FALSE;
data_pilot4.2_BLP$langfilter4[data_pilot4.2_BLP$L4Score==0] <- FALSE;
data_pilot4.2_BLP$L2Score[data_pilot4.2_BLP$langfilter2==FALSE] <- NA;
data_pilot4.2_BLP$L3Score[data_pilot4.2_BLP$langfilter3==FALSE] <- NA;
data_pilot4.2_BLP$L4Score[data_pilot4.2_BLP$langfilter4==FALSE] <- NA;
ok2 <- ! is.na(data_pilot4.2_BLP$L2Score);
ok3 <- ! is.na(data_pilot4.2_BLP$L3Score);
ok4 <- ! is.na(data_pilot4.2_BLP$L4Score);

# plot language scores per participant
data_pilot4.2_BLP$temp_sbjID <- c(1:20) # necessary: R doesn't like format of Prolific IDs
plot(data_pilot4.2_BLP$L1Score~data_pilot4.2_BLP$temp_sbjID,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,cex=2,col=cols[1],xaxt="n",yaxs="i");
axis(1, at = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20));
points(data_pilot4.2_BLP$L2Score~data_pilot4.2_BLP$temp_sbjID,subset=ok2,pch=19,cex=2,col=cols[2]);
points(data_pilot4.2_BLP$L3Score~data_pilot4.2_BLP$temp_sbjID,subset=ok2,pch=19,cex=2,col=cols[3]);
points(data_pilot4.2_BLP$L4Score~data_pilot4.2_BLP$temp_sbjID,subset=ok2,pch=19,cex=2,col=cols[4]);
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c(cols[1],cols[2],cols[3],cols[4]),bty = "n",
       cex=0.75,y.intersp=0.5)

# multilingual balance: variance
scores_list <- combineCols(data_pilot4.2_BLP, cols=c('L1Score','L2Score','L3Score','L4Score'),by_name=TRUE); # combine scores into 1 list
vars <- list();
for (i in 1:20) { # calculate variance for each participant
  temp <- unlist(scores_list[i]);
  var <- var(temp,na.rm=TRUE);
  vars <- append(vars, var)
};
data_pilot4.2_BLP$lang_var <- vars;
plot(data_pilot4.2_BLP$temp_sbjID,data_pilot4.2_BLP$lang_var,pch=19,xlab="Subject number",ylab="Language score variance",ylim=c(0,13000),yaxs="i");

# multilingual experience: summing all language scores
data_pilot4.2_BLP["L2Score"][is.na(data_pilot4.2_BLP["L2Score"])] <- 0;
data_pilot4.2_BLP["L3Score"][is.na(data_pilot4.2_BLP["L3Score"])] <- 0;
data_pilot4.2_BLP["L4Score"][is.na(data_pilot4.2_BLP["L4Score"])] <- 0;
data_pilot4.2_BLP$multi_exp <- data_pilot4.2_BLP$L1Score + data_pilot4.2_BLP$L2Score + data_pilot4.2_BLP$L3Score + data_pilot4.2_BLP$L4Score;
plot(data_pilot4.1_BLP$temp_sbjID,data_pilot4.1_BLP$multi_exp,pch=19,xlab="Subject number",ylab="Amount of total multilingual experience (out of 872)",ylim=c(0,872),yaxs="i");

# L1 - L2 score
data_pilot4.2_BLP$L1_L2_diff <- data_pilot4.2_BLP$L1Score - data_pilot4.2_BLP$L2Score;
plot(data_pilot4.2_BLP$temp_sbjID,data_pilot4.2_BLP$L1_L2_diff,pch=19,xlab="Subject number",ylab="Score difference of L1 and L2",ylim=c(0,218),yaxs="i")
