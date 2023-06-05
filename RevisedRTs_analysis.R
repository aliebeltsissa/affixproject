setwd("C:/Users/annal/Downloads");
data <- read.csv("SLSSE_exp1_exp2_data.csv",header=T)
str(data)
summary(data$response_time)
plot(density(data$response_time))
plot(density(na.omit(data$response_time),bw=1));

setwd("C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Participant_Responses_correctedRTs");
data1 <- read.table("sbj1_responses.tsv",header=T,sep=",");
data2 <- read.table("sbj2_responses.tsv",header=T,sep=",");
data3 <- read.table("sbj3_responses.tsv",header=T,sep=",");
data4 <- read.table("sbj4_responses.tsv",header=T,sep=",");
data5 <- read.table("sbj5_responses.tsv",header=T,sep=",");
data6 <- read.table("sbj6_responses.tsv",header=T,sep=",");
data7 <- read.table("sbj7_responses.tsv",header=T,sep=",");
data8 <- read.table("sbj8_responses.tsv",header=T,sep=",");
data9 <- read.table("sbj9_responses.tsv",header=T,sep=",");
data10 <- read.table("sbj10_responses.tsv",header=T,sep=",");
data11 <- read.table("sbj11_responses.tsv",header=T,sep=",");
data12 <- read.table("sbj12_responses.tsv",header=T,sep=",");
data13 <- read.table("sbj13_responses.tsv",header=T,sep=",");
data14 <- read.table("sbj14_responses.tsv",header=T,sep=",");
data15 <- read.table("sbj15_responses.tsv",header=T,sep=",");
data16 <- read.table("sbj16_responses.tsv",header=T,sep=",");
data17 <- read.table("sbj17_responses.tsv",header=T,sep=",");
all_data <- rbind(data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17);
summary(all_data$RT)

# ALL DATA
plot(density(all_data$RT,bw=30),xlim=c(0,14200),xlab="RTs (ms)",main="",xaxt = "n",yaxs="i");
axis(1, at = c(0,1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,11000,12000,14000,13000,16000,18000));

# PILOT 1
plot(density(data1$RT,bw=300),xlim=c(0,14200),ylim=c(0,0.00065),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00",yaxs="i",xaxs="i");
axis(1, at = c(0,2000,4000,6000,8000,10000,12000,14000));
lines(density(data2$RT,bw=300),col="#56B4E9");
lines(density(data3$RT,bw=300),col="#009E73");
lines(density(data4$RT,bw=300),col="#F0E442");
lines(density(data5$RT,bw=300),col="#0072B2");
lines(density(data6$RT,bw=300),col="#D55E00");
lines(density(data7$RT,bw=300),col="#CC79A7");
legend("topright",title="Participant:",c("1","2","3","4","5","6","7"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7"),bty = "n",
       cex=0.75,y.intersp=0.5);

# PILOT 2
plot(density(data8$RT,bw=400),xlim=c(0,14200),ylim=c(0,0.0005),xlab="RTs (ms)",main="",xaxt = "n",col="#E69F00",yaxs="i",xaxs="i");
axis(1, at = c(0,2000,4000,6000,8000,10000,12000,14000,16000,18000));
lines(density(data9$RT,bw=400),col="#56B4E9");
lines(density(data10$RT,bw=400),col="#009E73");
lines(density(data11$RT,bw=400),col="#F0E442");
lines(density(data12$RT,bw=400),col="#0072B2");
lines(density(data13$RT,bw=400),col="#D55E00");
lines(density(data14$RT,bw=400),col="#CC79A7");
lines(density(data15$RT,bw=400),col="#999999");
legend("topright",title="Participant:",c("8","9","10","11","12","13","14","15"),fill=c("#E69F00","#56B4E9","#009E73","#F0E442","#0072B2","#D55E00","#CC79A7","#999999"),bty = "n",
       cex=0.75,y.intersp=0.5)

boxplot(all_data$RT[all_data$sbjID<8],ylim=c(0,14500),ylab = "RTs",yaxs="i");
boxplot(all_data$RT[all_data$sbjID>7 & all_data$sbjID<16],ylim=c(0,14500),ylab = "RTs",yaxs="i");
boxplot(all_data$RT[all_data$sbjID>15],ylim=c(0,14500),ylab = "RTs",yaxs="i")