LIBNAME SEX 'L:\Sexual Satisfaction and Cognition\Sexual Satisfaction' ;
RUN;

*TABLE 2;
TITLE "PREDICTING SEXUAL SATISFACTION";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL  SEXSATTOTAL = AGE_C  WNW INCOME  TEDALL COMMITTED   ERECTILE_FX_GMC ERECTILE_FX_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
ATTSEX EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "AGE"   AGE_C 1 / CL;
ESTIMATE "WNW"   WNW 1 / CL;
ESTIMATE "INCOME"   INCOME  1 / CL;
ESTIMATE "TEDALL"   TEDALL 1 / CL;
ESTIMATE "COMMITTED"  COMMITTED  1 / CL;
ESTIMATE "CESD"   CESD 1 / CL;
ESTIMATE "SF36PF_LONG"   SF36PF_LONG 1 / CL;
ESTIMATE "CVDTOTAL"  CVDTOTAL  1 / CL;
ESTIMATE "CHARLSON"   CHARLSON 1 / CL;
ESTIMATE "ALC_CAT"   ALC_CAT 1 / CL;
ESTIMATE "CURSMOKE"   CURSMOKE 1 / CL;
ESTIMATE "ATTSEX"   ATTSEX 1 / CL;
ESTIMATE "EDMED_ALT"   EDMED_ALT 1 / CL;
ESTIMATE "ADMED"   ADMED 1 / CL;
RUN;



TITLE "PREDICTING ERECTILE FUNCTION";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL  ERECTILE_FX= AGE_C  WNW INCOME  TEDALL COMMITTED
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
ATTSEX EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "AGE"   AGE_C 1 / CL;
ESTIMATE "WNW"   WNW 1 / CL;
ESTIMATE "INCOME"   INCOME  1 / CL;
ESTIMATE "TEDALL"   TEDALL 1 / CL;
ESTIMATE "COMMITTED"  COMMITTED  1 / CL;
ESTIMATE "CESD"   CESD 1 / CL;
ESTIMATE "SF36PF_LONG"   SF36PF_LONG 1 / CL;
ESTIMATE "CVDTOTAL"  CVDTOTAL  1 / CL;
ESTIMATE "CHARLSON"   CHARLSON 1 / CL;
ESTIMATE "ALC_CAT"   ALC_CAT 1 / CL;
ESTIMATE "CURSMOKE"   CURSMOKE 1 / CL;
ESTIMATE "ATTSEX"   ATTSEX 1 / CL;
ESTIMATE "EDMED_ALT"   EDMED_ALT 1 / CL;
ESTIMATE "ADMED"   ADMED 1 / CL;
RUN;




*TABLE 3;

*Sexual Satisfaction;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL C= AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC EDYN2_SUM SEXSATTOTAL_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;



*TABLE 3;

*Sexual Satisfaction;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL speed = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC EDYN2_SUM SEXSATTOTAL_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 2 ADJUSTMENT FOR SEXUAL CHARACTERISTICS";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL speed = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 ATTSEX /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 3 ADJUSTMENT FOR HEALTH AND MEDICATION USE";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL speed = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
ATTSEX EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;

RUN;




*Erectile Function;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL speed = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC|SEXSATTOTAL_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 2 ADJUSTMENT FOR SEXUAL CHARACTERISTICS";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL speed = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;


TITLE "ERECTILE FUNCTION AND SPEED - STEP 3 ADJUSTMENT FOR HEALTH AND MEDICATION USE";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL  speed = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE ATTSEX CURSMOKE
EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;


*****************************************;
COMMONEF
*****************************************;
*Sexual Satisfaction;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 2 ADJUSTMENT FOR SEXUAL CHARACTERISTICS";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 ATTSEX /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 3 ADJUSTMENT FOR HEALTH AND MEDICATION USE";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
ATTSEX EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;

RUN;




*Erectile Function;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 2 ADJUSTMENT FOR SEXUAL CHARACTERISTICS";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;


TITLE "ERECTILE FUNCTION AND SPEED - STEP 3 ADJUSTMENT FOR HEALTH AND MEDICATION USE";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL  COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE ATTSEX CURSMOKE
EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;





*****************************************;
**MEMORY;
*****************************************;
*Sexual Satisfaction;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 2 ADJUSTMENT FOR SEXUAL CHARACTERISTICS";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 ATTSEX /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 3 ADJUSTMENT FOR HEALTH AND MEDICATION USE";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
ATTSEX EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 / CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 / CL;
RUN;




*Erectile Function;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;

TITLE "ERECTILE FUNCTION AND SPEED - STEP 2 ADJUSTMENT FOR SEXUAL CHARACTERISTICS";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;


TITLE "ERECTILE FUNCTION AND SPEED - STEP 3 ADJUSTMENT FOR HEALTH AND MEDICATION USE";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL  MEMORY = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE ATTSEX CURSMOKE
EDMED_ALT ADMED /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 / CL;
ESTIMATE "WP  ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 / CL;
RUN;












*Sexual Satisfaction;
TITLE "ERECTILE FUNCTION AND SPEED - STEP 1 DEMOGRAPHIC ADJUSTMENT";
PROC MIXED DATA= SEX.SEXLONG07072021 NOCLPRINT COVTEST METHOD = ML;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 /SOLUTION DDFM=BETWITHIN;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE=VC;
RUN;











***********************************************;
*SPEED CI;
***********************************************;


**********************;
*SEXUAL SATISFACTION;
**********************;
TITLE "SEXUAL SATISFACTION PREDICTING MCI STEP 1";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL SPEED_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;

TITLE "SEXUAL SATISFACTION PREDICTING MCI";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL SPEED_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
ATTSEX
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;

TITLE "SEXUAL SATISFACTION PREDICTING MCI";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE SPEED_CI;
MODEL SPEED_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
ATTSEX CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
EDMED_ALT ADMED
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;



**********************;
*ERECTILE FUNCTION;
**********************;



TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 1 CONTROLLING FOR DEMOGRAPHICS";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL SPEED_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
 /DIST=POI LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;
RUN;

TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 2 CONTROLLING FOR SEXUAL ACTIVITIY";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL SPEED_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;

RUN;

TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 3 CONTROLLING FOR HEALTH AND MEDICATION USE";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL SPEED_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
EDMED_ALT ADMED
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;
RUN;








***********************************************;
*EXECUTIVE FUNCTION CI;
***********************************************;


**********************;
*SEXUAL SATISFACTION;
**********************;
TITLE "SEXUAL SATISFACTION PREDICTING MCI STEP 1";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;

TITLE "SEXUAL SATISFACTION PREDICTING MCI";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
ATTSEX
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;

TITLE "SEXUAL SATISFACTION PREDICTING MCI";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE SPEED_CI;
MODEL COMMONEF_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
ATTSEX CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
EDMED_ALT ADMED
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;



**********************;
*ERECTILE FUNCTION;
**********************;



TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 1 CONTROLLING FOR DEMOGRAPHICS";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;
RUN;

TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 2 CONTROLLING FOR SEXUAL ACTIVITIY";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;

RUN;

TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 3 CONTROLLING FOR HEALTH AND MEDICATION USE";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL COMMONEF_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
EDMED_ALT ADMED
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;
RUN;





***********************************************;
*MEMORY CI;
***********************************************;


**********************;
*SEXUAL SATISFACTION;
**********************;
TITLE "SEXUAL SATISFACTION PREDICTING MCI STEP 1";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;

TITLE "SEXUAL SATISFACTION PREDICTING MCI";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
ATTSEX
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;

TITLE "SEXUAL SATISFACTION PREDICTING MCI";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1;
CLASS VETSAID CASE SPEED_CI;
MODEL MEMORY_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED SEXSATTOTAL_BGMC SEXSATTOTAL_BPC
ATTSEX CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
EDMED_ALT ADMED
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP SEXUAL SATIFACTION"   SEXSATTOTAL_BGMC 1 /EXP CL;
ESTIMATE "WP SEXUAL SATIFACTION"   SEXSATTOTAL_BPC 1 /EXP CL;
RUN;



**********************;
*ERECTILE FUNCTION;
**********************;



TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 1 CONTROLLING FOR DEMOGRAPHICS";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;
RUN;

TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 2 CONTROLLING FOR SEXUAL ACTIVITIY";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;

RUN;

TITLE "ERECTILE FUNCTION PREDICTING MCI STEP 3 CONTROLLING FOR HEALTH AND MEDICATION USE";
PROC GLIMMIX DATA=SEX.SEXLONG07072021 METHOD= LAPLACE NOCLPRINT NOITPRINT;
WHERE MCICAT_B = 0 AND SEXSAT_VALID > 1 AND ERECTILE_FX_VALID > 1;
CLASS VETSAID CASE;
MODEL MEMORY_CI (DESCENDING) = AGE_C  WNW INCOME  TEDALL COMMITTED  ERECTILE_FX_GMC ERECTILE_FX_BPC
ATTSEX CESD SF36PF_LONG  CVDTOTAL CHARLSON ALC_CAT CURSMOKE
EDMED_ALT ADMED
 /DIST=BINARY LINK=LOGIT SOLUTION DDFM = BW;
RANDOM INTERCEPT/SUB=VETSAID(CASE) TYPE = UN;
ESTIMATE "BP ERECTILE FUNCTION"   ERECTILE_FX_GMC 1 /EXP CL;
ESTIMATE "WP ERECTILE FUNCTION"   ERECTILE_FX_BPC 1 /EXP CL;
RUN;













***************************************;
DESCRIPTIVES;
***************************************;


DATA SEX.SEXLONG07082021;
SET SEX.SEXLONG07072021;
MORBID = CHARLSON - CVDTOTAL;
CVDCAT = .;
IF CVDTOTAL = 0 THEN CVDCAT = 0;
IF CVDTOTAL = 1 THEN CVDCAT = 1;
IF CVDTOTAL >1 THEN CVDCAT = 2;

CHARLSONCAT = .;
IF CHARLSON = 0 THEN CHARLSONCAT= 0;
IF CHARLSON = 1 THEN CHARLSONCAT= 1;
IF CHARLSON >1 THEN CHARLSONCAT= 2;
RUN;



PROC FREQ DATA = SEX.SEXLONG07082021;
WHERE MCICAT_B = 0  AND SEXSATTOTAL NE . AND SEXSAT_VALID > 1 AND WAVE=1;
TABLE WNW COMMITTED SEXSATTOTAL_CI ERECTILEFX_CI SPEED_CI COMMONEF_CI MEMORY_CI
CVDCAT CHARLSONCAT CURSMOKE ALC_CAT EDMED_ALT ADMED ;
RUN;





PROC FREQ DATA = SEX.SEXLONG07082021;
WHERE MCICAT_B = 0  AND SEXSATTOTAL NE . AND SEXSAT_VALID > 1 AND WAVE=2;
TABLE WNW COMMITTED SEXSATTOTAL_CI ERECTILEFX_CI SPEED_CI COMMONEF_CI MEMORY_CI
CVDCAT CHARLSONCAT CURSMOKE ALC_CAT EDMED_ALT ADMED ;
RUN;




PROC FREQ DATA = SEX.SEXLONG07082021;
WHERE MCICAT_B = 0  AND SEXSATTOTAL NE . AND SEXSAT_VALID > 1 AND WAVE=3;
TABLE WNW COMMITTED SEXSATTOTAL_CI ERECTILEFX_CI SPEED_CI COMMONEF_CI MEMORY_CI
CVDCAT CHARLSONCAT CURSMOKE ALC_CAT EDMED_ALT ADMED ;
RUN;




PROC FREQ DATA = SEX.SEXLONG07072021;
WHERE MCICAT_B = 0 AND WAVE=2;
TABLE SEXSAT_VALID ERECTILE_FX_VALID;"

RUN;

DATA SEX.SEXLONG07072021;
SET SEX.SEXLONG07072021;
SEX_CAT = .;
IF SEXSATTOTAL_BPC < 0 THEN SEX_CAT = -1;
IF SEXSATTOTAL_BPC = 0 THEN SEX_CAT = 0;
IF SEXSATTOTAL_BPC > 0 THEN SEX_CAT = 1;
EF_CAT = .;
IF ERECTILE_FX_BPC < 0 THEN EF_CAT = -1;
IF ERECTILE_FX_BPC = 0 THEN EF_CAT = 0;
IF ERECTILE_FX_BPC > 0 THEN EF_CAT = 1;
RUN;


PROC FREQ DATA = SEX.SEXLONG07072021;
WHERE MCICAT_B = 0 AND WAVE=3;
TABLE SEX_CAT EF_CAT;
RUN;




PROC MEANS DATA = SEX.SEXLONG07082021 MEAN STDDEV MIN MAX N P25;
WHERE MCICAT_B = 0  AND SEXSATTOTAL NE . AND SEXSAT_VALID > 1 AND WAVE>1;
VAR AGE TEDALL INCOME SEXSATTOTAL_BPC ERECTILE_FX_BPC ATTSEX SPEED COMMONEF MEMORY
CESD SF36PF_LONG BMI;
RUN;






PROC MEANS DATA = SEX.SEXLONG07082021 MEAN STDDEV MIN MAX N;
WHERE MCICAT_B = 0  AND SEXSATTOTAL NE . AND SEXSAT_VALID > 1 AND WAVE=2;
VAR AGE TEDALL INCOME SEXSATTOTAL SEXSATTOTAL_BPC ERECTILE_FX ERECTILE_FX_BPC ATTSEX SPEED COMMONEF MEMORY
CESD SF36PF_LONG BMI;
RUN;



PROC MEANS DATA = SEX.SEXLONG07082021 MEAN STDDEV MIN MAX N;
WHERE MCICAT_B = 0  AND SEXSATTOTAL NE . AND SEXSAT_VALID > 1 AND WAVE=3;
VAR AGE TEDALL INCOME SEXSATTOTAL SEXSATTOTAL_BPC ERECTILE_FX ERECTILE_FX_BPC ATTSEX SPEED COMMONEF MEMORY
CESD SF36PF_LONG BMI;
RUN;







PROC MEANS DATA = SEX.SEXLONG07072021 MEAN STDDEV MIN MAX N;
WHERE MCICAT_B = 0 AND ERECTILE_FX_VALID > 1 AND SEXSAT_VALID > 1 AND WAVE=2;
VAR SEXSATTOTAL ERECTILE_FX ERECTILE_FX_GMC ERECTILE_FX_BPC;
RUN;


PROC MEANS DATA = SEX.SEXLONG07072021 MEAN STDDEV MIN MAX N;
WHERE MCICAT_B = 0 AND WAVE=2;
VAR  SEXSAT_VALID SEXSATTOTAL ERECTILE_FX ERECTILE_FX_GMC ERECTILE_FX_BPC;
RUN;





PROC MEANS DATA = SEX.SEXLONG07072021 N MEAN STDDEV MIN MAX ;
WHERE MCICAT_B = 0 AND ERECTILE_FX_VALID > 2 AND SEXSAT_VALID > 2 AND WAVE=2;
VAR SEXSAT_VALID ERECTILE_FX_GMC ERECTILE_FX_BPC;
RUN;


PROC MEANS DATA = SEX.SEXLONG07072021 N MEAN STDDEV MIN MAX ;
WHERE MCICAT_B = 0 AND ERECTILE_FX_VALID > 2 AND SEXSAT_VALID > 2 AND WAVE=3;
VAR SEXSAT_VALID ERECTILE_FX_GMC ERECTILE_FX_BPC;
RUN;
