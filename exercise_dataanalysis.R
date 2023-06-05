getwd()
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Participant_Responses");

# import participant files
all_data = data.frame()
all_data2 = data.frame()
for (x in 21:1) { # for 21 participants
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
       cex=0.75,y.intersp=0.5)

# PILOT 2
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

# PILOT 3
# Pilot 3 accuracy boxplot
mean_data3 <- data.frame(mean_scores3 = c(50,57.5,40,50,52.5,50));
summary(mean_data3$mean_scores3);
boxplot(mean_data3$mean_scores3, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);

# Pilot 3 RTs
plot(density(all_data$RT[all_data$sbjID==16]),xlim=c(0,2200),ylim=c(0,0.0005),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00",yaxs="i");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800,2000));
lines(density(all_data$RT[all_data$sbjID==17]),col="#56B4E9");
lines(density(all_data$RT[all_data$sbjID==18]),col="#009E73");
lines(density(all_data$RT[all_data$sbjID==19]),col="#F0E442");
lines(density(all_data$RT[all_data$sbjID==20]),col="#0072B2");
lines(density(all_data$RT[all_data$sbjID==21]),col="#D55E00");
lines(density(all_data$RT[all_data$sbjID==22]),col="#CC79A7");
legend("topright",title="Participant:",c("16","17","18","19","20","21","22"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7"),bty = "n",
       cex=0.75,y.intersp=0.5)

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
legend("bottomright",title="Language:",c("L1","L2","L3","L4"),fill=c("#F1BB7B","#FD6467","#5B1A18","#D67236"),bty = "n",
       cex=0.75,y.intersp=0.5);

# familiarity
familiarity_data_pilot3 <- read.table("preprocessed_familiarity_pilot3.tsv",header=T,sep=",");
dim(familiarity_data_pilot3);
head(familiarity_data_pilot3);
summary(familiarity_data_pilot3);
boxplot(familiarity_data_pilot3$familiarity_score, ylab = "Familiarity score");
abline(h=50, lty=5);
summary(familiarity_data_pilot3$familiarity_score)