require(plyr)
require(dplyr)
require(tidyr)
require(ggplot2)
require(ggpubr)
require(zoo)
library(reshape2)

#"access1-0","canesm2","cesm1-bgc","cnrm-cm5","csiro-mk3-6-0","gfdl-cm3","gfdl-esm2g","hadgem2-cc",
#"hadgem2-es","inmcm4","miroc5","mpi-esm-lr","mri-cgcm3","noresm1-m"

gcms<-c("access1-0","canesm2","cesm1-bgc","cnrm-cm5","csiro-mk3-6-0","gfdl-cm3","gfdl-esm2g","hadgem2-cc",
        "hadgem2-es","inmcm4","miroc5","mpi-esm-lr","mri-cgcm3","noresm1-m")
testvar<-c("pr")
stns<-c("1","34","77")
dscale<-c("bcsd", "loca")
newdata<-data.frame(NA)
name2<-c("date")


for (i in 1:length(testvar))
{
  for(j in 1:length(stns))
  {
    for(l in 1:length(dscale))
    {
      for(k in 1:length(gcms))
      {
        data.in<-paste("~/R/win-library/3.5/Climate change/BCSD_daily_3/",dscale[l],"_daily_meteorology/",gcms[k],"_rcp85_",testvar[i],"_stn_",stns[j],".txt",sep="")
        frame<-read.table(data.in, quote="\"", comment.char="",fill=TRUE)
        frame<-frame[,-1]
        length(frame)<-54787
        newdata<-data.frame(newdata,frame)
        name1<-paste(gcms[k],testvar[i],stns[j],dscale[l],sep=".")
        name2<-c(name2,name1)
      }
    }
  }
}
frame<-read.table("~/R/win-library/3.5/Climate change/BCSD_daily_3/bcsd_daily_meteorology/noresm1-m_rcp85_tasmin_stn_77.txt", quote="\"", comment.char="")
newdata[,1]<-frame[,1]
names(newdata)<-name2


canesm2_rcp85_pr_stn_1 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_pr_stn_1.txt",
                                     quote="\"", comment.char="",fill=TRUE)
canesm2_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_pr_stn_34.txt",
                                      quote="\"", comment.char="",fill=TRUE)
canesm2_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_pr_stn_77.txt",
                                      quote="\"", comment.char="",fill=TRUE)

newdata$"canesm2.pr.1.loca"[1:35064]<-canesm2_rcp85_pr_stn_1[1:35064,2]
newdata$"canesm2.pr.1.loca"[35065:35429]<-NA
newdata$"canesm2.pr.1.loca"[35430:52596]<-canesm2_rcp85_pr_stn_1[35066:52232,2]

newdata$"canesm2.pr.34.loca"[1:35064]<-canesm2_rcp85_pr_stn_34[1:35064,2]
newdata$"canesm2.pr.34.loca"[35065:35429]<-NA
newdata$"canesm2.pr.34.loca"[35430:52596]<-canesm2_rcp85_pr_stn_34[35066:52232,2]

newdata$"canesm2.pr.77.loca"[1:35064]<-canesm2_rcp85_pr_stn_77[1:35064,2]
newdata$"canesm2.pr.77.loca"[35065:35429]<-NA
newdata$"canesm2.pr.77.loca"[35430:52596]<-canesm2_rcp85_pr_stn_77[35066:52232,2]

gfdl.esm2g_rcp85_pr_stn_1 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_pr_stn_1.txt",
                                        quote="\"", comment.char="",fill=TRUE)
gfdl.esm2g_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_pr_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
gfdl.esm2g_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_pr_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

newdata$"gfdl-esm2g.pr.1.loca"[1:8035]<-gfdl.esm2g_rcp85_pr_stn_1[1:8035,2]
newdata$"gfdl-esm2g.pr.1.loca"[8036:8401]<-NA
newdata$"gfdl-esm2g.pr.1.loca"[8402:13149]<-gfdl.esm2g_rcp85_pr_stn_1[8037:12784,2]
newdata$"gfdl-esm2g.pr.1.loca"[13150:13514]<-NA
newdata$"gfdl-esm2g.pr.1.loca"[13515:54787]<-gfdl.esm2g_rcp85_pr_stn_1[12786:54058,2]

newdata$"gfdl-esm2g.pr.34.loca"[1:8035]<-gfdl.esm2g_rcp85_pr_stn_34[1:8035,2]
newdata$"gfdl-esm2g.pr.34.loca"[8036:8401]<-NA
newdata$"gfdl-esm2g.pr.34.loca"[8402:13149]<-gfdl.esm2g_rcp85_pr_stn_34[8037:12784,2]
newdata$"gfdl-esm2g.pr.34.loca"[13150:13514]<-NA
newdata$"gfdl-esm2g.pr.34.loca"[13515:54787]<-gfdl.esm2g_rcp85_pr_stn_34[12786:54058,2]

newdata$"gfdl-esm2g.pr.77.loca"[1:8035]<-gfdl.esm2g_rcp85_pr_stn_77[1:8035,2]
newdata$"gfdl-esm2g.pr.77.loca"[8036:8401]<-NA
newdata$"gfdl-esm2g.pr.77.loca"[8402:13149]<-gfdl.esm2g_rcp85_pr_stn_77[8037:12784,2]
newdata$"gfdl-esm2g.pr.77.loca"[13150:13514]<-NA
newdata$"gfdl-esm2g.pr.77.loca"[13515:54787]<-gfdl.esm2g_rcp85_pr_stn_77[12786:54058,2]

hadgem2.es_rcp85_pr_stn_1 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-es_rcp85_pr_stn_1.txt",
                                        quote="\"", comment.char="",fill=TRUE)
hadgem2.es_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-es_rcp85_pr_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
hadgem2.es_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-es_rcp85_pr_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

newdata$"hadgem2-es.pr.1.loca"[1:16071]<-hadgem2.es_rcp85_pr_stn_1[1:16071,2]
newdata$"hadgem2-es.pr.1.loca"[16072:16436]<-NA
newdata$"hadgem2-es.pr.1.loca"[16437:28855]<-hadgem2.es_rcp85_pr_stn_1[16073:28491,2]
newdata$"hadgem2-es.pr.1.loca"[28856:29220]<-NA
newdata$"hadgem2-es.pr.1.loca"[29221:54787]<-hadgem2.es_rcp85_pr_stn_1[28493:54059,2]

newdata$"hadgem2-es.pr.34.loca"[1:16071]<-hadgem2.es_rcp85_pr_stn_34[1:16071,2]
newdata$"hadgem2-es.pr.34.loca"[16072:16436]<-NA
newdata$"hadgem2-es.pr.34.loca"[16437:28855]<-hadgem2.es_rcp85_pr_stn_34[16073:28491,2]
newdata$"hadgem2-es.pr.34.loca"[28856:29220]<-NA
newdata$"hadgem2-es.pr.34.loca"[29221:54787]<-hadgem2.es_rcp85_pr_stn_34[28493:54059,2]

newdata$"hadgem2-es.pr.77.loca"[1:16071]<-hadgem2.es_rcp85_pr_stn_77[1:16071,2]
newdata$"hadgem2-es.pr.77.loca"[16072:16436]<-NA
newdata$"hadgem2-es.pr.77.loca"[16437:28855]<-hadgem2.es_rcp85_pr_stn_77[16073:28491,2]
newdata$"hadgem2-es.pr.77.loca"[28856:29220]<-NA
newdata$"hadgem2-es.pr.77.loca"[29221:54787]<-hadgem2.es_rcp85_pr_stn_77[28493:54059,2]

miroc5_rcp85_tasmax_stn_1 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmax_stn_1.txt",
                                        quote="\"", comment.char="",fill=TRUE)
miroc5_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmax_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
miroc5_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmax_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

mpi.esm.lr_rcp85_pr_stn_1 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_pr_stn_1.txt",
                                        quote="\"", comment.char="",fill=TRUE)
mpi.esm.lr_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_pr_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
mpi.esm.lr_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_pr_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

newdata$"mpi-esm-lr.pr.1.loca"[1:46021]<-mpi.esm.lr_rcp85_pr_stn_1[1:46021,2]
newdata$"mpi-esm-lr.pr.1.loca"[46022:46387]<-NA
newdata$"mpi-esm-lr.pr.1.loca"[46388:54787]<-mpi.esm.lr_rcp85_pr_stn_1[46023:54422,2]

newdata$"mpi-esm-lr.pr.34.loca"[1:46021]<-mpi.esm.lr_rcp85_pr_stn_34[1:46021,2]
newdata$"mpi-esm-lr.pr.34.loca"[46022:46387]<-NA
newdata$"mpi-esm-lr.pr.34.loca"[46388:54787]<-mpi.esm.lr_rcp85_pr_stn_34[46023:54422,2]

newdata$"mpi-esm-lr.pr.77.loca"[1:46021]<-mpi.esm.lr_rcp85_pr_stn_77[1:46021,2]
newdata$"mpi-esm-lr.pr.77.loca"[46022:46387]<-NA
newdata$"mpi-esm-lr.pr.77.loca"[46388:54787]<-mpi.esm.lr_rcp85_pr_stn_77[46023:54422,2]

mri.cgcm3_rcp85_pr_stn_1 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_pr_stn_1.txt",
                                       quote="\"", comment.char="",fill=TRUE)
mri.cgcm3_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_pr_stn_34.txt",
                                        quote="\"", comment.char="",fill=TRUE)
mri.cgcm3_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_pr_stn_77.txt",
                                        quote="\"", comment.char="",fill=TRUE)

newdata$"mri-cgcm3.pr.1.loca"[1:50404]<-mri.cgcm3_rcp85_pr_stn_1[1:50404,2]
newdata$"mri-cgcm3.pr.1.loca"[50405:50770]<-NA
newdata$"mri-cgcm3.pr.1.loca"[50771:54787]<-mri.cgcm3_rcp85_pr_stn_1[50406:54422,2]

newdata$"mri-cgcm3.pr.34.loca"[1:50404]<-mri.cgcm3_rcp85_pr_stn_34[1:50404,2]
newdata$"mri-cgcm3.pr.34.loca"[50405:50770]<-NA
newdata$"mri-cgcm3.pr.34.loca"[50771:54787]<-mri.cgcm3_rcp85_pr_stn_34[50406:54422,2]

newdata$"mri-cgcm3.pr.77.loca"[1:50404]<-mri.cgcm3_rcp85_pr_stn_77[1:50404,2]
newdata$"mri-cgcm3.pr.77.loca"[50405:50770]<-NA
newdata$"mri-cgcm3.pr.77.loca"[50771:54787]<-mri.cgcm3_rcp85_pr_stn_77[50406:54422,2]


#1971 to 2000 (december of 1970 to november of 2000)
historic_data<-newdata[7640:18597,]

#2040 to 2069 (december of 2039 to november of 2069)
midcentury_data<-newdata[32842:43799,]


histdata<-data.frame(NA)
middata<-data.frame(NA)
historic_data1<-data.frame(matrix(nrow=30,ncol=43))
midcentury_data1<-data.frame(matrix(nrow=30,ncol=43))
for (i in 1971:2000)
{
  for (j in 2:85)
  {
    if (i==1972||i==1976||i==1980||i==1984||i==1988||i==1992||i==1996||i==2000)
    {
      search1<-paste(i-1,"-12-01",sep="")
      search2<-paste(i,"-02-29",sep="")
      histdata<-max(historic_data[which(grepl(search1,historic_data$date)):which(grepl(search2,historic_data$date)),j],na.rm=TRUE)
      historic_data1[i-1970,j]<-histdata
    }
    else
    {
      search1<-paste(i-1,"-12-01",sep="")
      search2<-paste(i,"-02-28",sep="")
      histdata<-max(historic_data[which(grepl(search1,historic_data$date)):which(grepl(search2,historic_data$date)),j],na.rm=TRUE)
      historic_data1[i-1970,j]<-histdata
    }
  }
}
for (i in 2040:2069)
{
  for (j in 2:85)
  {
    if (i==2040||i==2044||i==2048||i==2052||i==2056||i==2060||i==2064||i==2068)
    {
      search1<-paste(i-1,"-12-01",sep="")
      search2<-paste(i,"-02-29",sep="")
      middata<-max(midcentury_data[which(grepl(search1,midcentury_data$date)):which(grepl(search2,midcentury_data$date)),j],na.rm=TRUE)
      midcentury_data1[i-2039,j]<-middata
    }
    else
    {
      search1<-paste(i-1,"-12-01",sep="")
      search2<-paste(i,"-02-28",sep="")
      middata<-max(midcentury_data[which(grepl(search1,midcentury_data$date)):which(grepl(search2,midcentury_data$date)),j],na.rm=TRUE)
      midcentury_data1[i-2039,j]<-middata
    }
  }
}

quantilepdiff<-data.frame(matrix(ncol=85,nrow=5))
quantilemid<-data.frame(matrix(ncol=85,nrow=5))
quantilehist<-data.frame(matrix(ncol=85,nrow=5))

for (k in 2:85)
{
  quantilemid[,k]<-quantile(midcentury_data1[,k], probs=c(0.05,0.25,0.5,0.75,0.95))
  quantilehist[,k]<-quantile(historic_data1[,k], probs=c(0.05,0.25,0.5,0.75,0.95))
}
for (l in 2:85)
{
  for (m in 1:5)
  {
    quantilepdiff[m,l-1]<-(quantilemid[m,l]-quantilehist[m,l])/quantilehist[m,l]
  }
}

percentspdiff<-melt(quantilepdiff)
percentspdiff[,1]<-factor(rep(c("5%","25%","50%","75%","95%"),84),levels=c("5%","25%","50%","75%","95%"))
percentspdiff[,2]<-factor(c(rep("BCSD Stn1",70),rep("BCSD Stn34",70),rep("BCSD Stn77",70),rep("LOCA Stn1",70),rep("LOCA Stn34",70),rep("LOCA Stn77",70)),
                          levels=c("BCSD Stn1","BCSD Stn34","BCSD Stn77","LOCA Stn1","LOCA Stn34","LOCA Stn77"))
percentspdiff[,3]<-percentspdiff[,3]*100

bcsdsplit<-percentspdiff
bcsdsplit[211:420,3]<-0
locasplit<-percentspdiff[211:420,]

names(percentspdiff)<-c("Percent","Station","Value")
names(bcsdsplit)<-c("Percent","Station","Value")

pdiff<-ggplot(aes(y = Value, x = Percent, fill=Station),data=percentspdiff)+geom_hline(yintercept=0)+
  stat_boxplot(data=bcsdsplit,geom="errorbar")+geom_boxplot()+
  ylab(label="Percent Difference in Precipitation")+xlab(label="Quantiles")+theme_bw()+
  scale_y_continuous(breaks = seq(-50,100,by=25),limits=c(-50,100),expand=c(0,0))+
  ggtitle(label="Percent Difference in Precipitation from 1971-2000 to 2040-2069")+
  scale_fill_manual(values=c("#FF0000","#01BB20","#0000FF","#FF9999","#AAFFAA","#9999FF"))