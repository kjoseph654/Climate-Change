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
testvar<-c("pr","tasmax","tasmin")
stns<-c("34","77")
dscale<-c("loca","bcsd")
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

hadgem2.cc_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/bcsd_daily_meteorology/hadgem2-cc_rcp85_tasmax_stn_34.txt",
                                             quote="\"", comment.char="")
hadgem2.cc_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/bcsd_daily_meteorology/hadgem2-cc_rcp85_tasmax_stn_77.txt",
                                             quote="\"", comment.char="")


newdata$"hadgem2-cc.tasmax.34.bcsd"[1:48943]<-hadgem2.cc_rcp85_tasmax_stn_34[1:48943,2]
newdata$"hadgem2-cc.tasmax.34.bcsd"[48944:49309]<-NA
newdata$"hadgem2-cc.tasmax.34.bcsd"[49310:54787]<-hadgem2.cc_rcp85_tasmax_stn_34[48944:54421,2]

newdata$"hadgem2-cc.tasmax.77.bcsd"[1:48943]<-hadgem2.cc_rcp85_tasmax_stn_77[1:48943,2]
newdata$"hadgem2-cc.tasmax.77.bcsd"[48944:49309]<-NA
newdata$"hadgem2-cc.tasmax.77.bcsd"[49310:54787]<-hadgem2.cc_rcp85_tasmax_stn_77[48944:54421,2]


hadgem2.es_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/bcsd_daily_meteorology/hadgem2-es_rcp85_tasmin_stn_34.txt",
                                             quote="\"", comment.char="")
hadgem2.es_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/bcsd_daily_meteorology/hadgem2-es_rcp85_tasmin_stn_77.txt",
                                             quote="\"", comment.char="")

newdata$"hadgem2-es.tasmin.34.bcsd"[1:24472]<-hadgem2.es_rcp85_tasmin_stn_34[1:24472,2]
newdata$"hadgem2-es.tasmin.34.bcsd"[24473:24837]<-NA
newdata$"hadgem2-es.tasmin.34.bcsd"[24838:54787]<-hadgem2.es_rcp85_tasmin_stn_34[24473:54422,2]

newdata$"hadgem2-es.tasmin.77.bcsd"[1:24472]<-hadgem2.es_rcp85_tasmin_stn_77[1:24472,2]
newdata$"hadgem2-es.tasmin.77.bcsd"[24473:24837]<-NA
newdata$"hadgem2-es.tasmin.77.bcsd"[24838:54787]<-hadgem2.es_rcp85_tasmin_stn_77[24473:54422,2]



access1.0_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/access1-0_rcp85_tasmax_stn_34.txt",
                                            quote="\"", comment.char="",fill=TRUE)
access1.0_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/access1-0_rcp85_tasmax_stn_77.txt",
                                            quote="\"", comment.char="",fill=TRUE)

newdata$"access1-0.tasmax.34.loca"[1:17167]<-access1.0_rcp85_tasmax_stn_34[1:17167,2]
newdata$"access1-0.tasmax.34.loca"[17168:17532]<-NA
newdata$"access1-0.tasmax.34.loca"[17533:54787]<-access1.0_rcp85_tasmax_stn_34[17169:54423,2]

newdata$"access1-0.tasmax.77.loca"[1:17167]<-access1.0_rcp85_tasmax_stn_77[1:17167,2]
newdata$"access1-0.tasmax.77.loca"[17168:17532]<-NA
newdata$"access1-0.tasmax.77.loca"[17533:54787]<-access1.0_rcp85_tasmax_stn_77[17169:54423,2]


access1.0_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/access1-0_rcp85_tasmin_stn_34.txt",
                                            quote="\"", comment.char="",fill=TRUE)
access1.0_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/access1-0_rcp85_tasmin_stn_77.txt",
                                            quote="\"", comment.char="",fill=TRUE)


newdata$"access1-0.tasmin.34.loca"[1:4748]<-access1.0_rcp85_tasmin_stn_34[1:4748,2]
newdata$"access1-0.tasmin.34.loca"[4749:5113]<-NA
newdata$"access1-0.tasmin.34.loca"[5114:54787]<-access1.0_rcp85_tasmin_stn_34[4750:54423,2]

newdata$"access1-0.tasmin.77.loca"[1:4748]<-access1.0_rcp85_tasmin_stn_77[1:4748,2]
newdata$"access1-0.tasmin.77.loca"[4749:5113]<-NA
newdata$"access1-0.tasmin.77.loca"[5114:54787]<-access1.0_rcp85_tasmin_stn_77[4750:54423,2]

canesm2_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_pr_stn_34.txt",
                                      quote="\"", comment.char="",fill=TRUE)
canesm2_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_pr_stn_77.txt",
                                      quote="\"", comment.char="",fill=TRUE)

newdata$"canesm2.pr.34.loca"[1:35064]<-canesm2_rcp85_pr_stn_34[1:35064,2]
newdata$"canesm2.pr.34.loca"[35065:35429]<-NA
newdata$"canesm2.pr.34.loca"[35430:52596]<-canesm2_rcp85_pr_stn_34[35066:52232,2]

newdata$"canesm2.pr.77.loca"[1:35064]<-canesm2_rcp85_pr_stn_77[1:35064,2]
newdata$"canesm2.pr.77.loca"[35065:35429]<-NA
newdata$"canesm2.pr.77.loca"[35430:52596]<-canesm2_rcp85_pr_stn_77[35066:52232,2]

canesm2_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_tasmax_stn_34.txt",
                                          quote="\"", comment.char="",fill=TRUE)
canesm2_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/canesm2_rcp85_tasmax_stn_77.txt",
                                          quote="\"", comment.char="",fill=TRUE)

newdata$"canesm2.tasmax.34.loca"[1:3652]<-canesm2_rcp85_tasmax_stn_34[1:3652,2]
newdata$"canesm2.tasmax.34.loca"[3653:4018]<-NA
newdata$"canesm2.tasmax.34.loca"[4019:54787]<-canesm2_rcp85_tasmax_stn_34[3654:54422,2]

newdata$"canesm2.tasmax.77.loca"[1:3652]<-canesm2_rcp85_tasmax_stn_77[1:3652,2]
newdata$"canesm2.tasmax.77.loca"[3653:4018]<-NA
newdata$"canesm2.tasmax.77.loca"[4019:54787]<-canesm2_rcp85_tasmax_stn_77[3654:54422,2]

cesm1.bgc_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/cesm1-bgc_rcp85_tasmax_stn_34.txt",
                                            quote="\"", comment.char="",fill=TRUE)
cesm1.bgc_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/cesm1-bgc_rcp85_tasmax_stn_77.txt",
                                            quote="\"", comment.char="",fill=TRUE)

newdata$"cesm1-bgc.tasmax.34.loca"[1:37255]<-cesm1.bgc_rcp85_tasmax_stn_34[1:37255,2]
newdata$"cesm1-bgc.tasmax.34.loca"[37256:37621]<-NA
newdata$"cesm1-bgc.tasmax.34.loca"[37622:54787]<-cesm1.bgc_rcp85_tasmax_stn_34[37257:54422,2]

newdata$"cesm1-bgc.tasmax.77.loca"[1:37255]<-cesm1.bgc_rcp85_tasmax_stn_77[1:37255,2]
newdata$"cesm1-bgc.tasmax.77.loca"[37256:37621]<-NA
newdata$"cesm1-bgc.tasmax.77.loca"[37622:54787]<-cesm1.bgc_rcp85_tasmax_stn_77[37257:54422,2]

cnrm.cm5_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/cnrm-cm5_rcp85_tasmax_stn_34.txt",
                                           quote="\"", comment.char="",fill=TRUE)
cnrm.cm5_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/cnrm-cm5_rcp85_tasmax_stn_77.txt",
                                           quote="\"", comment.char="",fill=TRUE)

newdata$"cnrm-cm5.tasmax.34.loca"[1:39082]<-cnrm.cm5_rcp85_tasmax_stn_34[1:39082,2]
newdata$"cnrm-cm5.tasmax.34.loca"[39083:39447]<-NA
newdata$"cnrm-cm5.tasmax.34.loca"[39448:46387]<-cnrm.cm5_rcp85_tasmax_stn_34[39084:46023,2]
newdata$"cnrm-cm5.tasmax.34.loca"[46388:46752]<-NA
newdata$"cnrm-cm5.tasmax.34.loca"[46753:54787]<-cnrm.cm5_rcp85_tasmax_stn_34[46025:54059,2]

newdata$"cnrm-cm5.tasmax.77.loca"[1:39082]<-cnrm.cm5_rcp85_tasmax_stn_77[1:39082,2]
newdata$"cnrm-cm5.tasmax.77.loca"[39083:39447]<-NA
newdata$"cnrm-cm5.tasmax.77.loca"[39448:46387]<-cnrm.cm5_rcp85_tasmax_stn_77[39084:46023,2]
newdata$"cnrm-cm5.tasmax.77.loca"[46388:46752]<-NA
newdata$"cnrm-cm5.tasmax.77.loca"[46753:54787]<-cnrm.cm5_rcp85_tasmax_stn_77[46025:54059,2]

cnrm.cm5_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/cnrm-cm5_rcp85_tasmin_stn_34.txt",
                                           quote="\"", comment.char="",fill=TRUE)
cnrm.cm5_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/cnrm-cm5_rcp85_tasmin_stn_77.txt",
                                           quote="\"", comment.char="",fill=TRUE)

newdata$"cnrm-cm5.tasmin.34.loca"[1:16071]<-cnrm.cm5_rcp85_tasmin_stn_34[1:16071,2]
newdata$"cnrm-cm5.tasmin.34.loca"[16072:16436]<-NA
newdata$"cnrm-cm5.tasmin.34.loca"[16437:42005]<-cnrm.cm5_rcp85_tasmin_stn_34[16072:41640,2]
newdata$"cnrm-cm5.tasmin.34.loca"[42006:42370]<-NA
newdata$"cnrm-cm5.tasmin.34.loca"[42370:54787]<-cnrm.cm5_rcp85_tasmin_stn_34[41642:54059,2]

newdata$"cnrm-cm5.tasmin.77.loca"[1:16071]<-cnrm.cm5_rcp85_tasmin_stn_77[1:16071,2]
newdata$"cnrm-cm5.tasmin.77.loca"[16072:16436]<-NA
newdata$"cnrm-cm5.tasmin.77.loca"[16437:42005]<-cnrm.cm5_rcp85_tasmin_stn_77[16072:41640,2]
newdata$"cnrm-cm5.tasmin.77.loca"[42006:42370]<-NA
newdata$"cnrm-cm5.tasmin.77.loca"[42370:54787]<-cnrm.cm5_rcp85_tasmin_stn_77[41642:54059,2]

csiro.mk3.6.0_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/csiro-mk3-6-0_rcp85_tasmax_stn_34.txt",
                                                quote="\"", comment.char="",fill=TRUE)
csiro.mk3.6.0_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/csiro-mk3-6-0_rcp85_tasmax_stn_77.txt",
                                                quote="\"", comment.char="",fill=TRUE)

newdata$"csiro-mk3-6-0.tasmax.34.loca"[1:28855]<-csiro.mk3.6.0_rcp85_tasmax_stn_34[1:28855,2]
newdata$"csiro-mk3-6-0.tasmax.34.loca"[28856:29220]<-NA
newdata$"csiro-mk3-6-0.tasmax.34.loca"[29221:50404]<-csiro.mk3.6.0_rcp85_tasmax_stn_34[28857:50040,2]
newdata$"csiro-mk3-6-0.tasmax.34.loca"[50405:50770]<-NA
newdata$"csiro-mk3-6-0.tasmax.34.loca"[50771:54787]<-csiro.mk3.6.0_rcp85_tasmax_stn_34[50042:54058,2]

newdata$"csiro-mk3-6-0.tasmax.77.loca"[1:28855]<-csiro.mk3.6.0_rcp85_tasmax_stn_77[1:28855,2]
newdata$"csiro-mk3-6-0.tasmax.77.loca"[28856:29220]<-NA
newdata$"csiro-mk3-6-0.tasmax.77.loca"[29221:50404]<-csiro.mk3.6.0_rcp85_tasmax_stn_77[28857:50040,2]
newdata$"csiro-mk3-6-0.tasmax.77.loca"[50405:50770]<-NA
newdata$"csiro-mk3-6-0.tasmax.77.loca"[50771:54787]<-csiro.mk3.6.0_rcp85_tasmax_stn_77[50042:54058,2]

gfdl.cm3_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-cm3_rcp85_tasmax_stn_34.txt",
                                           quote="\"", comment.char="",fill=TRUE)
gfdl.cm3_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-cm3_rcp85_tasmax_stn_77.txt",
                                           quote="\"", comment.char="",fill=TRUE)

newdata$"gfdl-cm3.tasmax.34.loca"[1:1826]<-gfdl.cm3_rcp85_tasmax_stn_34[1:1826,2]
newdata$"gfdl-cm3.tasmax.34.loca"[1827:2191]<-NA
newdata$"gfdl-cm3.tasmax.34.loca"[2192:54787]<-gfdl.cm3_rcp85_tasmax_stn_34[1828:54423,2]

newdata$"gfdl-cm3.tasmax.77.loca"[1:1826]<-gfdl.cm3_rcp85_tasmax_stn_77[1:1826,2]
newdata$"gfdl-cm3.tasmax.77.loca"[1827:2191]<-NA
newdata$"gfdl-cm3.tasmax.77.loca"[2192:54787]<-gfdl.cm3_rcp85_tasmax_stn_77[1828:54423,2]

gfdl.cm3_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-cm3_rcp85_tasmin_stn_34.txt",
                                           quote="\"", comment.char="",fill=TRUE)
gfdl.cm3_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-cm3_rcp85_tasmin_stn_77.txt",
                                           quote="\"", comment.char="",fill=TRUE)

newdata$"gfdl-cm3.tasmin.34.loca"[1:24106]<-gfdl.cm3_rcp85_tasmin_stn_34[1:24106,2]
newdata$"gfdl-cm3.tasmin.34.loca"[24107:24472]<-NA
newdata$"gfdl-cm3.tasmin.34.loca"[24473:46021]<-gfdl.cm3_rcp85_tasmin_stn_34[24108:45656,2]
newdata$"gfdl-cm3.tasmin.34.loca"[46022:46387]<-NA
newdata$"gfdl-cm3.tasmin.34.loca"[46388:51865]<-gfdl.cm3_rcp85_tasmin_stn_34[45658:51135,2]
newdata$"gfdl-cm3.tasmin.34.loca"[51866:52231]<-NA
newdata$"gfdl-cm3.tasmin.34.loca"[52232:54787]<-gfdl.cm3_rcp85_tasmin_stn_34[51137:53692,2]

newdata$"gfdl-cm3.tasmin.77.loca"[1:24106]<-gfdl.cm3_rcp85_tasmin_stn_77[1:24106,2]
newdata$"gfdl-cm3.tasmin.77.loca"[24107:24472]<-NA
newdata$"gfdl-cm3.tasmin.77.loca"[24473:46021]<-gfdl.cm3_rcp85_tasmin_stn_77[24108:45656,2]
newdata$"gfdl-cm3.tasmin.77.loca"[46022:46387]<-NA
newdata$"gfdl-cm3.tasmin.77.loca"[46388:51865]<-gfdl.cm3_rcp85_tasmin_stn_77[45658:51135,2]
newdata$"gfdl-cm3.tasmin.77.loca"[51866:52231]<-NA
newdata$"gfdl-cm3.tasmin.77.loca"[52232:54787]<-gfdl.cm3_rcp85_tasmin_stn_77[51137:53692,2]

gfdl.esm2g_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_pr_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
gfdl.esm2g_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_pr_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

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

gfdl.esm2g_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_tasmax_stn_34.txt",
                                             quote="\"", comment.char="",fill=TRUE)
gfdl.esm2g_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/gfdl-esm2g_rcp85_tasmax_stn_77.txt",
                                             quote="\"", comment.char="",fill=TRUE)

newdata$"gfdl-esm2g.tasmax.34.loca"[1:11323]<-gfdl.esm2g_rcp85_tasmax_stn_34[1:11323,2]
newdata$"gfdl-esm2g.tasmax.34.loca"[11324:11688]<-NA
newdata$"gfdl-esm2g.tasmax.34.loca"[11689:27029]<-gfdl.esm2g_rcp85_tasmax_stn_34[11325:26665,2]
newdata$"gfdl-esm2g.tasmax.34.loca"[27030:27395]<-NA
newdata$"gfdl-esm2g.tasmax.34.loca"[27396:40543]<-gfdl.esm2g_rcp85_tasmax_stn_34[26667:39814,2]
newdata$"gfdl-esm2g.tasmax.34.loca"[40544:40908]<-NA
newdata$"gfdl-esm2g.tasmax.34.loca"[40909:54787]<-gfdl.esm2g_rcp85_tasmax_stn_34[39816:53694,2]

newdata$"gfdl-esm2g.tasmax.77.loca"[1:11323]<-gfdl.esm2g_rcp85_tasmax_stn_77[1:11323,2]
newdata$"gfdl-esm2g.tasmax.77.loca"[11324:11688]<-NA
newdata$"gfdl-esm2g.tasmax.77.loca"[11689:27029]<-gfdl.esm2g_rcp85_tasmax_stn_77[11325:26665,2]
newdata$"gfdl-esm2g.tasmax.77.loca"[27030:27395]<-NA
newdata$"gfdl-esm2g.tasmax.77.loca"[27396:40543]<-gfdl.esm2g_rcp85_tasmax_stn_77[26667:39814,2]
newdata$"gfdl-esm2g.tasmax.77.loca"[40544:40908]<-NA
newdata$"gfdl-esm2g.tasmax.77.loca"[40909:54787]<-gfdl.esm2g_rcp85_tasmax_stn_77[39816:53694,2]

hadgem2.cc_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-cc_rcp85_tasmax_stn_34.txt",
                                             quote="\"", comment.char="",fill=TRUE)
hadgem2.cc_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-cc_rcp85_tasmax_stn_77.txt",
                                             quote="\"", comment.char="",fill=TRUE)

newdata$"hadgem2-cc.tasmax.34.loca"[1:37255]<-hadgem2.cc_rcp85_tasmax_stn_34[1:37255,2]
newdata$"hadgem2-cc.tasmax.34.loca"[37256:37621]<-NA
newdata$"hadgem2-cc.tasmax.34.loca"[37622:53692]<-hadgem2.cc_rcp85_tasmax_stn_34[37257:53327,2]
newdata$"hadgem2-cc.tasmax.34.loca"[53693:54057]<-NA
newdata$"hadgem2-cc.tasmax.34.loca"[54058:54787]<-hadgem2.cc_rcp85_tasmax_stn_34[53329:54058,2]

newdata$"hadgem2-cc.tasmax.77.loca"[1:37255]<-hadgem2.cc_rcp85_tasmax_stn_77[1:37255,2]
newdata$"hadgem2-cc.tasmax.77.loca"[37256:37621]<-NA
newdata$"hadgem2-cc.tasmax.77.loca"[37622:53692]<-hadgem2.cc_rcp85_tasmax_stn_77[37257:53327,2]
newdata$"hadgem2-cc.tasmax.77.loca"[53693:54057]<-NA
newdata$"hadgem2-cc.tasmax.77.loca"[54058:54787]<-hadgem2.cc_rcp85_tasmax_stn_77[53329:54058,2]

hadgem2.cc_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-cc_rcp85_tasmin_stn_34.txt",
                                             quote="\"", comment.char="",fill=TRUE)
hadgem2.cc_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-cc_rcp85_tasmin_stn_77.txt",
                                             quote="\"", comment.char="",fill=TRUE)

newdata$"hadgem2-cc.tasmin.34.loca"[1:36160]<-hadgem2.cc_rcp85_tasmin_stn_34[1:36160,2]
newdata$"hadgem2-cc.tasmin.34.loca"[36161:36525]<-NA
newdata$"hadgem2-cc.tasmin.34.loca"[36526:54787]<-hadgem2.cc_rcp85_tasmin_stn_34[36162:54423,2]

newdata$"hadgem2-cc.tasmin.77.loca"[1:36160]<-hadgem2.cc_rcp85_tasmin_stn_77[1:36160,2]
newdata$"hadgem2-cc.tasmin.77.loca"[36161:36525]<-NA
newdata$"hadgem2-cc.tasmin.77.loca"[36526:54787]<-hadgem2.cc_rcp85_tasmin_stn_77[36162:54423,2]

hadgem2.es_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-es_rcp85_pr_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
hadgem2.es_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/hadgem2-es_rcp85_pr_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

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

miroc5_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmax_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
miroc5_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmax_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

newdata$"miroc5.tasmax.34.loca"[1:40908]<-miroc5_rcp85_tasmax_stn_34[1:40908,2]
newdata$"miroc5.tasmax.34.loca"[40909:41273]<-NA
newdata$"miroc5.tasmax.34.loca"[41274:54787]<-miroc5_rcp85_tasmax_stn_34[40910:54423,2]

newdata$"miroc5.tasmax.77.loca"[1:40908]<-miroc5_rcp85_tasmax_stn_77[1:40908,2]
newdata$"miroc5.tasmax.77.loca"[40909:41273]<-NA
newdata$"miroc5.tasmax.77.loca"[41274:54787]<-miroc5_rcp85_tasmax_stn_77[40910:54423,2]

miroc5_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmin_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
miroc5_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/miroc5_rcp85_tasmin_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

newdata$"miroc5.tasmin.34.loca"[1:16801]<-miroc5_rcp85_tasmin_stn_34[1:16801,2]
newdata$"miroc5.tasmin.34.loca"[16802:17167]<-NA
newdata$"miroc5.tasmin.34.loca"[17168:54787]<-miroc5_rcp85_tasmin_stn_34[16803:54422,2]

newdata$"miroc5.tasmin.77.loca"[1:16801]<-miroc5_rcp85_tasmin_stn_77[1:16801,2]
newdata$"miroc5.tasmin.77.loca"[16802:17167]<-NA
newdata$"miroc5.tasmin.77.loca"[17168:54787]<-miroc5_rcp85_tasmin_stn_77[16803:54422,2]

mpi.esm.lr_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_pr_stn_34.txt",
                                         quote="\"", comment.char="",fill=TRUE)
mpi.esm.lr_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_pr_stn_77.txt",
                                         quote="\"", comment.char="",fill=TRUE)

newdata$"mpi-esm-lr.pr.34.loca"[1:46021]<-mpi.esm.lr_rcp85_pr_stn_34[1:46021,2]
newdata$"mpi-esm-lr.pr.34.loca"[46022:46387]<-NA
newdata$"mpi-esm-lr.pr.34.loca"[46388:54787]<-mpi.esm.lr_rcp85_pr_stn_34[46023:54422,2]

newdata$"mpi-esm-lr.pr.77.loca"[1:46021]<-mpi.esm.lr_rcp85_pr_stn_77[1:46021,2]
newdata$"mpi-esm-lr.pr.77.loca"[46022:46387]<-NA
newdata$"mpi-esm-lr.pr.77.loca"[46388:54787]<-mpi.esm.lr_rcp85_pr_stn_77[46023:54422,2]

mpi.esm.lr_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_tasmin_stn_34.txt",
                                             quote="\"", comment.char="",fill=TRUE)
mpi.esm.lr_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mpi-esm-lr_rcp85_tasmin_stn_77.txt",
                                             quote="\"", comment.char="",fill=TRUE)

newdata$"mpi-esm-lr.tasmin.34.loca"[1:18262]<-mpi.esm.lr_rcp85_tasmin_stn_34[1:18262,2]
newdata$"mpi-esm-lr.tasmin.34.loca"[18263:18628]<-NA
newdata$"mpi-esm-lr.tasmin.34.loca"[18629:54787]<-mpi.esm.lr_rcp85_tasmin_stn_34[18264:54422,2]

newdata$"mpi-esm-lr.tasmin.77.loca"[1:18262]<-mpi.esm.lr_rcp85_tasmin_stn_77[1:18262,2]
newdata$"mpi-esm-lr.tasmin.77.loca"[18263:18628]<-NA
newdata$"mpi-esm-lr.tasmin.77.loca"[18629:54787]<-mpi.esm.lr_rcp85_tasmin_stn_77[18264:54422,2]

mri.cgcm3_rcp85_pr_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_pr_stn_34.txt",
                                        quote="\"", comment.char="",fill=TRUE)
mri.cgcm3_rcp85_pr_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_pr_stn_77.txt",
                                        quote="\"", comment.char="",fill=TRUE)

newdata$"mri-cgcm3.pr.34.loca"[1:50404]<-mri.cgcm3_rcp85_pr_stn_34[1:50404,2]
newdata$"mri-cgcm3.pr.34.loca"[50405:50770]<-NA
newdata$"mri-cgcm3.pr.34.loca"[50771:54787]<-mri.cgcm3_rcp85_pr_stn_34[50406:54422,2]

newdata$"mri-cgcm3.pr.77.loca"[1:50404]<-mri.cgcm3_rcp85_pr_stn_77[1:50404,2]
newdata$"mri-cgcm3.pr.77.loca"[50405:50770]<-NA
newdata$"mri-cgcm3.pr.77.loca"[50771:54787]<-mri.cgcm3_rcp85_pr_stn_77[50406:54422,2]

mri.cgcm3_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_tasmax_stn_34.txt",
                                            quote="\"", comment.char="",fill=TRUE)
mri.cgcm3_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/mri-cgcm3_rcp85_tasmax_stn_77.txt",
                                            quote="\"", comment.char="",fill=TRUE)

newdata$"mri-cgcm3.tasmax.34.loca"[1:37255]<-mri.cgcm3_rcp85_tasmax_stn_34[1:37255,2]
newdata$"mri-cgcm3.tasmax.34.loca"[37256:37621]<-NA
newdata$"mri-cgcm3.tasmax.34.loca"[37622:54787]<-mri.cgcm3_rcp85_tasmax_stn_34[37257:54422,2]

newdata$"mri-cgcm3.tasmax.77.loca"[1:37255]<-mri.cgcm3_rcp85_tasmax_stn_77[1:37255,2]
newdata$"mri-cgcm3.tasmax.77.loca"[37256:37621]<-NA
newdata$"mri-cgcm3.tasmax.77.loca"[37622:54787]<-mri.cgcm3_rcp85_tasmax_stn_77[37257:54422,2]

noresm1.m_rcp85_tasmax_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/noresm1-m_rcp85_tasmax_stn_34.txt",
                                            quote="\"", comment.char="",fill=TRUE)
noresm1.m_rcp85_tasmax_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/noresm1-m_rcp85_tasmax_stn_77.txt",
                                            quote="\"", comment.char="",fill=TRUE)

newdata$"noresm1-m.tasmax.34.loca"[1:10227]<-noresm1.m_rcp85_tasmax_stn_34[1:10227,2]
newdata$"noresm1-m.tasmax.34.loca"[10228:10592]<-NA
newdata$"noresm1-m.tasmax.34.loca"[10593:20089]<-noresm1.m_rcp85_tasmax_stn_34[10229:19725,2]
newdata$"noresm1-m.tasmax.34.loca"[20090:20454]<-NA
newdata$"noresm1-m.tasmax.34.loca"[20455:54787]<-noresm1.m_rcp85_tasmax_stn_34[19727:54059,2]

newdata$"noresm1-m.tasmax.77.loca"[1:10227]<-noresm1.m_rcp85_tasmax_stn_77[1:10227,2]
newdata$"noresm1-m.tasmax.77.loca"[10228:10592]<-NA
newdata$"noresm1-m.tasmax.77.loca"[10593:20089]<-noresm1.m_rcp85_tasmax_stn_77[10229:19725,2]
newdata$"noresm1-m.tasmax.77.loca"[20090:20454]<-NA
newdata$"noresm1-m.tasmax.77.loca"[20455:54787]<-noresm1.m_rcp85_tasmax_stn_77[19727:54059,2]

noresm1.m_rcp85_tasmin_stn_34 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/noresm1-m_rcp85_tasmin_stn_34.txt",
                                            quote="\"", comment.char="",fill=TRUE)
noresm1.m_rcp85_tasmin_stn_77 <- read.table("~/R/win-library/3.5/Climate Change/BCSD_daily_3/loca_daily_meteorology/noresm1-m_rcp85_tasmin_stn_77.txt",
                                            quote="\"", comment.char="",fill=TRUE)

newdata$"noresm1-m.tasmin.34.loca"[1:51500]<-noresm1.m_rcp85_tasmin_stn_34[1:51500,2]
newdata$"noresm1-m.tasmin.34.loca"[51501:51865]<-NA
newdata$"noresm1-m.tasmin.34.loca"[51866:54787]<-noresm1.m_rcp85_tasmin_stn_34[51502:54423,2]

newdata$"noresm1-m.tasmin.77.loca"[1:51500]<-noresm1.m_rcp85_tasmin_stn_77[1:51500,2]
newdata$"noresm1-m.tasmin.77.loca"[51501:51865]<-NA
newdata$"noresm1-m.tasmin.77.loca"[51866:54787]<-noresm1.m_rcp85_tasmin_stn_77[51502:54423,2]


PR99<-newdata[1:which(grepl("1999-12-31",newdata$date)),1:(4*length(gcms)+1)]
PR54<-newdata[which(grepl("2025-01-01",newdata$date)):which(grepl("2054-12-31",newdata$date)),1:(4*length(gcms)+1)]

TMax99<-newdata[1:which(grepl("1999-12-31",newdata$date)),c(1,(4*length(gcms)+2):(8*length(gcms)+1))]
TMax54<-newdata[which(grepl("2025-01-01",newdata$date)):which(grepl("2054-12-31",newdata$date)),c(1,(4*length(gcms)+2):(8*length(gcms)+1))]

TMin99<-newdata[1:which(grepl("1999-12-31",newdata$date)),c(1,(8*length(gcms)+2):(12*length(gcms)+1))]
TMin54<-newdata[which(grepl("2025-01-01",newdata$date)):which(grepl("2054-12-31",newdata$date)),c(1,(8*length(gcms)+2):(12*length(gcms)+1))]

PR99$date<-months(as.Date(PR99$date))
PR54$date<-months(as.Date(PR54$date))
TMax99$date<-months(as.Date(TMax99$date))
TMax54$date<-months(as.Date(TMax54$date))
TMin99$date<-months(as.Date(TMin99$date))
TMin54$date<-months(as.Date(TMin54$date))

PR99M<-data.frame(NA)
PR54M<-data.frame(NA)
TMax99M<-data.frame(NA)
TMax54M<-data.frame(NA)
TMin99M<-data.frame(NA)
TMin54M<-data.frame(NA)
months1<-c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:(4*length(gcms)))
{
  for (j in 1:length(months1))
  {
    PR99M[j,i]<-mean(PR99[grepl(months1[j],PR99$date),i+1],na.rm = TRUE)
    PR54M[j,i]<-mean(PR54[grepl(months1[j],PR54$date),i+1],na.rm = TRUE)
    TMax99M[j,i]<-mean(TMax99[grepl(months1[j],TMax99$date),i+1],na.rm = TRUE)
    TMax54M[j,i]<-mean(TMax54[grepl(months1[j],TMax54$date),i+1],na.rm = TRUE)
    TMin99M[j,i]<-mean(TMin99[grepl(months1[j],TMin99$date),i+1],na.rm = TRUE)
    TMin54M[j,i]<-mean(TMin54[grepl(months1[j],TMin54$date),i+1],na.rm = TRUE)
  }
}

months<-factor(rep(c("January","February","March","April","May","June","July","August","September","October","November","December"),4*length(gcms)),levels=c("October","November","December","January","February","March","April","May","June","July","August","September"))
Station<-factor(c(rep("stn_34-loca",12*length(gcms)),rep("stn_34-bcsd",12*length(gcms)),rep("stn_77-loca",12*length(gcms)),rep("stn_77-bcsd",12*length(gcms))),levels=c("stn_34-loca","stn_34-bcsd","stn_77-loca","stn_77-bcsd"))

PRAVG<-PR54M-PR99M
TMaxAVG<-TMax54M-TMax99M
TMinAVG<-TMin54M-TMin99M

PR1<-melt(PRAVG)
TMax1<-melt(TMaxAVG)
TMin1<-melt(TMinAVG)

PR1<-PR1[,-1]
TMax1<-TMax1[,-1]
TMin1<-TMin1[,-1]

PR<-data.frame(months,Station,PR1)
TMax<-data.frame(months,Station,TMax1)
TMin<-data.frame(months,Station,TMin1)

PRBAG<-ggplot(aes(y = PR1, x = months, fill = Station), data = PR) + 
  geom_boxplot()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),plot.title = element_text(hjust = 0.5))+
  ylab(label="Precipitation (mm/day)")+ggtitle(label ="Projected Monthly Change")

TMaxBAG<-ggplot(aes(y=TMax1,x=months,fill=Station),data=TMax)+
  geom_boxplot()+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())+
  ylab(label="Max Temperature (°C)")

TMinBAG<-ggplot(aes(y=TMin1,x=months,fill=Station),data=TMin)+
  geom_boxplot()+theme(axis.title.x=element_blank())+ylab(label="Min Temperature (°C)")

BAGPLOTS<-ggarrange(PRBAG,TMaxBAG,TMinBAG,ncol=1,nrow=3)
