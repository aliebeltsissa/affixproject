getwd()
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Participant_Responses");
data1 <- read.table("./Participant_1/sbj1_responses.tsv",header=T,sep=",");
data2 <- read.table("./Participant_2/sbj2_responses.tsv",header=T,sep=",");
data3 <- read.table("./Participant_3/sbj3_responses.tsv",header=T,sep=",");
data4 <- read.table("./Participant_4/sbj4_responses.tsv",header=T,sep=",");
data5 <- read.table("./Participant_5/sbj5_responses.tsv",header=T,sep=",");
data6 <- read.table("./Participant_6/sbj6_responses.tsv",header=T,sep=",");
data7 <- read.table("./Participant_7/sbj7_responses.tsv",header=T,sep=",");
data <- rbind(data1,data2,data3,data4,data5,data6,data7);
all_data <- read.table("preprocessed_data.tsv",header=T,sep=",");
dim(all_data);
head(all_data);
summary(all_data);
data_clean <- rbind(data1,data2,data3,data5,data6,data7);
data$response <- as.factor(data$response);
data$condition <- as.factor(data$condition);
dim(data1);
str(data1);
head(data1);
summary(data1);
dim(data);
str(data);
head(data);
summary(data);
table(data$sbjID);
table(data$trialn);
table(data$word);
table(data$condition);
table(data$response);
table(data$condition, data$response);
hist(data$RT);
plot(density(data$RT,bw=.5));
warnings()
library(ggplot2);
ggplot(data, aes(condition)) + geom_bar(fill = "#0073C2FF");
ggplot(data, aes(response)) + geom_bar(fill = "#0073C2FF");
fivenum(data$RT);
data$strictfilter <- TRUE;
data$strictfilter[data$RT<25 | data$RT>150] <- FALSE;
data$lenientfilter <- TRUE;
data$lenientfilter[data$RT>175] <- FALSE;
summary(data);

# RT plot with all pilot 1
plot(density(data1$RT),xlim=c(0,1750),ylim=c(0,0.0055),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800));
lines(density(data2$RT),col="#56B4E9");
lines(density(data3$RT),col="#009E73");
lines(density(data4$RT),col="#F0E442");
lines(density(data5$RT),col="#0072B2");
lines(density(data6$RT),col="#D55E00");
lines(density(data7$RT),col="#CC79A7");
legend("topright",title="Participant:",c("1","2","3","4","5","6","7"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7"),bty = "n",
       cex=0.75,y.intersp=0.5);

# scores & RTs with all participants
scores <- list(42.5,57.5,35.0,42.5,50.0,37.5,52.5);
mean_RTs <- list(344.5735,461.22575,187.264,505.766,260.111,211.34025,530.5685);
plot(unlist(mean_RTs),unlist(scores),pch=16);
plot(density(all_data$RT[all_data$sbjID == 3],bw=20));

all_data$correct <- 0;
all_data$correct[all_data$expected!=all_data$observed] <- 1;
library(ggplot2)
library(ggpubr)
ggscatter(all_data, aes(x = "RT", y = "correct"));
plot(correct ~ RT, data = all_data)
plot(all_data$RT[all_data$sbjID==1],all_data$correct[all_data$sbjID==1],xlim=c(0,1500));
points(all_data$RT[all_data$sbjID==2],all_data$correct[all_data$sbjID==2]);
points(all_data$RT[all_data$sbjID==3],all_data$correct[all_data$sbjID==3]);
points(all_data$RT[all_data$sbjID==4],all_data$correct[all_data$sbjID==4]);
points(all_data$RT[all_data$sbjID==5],all_data$correct[all_data$sbjID==5]);
points(all_data$RT[all_data$sbjID==6],all_data$correct[all_data$sbjID==6]);
points(all_data$RT[all_data$sbjID==7],all_data$correct[all_data$sbjID==7]);

# d'
dPrime <- function(sbj, expectedResp, observedResp)
{
  sbjNumbers <- unique(sbj);
  dprimes <- vector(length=length(sbjNumbers), mode="numeric");
  bias <- vector(length=length(sbjNumbers), mode="numeric");
  subjects <- vector(length=length(sbjNumbers), mode="integer");
  counter<-1;
  for (s in sbjNumbers)
  {
    contingencyTable <- xtabs(~ expectedResp[sbj==s] + observedResp[sbj==s]); 
    percVector <- contingencyTable[,2] / xtabs(~ expectedResp[sbj==s]);
    nTrials <- length(expectedResp);
    zhr <- ifelse( percVector[2]==1, qnorm( 1-(1/(2*nTrials))), qnorm(percVector[2]));
    zfar <- ifelse(percVector[1]==0, qnorm( 1/(2*nTrials) ), qnorm(percVector[1])); 
    dprimes[counter] <- round(zhr - zfar, digits = 3);
    bias[counter] <- exp(-zhr*zhr/2+zfar*zfar/2);
    subjects[counter] <- s;
    counter <- counter+1;
  };
  print(data.frame(sbj=subjects, dprime=dprimes, bias=bias));
};
dprimes <- dPrime(all_data$sbjID,all_data$expected,all_data$observed);
summary(dprimes);
dim(dprimes);
dim(all_data);
head(all_data);
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
boxplot(mean_data$mean_scores, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);
summary(mean_data$mean_scores);

setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Pilot1_data");
BLP_data_pilot1 <- read.table("BLP_preprocessed_pilot1.csv",header=T,sep=",");
dim(BLP_data_pilot1);
head(BLP_data_pilot1);
summary(BLP_data_pilot1);
BLP_data_pilot1$Sex <- as.factor(BLP_data_pilot1$Sex);
BLP_data_pilot1$MaxEdu <- as.factor(BLP_data_pilot1$MaxEdu);
BLP_data_pilot1$L1 <- as.factor(BLP_data_pilot1$L1);
BLP_data_pilot1$L2 <- as.factor(BLP_data_pilot1$L2);
BLP_data_pilot1$L3 <- as.factor(BLP_data_pilot1$L3);
BLP_data_pilot1$L4 <- as.factor(BLP_data_pilot1$L4);
BLP_data_pilot1$AttentionCheck <- as.factor(BLP_data_pilot1$AttentionCheck);
summary(BLP_data_pilot1);
str(BLP_data_pilot1);

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

plot(density(data1$RT),xlim=c(0,1750),ylim=c(0,0.0055),xlab="RTs (ms)",main="",xaxt = "n",col="cadetblue");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800));
lines(density(data2$RT),col="coral");
lines(density(data3$RT),col="darkgoldenrod");
lines(density(data4$RT),col="darkgreen");
lines(density(data5$RT),col="indianred4");
lines(density(data6$RT),col="lightslateblue");
lines(density(data7$RT),col="navy");
legend("topright",title="Participant:",c("1","2","3","4","5","6","7"),fill=c("cadetblue","coral","darkgoldenrod","darkgreen","indianred4","lightslateblue","navy"),bty = "n",
       cex=0.75,y.intersp=0.5)

plot(BLP_data_pilot1$L1Score ~ BLP_data_pilot1$ID.partecipante,  
     ylab = "Language Score",  
     ylim = c(0, 230),  
     xlab = "Participant", 
     main = "",
     pch = 19,
     cex = 2,  
     col = "#F1BB7B",
     xlim = c(0,max(BLP_data_pilot1$ID.partecipante)),
     yaxt = "n",  
     mar = c(5, 4, 4, 8) + 0.1)

axis(2, at = c(0, 50, 100, 150, 200, 230), 
     labels = c(0, 50, 100, 150, 200, 230))

# PILOT 2
pilot2_data <- read.table("preprocessed_data.tsv",header=T,sep=",");
head(pilot2_data)
summary(pilot2_data)
pilot2_data <- pilot2_data[pilot2_data$sbjID>7,]
head(pilot2_data)
summary(pilot2_data)
pilot2_data$response <- as.factor(pilot2_data$response)

pilot2_data$correct <- 0;
pilot2_data$correct[pilot2_data$expected!=pilot2_data$observed] <- 1;

mean_data2 <- data.frame(mean_scores2 = c(35,52.5,52.5,65,52.5,47.5,35,57.5));
boxplot(mean_data2$mean_scores2, ylab = "Accuracy score (in %)");
abline(h=50, lty=5);
summary(mean_data2$mean_scores2);

# RTs
plot(density(pilot2_data$RT[pilot2_data$sbjID==8]),xlim=c(0,1750),ylim=c(0,0.005),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00",yaxs="i");
axis(1, at = c(0,200,400,600,800,1000,1200,1400,1600,1800));
lines(density(pilot2_data$RT[pilot2_data$sbjID==9]),col="#56B4E9");
lines(density(pilot2_data$RT[pilot2_data$sbjID==10]),col="#009E73");
lines(density(pilot2_data$RT[pilot2_data$sbjID==11]),col="#F0E442");
lines(density(pilot2_data$RT[pilot2_data$sbjID==12]),col="#0072B2");
lines(density(pilot2_data$RT[pilot2_data$sbjID==13]),col="#D55E00");
lines(density(pilot2_data$RT[pilot2_data$sbjID==14]),col="#CC79A7");
lines(density(pilot2_data$RT[pilot2_data$sbjID==15]),col="#999999")
legend("topright",title="Participant:",c("8","9","10","11","12","13","14","15"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7","#999999"),bty = "n",
       cex=0.75,y.intersp=0.5)

# BLP
setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Pilot2_data");
BLP_data <- read.table("BLP_preprocessed_pilot2.csv",header=T,sep=",");
dim(BLP_data);
head(BLP_data);
summary(BLP_data);
BLP_data$Sex <- as.factor(BLP_data$Sex);
BLP_data$MaxEdu <- as.factor(BLP_data$MaxEdu);
BLP_data$L1 <- as.factor(BLP_data$L1);
BLP_data$L2 <- as.factor(BLP_data$L2);
BLP_data$L3 <- as.factor(BLP_data$L3);
BLP_data$L4 <- as.factor(BLP_data$L4);
BLP_data$AttentionCheck <- as.factor(BLP_data$AttentionCheck);
summary(BLP_data);
str(BLP_data);
library(dplyr);
BLP_data_pilot2 <- BLP_data %>% filter(ID.partecipante>7);
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
plot(L3Score~ID.partecipante,BLP_data_pilot2,subset=ok3,ylab="Language Score",ylim=c(0,230),xlab="Participant",main="",pch=19,col="#F1BB7B");

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
