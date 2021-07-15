 libname master 'L:\VETSA Data\Master Files' ;
RUN;


PROC SORT data = master.vetsaid;
by VETSAID;
RUN;


PROC SORT data = master.vetsa1merged_22dec2016_nomiss;
by VETSAID;
RUN;



PROC SORT data = master.vetsa2merged_23dec2016_nomiss;
by VETSAID;
RUN;


PROC SORT data = master.vetsa3_master_db_20200618;
by VETSAID;
RUN;


DATA STEP1;
MERGE master.vetsaid master.vetsa1merged_22dec2016_nomiss;
BY VETSAID;
RUN;



DATA STEP2;
MERGE STEP1 master.vetsa2merged_23dec2016_nomiss ;
BY VETSAID;
RUN;


DATA STEP3;
MERGE STEP2  master.vetsa3_master_db_20200618 ;
BY VETSAID;
RUN;

DATA MASTER.VESTAWIDE06142021;
SET STEP3;
RUN;











/*Work done by Tyler Bell 6.24.2020*/
*Converted the following files into CSV to match other file formats:
satis_v1v2v3_all.sas7bdat = satis.csv (Z:\Riki\Satisfaction\Satisfaction SAS)
satised_calis_practice.sas7bdat = ed.csv (Z:\Riki\Satisfaction\Satisfaction SAS)
vetsa_admin_file_20200619.sas7bdat = admin.csv (Z:\a_data management\Admin File Updates)

Data sets already in csv:
Practice_Corrected_Cognitive_Data_V1V2V3_2020-06-17 = cog.csv (Z:\NAS VETSA MASTER DATAFILES\Other cognitive measures\Cognitive data practice effects\V1V2V3)
V1V2V3_CogData_FactorScores_Imputed_6_17_2020.csv = cogfactor.csv (Z:\NAS VETSA MASTER DATAFILES\Other cognitive measures\Cognitive Factor Scores V1V2V3)

*Step 1: Import Files;
**Set workspace;
libname home 'Z:/Riki/Satisfaction/Satisfaction SAS/Tyler Data' ;
RUN;

**Import admin file;
DATA home.admin;
set home.vetsa_admin_file_20200619;
RUN;
***Validate import;
PROC CONTENTS DATA=home.admin;
RUN;


**Import cognitive data;
FILENAME REFFILE 'Z:/Riki/Satisfaction/Satisfaction SAS/Tyler Data/Practice_Corrected_Cognitive_Data_V1V2V3_2020-06-17.csv';

PROC IMPORT DATAFILE=REFFILE
        DBMS=CSV
        OUT=home.cog;
        GETNAMES=YES;
RUN;
***Validate import;
PROC CONTENTS DATA=home.cog;
RUN;

**Import sexual satisfication data;
FILENAME REFFILE '/home/u49069631/satis.csv';
PROC IMPORT DATAFILE=REFFILE
        OUT=home.sex;
        GETNAMES=YES;
RUN;
*Keep most important factors (From Rikki 6/24/2020);
DATA home.satis;
set home.satis_v1v2v3_all;
keep vetsaid
OFTERECT PENERECT PENETRAT MNTNRCT DIFFMNTN ATTSEX
SATISSEX SATISSEX_V2 SATISSEX_V3
ENJOYSEX OFTEJAC OFTORGAS
OFTDESIR LVLDESIR
OFTDESIR OFTDESIR_v2 OFTDESIR_v3
LVLDESIR LVLDESIR_v2 LVLDESIR_v3
SATSEXLI SATSEXLI_V2 SATSEXLI_V3
SATSEXRE SATSEXRE_V2 SATSEXRE_V3
CONFERCT SATSEXLI SATSEXRE
satoverall_v1 satoverall_v2 satoverall_v3
satrel_v1  satrel_v2  satrel_v3
satinter_v1 satinter_v2 satinter_v3
satcomb1_v1 satcomb1_v2 satcomb1_v3
sattotal_v1  sattotal_v2  sattotal_v3
anyEDdrg PARTNER ED_CSM EDYN_v2 EDYN_v3
weight  height  BMI_v1
a1   e6   L3   g1a   g2   g3   g15   g16
Charlson hrtprblm5 dep05 CESDep_v2 cesdtot_V3
BPMSYS1  BPMDIA1  MPULSE1  BPMSYS2  BPMDIA2  MPULSE2  BPASYS1  BPADIA1
APULSE1  BPASYS2  BPADIA2  APULSE2
ASTHYN BRONYN EMPHYN SAPNYN HYPTYN ANGIYN HATTYN HRTFYN PRVDYN
THRMYN GASTYN ULCRYN IBSYN GALLYN PANCYN HEPAYN HEPBYN JAUNYN
LVRDYN CIRRYN CROHYN ULCOYN DIABYN
OTHYYN UNDYYN OARTYN GOUTYN RARTYN MCSSYN CFSYN FIBRYN GLAUYN PSORYN
ANEMYN KISTYN MIGRYN SEIZYN MSYN STROYN HIVYN HIVYEAR HIVCURR AIDSYN PTSDYN AAADYN DEPRYN ANXDYN SCHZYN DADDYN
SMOKE100 SMOKENOW NUMSMOKE AGESMOKE DRINK20 NDYSBEER NDRNBEER NDYSWINE NDRNWINE NDYSHARD NDRNHARD
SF36PF SF36RP SF36BP  SF36GH  SF36VT  SF36SF  SF36RE  SF36MH
SF36PCS  SF36MCS  SF36PFNBS  SF36RPNBS  SF36BPNBS  SF36GHNBS  SF36VTNBS  SF36SFNBS  SF36RENBS  SF36MHNBS
A3_1 A3_2 A3_3 A3_4 A3_5 A3_6 A3_7 A3_8 A3_9 A3_10
D1_1 D1_2 D1_3 D1_4 D1_5 D1_6 D1_7 D1_8 D1_9 D1_10 D1_11 D1_12 D1_13 D1_14 D1_15 D1_16
D1_17 D1_18  posrel  envmst  persgr  slfacc auton purps totwb
D4_1 - D4_10 slfestm nWellbe  nSocpot nAchiev  nSocclo  nSreact nAliena
nAggrsn  nContrl  nHarmav  nTradnl  nAbsorb  nMPQPEM  nMPQPAG  nMPQPCOM  nMPQNEM  nMPQCONS
G1a   G4q1 G4q2 G4q3 G4q4 G4q5 G4q6 G4q7 G4q8 G4q9 G4q10 G4q11 G4q12 G4q13 G4q14 G4q15
G4q17 G4q18 G4q19 G4q20 G4q21 G4q22 G4q23 G4q24 G4q25 G4q26 G4q27 G4q28 G4q29 G4q30
G4q31 G4q32 G4q33 G4q34 G4q35 G4q36 G5  G7  G8  G9  G10q1 G10q2 G10q3 G10q4 G10q5  G11 G12q1  G12q2  G12q3
G13q1 G13q2 G13q3 G13q4 G13q5 G13q6 G14 G17 G19 G20 G21 G22 G23 G24 G25 H1 I1  I2  I3;
RUN;

DATA MASTER.VETSAWIDE_SEXSATIS06142021;
set STEP3;

*CLEAN VARIABLES;



SATISSEX_v1 = .;
if SATISSEX = 9 then SATISSEX_v1 = .;
else if SATISSEX = 0 then SATISSEXC = .;
else if SATISSEX = 1 then SATISSEXC = 1;
else if SATISSEX = 2 then SATISSEXC = 2;
else if SATISSEX = 3 then SATISSEXC = 3;
else if SATISSEX = 4 then SATISSEXC = 4;
else if SATISSEX = 5 then SATISSEXC = 5;

SATISSEX_v2C = .;
if SATISSEX_v2 = 9 then SATISSEX_v2C = .;
else if SATISSEX_v2 = 0 then SATISSEX_v2C = .;
else if SATISSEX_v2 = 1 then SATISSEX_v2C = 1;
else if SATISSEX_v2 = 2 then SATISSEX_v2C = 2;
else if SATISSEX_v2 = 3 then SATISSEX_v2C = 3;
else if SATISSEX_v2 = 4 then SATISSEX_v2C = 4;
else if SATISSEX_v2 = 5 then SATISSEX_v2C = 5;

SATISSEX_v3C = .;
if SATISSEX_v3 = 9 then SATISSEX_v3C = .;
else if SATISSEX_v3 = 0 then SATISSEX_v3C = .;
else if SATISSEX_v3 = 1 then SATISSEX_v3C = 1;
else if SATISSEX_v3 = 2 then SATISSEX_v3C = 2;
else if SATISSEX_v3 = 3 then SATISSEX_v3C = 3;
else if SATISSEX_v3 = 4 then SATISSEX_v3C = 4;
else if SATISSEX_v3 = 5 then SATISSEX_v3C = 5;


SATSEXLI_v1 = .;
if SATSEXLI = 9 then SATSEXLI_v1 = .;
else if SATSEXLI = 0 then SATSEXLIC = .;
else if SATSEXLI = 1 then SATSEXLIC = 1;
else if SATSEXLI = 2 then SATSEXLIC = 2;
else if SATSEXLI = 3 then SATSEXLIC = 3;
else if SATSEXLI = 4 then SATSEXLIC = 4;
else if SATSEXLI = 5 then SATSEXLIC = 5;

SATSEXLI_v2C = .;
if SATSEXLI_v2 = 9 then SATSEXLI_v2C = .;
else if SATSEXLI_v2 = 0 then SATSEXLI_v2C = .;
else if SATSEXLI_v2 = 1 then SATSEXLI_v2C = 1;
else if SATSEXLI_v2 = 2 then SATSEXLI_v2C = 2;
else if SATSEXLI_v2 = 3 then SATSEXLI_v2C = 3;
else if SATSEXLI_v2 = 4 then SATSEXLI_v2C = 4;
else if SATSEXLI_v2 = 5 then SATSEXLI_v2C = 5;

SATSEXLI_v3C = .;
if SATSEXLI_v3 = 9 then SATSEXLI_v3C = .;
else if SATSEXLI_v3 = 0 then SATSEXLI_v3C = .;
else if SATSEXLI_v3 = 1 then SATSEXLI_v3C = 1;
else if SATSEXLI_v3 = 2 then SATSEXLI_v3C = 2;
else if SATSEXLI_v3 = 3 then SATSEXLI_v3C = 3;
else if SATSEXLI_v3 = 4 then SATSEXLI_v3C = 4;
else if SATSEXLI_v3 = 5 then SATSEXLI_v3C = 5;


SATSEXRE_v1 = .;
if SATSEXRE = 9 then SATSEXREC_v1 = .;
else if SATSEXRE = 0 then SATSEXREC = .;
else if SATSEXRE = 1 then SATSEXREC = 1;
else if SATSEXRE = 2 then SATSEXREC = 2;
else if SATSEXRE = 3 then SATSEXREC = 3;
else if SATSEXRE = 4 then SATSEXREC = 4;
else if SATSEXRE = 5 then SATSEXREC = 5;

SATSEXRE_v2C = .;
if SATSEXRE_v2 = 9 then SATSEXRE_v2C = .;
else if SATSEXRE_v2 = 0 then SATSEXRE_v2C = .;
else if SATSEXRE_v2 = 1 then SATSEXRE_v2C = 1;
else if SATSEXRE_v2 = 2 then SATSEXRE_v2C = 2;
else if SATSEXRE_v2 = 3 then SATSEXRE_v2C = 3;
else if SATSEXRE_v2 = 4 then SATSEXRE_v2C = 4;
else if SATSEXRE_v2 = 5 then SATSEXRE_v2C = 5;

SATSEXRE_v3C = .;
if SATSEXRE_v3 = 9 then SATSEXRE_v3C = .;
else if SATSEXRE_v3 = 0 then SATSEXRE_v3C = .;
else if SATSEXRE_v3 = 1 then SATSEXRE_v3C = 1;
else if SATSEXRE_v3 = 2 then SATSEXRE_v3C = 2;
else if SATSEXRE_v3 = 3 then SATSEXRE_v3C = 3;
else if SATSEXRE_v3 = 4 then SATSEXRE_v3C = 4;
else if SATSEXRE_v3 = 5 then SATSEXRE_v3C = 5;


OFTERECT_v1 = .;
if OFTERECT = 9 then OFTERECT_v1 = .;
else if OFTERECT = 0 then OFTERECTC = .;
else if OFTERECT = 1 then OFTERECTC = 1;
else if OFTERECT = 2 then OFTERECTC = 2;
else if OFTERECT = 3 then OFTERECTC = 3;
else if OFTERECT = 4 then OFTERECTC = 4;
else if OFTERECT = 5 then OFTERECTC = 5;

OFTERECT_v2C = .;
if OFTERECT_v2 = 9 then OFTERECT_v2C = .;
else if OFTERECT_v2 = 0 then OFTERECT_v2C = .;
else if OFTERECT_v2 = 1 then OFTERECT_v2C = 1;
else if OFTERECT_v2 = 2 then OFTERECT_v2C = 2;
else if OFTERECT_v2 = 3 then OFTERECT_v2C = 3;
else if OFTERECT_v2 = 4 then OFTERECT_v2C = 4;
else if OFTERECT_v2 = 5 then OFTERECT_v2C = 5;

OFTERECT_v3C = .;
if OFTERECT_v3 = 9 then OFTERECT_v3C = .;
else if OFTERECT_v3 = 0 then OFTERECT_v3C = .;
else if OFTERECT_v3 = 1 then OFTERECT_v3C = 1;
else if OFTERECT_v3 = 2 then OFTERECT_v3C = 2;
else if OFTERECT_v3 = 3 then OFTERECT_v3C = 3;
else if OFTERECT_v3 = 4 then OFTERECT_v3C = 4;
else if OFTERECT_v3 = 5 then OFTERECT_v3C = 5;


PENERECT_v1 = .;
if PENERECT = 9 then PENERECT_v1 = .;
else if PENERECT = 0 then PENERECTC = .;
else if PENERECT = 1 then PENERECTC = 1;
else if PENERECT = 2 then PENERECTC = 2;
else if PENERECT = 3 then PENERECTC = 3;
else if PENERECT = 4 then PENERECTC = 4;
else if PENERECT = 5 then PENERECTC = 5;

PENERECT_v2C = .;
if PENERECT_v2 = 9 then PENERECT_v2C = .;
else if PENERECT_v2 = 0 then PENERECT_v2C = .;
else if PENERECT_v2 = 1 then PENERECT_v2C = 1;
else if PENERECT_v2 = 2 then PENERECT_v2C = 2;
else if PENERECT_v2 = 3 then PENERECT_v2C = 3;
else if PENERECT_v2 = 4 then PENERECT_v2C = 4;
else if PENERECT_v2 = 5 then PENERECT_v2C = 5;

PENERECT_v3C = .;
if PENERECT_v3 = 9 then PENERECT_v3C = .;
else if PENERECT_v3 = 0 then PENERECT_v3C = .;
else if PENERECT_v3 = 1 then PENERECT_v3C = 1;
else if PENERECT_v3 = 2 then PENERECT_v3C = 2;
else if PENERECT_v3 = 3 then PENERECT_v3C = 3;
else if PENERECT_v3 = 4 then PENERECT_v3C = 4;
else if PENERECT_v3 = 5 then PENERECT_v3C = 5;

PENETRAT_v1 = .;
if PENETRAT = 9 then PENETRAT_v1 = .;
else if PENETRAT = 0 then PENETRATC = .;
else if PENETRAT = 1 then PENETRATC = 1;
else if PENETRAT = 2 then PENETRATC = 2;
else if PENETRAT = 3 then PENETRATC = 3;
else if PENETRAT = 4 then PENETRATC = 4;
else if PENETRAT = 5 then PENETRATC = 5;

PENETRAT_v2C = .;
if PENETRAT_v2 = 9 then PENETRAT_v2C = .;
else if PENETRAT_v2 = 0 then PENETRAT_v2C = .;
else if PENETRAT_v2 = 1 then PENETRAT_v2C = 1;
else if PENETRAT_v2 = 2 then PENETRAT_v2C = 2;
else if PENETRAT_v2 = 3 then PENETRAT_v2C = 3;
else if PENETRAT_v2 = 4 then PENETRAT_v2C = 4;
else if PENETRAT_v2 = 5 then PENETRAT_v2C = 5;

PENETRAT_v3C = .;
if PENETRAT_v3 = 9 then PENETRAT_v3C = .;
else if PENETRAT_v3 = 0 then PENETRAT_v3C = .;
else if PENETRAT_v3 = 1 then PENETRAT_v3C = 1;
else if PENETRAT_v3 = 2 then PENETRAT_v3C = 2;
else if PENETRAT_v3 = 3 then PENETRAT_v3C = 3;
else if PENETRAT_v3 = 4 then PENETRAT_v3C = 4;
else if PENETRAT_v3 = 5 then PENETRAT_v3C = 5;

MNTNRCT_v1 = .;
if MNTNRCT = 9 then MNTNRCT_v1 = .;
else if MNTNRCT = 0 then MNTNRCTC = .;
else if MNTNRCT = 1 then MNTNRCTC = 1;
else if MNTNRCT = 2 then MNTNRCTC = 2;
else if MNTNRCT = 3 then MNTNRCTC = 3;
else if MNTNRCT = 4 then MNTNRCTC = 4;
else if MNTNRCT = 5 then MNTNRCTC = 5;

MNTNRCT_v2C = .;
if MNTNRCT_v2 = 9 then MNTNRCT_v2C = .;
else if MNTNRCT_v2 = 0 then MNTNRCT_v2C = .;
else if MNTNRCT_v2 = 1 then MNTNRCT_v2C = 1;
else if MNTNRCT_v2 = 2 then MNTNRCT_v2C = 2;
else if MNTNRCT_v2 = 3 then MNTNRCT_v2C = 3;
else if MNTNRCT_v2 = 4 then MNTNRCT_v2C = 4;
else if MNTNRCT_v2 = 5 then MNTNRCT_v2C = 5;

MNTNRCT_v3C = .;
if MNTNRCT_v3 = 9 then MNTNRCT_v3C = .;
else if MNTNRCT_v3 = 0 then MNTNRCT_v3C = .;
else if MNTNRCT_v3 = 1 then MNTNRCT_v3C = 1;
else if MNTNRCT_v3 = 2 then MNTNRCT_v3C = 2;
else if MNTNRCT_v3 = 3 then MNTNRCT_v3C = 3;
else if MNTNRCT_v3 = 4 then MNTNRCT_v3C = 4;
else if MNTNRCT_v3 = 5 then MNTNRCT_v3C = 5;


DIFFMNTN_v1 = .;
if DIFFMNTN = 9 then DIFFMNTN_v1 = .;
else if DIFFMNTN = 0 then DIFFMNTNC = .;
else if DIFFMNTN = 1 then DIFFMNTNC = 1;
else if DIFFMNTN = 2 then DIFFMNTNC = 2;
else if DIFFMNTN = 3 then DIFFMNTNC = 3;
else if DIFFMNTN = 4 then DIFFMNTNC = 4;
else if DIFFMNTN = 5 then DIFFMNTNC = 5;

DIFFMNTN_v2C = .;
if DIFFMNTN_v2 = 9 then DIFFMNTN_v2C = .;
else if DIFFMNTN_v2 = 0 then DIFFMNTN_v2C = .;
else if DIFFMNTN_v2 = 1 then DIFFMNTN_v2C = 1;
else if DIFFMNTN_v2 = 2 then DIFFMNTN_v2C = 2;
else if DIFFMNTN_v2 = 3 then DIFFMNTN_v2C = 3;
else if DIFFMNTN_v2 = 4 then DIFFMNTN_v2C = 4;
else if DIFFMNTN_v2 = 5 then DIFFMNTN_v2C = 5;

DIFFMNTN_v3C = .;
if DIFFMNTN_v3 = 9 then DIFFMNTN_v3C = .;
else if DIFFMNTN_v3 = 0 then DIFFMNTN_v3C = .;
else if DIFFMNTN_v3 = 1 then DIFFMNTN_v3C = 1;
else if DIFFMNTN_v3 = 2 then DIFFMNTN_v3C = 2;
else if DIFFMNTN_v3 = 3 then DIFFMNTN_v3C = 3;
else if DIFFMNTN_v3 = 4 then DIFFMNTN_v3C = 4;
else if DIFFMNTN_v3 = 5 then DIFFMNTN_v3C = 5;

OFTDESIR_v1 = .;
if OFTDESIR = 9 then OFTDESIR_v1 = .;
else if OFTDESIR = 0 then OFTDESIRC = .;
else if OFTDESIR = 1 then OFTDESIRC = 1;
else if OFTDESIR = 2 then OFTDESIRC = 2;
else if OFTDESIR = 3 then OFTDESIRC = 3;
else if OFTDESIR = 4 then OFTDESIRC = 4;
else if OFTDESIR = 5 then OFTDESIRC = 5;

OFTDESIR_v2C = .;
if OFTDESIR_v2 = 9 then OFTDESIR_v2C = .;
else if OFTDESIR_v2 = 0 then OFTDESIR_v2C = .;
else if OFTDESIR_v2 = 1 then OFTDESIR_v2C = 1;
else if OFTDESIR_v2 = 2 then OFTDESIR_v2C = 2;
else if OFTDESIR_v2 = 3 then OFTDESIR_v2C = 3;
else if OFTDESIR_v2 = 4 then OFTDESIR_v2C = 4;
else if OFTDESIR_v2 = 5 then OFTDESIR_v2C = 5;

OFTDESIR_v3C = .;
if OFTDESIR_v3 = 9 then OFTDESIR_v3C = .;
else if OFTDESIR_v3 = 0 then OFTDESIR_v3C = .;
else if OFTDESIR_v3 = 1 then OFTDESIR_v3C = 1;
else if OFTDESIR_v3 = 2 then OFTDESIR_v3C = 2;
else if OFTDESIR_v3 = 3 then OFTDESIR_v3C = 3;
else if OFTDESIR_v3 = 4 then OFTDESIR_v3C = 4;
else if OFTDESIR_v3 = 5 then OFTDESIR_v3C = 5;


LVLDESIR_v1 = .;
if LVLDESIR = 9 then LVLDESIR_v1 = .;
else if LVLDESIR = 0 then LVLDESIRC = .;
else if LVLDESIR = 1 then LVLDESIRC = 1;
else if LVLDESIR = 2 then LVLDESIRC = 2;
else if LVLDESIR = 3 then LVLDESIRC = 3;
else if LVLDESIR = 4 then LVLDESIRC = 4;
else if LVLDESIR = 5 then LVLDESIRC = 5;

LVLDESIR_v2C = .;
if LVLDESIR_v2 = 9 then LVLDESIR_v2C = .;
else if LVLDESIR_v2 = 0 then LVLDESIR_v2C = .;
else if LVLDESIR_v2 = 1 then LVLDESIR_v2C = 1;
else if LVLDESIR_v2 = 2 then LVLDESIR_v2C = 2;
else if LVLDESIR_v2 = 3 then LVLDESIR_v2C = 3;
else if LVLDESIR_v2 = 4 then LVLDESIR_v2C = 4;
else if LVLDESIR_v2 = 5 then LVLDESIR_v2C = 5;

LVLDESIR_v3C = .;
if LVLDESIR_v3 = 9 then LVLDESIR_v3C = .;
else if LVLDESIR_v3 = 0 then LVLDESIR_v3C = .;
else if LVLDESIR_v3 = 1 then LVLDESIR_v3C = 1;
else if LVLDESIR_v3 = 2 then LVLDESIR_v3C = 2;
else if LVLDESIR_v3 = 3 then LVLDESIR_v3C = 3;
else if LVLDESIR_v3 = 4 then LVLDESIR_v3C = 4;
else if LVLDESIR_v3 = 5 then LVLDESIR_v3C = 5;
*CREATE SUMMED SCORES;

SEXSATTOTAL_V1 = SUM(SATISSEXC, SATSEXLIC, SATSEXREC);
SEXSATTOTAL_V2 = SUM(SATISSEX_V2C, SATSEXLI_V2C, SATSEXRE_V2C);
SEXSATTOTAL_V3 = SUM(SATISSEX_V3C, SATSEXLI_V3C, SATSEXRE_V3C);

ERECTDYSF_V1 = SUM(PENETRATC,MNTNRCTC,DIFFMNTNC);     *confident
ERECTDYSF_V2 = SUM(PENETRAT_V2C,MNTNRCT_V2C,DIFFMNTN_V2C);
ERECTDYSF_V3 = SUM(PENETRAT_V3C,MNTNRCT_V3C,DIFFMNTN_V3C);


SexDesir_v1 = sum(OFTDESIRC, LVLDESIRC);
SexDesir_v2 = sum(OFTDESIR_v2C, LVLDESIR_v2C);
SexDesir_V3= sum(OFTDESIR_v3C, LVLDESIR_v3C);

*WITHIN-PERSON CENTERING;

SEXSATTOTAL_v1bpc = SEXSATTOTAL_v1 - SEXSATTOTAL_v1;
SEXSATTOTAL_v2bpc = SEXSATTOTAL_v2 - SEXSATTOTAL_v1;
SEXSATTOTAL_v3bpc = SEXSATTOTAL_v3 - SEXSATTOTAL_v1;
SexDesir_v1bpc = SexDesir_v1 - SexDesir_v1;
SexDesir_v2bpc = SexDesir_v2 - SexDesir_v1;
SexDesir_v3bpc = SexDesir_v3 - SexDesir_v1;


ERECTDYSF_v1bpc = ERECTDYSF_v1 - ERECTDYSF_v1;
ERECTDYSF_v2bpc = ERECTDYSF_v2 - ERECTDYSF_v1;
ERECTDYSF_v3bpc = ERECTDYSF_v3 - ERECTDYSF_v1;


*grand mean centering on baseline values;
SEXSATTOTAL_v1bgmc = SEXSATTOTAL_v1 - 10.28;
SexDesir_v1bgmc = SexDesir_v1 - 6.75;
ERECTDYSF_V1BGMC = ERECTDYSF_V1 - 13.20;


EDYN2_v1 = ED_CSM;
EDYN2_v2 = .;
if EDYN_v2 = 1 then EDYN2_v2 = 1;
else if EDYN_v2 = 2 then EDYN2_v2 = 0;
EDYN2_v3 = .;
if EDYN_v3 = 1 then EDYN2_v3 = 1;
else if EDYN_v3 = 2 then EDYN2_v3 = 0;

*Making baseline variables;
SEXSATTOTALb = SEXSATTOTAL_v1;
SexDesirb = SexDesir_v1;
EDYN2b = EDYN2_v1;
ERECTDYSFB = ERECTDYSF_v1;

RUN;

 libname sex 'L:\Sexual Satisfaction and Cognition\Sexual Satisfaction' ;
RUN;

PROC SORT DATA = sex.sexlong06212021;
by vetsaid;
run;


TITLE "SPEED GROWTH MODEL CENTERED AT 61";
PROC MIXED DATA= sex.sexlong06252021 NOCLPRINT COVTEST METHOD = ML;
where SEXSAT_VALID>1;
CLASS VETSAID CASE;
MODEL SPEED = age_c  WNW TEDALL INCOME ALC_CAT bmi COMMITTED ATTSEX SEXDESIR  AnyADMed CVDtotal cesd COMMITTED anyEDdrglong frailty SF36PF_LONG/SOLUTION
 DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
RUN;


TITLE "SPEED GROWTH MODEL CENTERED AT 61";
PROC MIXED DATA= sex.sexlong06252021 NOCLPRINT COVTEST METHOD = ML;
where SEXSAT_VALID>1;
CLASS VETSAID CASE;
MODEL COMMONEF = age_c  WNW TEDALL INCOME ALC_CAT bmi COMMITTED ATTSEX SEXDESIR  AnyADMed CVDtotal cesd COMMITTED anyEDdrglong frailty SF36PF_LONG/SOLUTION
 DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
RUN;






proc Sgplot DATA = sex.sexlong06222021;
 series x=age_c y=SEXSATTOTAL_BPC / group=VETSAID markers;
run;


proc Sgplot DATA = sex.sexlong06252021;
 series x=AGE_C y=ERECTILE_FX_BPC / group=VETSAID markers;
run;



TITLE "SPEED - COVARIATE MODEL";
PROC MIXED DATA= sex.sexlong06252021 NOCLPRINT COVTEST METHOD = ML;
where SEXSAT_VALID>1;
CLASS VETSAID CASE;
MODEL SPEED = age_c  WNW TEDALL INCOME COMMITTED ATTSEX SEXDESIR CVDtotal CURSMOKE  ALC_CAT  SF36PF_LONG
 bmi frailty  cesd  AnyADMed anyEDdrglong /SOLUTION
 DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
RUN;



TITLE "EF - COVARIATE MODEL";
PROC MIXED DATA= sex.sexlong06252021 NOCLPRINT COVTEST METHOD = ML;
where SEXSAT_VALID>1;
CLASS VETSAID CASE;
MODEL COMMONEF = age_c  WNW TEDALL INCOME COMMITTED ATTSEX SEXDESIR CVDtotal CURSMOKE  ALC_CAT  SF36PF_LONG
 bmi frailty  cesd  AnyADMed anyEDdrglong /SOLUTION
 DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
RUN;
