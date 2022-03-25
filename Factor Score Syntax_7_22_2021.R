library(dplyr)
library(psych)

dat<- read.csv("~/netshare/M/NAS VETSA MASTER DATAFILES/Other cognitive measures/Cognitive data practice effects/V1V2V3/Practice_Corrected_Cognitive_Data_V1V2V3_2020-06-17.csv",head=T, stringsAsFactors = F)
afqtbx<- read.csv("~/netshare/M/NAS VETSA MASTER DATAFILES/Other cognitive measures/AFQT/DATA/AFQTV1V2V3 11.10.2020.csv")
afqtbx<- afqtbx %>% select(VETSAID, starts_with("AFQTBXPCTTRAN_R"))
dat<- dat %>% left_join(afqtbx, by="VETSAID")
names(dat)
dat<-arrange(dat, VETSAID)
attach(dat)

# J Elman adding in hard-coded corrections per CR's SAS data prep script
dat[dat$VETSAID=="20527A","VRCTOT"] = NA
dat[dat$VETSAID=="20201B","VRCTOT"] = 67

####################################################################
###########     Standarize Variables to Wave 1      ################
####################################################################

## Memory
LMITOT_V1_stndV1 = scale(LMITOT)
LMITOT_V2_stndV1 = (LMITOT_V2p-mean(LMITOT,na.rm=T))/sd(LMITOT,na.rm=T)
LMITOT_V3_stndV1 = (LMITOT_V3p-mean(LMITOT,na.rm=T))/sd(LMITOT,na.rm=T)
LMDTOT_V1_stndV1 = scale(LMDTOT)
LMDTOT_V2_stndV1 = (LMDTOT_V2p-mean(LMDTOT,na.rm=T))/sd(LMDTOT,na.rm=T)
LMDTOT_V3_stndV1 = (LMDTOT_V3p-mean(LMDTOT,na.rm=T))/sd(LMDTOT,na.rm=T)

VRITOT_V1_stndV1 = scale(VRITOT)
VRITOT_V2_stndV1 = (VRITOT_V2p-mean(VRITOT,na.rm=T))/sd(VRITOT,na.rm=T)
VRITOT_V3_stndV1 = (VRITOT_V3p-mean(VRITOT,na.rm=T))/sd(VRITOT,na.rm=T)
VRDTOT_V1_stndV1 = scale(VRDTOT)
VRDTOT_V2_stndV1 = (VRDTOT_V2p-mean(VRDTOT,na.rm=T))/sd(VRDTOT,na.rm=T)
VRDTOT_V3_stndV1 = (VRDTOT_V3p-mean(VRDTOT,na.rm=T))/sd(VRDTOT,na.rm=T)
VRCTOT_V1_stndV1 = scale(VRCTOT)
VRCTOT_V2_stndV1 = (VRCTOT_V2p-mean(VRCTOT,na.rm=T))/sd(VRCTOT,na.rm=T)
VRCTOT_V3_stndV1 = (VRCTOT_V3p-mean(VRCTOT,na.rm=T))/sd(VRCTOT,na.rm=T)

CVA1RAW_V1_stndV1 = scale(CVA1RAW)
CVA1RAW_V2_stndV1 = (CVA1RAW_V2p-mean(CVA1RAW,na.rm=T))/sd(CVA1RAW,na.rm=T)
CVA1RAW_V3_stndV1 = (CVA1RAW_V3p-mean(CVA1RAW,na.rm=T))/sd(CVA1RAW,na.rm=T)
CVATOT_V1_stndV1 = scale(CVATOT)
CVATOT_V2_stndV1 = (CVATOT_V2p-mean(CVATOT,na.rm=T))/sd(CVATOT,na.rm=T)
CVATOT_V3_stndV1 = (CVATOT_V3p-mean(CVATOT,na.rm=T))/sd(CVATOT,na.rm=T)
CVSDFR_V1_stndV1 = scale(CVSDFR)
CVSDFR_V2_stndV1 = (CVSDFR_V2p-mean(CVSDFR,na.rm=T))/sd(CVSDFR,na.rm=T)
CVSDFR_V3_stndV1 = (CVSDFR_V3p-mean(CVSDFR,na.rm=T))/sd(CVSDFR,na.rm=T)
CVLDFR_V1_stndV1 = scale(CVLDFR)
CVLDFR_V2_stndV1 = (CVLDFR_V2p-mean(CVLDFR,na.rm=T))/sd(CVLDFR,na.rm=T)
CVLDFR_V3_stndV1 = (CVLDFR_V3p-mean(CVLDFR,na.rm=T))/sd(CVLDFR,na.rm=T)


## EF and Speed
StroopCW_V1_stndV1 = scale(STRCWRAW)
StroopCW_V2_stndV1=(STRCWRAW_V2p-mean(STRCWRAW,na.rm=T))/sd(STRCWRAW,na.rm=T)
StroopCW_V3_stndV1=(STRCWRAW_V3p-mean(STRCWRAW,na.rm=T))/sd(STRCWRAW,na.rm=T)
StroopC_V1_stndV1 = scale(STRCRAW)
StroopC_V2_stndV1=(STRCRAW_V2p-mean(STRCRAW,na.rm=T))/sd(STRCRAW,na.rm=T)
StroopC_V3_stndV1=(STRCRAW_V3p-mean(STRCRAW,na.rm=T))/sd(STRCRAW,na.rm=T)
StroopW_V1_stndV1 = scale(STRWRAW)
StroopW_V2_stndV1=(STRWRAW_V2p-mean(STRWRAW,na.rm=T))/sd(STRWRAW,na.rm=T)
StroopW_V3_stndV1=(STRWRAW_V3p-mean(STRWRAW,na.rm=T))/sd(STRWRAW,na.rm=T)

LNseq_V1_stndV1=scale(LNTOT)
LNseq_V2_stndV1=(LNTOT_V2p-mean(LNTOT,na.rm=T))/sd(LNTOT,na.rm=T)
LNseq_V3_stndV1=(LNTOT_V3p-mean(LNTOT,na.rm=T))/sd(LNTOT,na.rm=T)
RSasc_V1_stndV1=scale(RSATOT)
RSasc_V2_stndV1=(RSATOT_V2p-mean(RSATOT,na.rm=T))/sd(RSATOT,na.rm=T)
RSasc_V3_stndV1=(RSATOT_V3p-mean(RSATOT,na.rm=T))/sd(RSATOT,na.rm=T)
DStot_V1_stndV1=scale(DSTOT)
DStot_V2_stndV1=(DSTOT_V2p-mean(DSTOT,na.rm=T))/sd(DSTOT,na.rm=T)
DStot_V3_stndV1=(DSTOT_V3p-mean(DSTOT,na.rm=T))/sd(DSTOT,na.rm=T)
SStot_V1_stndV1 = scale(SSPTOTP)
SStot_V2_stndV1 = (SSPTOTP_V2p-mean(SSPTOTP,na.rm=T))/sd(SSPTOTP,na.rm=T)
SStot_V3_stndV1 = (SSPTOTP_V3p-mean(SSPTOTP,na.rm=T))/sd(SSPTOTP,na.rm=T)


TRL2rt <- exp(TRL2TLOG)
TRL3rt <- exp(TRL3TLOG)
TRL4rt <- exp(TRL4TLOG)
TRL2rt_V2p <- exp(TRL2TLOG_V2p)
TRL3rt_V2p <- exp(TRL3TLOG_V2p)
TRL4rt_V2p <- exp(TRL4TLOG_V2p)
TRL2rt_V3p <- exp(TRL2TLOG_V3p)
TRL3rt_V3p <- exp(TRL3TLOG_V3p)
TRL4rt_V3p <- exp(TRL4TLOG_V3p)
Trail4_V1_stndV1=scale(TRL4rt)
Trail4_V2_stndV1=(TRL4rt_V2p-mean(TRL4rt,na.rm=T))/sd(TRL4rt,na.rm=T)
Trail4_V3_stndV1=(TRL4rt_V3p-mean(TRL4rt,na.rm=T))/sd(TRL4rt,na.rm=T)
Trail3_V1_stndV1=scale(TRL3rt)
Trail3_V2_stndV1=(TRL3rt_V2p-mean(TRL3rt,na.rm=T))/sd(TRL3rt,na.rm=T)
Trail3_V3_stndV1=(TRL3rt_V3p-mean(TRL3rt,na.rm=T))/sd(TRL3rt,na.rm=T)
Trail2_V1_stndV1=scale(TRL2rt)
Trail2_V2_stndV1=(TRL2rt_V2p-mean(TRL2rt,na.rm=T))/sd(TRL2rt,na.rm=T)
Trail2_V3_stndV1=(TRL2rt_V3p-mean(TRL2rt,na.rm=T))/sd(TRL2rt,na.rm=T)

AXHITRATE_V1_stndV1 = scale(AXHITRATE) 
AXHITRATE_V2_stndV1 = (AXHITRATE_V2p-mean(AXHITRATE,na.rm=T))/sd(AXHITRATE,na.rm=T)
BXFARATE_V2_stndV1=scale(BXFARATE)
BXFARATE_V2_stndV1 = (BXFARATE_V2p-mean(BXFARATE,na.rm=T))/sd(BXFARATE,na.rm=T)

SRTGMEANLOG_V1_stndV1 = scale(SRTGMEANLOG)
SRTGMEANLOG_V2_stndV1 = (SRTGMEANLOG_V2p-mean(SRTGMEANLOG,na.rm=T))/sd(SRTGMEANLOG,na.rm=T)
SRTGMEANLOG_V3_stndV1 = (SRTGMEANLOG_V3p-mean(SRTGMEANLOG,na.rm=T))/sd(SRTGMEANLOG,na.rm=T)
CHRTGMEANLOG_V1_stndV1 = scale(CHRTGMEANLOG)
CHRTGMEANLOG_V2_stndV1 = (CHRTGMEANLOG_V2p-mean(CHRTGMEANLOG,na.rm=T))/sd(CHRTGMEANLOG,na.rm=T)
CHRTGMEANLOG_V3_stndV1 = (CHRTGMEANLOG_V3p-mean(CHRTGMEANLOG,na.rm=T))/sd(CHRTGMEANLOG,na.rm=T)


## Fluency
LFFCOR_V1_stndV1 = scale(LFFCOR)
LFFCOR_V2_stndV1 = (LFFCOR_V2p-mean(LFFCOR,na.rm=T))/sd(LFFCOR,na.rm=T)
LFFCOR_V3_stndV1 = (LFFCOR_V3p-mean(LFFCOR,na.rm=T))/sd(LFFCOR,na.rm=T)
LFACOR_V1_stndV1 = scale(LFACOR)
LFACOR_V2_stndV1 = (LFACOR_V2p-mean(LFACOR,na.rm=T))/sd(LFACOR,na.rm=T)
LFACOR_V3_stndV1 = (LFACOR_V3p-mean(LFACOR,na.rm=T))/sd(LFACOR,na.rm=T)
LFSCOR_V1_stndV1 = scale(LFSCOR)
LFSCOR_V2_stndV1 = (LFSCOR_V2p-mean(LFSCOR,na.rm=T))/sd(LFSCOR,na.rm=T)
LFSCOR_V3_stndV1 = (LFSCOR_V3p-mean(LFSCOR,na.rm=T))/sd(LFSCOR,na.rm=T)
LFCOR_V1_stndV1 = scale(LFCOR)
LFCOR_V2_stndV1 = (LFCOR_V2p-mean(LFCOR,na.rm=T))/sd(LFCOR,na.rm=T)
LFCOR_V3_stndV1 = (LFCOR_V3p-mean(LFCOR,na.rm=T))/sd(LFCOR,na.rm=T)

CFANCOR_V1_stndV1 = scale(CFANCOR)
CFANCOR_V2_stndV1 = (CFANCOR_V2p-mean(CFANCOR,na.rm=T))/sd(CFANCOR,na.rm=T)
CFANCOR_V3_stndV1 = (CFANCOR_V3p-mean(CFANCOR,na.rm=T))/sd(CFANCOR,na.rm=T)
CFBNCOR_V1_stndV1 = scale(CFBNCOR)
CFBNCOR_V2_stndV1 = (CFBNCOR_V2p-mean(CFBNCOR,na.rm=T))/sd(CFBNCOR,na.rm=T)
CFBNCOR_V3_stndV1 = (CFBNCOR_V3p-mean(CFBNCOR,na.rm=T))/sd(CFBNCOR,na.rm=T)
CSCOR_V1_stndV1 = scale(CSCOR)
CSCOR_V2_stndV1 = (CSCOR_V2p-mean(CSCOR,na.rm=T))/sd(CSCOR,na.rm=T)
CSCOR_V3_stndV1 = (CSCOR_V3p-mean(CSCOR,na.rm=T))/sd(CSCOR,na.rm=T)
CatFluency_V1_stndV1=scale(CFCOR)
CatFluency_V2_stndV1=(CFCOR_V2p-mean(CFCOR,na.rm=T))/sd(CFCOR,na.rm=T)
CatFluency_V3_stndV1=(CFCOR_V3p-mean(CFCOR,na.rm=T))/sd(CFCOR,na.rm=T)

CatSwAcc_V1_stndV1=scale(CSSACC)
CatSwAcc_V2_stndV1=(CSSACC_V2p-mean(CSSACC,na.rm=T))/sd(CSSACC,na.rm=T)
CatSwAcc_V3_stndV1=(CSSACC_V3p-mean(CSSACC,na.rm=T))/sd(CSSACC,na.rm=T)

#Visuospatial Other
HFTOTCOR_V1_stndV1 = scale(HFTOTCOR)
HFTOTCOR_V2_stndV1 = (HFTOTCOR_V2p-mean(HFTOTCOR,na.rm=T))/sd(HFTOTCOR,na.rm=T)
HFTOTCOR_V3_stndV1 = (HFTOTCOR_V3p-mean(HFTOTCOR,na.rm=T))/sd(HFTOTCOR,na.rm=T)
MR1COR_V1_stndV1 = scale(MR1COR)
MR1COR_V2_stndV1 = (MR1COR_V2p-mean(MR1COR,na.rm=T))/sd(MR1COR,na.rm=T)
MR1COR_V3_stndV1 = (MR1COR_V3p-mean(MR1COR,na.rm=T))/sd(MR1COR,na.rm=T)
MTXRAW_V1_stndV1 = scale(MTXRAW)
MTXRAW_V2_stndV1 = (MTXRAW_V2p-mean(MTXRAW,na.rm=T))/sd(MTXRAW,na.rm=T)
MTXRAW_V3_stndV1 = (MTXRAW_V3p-mean(MTXRAW,na.rm=T))/sd(MTXRAW,na.rm=T)


## VisSpat (including AFQT Box)
MR1COR_V1_stndV1 = scale(MR1COR)
MR1COR_V2_stndV1 = (MR1COR_V2p-mean(MR1COR,na.rm=T))/sd(MR1COR,na.rm=T)
MR1COR_V3_stndV1 = (MR1COR_V3p-mean(MR1COR,na.rm=T))/sd(MR1COR,na.rm=T)
AFQTBXPCTTRAN_R_V1_stndV1 = scale(AFQTBXPCTTRAN_R_V1)
AFQTBXPCTTRAN_R_V2_stndV1 = (AFQTBXPCTTRAN_R_V2p-mean(AFQTBXPCTTRAN_R_V1,na.rm=T))/sd(AFQTBXPCTTRAN_R_V1,na.rm=T)
AFQTBXPCTTRAN_R_V3_stndV1 = (AFQTBXPCTTRAN_R_V3p-mean(AFQTBXPCTTRAN_R_V1,na.rm=T))/sd(AFQTBXPCTTRAN_R_V1,na.rm=T)
HFTOTCOR_V1_stndV1 = scale(HFTOTCOR)
HFTOTCOR_V2_stndV1 = (HFTOTCOR_V2p-mean(HFTOTCOR,na.rm=T))/sd(HFTOTCOR,na.rm=T)
HFTOTCOR_V3_stndV1 = (HFTOTCOR_V3p-mean(HFTOTCOR,na.rm=T))/sd(HFTOTCOR,na.rm=T)

## VisMem
sVRCTOT = sqrt(VRCTOT)
sVRCTOT_V2p = sqrt(VRCTOT_V2p)
sVRCTOT_V3p = sqrt(VRCTOT_V3p)
sVRCTOT_V1_stndV1 = scale(sVRCTOT)
sVRCTOT_V2_stndV1 = (sVRCTOT_V2p-mean(sVRCTOT,na.rm=T))/sd(sVRCTOT,na.rm=T)
sVRCTOT_V3_stndV1 = (sVRCTOT_V3p-mean(sVRCTOT,na.rm=T))/sd(sVRCTOT,na.rm=T)
VRITOT_V1_stndV1 = scale(VRITOT)
VRITOT_V2_stndV1 = (VRITOT_V2p-mean(VRITOT,na.rm=T))/sd(VRITOT,na.rm=T)
VRITOT_V3_stndV1 = (VRITOT_V3p-mean(VRITOT,na.rm=T))/sd(VRITOT,na.rm=T)
VRDTOT_V1_stndV1 = scale(VRDTOT)
VRDTOT_V2_stndV1 = (VRDTOT_V2p-mean(VRDTOT,na.rm=T))/sd(VRDTOT,na.rm=T)
VRDTOT_V3_stndV1 = (VRDTOT_V3p-mean(VRDTOT,na.rm=T))/sd(VRDTOT,na.rm=T)

############################################
### Create interference scores for EF    ###
############################################
#
library(lme4)

Stroop_V1_lm <- lmer(STRCWRAW~STRCRAW+STRWRAW + (1|CASE), na.action=na.exclude) # Regress EF condition on baseline conditions (controlling for case)
Stroop_V1 <- resid(Stroop_V1_lm)+mean(STRCWRAW, na.rm=T)                        # save residuals into new variable after adding mean back in
Stroop_V1z <- scale(Stroop_V1)

Stroop_V2_lm <- lmer(STRCWRAW_V2p~STRCRAW_V2p+STRWRAW_V2p + (1|CASE), na.action=na.exclude)
Stroop_V2 <- (resid(Stroop_V2_lm)-mean(STRCWRAW, na.rm=T)+mean(STRCWRAW_V2p, na.rm=T))/sd(Stroop_V1, na.rm=T)
Stroop_V3_lm <- lmer(STRCWRAW_V3p~STRCRAW_V3p+STRWRAW_V3p + (1|CASE), na.action=na.exclude)
Stroop_V3 <- (resid(Stroop_V3_lm)-mean(STRCWRAW, na.rm=T)+mean(STRCWRAW_V3p, na.rm=T))/sd(Stroop_V1, na.rm=T)


Trail_V1_lm <- lmer(TRL4rt~TRL3rt+TRL2rt + (1|CASE), na.action=na.exclude)
Trail_V1 <- resid(Trail_V1_lm)+mean(TRL4rt, na.rm=T)
Trail_V1z <- scale(Trail_V1)

Trail_V2_lm <- lmer(TRL4rt_V2p~TRL3rt_V2p+TRL2rt_V2p + (1|CASE), na.action=na.exclude)
Trail_V2 <- (resid(Trail_V2_lm)-mean(TRL4rt, na.rm=T)+mean(TRL4rt_V2p, na.rm=T))/sd(TRL4rt, na.rm=T)
Trail_V3_lm <- lmer(TRL4rt_V3p~TRL3rt_V3p+TRL2rt_V3p + (1|CASE), na.action=na.exclude)
Trail_V3 <- (resid(Trail_V3_lm)-mean(TRL4rt, na.rm=T)+mean(TRL4rt_V3p, na.rm=T))/sd(TRL4rt, na.rm=T)


CatSw_V1_lm <- lmer(CSSACC~CFANCOR+CFBNCOR + (1|CASE), na.action=na.exclude)
CatSw_V1 <- resid(CatSw_V1_lm)+mean(TRL4rt, na.rm=T)
CatSw_V1z <- scale(CatSw_V1)

CatSw_V2_lm <- lmer(CSSACC_V2p~CFANCOR_V2p+CFBNCOR_V2p + (1|CASE), na.action=na.exclude)
CatSw_V2 <- (resid(CatSw_V2_lm)-mean(CSSACC, na.rm=T)+mean(CSSACC_V2p, na.rm=T))/sd(CSSACC, na.rm=T)
CatSw_V3_lm <- lmer(CSSACC_V3p~CFANCOR_V3p+CFBNCOR_V3p + (1|CASE), na.action=na.exclude)
CatSw_V3 <- (resid(CatSw_V3_lm)-mean(CSSACC, na.rm=T)+mean(CSSACC_V3p, na.rm=T))/sd(CSSACC, na.rm=T)

##### AXCPT Dprime - Not in VETSA 3
#asinTransform <- function(p) { asin(sqrt(p)) }

#AXdprime_V1_step1 = AXHITRATE-BXFARATE
#AXdprime_V1_step2 = asinTransform(AXdprime_V1_step1)
#AXdprime_V1_step2[AXdprime_V1_step2<0] <- 0
#AXdprime_V1 = scale(AXdprime_V1_step2)

#AXdprime_V2_step1 = AXHITRATE_V2p-BXFARATE_V2p
#AXdprime_V2_step2 = asinTransform(AXdprime_V2_step1)
#AXdprime_V2_step2[AXdprime_V2_step2<0] <- 0
#AXdprime_V2 = (AXdprime_V2_step2-mean(AXdprime_V1_step2,na.rm=T))/sd(AXdprime_V1_step2, na.rm=T)

################################################
########     IMPUTE MISSING DATA       #########
####    prep domains and exclude missing    ####
################################################

#Create Datasets for imputation (dataset for each domain and wave, removing sjs missing too many tests, create dataset with and without ID var for MICE)
EF1x <- data.frame(VETSAID, Stroop_V1z, Trail_V1z, CatSw_V1z, LNseq_V1_stndV1, RSasc_V1_stndV1, DStot_V1_stndV1)
EF2x <- data.frame(VETSAID, Stroop_V2,  Trail_V2,  CatSw_V2,  LNseq_V2_stndV1, RSasc_V2_stndV1, DStot_V2_stndV1)
EF3x <- data.frame(VETSAID, Stroop_V3,  Trail_V3,  CatSw_V3,  LNseq_V3_stndV1, RSasc_V3_stndV1, DStot_V3_stndV1)
EF1y <- EF1x[rowSums(is.na(EF1x))<4,] # up to 3 tests can be missing
EF2y <- EF2x[rowSums(is.na(EF2x))<4,]
EF3y <- EF3x[rowSums(is.na(EF3x))<4,]
EF1 <- EF1y[,2:7]
EF2 <- EF2y[,2:7]
EF3 <- EF3y[,2:7]

FLU1x <- data.frame(VETSAID, LFFCOR_V1_stndV1, LFACOR_V1_stndV1, LFSCOR_V1_stndV1, CFANCOR_V1_stndV1, CFBNCOR_V1_stndV1, CSCOR_V1_stndV1)
FLU2x <- data.frame(VETSAID, LFFCOR_V2_stndV1, LFACOR_V2_stndV1, LFSCOR_V2_stndV1, CFANCOR_V2_stndV1, CFBNCOR_V2_stndV1, CSCOR_V2_stndV1)
FLU3x <- data.frame(VETSAID, LFFCOR_V3_stndV1, LFACOR_V3_stndV1, LFSCOR_V3_stndV1, CFANCOR_V3_stndV1, CFBNCOR_V3_stndV1, CSCOR_V3_stndV1)
FLU1y <- FLU1x[rowSums(is.na(FLU1x))<4,] # up to 3 tests can be missing
FLU2y <- FLU2x[rowSums(is.na(FLU2x))<4,]
FLU3y <- FLU3x[rowSums(is.na(FLU3x))<4,]
FLU1 <- FLU1y[,2:7]
FLU2 <- FLU2y[,2:7]
FLU3 <- FLU3y[,2:7]

MEM1x <- data.frame(VETSAID, LMITOT_V1_stndV1, LMDTOT_V1_stndV1, VRITOT_V1_stndV1, VRDTOT_V1_stndV1, CVATOT_V1_stndV1, CVSDFR_V1_stndV1, CVLDFR_V1_stndV1)
MEM2x <- data.frame(VETSAID, LMITOT_V2_stndV1, LMDTOT_V2_stndV1, VRITOT_V2_stndV1, VRDTOT_V2_stndV1, CVATOT_V2_stndV1, CVSDFR_V2_stndV1, CVLDFR_V2_stndV1)
MEM3x <- data.frame(VETSAID, LMITOT_V3_stndV1, LMDTOT_V3_stndV1, VRITOT_V3_stndV1, VRDTOT_V3_stndV1, CVATOT_V3_stndV1, CVSDFR_V3_stndV1, CVLDFR_V3_stndV1)
MEM1y <- MEM1x[rowSums(is.na(MEM1x))<4,] # up to 3 tests can be missing
MEM2y <- MEM2x[rowSums(is.na(MEM2x))<4,]
MEM3y <- MEM3x[rowSums(is.na(MEM3x))<4,]
MEM1 <- MEM1y[,2:8]
MEM2 <- MEM2y[,2:8]
MEM3 <- MEM3y[,2:8]

SPD1x <- data.frame(VETSAID, Trail2_V1_stndV1, Trail3_V1_stndV1, StroopW_V1_stndV1, StroopC_V1_stndV1, SRTGMEANLOG_V1_stndV1, CHRTGMEANLOG_V1_stndV1) 
SPD2x <- data.frame(VETSAID, Trail2_V2_stndV1, Trail3_V2_stndV1, StroopW_V2_stndV1, StroopC_V2_stndV1, SRTGMEANLOG_V2_stndV1, CHRTGMEANLOG_V2_stndV1) 
SPD3x <- data.frame(VETSAID, Trail2_V3_stndV1, Trail3_V3_stndV1, StroopW_V3_stndV1, StroopC_V3_stndV1, SRTGMEANLOG_V3_stndV1, CHRTGMEANLOG_V3_stndV1) 
SPD1y <- SPD1x[rowSums(is.na(SPD1x))<4,] # up to 3 tests can be missing
SPD2y <- SPD2x[rowSums(is.na(SPD2x))<4,]
SPD3y <- SPD3x[rowSums(is.na(SPD3x))<4,]
SPD1 <-  SPD1y[,2:7]
SPD2 <-  SPD2y[,2:7]
SPD3 <-  SPD3y[,2:7]


WM1x <- data.frame(VETSAID, LNseq_V1_stndV1, RSasc_V1_stndV1, DStot_V1_stndV1)
WM2x <- data.frame(VETSAID, LNseq_V2_stndV1, RSasc_V2_stndV1, DStot_V2_stndV1)
WM3x <- data.frame(VETSAID, LNseq_V3_stndV1, RSasc_V3_stndV1, DStot_V3_stndV1)
WM1y <- WM1x[rowSums(is.na(WM1x))<2,] # up to 1 test can be missing
WM2y <- WM2x[rowSums(is.na(WM2x))<2,]
WM3y <- WM3x[rowSums(is.na(WM3x))<2,]
WM1 <-  WM1y[,2:4]
WM2 <-  WM2y[,2:4]
WM3 <-  WM3y[,2:4]


SF1x <- data.frame(VETSAID, CFANCOR_V1_stndV1, CFBNCOR_V1_stndV1, CSCOR_V1_stndV1)
SF2x <- data.frame(VETSAID, CFANCOR_V2_stndV1, CFBNCOR_V2_stndV1, CSCOR_V2_stndV1)
SF3x <- data.frame(VETSAID, CFANCOR_V3_stndV1, CFBNCOR_V3_stndV1, CSCOR_V3_stndV1)
SF1y <- SF1x[rowSums(is.na(SF1x))<2,] # up to 1 test can be missing
SF2y <- SF2x[rowSums(is.na(SF2x))<2,]
SF3y <- SF3x[rowSums(is.na(SF3x))<2,]
SF1 <-  SF1y[,2:4]
SF2 <-  SF2y[,2:4]
SF3 <-  SF3y[,2:4]


SPA1x <- data.frame(VETSAID, MR1COR_V1_stndV1, AFQTBXPCTTRAN_R_V1_stndV1, HFTOTCOR_V1_stndV1)
SPA2x <- data.frame(VETSAID, MR1COR_V2_stndV1, AFQTBXPCTTRAN_R_V2_stndV1, HFTOTCOR_V2_stndV1)
SPA3x <- data.frame(VETSAID, MR1COR_V3_stndV1, AFQTBXPCTTRAN_R_V3_stndV1, HFTOTCOR_V3_stndV1)
SPA1y <- SPA1x[rowSums(is.na(SPA1x))<2,] # up to 1 tests can be missing
SPA2y <- SPA2x[rowSums(is.na(SPA2x))<2,]
SPA3y <- SPA3x[rowSums(is.na(SPA3x))<2,]
SPA1 <- SPA1y[,2:4]
SPA2 <- SPA2y[,2:4]
SPA3 <- SPA3y[,2:4]

VMEM1x <- data.frame(VETSAID, sVRCTOT_V1_stndV1, VRITOT_V1_stndV1, VRDTOT_V1_stndV1)
VMEM2x <- data.frame(VETSAID, sVRCTOT_V2_stndV1, VRITOT_V2_stndV1, VRDTOT_V2_stndV1)
VMEM3x <- data.frame(VETSAID, sVRCTOT_V3_stndV1, VRITOT_V3_stndV1, VRDTOT_V3_stndV1)
VMEM1y <- VMEM1x[rowSums(is.na(VMEM1x))<2,] # up to 1 tests can be missing
VMEM2y <- VMEM2x[rowSums(is.na(VMEM2x))<2,]
VMEM3y <- VMEM3x[rowSums(is.na(VMEM3x))<2,]
VMEM1 <- VMEM1y[,2:4]
VMEM2 <- VMEM2y[,2:4]
VMEM3 <- VMEM3y[,2:4]


###################################
#### Actually run imputation ######
###################################
library(mice)

FLU1_imp <- mice(FLU1,m=5) # imputing the variables, 5 times
FLU2_imp <- mice(FLU2,m=5) 
FLU3_imp <- mice(FLU3,m=5) 
EF1_imp <-  mice(EF1,m=5) 
EF2_imp <-  mice(EF2,m=5) 
EF3_imp <-  mice(EF3,m=5) 
MEM1_imp <- mice(MEM1,m=5) 
MEM2_imp <- mice(MEM2,m=5) 
MEM3_imp <- mice(MEM3,m=5) 
SPD1_imp <- mice(SPD1,m=5) 
SPD2_imp <- mice(SPD2,m=5) 
SPD3_imp <- mice(SPD3,m=5) 
WM1_imp <- mice(WM1,m=5) 
WM2_imp <- mice(WM2,m=5) 
WM3_imp <- mice(WM3,m=5) 
SF1_imp <- mice(SF1,m=5) 
SF2_imp <- mice(SF2,m=5) 
SF3_imp <- mice(SF3,m=5) 
SPA1_imp <- mice(SPA1,m=5) # imputing the variables, 5 times
SPA2_imp <- mice(SPA2,m=5) 
SPA3_imp <- mice(SPA3,m=5) 
VMEM1_imp <- mice(VMEM1,m=5) 
VMEM2_imp <- mice(VMEM2,m=5) 
VMEM3_imp <- mice(VMEM3,m=5) 


#data2 <- complete(imp,"long") #creating complete data set from imputed variables, stacked by imputation
FLU1_data2 <- complete(FLU1_imp,"long") #creating complete data set from imputed variables, stacked by imputation
FLU2_data2 <- complete(FLU2_imp,"long") 
FLU3_data2 <- complete(FLU3_imp,"long") 
EF1_data2 <- complete(EF1_imp,"long") 
EF2_data2 <- complete(EF2_imp,"long") 
EF3_data2 <- complete(EF3_imp,"long") 
MEM1_data2 <- complete(MEM1_imp,"long") 
MEM2_data2 <- complete(MEM2_imp,"long") 
MEM3_data2 <- complete(MEM3_imp,"long") 
SPD1_data2 <- complete(SPD1_imp,"long") 
SPD2_data2 <- complete(SPD2_imp,"long") 
SPD3_data2 <- complete(SPD3_imp,"long") 
WM1_data2 <- complete(WM1_imp,"long") 
WM2_data2 <- complete(WM2_imp,"long") 
WM3_data2 <- complete(WM3_imp,"long") 
SF1_data2 <- complete(SF1_imp,"long") 
SF2_data2 <- complete(SF2_imp,"long") 
SF3_data2 <- complete(SF3_imp,"long") 
SPA1_data2 <- complete(SPA1_imp,"long") #creating complete data set from imputed variables, stacked by imputation
SPA2_data2 <- complete(SPA2_imp,"long") 
SPA3_data2 <- complete(SPA3_imp,"long") 
VMEM1_data2 <- complete(VMEM1_imp,"long") 
VMEM2_data2 <- complete(VMEM2_imp,"long") 
VMEM3_data2 <- complete(VMEM3_imp,"long") 

dataimp <- FLU1                                                                       # temporary dataset with imputed data
for(i in 1:dim(FLU1y)[1]){dataimp[i,] <- colMeans(FLU1_data2[FLU1_data2$.id==i,3:8])} # average values across 5 imputations
FLU1_Imputed <- cbind(FLU1y[,1],dataimp)                                              # combine with original list of IDs
names(FLU1_Imputed)[1] <- "VETSAID"                                                   # rename first column
# Checking Summaries post imputation, there should be no missing data
#summary(FLU1_Imputed)
#names(FLU1_Imputed)
#write.csv(V3_Imp, "V3_Imp.csv")

dataimp <- FLU2
for(i in 1:dim(FLU2y)[1]){dataimp[i,] <- colMeans(FLU2_data2[FLU2_data2$.id==i,3:8])} # averaging values across 5 imputations
FLU2_Imputed <- cbind(FLU2y[,1],dataimp)
names(FLU2_Imputed)[1] <- "VETSAID"
dataimp <- FLU3

for(i in 1:dim(FLU3y)[1]){dataimp[i,] <- colMeans(FLU3_data2[FLU3_data2$.id==i,3:8])} # averaging values across 5 imputations
FLU3_Imputed <- cbind(FLU3y[,1],dataimp)
names(FLU3_Imputed)[1] <- "VETSAID"

dataimp <- EF1
for(i in 1:dim(EF1y)[1]){dataimp[i,] <- colMeans(EF1_data2[EF1_data2$.id==i,3:8])} # averaging values across 5 imputations
EF1_Imputed <- cbind(EF1y[,1],dataimp)
names(EF1_Imputed)[1] <- "VETSAID"

dataimp <- EF2
for(i in 1:dim(EF2y)[1]){dataimp[i,] <- colMeans(EF2_data2[EF2_data2$.id==i,3:8])} # averaging values across 5 imputations
EF2_Imputed <- cbind(EF2y[,1],dataimp)
names(EF2_Imputed)[1] <- "VETSAID"

dataimp <- EF3
for(i in 1:dim(EF3y)[1]){dataimp[i,] <- colMeans(EF3_data2[EF3_data2$.id==i,3:8])} # averaging values across 5 imputations
EF3_Imputed <- cbind(EF3y[,1],dataimp)
names(EF3_Imputed)[1] <- "VETSAID"


dataimp <- MEM1
for(i in 1:dim(MEM1y)[1]){dataimp[i,] <- colMeans(MEM1_data2[MEM1_data2$.id==i,3:9])} # averaging values across 5 imputations
MEM1_Imputed <- cbind(MEM1y[,1],dataimp)
names(MEM1_Imputed)[1] <- "VETSAID"

dataimp <- MEM2
for(i in 1:dim(MEM2y)[1]){dataimp[i,] <- colMeans(MEM2_data2[MEM2_data2$.id==i,3:9])} # averaging values across 5 imputations
MEM2_Imputed <- cbind(MEM2y[,1],dataimp)
names(MEM2_Imputed)[1] <- "VETSAID"

dataimp <- MEM3
for(i in 1:dim(MEM3y)[1]){dataimp[i,] <- colMeans(MEM3_data2[MEM3_data2$.id==i,3:9])} # averaging values across 5 imputations
MEM3_Imputed <- cbind(MEM3y[,1],dataimp)
names(MEM3_Imputed)[1] <- "VETSAID"


dataimp <- SPD1
for(i in 1:dim(SPD1y)[1]){dataimp[i,] <- colMeans(SPD1_data2[SPD1_data2$.id==i,3:8])} # averaging values across 5 imputations
SPD1_Imputed <- cbind(SPD1y[,1],dataimp)
names(SPD1_Imputed)[1] <- "VETSAID"

dataimp <- SPD2
for(i in 1:dim(SPD2y)[1]){dataimp[i,] <- colMeans(SPD2_data2[SPD2_data2$.id==i,3:8])} # averaging values across 5 imputations
SPD2_Imputed <- cbind(SPD2y[,1],dataimp)
names(SPD2_Imputed)[1] <- "VETSAID"

dataimp <- SPD3
for(i in 1:dim(SPD3y)[1]){dataimp[i,] <- colMeans(SPD3_data2[SPD3_data2$.id==i,3:8])} # averaging values across 5 imputations
SPD3_Imputed <- cbind(SPD3y[,1],dataimp)
names(SPD3_Imputed)[1] <- "VETSAID"


dataimp <- WM1
for(i in 1:dim(WM1y)[1]){dataimp[i,] <- colMeans(WM1_data2[WM1_data2$.id==i,3:5])} # averaging values across 5 imputations
WM1_Imputed <- cbind(WM1y[,1],dataimp)
names(WM1_Imputed) <- c("VETSAID","LN1_wm","RS1_wm","DS1_wm") ## rename variables so they don't conflict with EF domain

dataimp <- WM2
for(i in 1:dim(WM2y)[1]){dataimp[i,] <- colMeans(WM2_data2[WM2_data2$.id==i,3:5])} # averaging values across 5 imputations
WM2_Imputed <- cbind(WM2y[,1],dataimp)
names(WM2_Imputed) <- c("VETSAID","LN2_wm","RS2_wm","DS2_wm") ## rename variables so they don't conflict with EF domain

dataimp <- WM3
for(i in 1:dim(WM3y)[1]){dataimp[i,] <- colMeans(WM3_data2[WM3_data2$.id==i,3:5])} # averaging values across 5 imputations
WM3_Imputed <- cbind(WM3y[,1],dataimp)
names(WM3_Imputed) <- c("VETSAID","LN3_wm","RS3_wm","DS3_wm") ## rename variables so they don't conflict with EF domain

dataimp <- SF1
for(i in 1:dim(SF1y)[1]){dataimp[i,] <- colMeans(SF1_data2[SF1_data2$.id==i,3:5])} # averaging values across 5 imputations
SF1_Imputed <- cbind(SF1y[,1],dataimp)
names(SF1)
names(SF1_Imputed) <- c("VETSAID","AN1_sf","BN1_sf","CS1_sf") ## rename variables so they don't conflict with fluency domain

dataimp <- SF2
for(i in 1:dim(SF2y)[1]){dataimp[i,] <- colMeans(SF2_data2[SF2_data2$.id==i,3:5])} # averaging values across 5 imputations
SF2_Imputed <- cbind(SF2y[,1],dataimp)
names(SF2_Imputed) <- c("VETSAID","AN2_sf","BN2_sf","CS2_sf") ## rename variables so they don't conflict with fluency domain

dataimp <- SF3
for(i in 1:dim(SF3y)[1]){dataimp[i,] <- colMeans(SF3_data2[SF3_data2$.id==i,3:5])} # averaging values across 5 imputations
SF3_Imputed <- cbind(SF3y[,1],dataimp)
names(SF3_Imputed) <- c("VETSAID","AN3_sf","BN3_sf","CS3_sf")

dataimp <- SPA1
for(i in 1:dim(SPA1y)[1]){dataimp[i,] <- colMeans(SPA1_data2[SPA1_data2$.id==i,3:5])} # averaging values across 5 imputations
SPA1_Imputed <- cbind(SPA1y[,1],dataimp)
names(SPA1_Imputed)[1] <- "VETSAID"

dataimp <- SPA2
for(i in 1:dim(SPA2y)[1]){dataimp[i,] <- colMeans(SPA2_data2[SPA2_data2$.id==i,3:5])} # averaging values across 5 imputations
SPA2_Imputed <- cbind(SPA2y[,1],dataimp)
names(SPA2_Imputed)[1] <- "VETSAID"

dataimp <- SPA3
for(i in 1:dim(SPA3y)[1]){dataimp[i,] <- colMeans(SPA3_data2[SPA3_data2$.id==i,3:5])} # averaging values across 5 imputations
SPA3_Imputed <- cbind(SPA3y[,1],dataimp)
names(SPA3_Imputed)[1] <- "VETSAID"


dataimp <- VMEM1
for(i in 1:dim(VMEM1y)[1]){dataimp[i,] <- colMeans(VMEM1_data2[VMEM1_data2$.id==i,3:5])} # averaging values across 5 imputations
VMEM1_Imputed <- cbind(VMEM1y[,1],dataimp)
names(VMEM1_Imputed)[1] <- "VETSAID"

dataimp <- VMEM2
for(i in 1:dim(VMEM2y)[1]){dataimp[i,] <- colMeans(VMEM2_data2[VMEM2_data2$.id==i,3:5])} # averaging values across 5 imputations
VMEM2_Imputed <- cbind(VMEM2y[,1],dataimp)
names(VMEM2_Imputed)[1] <- "VETSAID"

dataimp <- VMEM3
for(i in 1:dim(VMEM3y)[1]){dataimp[i,] <- colMeans(VMEM3_data2[VMEM3_data2$.id==i,3:5])} # averaging values across 5 imputations
VMEM3_Imputed <- cbind(VMEM3y[,1],dataimp)
names(VMEM3_Imputed)[1] <- "VETSAID"

###########################################
#####      Create Factor Scores      ######
###########################################
##############################
##### NO IMPUTATION ##########
##############################
# Sum across standardized factor loadings from latent variable models, then re-scale all factor scores based on M/SD of wave 1 factor scores
commonEF_V1x <- .31*Stroop_V1z+ (-1)*.55*Trail_V1z+ .22*CatSw_V1z+ .49*LNseq_V1_stndV1 + .38*RSasc_V1_stndV1 + .44*DStot_V1_stndV1
commonEF_V2x <- .31*Stroop_V2 + (-1)*.55*Trail_V2 + .22*CatSw_V2 + .49*LNseq_V2_stndV1 + .38*RSasc_V2_stndV1 + .44*DStot_V2_stndV1
commonEF_V3x <- .31*Stroop_V3 + (-1)*.55*Trail_V3 + .22*CatSw_V3 + .49*LNseq_V3_stndV1 + .38*RSasc_V3_stndV1 + .44*DStot_V3_stndV1
commonEF_V1 <- scale(commonEF_V1x)
commonEF_V2 <- (commonEF_V2x-mean(commonEF_V1x,na.rm=T))/sd(commonEF_V1x,na.rm=T)
commonEF_V3 <- (commonEF_V3x-mean(commonEF_V1x,na.rm=T))/sd(commonEF_V1x,na.rm=T)

WM_V1x <- .705*LNseq_V1_stndV1 + .606*RSasc_V1_stndV1 + .828*DStot_V1_stndV1
WM_V2x <- .705*LNseq_V2_stndV1 + .606*RSasc_V2_stndV1 + .828*DStot_V2_stndV1
WM_V3x <- .705*LNseq_V3_stndV1 + .606*RSasc_V3_stndV1 + .828*DStot_V3_stndV1
work_mem_V1 <- scale(WM_V1x)
work_mem_V2 <- (WM_V2x-mean(WM_V1x,na.rm=T))/sd(WM_V1x,na.rm=T)
work_mem_V3 <- (WM_V3x-mean(WM_V1x,na.rm=T))/sd(WM_V1x,na.rm=T)

fluency_V1x <- .77*LFFCOR_V1_stndV1 + .78*LFACOR_V1_stndV1 + .80*LFSCOR_V1_stndV1 + .43*CFANCOR_V1_stndV1 + .54*CFBNCOR_V1_stndV1 + .36*CSCOR_V1_stndV1
fluency_V2x <- .77*LFFCOR_V2_stndV1 + .78*LFACOR_V2_stndV1 + .80*LFSCOR_V2_stndV1 + .43*CFANCOR_V2_stndV1 + .54*CFBNCOR_V2_stndV1 + .36*CSCOR_V2_stndV1
fluency_V3x <- .77*LFFCOR_V3_stndV1 + .78*LFACOR_V3_stndV1 + .80*LFSCOR_V3_stndV1 + .43*CFANCOR_V3_stndV1 + .54*CFBNCOR_V3_stndV1 + .36*CSCOR_V3_stndV1
fluency_V1 <- scale(fluency_V1x)
fluency_V2 <- (fluency_V2x-mean(fluency_V1x,na.rm=T))/sd(fluency_V1x,na.rm=T)
fluency_V3 <- (fluency_V3x-mean(fluency_V1x,na.rm=T))/sd(fluency_V1x,na.rm=T)

semantic_flu_V1x <- .685*CFANCOR_V1_stndV1 + .623*CFBNCOR_V1_stndV1 + .516*CSCOR_V1_stndV1
semantic_flu_V2x <- .685*CFANCOR_V2_stndV1 + .623*CFBNCOR_V2_stndV1 + .516*CSCOR_V2_stndV1
semantic_flu_V3x <- .685*CFANCOR_V3_stndV1 + .623*CFBNCOR_V3_stndV1 + .516*CSCOR_V3_stndV1
semantic_flu_V1 <- scale(semantic_flu_V1x)
semantic_flu_V2 <- (semantic_flu_V2x-mean(semantic_flu_V1x,na.rm=T))/sd(semantic_flu_V1x,na.rm=T)
semantic_flu_V3 <- (semantic_flu_V3x-mean(semantic_flu_V1x,na.rm=T))/sd(semantic_flu_V1x,na.rm=T)

# Original Version without CVLT learning trials
#memory_V1x <- .87*.57*LMITOT_V1_stndV1 + .97*.57*LMDTOT_V1_stndV1 + .64*.47*VRITOT_V1_stndV1 + .88*.47*VRDTOT_V1_stndV1 + .83*.68*CVSDFR_V1_stndV1 + .96*.68*CVLDFR_V1_stndV1
#memory_V2x <- .87*.57*LMITOT_V2_stndV1 + .97*.57*LMDTOT_V2_stndV1 + .64*.47*VRITOT_V2_stndV1 + .88*.47*VRDTOT_V2_stndV1 + .83*.68*CVSDFR_V2_stndV1 + .96*.68*CVLDFR_V2_stndV1
#memory_V3x <- .87*.57*LMITOT_V3_stndV1 + .97*.57*LMDTOT_V3_stndV1 + .64*.47*VRITOT_V3_stndV1 + .88*.47*VRDTOT_V3_stndV1 + .83*.68*CVSDFR_V3_stndV1 + .96*.68*CVLDFR_V3_stndV1
#memory_V1 <- scale(memory_V1x)
#memory_V2 <- (memory_V2x-mean(memory_V1x,na.rm=T))/sd(memory_V1x,na.rm=T)
#memory_V3 <- (memory_V3x-mean(memory_V1x,na.rm=T))/sd(memory_V1x,na.rm=T)

memory_V1x <- .91*.66*LMITOT_V1_stndV1 + .94*.66*LMDTOT_V1_stndV1 + .75*.60*VRITOT_V1_stndV1 + .85*.60*VRDTOT_V1_stndV1 + .18*CVATOT_V1_stndV1 + .68*.72*CVATOT_V1_stndV1 + .90*.72*CVSDFR_V1_stndV1 + .91*.72*CVLDFR_V1_stndV1
memory_V2x <- .91*.66*LMITOT_V2_stndV1 + .94*.66*LMDTOT_V2_stndV1 + .75*.60*VRITOT_V2_stndV1 + .85*.60*VRDTOT_V2_stndV1 + .18*CVATOT_V2_stndV1 + .68*.72*CVATOT_V2_stndV1 + .90*.72*CVSDFR_V2_stndV1 + .91*.72*CVLDFR_V2_stndV1
memory_V3x <- .91*.66*LMITOT_V3_stndV1 + .94*.66*LMDTOT_V3_stndV1 + .75*.60*VRITOT_V3_stndV1 + .85*.60*VRDTOT_V3_stndV1 + .18*CVATOT_V3_stndV1 + .68*.72*CVATOT_V3_stndV1 + .90*.72*CVSDFR_V3_stndV1 + .91*.72*CVLDFR_V3_stndV1
memory_V1 <- scale(memory_V1x)
memory_V2 <- (memory_V2x-mean(memory_V1x,na.rm=T))/sd(memory_V1x,na.rm=T)
memory_V3 <- (memory_V3x-mean(memory_V1x,na.rm=T))/sd(memory_V1x,na.rm=T)

speed_V1x <- (-1)*.66*.56*Trail2_V1_stndV1 + (-1)*.84*.56*Trail3_V1_stndV1 + .74*.82*StroopW_V1_stndV1 + .83*.82*StroopC_V1_stndV1 + (-1)*.76*.54*SRTGMEANLOG_V1_stndV1 + (-1)*.86*.54*CHRTGMEANLOG_V1_stndV1 
speed_V2x <- (-1)*.66*.56*Trail2_V2_stndV1 + (-1)*.84*.56*Trail3_V2_stndV1 + .74*.82*StroopW_V2_stndV1 + .83*.82*StroopC_V2_stndV1 + (-1)*.76*.54*SRTGMEANLOG_V2_stndV1 + (-1)*.86*.54*CHRTGMEANLOG_V2_stndV1 
speed_V3x <- (-1)*.66*.56*Trail2_V3_stndV1 + (-1)*.84*.56*Trail3_V3_stndV1 + .74*.82*StroopW_V3_stndV1 + .83*.82*StroopC_V3_stndV1 + (-1)*.76*.54*SRTGMEANLOG_V3_stndV1 + (-1)*.86*.54*CHRTGMEANLOG_V3_stndV1 
speed_V1 <- scale(speed_V1x)
speed_V2 <- (speed_V2x-mean(speed_V1x,na.rm=T))/sd(speed_V1x,na.rm=T)
speed_V3 <- (speed_V3x-mean(speed_V1x,na.rm=T))/sd(speed_V1x,na.rm=T)


#Standardized Scoring Coefficients from Proc Factor n=1 priors=smc method=ML (CR)
SPA_V1x <- 0.16715*MR1COR_V1_stndV1 + 0.27901*AFQTBXPCTTRAN_R_V1_stndV1 + 0.59952*HFTOTCOR_V1_stndV1
SPA_V2x <- 0.16715*MR1COR_V2_stndV1 + 0.27901*AFQTBXPCTTRAN_R_V2_stndV1 + 0.59952*HFTOTCOR_V2_stndV1
SPA_V3x <- 0.16715*MR1COR_V3_stndV1 + 0.27901*AFQTBXPCTTRAN_R_V3_stndV1 + 0.59952*HFTOTCOR_V3_stndV1
VisSpat_V1 <- scale(SPA_V1x)
VisSpat_V2 <- (SPA_V2x-mean(SPA_V1x,na.rm=T))/sd(SPA_V1x,na.rm=T)
VisSpat_V3 <- (SPA_V3x-mean(SPA_V1x,na.rm=T))/sd(SPA_V1x,na.rm=T)


VMEM_V1x <- 0.05350*sVRCTOT_V1_stndV1 + 0.80128*VRITOT_V1_stndV1 + 0.16498*VRDTOT_V1_stndV1
VMEM_V2x <- 0.05350*sVRCTOT_V2_stndV1 + 0.80128*VRITOT_V2_stndV1 + 0.16498*VRDTOT_V2_stndV1
VMEM_V3x <- 0.05350*sVRCTOT_V3_stndV1 + 0.80128*VRITOT_V3_stndV1 + 0.16498*VRDTOT_V3_stndV1
VisMem_V1 <- scale(VMEM_V1x)
VisMem_V2 <- (VMEM_V2x-mean(VMEM_V1x,na.rm=T))/sd(VMEM_V1x,na.rm=T)
VisMem_V3 <- (VMEM_V3x-mean(VMEM_V1x,na.rm=T))/sd(VMEM_V1x,na.rm=T)



###################################################
#####   Factor Scores from Imputed Data  ##########
###################################################
library(dplyr)
#merge imputed datasets
Part1FLU <- merge(merge(FLU1_Imputed, FLU2_Imputed, by = "VETSAID", all=T),
                  FLU3_Imputed, by = "VETSAID", all=T)
Part2EF <- merge(merge(merge(Part1FLU, EF1_Imputed, by = "VETSAID", all=T),
                 EF2_Imputed, by = "VETSAID", all=T),
                 EF3_Imputed, by = "VETSAID", all=T)
Part3MEM <- merge(merge(merge(Part2EF, MEM1_Imputed, by = "VETSAID", all=T),
                 MEM2_Imputed, by = "VETSAID", all=T),
                 MEM3_Imputed, by = "VETSAID", all=T)
Part4SPD <- merge(merge(merge(Part3MEM, SPD1_Imputed, by = "VETSAID", all=T),
                 SPD2_Imputed, by = "VETSAID", all=T),
                 SPD3_Imputed, by = "VETSAID", all=T)
Part5WM <- merge(merge(merge(Part4SPD, WM1_Imputed, by = "VETSAID", all=T),
                  WM2_Imputed, by = "VETSAID", all=T),
                  WM3_Imputed, by = "VETSAID", all=T)
Part6SF <- merge(merge(merge(Part5WM, SF1_Imputed, by = "VETSAID", all=T),
                  SF2_Imputed, by = "VETSAID", all=T),
                  SF3_Imputed, by = "VETSAID", all=T)
Part7SPA <- merge(merge(merge(Part6SF, SPA1_Imputed, by = "VETSAID", all=T),
                         SPA2_Imputed, by = "VETSAID", all=T),
                   SPA3_Imputed, by = "VETSAID", all=T)
Part8VMEM <- merge(merge(merge(Part7SPA, VMEM1_Imputed, by = "VETSAID", all=T),
                        VMEM2_Imputed, by = "VETSAID", all=T),
                  VMEM3_Imputed, by = "VETSAID", all=T)
IDs <- data.frame(VETSAID, VETSAGRP)
all_Imputed <- merge(Part8VMEM, IDs, by = "VETSAID", all=T)
# Remove duplicated variables and rename
all_Imputed <- all_Imputed %>% select(-ends_with(".y"))
names(all_Imputed) = gsub(".x","",names(all_Imputed))

commonEF_V1x_imputed <- .31*all_Imputed$Stroop_V1z+ (-1)*.55*all_Imputed$Trail_V1z+ .22*all_Imputed$CatSw_V1z+ .49*all_Imputed$LNseq_V1_stndV1 + .38*all_Imputed$RSasc_V1_stndV1 + .44*all_Imputed$DStot_V1_stndV1
commonEF_V2x_imputed <- .31*all_Imputed$Stroop_V2 + (-1)*.55*all_Imputed$Trail_V2 + .22*all_Imputed$CatSw_V2 + .49*all_Imputed$LNseq_V2_stndV1 + .38*all_Imputed$RSasc_V2_stndV1 + .44*all_Imputed$DStot_V2_stndV1
commonEF_V3x_imputed <- .31*all_Imputed$Stroop_V3 + (-1)*.55*all_Imputed$Trail_V3 + .22*all_Imputed$CatSw_V3 + .49*all_Imputed$LNseq_V3_stndV1 + .38*all_Imputed$RSasc_V3_stndV1 + .44*all_Imputed$DStot_V3_stndV1
commonEF_V1_imputed <- scale(commonEF_V1x_imputed)
commonEF_V2_imputed <- (commonEF_V2x_imputed-mean(commonEF_V1x_imputed,na.rm=T))/sd(commonEF_V1x_imputed,na.rm=T)
commonEF_V3_imputed <- (commonEF_V3x_imputed-mean(commonEF_V1x_imputed,na.rm=T))/sd(commonEF_V1x_imputed,na.rm=T)

WM_V1x_imputed <- .705*all_Imputed$LN1_wm + .606*all_Imputed$RS1_wm + .828*all_Imputed$DS1_wm
WM_V2x_imputed <- .705*all_Imputed$LN2_wm + .606*all_Imputed$RS2_wm + .828*all_Imputed$DS2_wm
WM_V3x_imputed <- .705*all_Imputed$LN3_wm + .606*all_Imputed$RS3_wm + .828*all_Imputed$DS3_wm
work_mem_V1_imputed <- scale(WM_V1x_imputed)
work_mem_V2_imputed <- (WM_V2x_imputed-mean(WM_V1x_imputed,na.rm=T))/sd(WM_V1x_imputed,na.rm=T)
work_mem_V3_imputed <- (WM_V3x_imputed-mean(WM_V1x_imputed,na.rm=T))/sd(WM_V1x_imputed,na.rm=T)


fluency_V1x_imputed <- .77*all_Imputed$LFFCOR_V1_stndV1 + .78*all_Imputed$LFACOR_V1_stndV1 + .80*all_Imputed$LFSCOR_V1_stndV1 + .43*all_Imputed$CFANCOR_V1_stndV1 + .54*all_Imputed$CFBNCOR_V1_stndV1 + .36*all_Imputed$CSCOR_V1_stndV1
fluency_V2x_imputed <- .77*all_Imputed$LFFCOR_V2_stndV1 + .78*all_Imputed$LFACOR_V2_stndV1 + .80*all_Imputed$LFSCOR_V2_stndV1 + .43*all_Imputed$CFANCOR_V2_stndV1 + .54*all_Imputed$CFBNCOR_V2_stndV1 + .36*all_Imputed$CSCOR_V2_stndV1
fluency_V3x_imputed <- .77*all_Imputed$LFFCOR_V3_stndV1 + .78*all_Imputed$LFACOR_V3_stndV1 + .80*all_Imputed$LFSCOR_V3_stndV1 + .43*all_Imputed$CFANCOR_V3_stndV1 + .54*all_Imputed$CFBNCOR_V3_stndV1 + .36*all_Imputed$CSCOR_V3_stndV1
fluency_V1_imputed <- scale(fluency_V1x_imputed)
fluency_V2_imputed <- (fluency_V2x_imputed-mean(fluency_V1x_imputed,na.rm=T))/sd(fluency_V1x_imputed,na.rm=T)
fluency_V3_imputed <- (fluency_V3x_imputed-mean(fluency_V1x_imputed,na.rm=T))/sd(fluency_V1x_imputed,na.rm=T)

semantic_flu_V1x_imputed <- .685*all_Imputed$AN1_sf + .623*all_Imputed$BN1_sf + .516*all_Imputed$CS1_sf
semantic_flu_V2x_imputed <- .685*all_Imputed$AN2_sf + .623*all_Imputed$BN2_sf + .516*all_Imputed$CS2_sf
semantic_flu_V3x_imputed <- .685*all_Imputed$AN3_sf + .623*all_Imputed$BN3_sf + .516*all_Imputed$CS3_sf
semantic_flu_V1_imputed <- scale(semantic_flu_V1x_imputed)
semantic_flu_V2_imputed <- (semantic_flu_V2x_imputed-mean(semantic_flu_V1x_imputed,na.rm=T))/sd(semantic_flu_V1x_imputed,na.rm=T)
semantic_flu_V3_imputed <- (semantic_flu_V3x_imputed-mean(semantic_flu_V1x_imputed,na.rm=T))/sd(semantic_flu_V1x_imputed,na.rm=T)

memory_V1x_imputed <- .91*.66*all_Imputed$LMITOT_V1_stndV1 + .94*.66*all_Imputed$LMDTOT_V1_stndV1 + .75*.60*all_Imputed$VRITOT_V1_stndV1 + .85*.60*all_Imputed$VRDTOT_V1_stndV1 + .18*all_Imputed$CVATOT_V1_stndV1 + .68*.72*all_Imputed$CVATOT_V1_stndV1 + .90*.72*all_Imputed$CVSDFR_V1_stndV1 + .91*.72*all_Imputed$CVLDFR_V1_stndV1
memory_V2x_imputed <- .91*.66*all_Imputed$LMITOT_V2_stndV1 + .94*.66*all_Imputed$LMDTOT_V2_stndV1 + .75*.60*all_Imputed$VRITOT_V2_stndV1 + .85*.60*all_Imputed$VRDTOT_V2_stndV1 + .18*all_Imputed$CVATOT_V2_stndV1 + .68*.72*all_Imputed$CVATOT_V2_stndV1 + .90*.72*all_Imputed$CVSDFR_V2_stndV1 + .91*.72*all_Imputed$CVLDFR_V2_stndV1
memory_V3x_imputed <- .91*.66*all_Imputed$LMITOT_V3_stndV1 + .94*.66*all_Imputed$LMDTOT_V3_stndV1 + .75*.60*all_Imputed$VRITOT_V3_stndV1 + .85*.60*all_Imputed$VRDTOT_V3_stndV1 + .18*all_Imputed$CVATOT_V3_stndV1 + .68*.72*all_Imputed$CVATOT_V3_stndV1 + .90*.72*all_Imputed$CVSDFR_V3_stndV1 + .91*.72*all_Imputed$CVLDFR_V3_stndV1
memory_V1_imputed <- scale(memory_V1x_imputed)
memory_V2_imputed <- (memory_V2x_imputed-mean(memory_V1x_imputed,na.rm=T))/sd(memory_V1x_imputed,na.rm=T)
memory_V3_imputed <- (memory_V3x_imputed-mean(memory_V1x_imputed,na.rm=T))/sd(memory_V1x_imputed,na.rm=T)


speed_V1x_imputed <- (-1)*.66*.56*all_Imputed$Trail2_V1_stndV1 + (-1)*.84*.56*all_Imputed$Trail3_V1_stndV1 + .74*.82*all_Imputed$StroopW_V1_stndV1 + .83*.82*all_Imputed$StroopC_V1_stndV1 + (-1)*.76*.54*all_Imputed$SRTGMEANLOG_V1_stndV1 + (-1)*.86*.54*all_Imputed$CHRTGMEANLOG_V1_stndV1 
speed_V2x_imputed <- (-1)*.66*.56*all_Imputed$Trail2_V2_stndV1 + (-1)*.84*.56*all_Imputed$Trail3_V2_stndV1 + .74*.82*all_Imputed$StroopW_V2_stndV1 + .83*.82*all_Imputed$StroopC_V2_stndV1 + (-1)*.76*.54*all_Imputed$SRTGMEANLOG_V2_stndV1 + (-1)*.86*.54*all_Imputed$CHRTGMEANLOG_V2_stndV1 
speed_V3x_imputed <- (-1)*.66*.56*all_Imputed$Trail2_V3_stndV1 + (-1)*.84*.56*all_Imputed$Trail3_V3_stndV1 + .74*.82*all_Imputed$StroopW_V3_stndV1 + .83*.82*all_Imputed$StroopC_V3_stndV1 + (-1)*.76*.54*all_Imputed$SRTGMEANLOG_V3_stndV1 + (-1)*.86*.54*all_Imputed$CHRTGMEANLOG_V3_stndV1 
speed_V1_imputed <- scale(speed_V1x_imputed)
speed_V2_imputed <- (speed_V2x_imputed-mean(speed_V1x_imputed,na.rm=T))/sd(speed_V1x_imputed,na.rm=T)
speed_V3_imputed <- (speed_V3x_imputed-mean(speed_V1x_imputed,na.rm=T))/sd(speed_V1x_imputed,na.rm=T)

SPA_V1x_imputed <- 0.16715*all_Imputed$MR1COR_V1_stndV1 + 0.27901*all_Imputed$AFQTBXPCTTRAN_R_V1_stndV1 + 0.59952*all_Imputed$HFTOTCOR_V1_stndV1
SPA_V2x_imputed <- 0.16715*all_Imputed$MR1COR_V2_stndV1 + 0.27901*all_Imputed$AFQTBXPCTTRAN_R_V2_stndV1 + 0.59952*all_Imputed$HFTOTCOR_V2_stndV1
SPA_V3x_imputed <- 0.16715*all_Imputed$MR1COR_V3_stndV1 + 0.27901*all_Imputed$AFQTBXPCTTRAN_R_V3_stndV1 + 0.59952*all_Imputed$HFTOTCOR_V3_stndV1
VisSpat_V1_imputed <- scale(SPA_V1x_imputed)
VisSpat_V2_imputed <- (SPA_V2x_imputed-mean(SPA_V1x_imputed,na.rm=T))/sd(SPA_V1x_imputed,na.rm=T)
VisSpat_V3_imputed <- (SPA_V3x_imputed-mean(SPA_V1x_imputed,na.rm=T))/sd(SPA_V1x_imputed,na.rm=T)

VMEM_V1x_imputed <- 0.05350*all_Imputed$sVRCTOT_V1_stndV1 + 0.80128*all_Imputed$VRITOT_V1_stndV1 + 0.16498*all_Imputed$VRDTOT_V1_stndV1
VMEM_V2x_imputed <- 0.05350*all_Imputed$sVRCTOT_V2_stndV1 + 0.80128*all_Imputed$VRITOT_V2_stndV1 + 0.16498*all_Imputed$VRDTOT_V2_stndV1
VMEM_V3x_imputed <- 0.05350*all_Imputed$sVRCTOT_V3_stndV1 + 0.80128*all_Imputed$VRITOT_V3_stndV1 + 0.16498*all_Imputed$VRDTOT_V3_stndV1
VisMem_V1_imputed <- scale(VMEM_V1x_imputed)
VisMem_V2_imputed <- (VMEM_V2x_imputed-mean(VMEM_V1x_imputed,na.rm=T))/sd(VMEM_V1x_imputed,na.rm=T)
VisMem_V3_imputed <- (VMEM_V3x_imputed-mean(VMEM_V1x_imputed,na.rm=T))/sd(VMEM_V1x_imputed,na.rm=T)



############################
### Export Scores to csv ###
############################

## non imputed
allScores <- data.frame(VETSAID, VETSAGRP,
                   memory_V1, memory_V2, memory_V3,
                   speed_V1, speed_V2, speed_V3,
                   commonEF_V1, commonEF_V2, commonEF_V3,
                   work_mem_V1, work_mem_V2, work_mem_V3,
                   fluency_V1, fluency_V2, fluency_V3,
                   semantic_flu_V1, semantic_flu_V2, semantic_flu_V3,
                   VisSpat_V1, VisSpat_V2, VisSpat_V3,
                   VisMem_V1,VisMem_V2,VisMem_V3)
describe(allScores)
write.csv(allScores, "~/netshare/M/NAS VETSA MASTER DATAFILES/Other cognitive measures/Cognitive Factor Scores V1V2V3/V1V2V3_CogData_FactorScores_7_22_2021.csv", row.names = FALSE)
#head(allScores)

## imputed
allScores_imp <- data.frame(VETSAID, VETSAGRP,
                        memory_V1_imputed, memory_V2_imputed, memory_V3_imputed,
                        speed_V1_imputed, speed_V2_imputed, speed_V3_imputed,
                        commonEF_V1_imputed, commonEF_V2_imputed, commonEF_V3_imputed,
                        work_mem_V1_imputed, work_mem_V2_imputed, work_mem_V3_imputed,
                        fluency_V1_imputed, fluency_V2_imputed, fluency_V3_imputed,
                        semantic_flu_V1_imputed, semantic_flu_V2_imputed, semantic_flu_V3_imputed,
                        VisSpat_V1_imputed, VisSpat_V2_imputed, VisSpat_V3_imputed,
                        VisMem_V1_imputed,VisMem_V2_imputed,VisMem_V3_imputed)
impnames <- c("VETSAID", "VETSAGRP",
              "memory_V1", "memory_V2", "memory_V3",
              "speed_V1", "speed_V2", "speed_V3",
              "commonEF_V1", "commonEF_V2", "commonEF_V3",
              "work_mem_V1", "work_mem_V2", "work_mem_V3",
              "fluency_V1", "fluency_V2", "fluency_V3",
              "semantic_flu_V1", "semantic_flu_V2", "semantic_flu_V3",
              "vis_spat_V1", "vis_spat_V2", "vis_spat_V3",
              "vis_mem_V1","vis_mem_V2","vis_mem_V3")
names(allScores_imp) <- impnames
describe(allScores_imp)
describe(allScores)
### Exclude final WM and SS IDs that were missing too many subdomain tasks in full imputation (for EF/fluency)
# allScores_imp$WorkMem_V1[allScores_imp$VETSAID %in% WM1_exclude_IDs]<- NA
# allScores_imp$WorkMem_V2[allScores_imp$VETSAID %in% WM2_exclude_IDs]<- NA
# allScores_imp$WorkMem_V3[allScores_imp$VETSAID %in% WM3_exclude_IDs]<- NA
# allScores_imp$Semantic_Flu_V1[allScores_imp$VETSAID %in% SS1_exclude_IDs]<- NA
# allScores_imp$Semantic_Flu_V2[allScores_imp$VETSAID %in% SS2_exclude_IDs]<- NA
# allScores_imp$Semantic_Flu_V3[allScores_imp$VETSAID %in% SS3_exclude_IDs]<- NA
#describe(allScores_imp)

write.csv(allScores_imp, "~/netshare/M/NAS VETSA MASTER DATAFILES/Other cognitive measures/Cognitive Factor Scores V1V2V3/V1V2V3_CogData_FactorScores_Imputed_7_22_2021.csv", row.names = FALSE)

