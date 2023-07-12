#*******************************************************************************
# This file is slightly modified from "data.R" file which came with the NLSY97
#   data download. I mostly removed some functions/code that I didn't need.
# Recall that when I downloaded the data, I called the file "data", so you may
#   need to adjust the file name as necessary.
#*******************************************************************************

################################################################################
### PART 1: IMPORT DATA
################################################################################

# Import tidyr
library(tidyr)

# Set working directory
setwd("./../Data/")

nlsy97 <- read.table('data.dat', sep=' ')
names(nlsy97) <- c('R0000100',
'R0068900',
'R0069000',
'R0069100',
'R0069200',
'R0069300',
'R0069400',
'R0069500',
'R0069600',
'R0069700',
'R0069800',
'R0069900',
'R0070000',
'R0070300',
'R0070400',
'R0070500',
'R0070600',
'R0070700',
'R0070800',
'R0070900',
'R0071000',
'R0071100',
'R0324100',
'R0325700',
'R0325800',
'R0325900',
'R0327500',
'R0327600',
'R0356500',
'R0356800',
'R0357100',
'R0357200',
'R0357500',
'R0357600',
'R0357700',
'R0357800',
'R0443900',
'R0444000',
'R0444100',
'R0536300',
'R0536401',
'R0536402',
'R1194100',
'R1204900',
'R1205500',
'R1235800',
'R1302600',
'R1302700',
'R1482600',
'R2553500',
'R2563500',
'R2563800',
'R3876300',
'R3885100',
'R3885400',
'R5453700',
'R5464300',
'R5464600',
'R7216000',
'R7228000',
'R7228300',
'S1531400',
'S1541900',
'S1542200',
'S2001000',
'S2011700',
'S2012000',
'S2012201',
'S3801100',
'S3812500',
'S3813500',
'S3813701',
'S5401000',
'S5412900',
'S5413100',
'S5413300',
'S7501200',
'S7513800',
'S7514000',
'S7514200',
'T0008500',
'T0014200',
'T0014400',
'T0014600',
'T2011100',
'T2016300',
'T2016500',
'T2016700',
'T3601500',
'T3606600',
'T3606800',
'T3607000')

# Use qnames rather than rnums
qnames = function(data) {
names(data) <- c("PUBID_1997",
"YSCH-35900_1997",
"YSCH-36000_1997",
"YSCH-36100_1997",
"YSCH-36200_1997",
"YSCH-36300_1997",
"YSCH-36400_1997",
"YSCH-36500_1997",
"YSCH-36600_1997",
"YSCH-36700_1997",
"YSCH-36800_1997",
"YSCH-36900_1997",
"YSCH-37000_1997",
"YPRS-600_1997",
"YPRS-700_1997",
"YPRS-800_1997",
"YPRS-900_1997",
"YPRS-1000_1997",
"YPRS-1100_1997",
"YPRS-1200_1997",
"YPRS-1300_1997",
"YPRS-1400_1997",
"YSAQ-013_1997",
"YSAQ-032_1997",
"YSAQ-033_1997",
"YSAQ-034_1997",
"YSAQ-053_1997",
"YSAQ-054_1997",
"YSAQ-343_1997",
"YSAQ-346_1997",
"YSAQ-349_1997",
"YSAQ-350_1997",
"YSAQ-354_1997",
"YSAQ-355_1997",
"YSAQ-356_1997",
"YSAQ-357_1997",
"YSAQ-517_1997",
"YSAQ-518_1997",
"YSAQ-519_1997",
"KEY_SEX_1997",
"KEY_BDATE_M_1997",
"KEY_BDATE_Y_1997",
"CV_AGE_INT_DATE_1997",
"CV_HH_POV_RATIO_1997",
"CV_HH_UNDER_18_1997",
"CV_SAMPLE_TYPE_1997",
"CV_HGC_RES_DAD_1997",
"CV_HGC_RES_MOM_1997",
"KEY_RACE_ETHNICITY_1997",
"CV_AGE_INT_DATE_1998",
"CV_HH_POV_RATIO_1998",
"CV_HH_UNDER_18_1998",
"CV_AGE_INT_DATE_1999",
"CV_HH_POV_RATIO_1999",
"CV_HH_UNDER_18_1999",
"CV_AGE_INT_DATE_2000",
"CV_HH_POV_RATIO_2000",
"CV_HH_UNDER_18_2000",
"CV_AGE_INT_DATE_2001",
"CV_HH_POV_RATIO_2001",
"CV_HH_UNDER_18_2001",
"CV_AGE_INT_DATE_2002",
"CV_HH_POV_RATIO_2002",
"CV_HH_UNDER_18_2002",
"CV_AGE_INT_DATE_2003",
"CV_HH_POV_RATIO_2003",
"CV_HH_UNDER_18_2003",
"CV_HIGHEST_DEGREE_EVER_EDT_2003",
"CV_AGE_INT_DATE_2004",
"CV_HH_POV_RATIO_2004",
"CV_HH_UNDER_18_2004",
"CV_HIGHEST_DEGREE_EVER_EDT_2004",
"CV_AGE_INT_DATE_2005",
"CV_HH_POV_RATIO_2005",
"CV_HH_UNDER_18_2005",
"CV_HIGHEST_DEGREE_EVER_EDT_2005",
"CV_AGE_INT_DATE_2006",
"CV_HH_POV_RATIO_2006",
"CV_HH_UNDER_18_2006",
"CV_HIGHEST_DEGREE_EVER_EDT_2006",
"CV_AGE_INT_DATE_2007",
"CV_HH_POV_RATIO_2007",
"CV_HH_UNDER_18_2007",
"CV_HIGHEST_DEGREE_EVER_EDT_2007",
"CV_AGE_INT_DATE_2008",
"CV_HH_POV_RATIO_2008",
"CV_HH_UNDER_18_2008",
"CV_HIGHEST_DEGREE_EVER_EDT_2008",
"CV_AGE_INT_DATE_2009",
"CV_HH_POV_RATIO_2009",
"CV_HH_UNDER_18_2009",
"CV_HIGHEST_DEGREE_EVER_EDT_2009")
return(data)
}

nlsy97 <- qnames(nlsy97)

################################################################################
##### PART 2A: CLEAN DATA (CONTROL VARIABLES)
### NOTE: Code like "nlsy97 <- nlsy97[, -grep("COLNAME", colnames(nlsy97))]"
###       simply removes COLNAME from the DataFrame, once we're done using it.
### NOTE: "Missing" variables are those that are coded as: 
###       -1 (Refusal), -2 (Don't Know), -3 (Invalid Skip), 
###       -4 (Valid Skip), -5 (non-Interview)
################################################################################

##### PUBID_1997: 
colnames(nlsy97)[colnames(nlsy97) == "PUBID_1997"] <- "ID" #rename

##### KEY_SEX_1997
### Currently coded (1, 2) = (Male, Female). Swap to (0, 1).
nlsy97$KEY_SEX_1997 <- nlsy97$KEY_SEX_1997 - 1
colnames(nlsy97)[colnames(nlsy97) == "KEY_SEX_1997"] <- "sex"

##### KEY_RACE_ETHNICITY_1997
### Convert to Booleans: isBlack, isHispanic. Base therefore will be: "is non-Black and non-Hispanic"
nlsy97$isBlack <- 0
nlsy97$isHispanic <- 0
nlsy97$isBlack[nlsy97$KEY_RACE_ETHNICITY_1997 == 1] <- 1
nlsy97$isHispanic[nlsy97$KEY_RACE_ETHNICITY_1997 == 2] <- 1
nlsy97 <- nlsy97[, -grep("KEY_RACE_ETHNICITY_1997", colnames(nlsy97))] #drop

##### KEY_BDATE_M_1997, KEY_BDATE_Y_1997
### Drop Birth Month (no need), rename Birth Year. 
nlsy97 <- nlsy97[, -grep("KEY_BDATE_M_1997", colnames(nlsy97))] #no need
colnames(nlsy97)[colnames(nlsy97) == "KEY_BDATE_Y_1997"] <- "birthYear"

##### CV_HGC_RES_DAD, CV_HGC_RES_MOM
### Generate "maxParentEducation" variable, equal to highest grade either (residential) parent achieved. 
### Replace "95" coded value with 0; missing (valid skip) = 0, missing (invalid skip) = 12 (mode, safe assumption).  
nlsy97$CV_HGC_RES_DAD_1997[nlsy97$CV_HGC_RES_DAD_1997 == -4] <- 0
nlsy97$CV_HGC_RES_DAD_1997[nlsy97$CV_HGC_RES_DAD_1997 == -3] <- 12
nlsy97$CV_HGC_RES_DAD_1997[nlsy97$CV_HGC_RES_DAD_1997 == 95] <- 0
nlsy97$CV_HGC_RES_MOM_1997[nlsy97$CV_HGC_RES_MOM_1997 == -4] <- 0
nlsy97$CV_HGC_RES_MOM_1997[nlsy97$CV_HGC_RES_MOM_1997 == -3] <- 12
nlsy97$CV_HGC_RES_MOM_1997[nlsy97$CV_HGC_RES_MOM_1997 == 95] <- 0
nlsy97$maxParentEducation <- pmax(nlsy97$CV_HGC_RES_DAD_1997, nlsy97$CV_HGC_RES_MOM_1997) #pmax for parallel maximum
nlsy97 <- nlsy97[, -grep("CV_HGC_RES_(MOM|DAD)_1997", colnames(nlsy97))]

##### Ratio HH Income/Poverty + Number of Siblings. "By Age 18" variables (<= Age 18)
idColumn <- grep("^ID$", colnames(nlsy97))
ageColumns <- grep("CV_AGE_INT_DATE_*", colnames(nlsy97))
ratioColumns <- grep("CV_HH_POV_RATIO_*", colnames(nlsy97))
siblingColumns <- grep("CV_HH_UNDER_18_*", colnames(nlsy97))

#pivot_longer is a function to convert from Wide to Long
byAge18 <- pivot_longer(nlsy97[, c(idColumn, ageColumns, ratioColumns, siblingColumns)], 
                        cols_vary = "slowest", matches("[12][09][09][0-9]$"), 
                        names_to = c(".value", "year"), names_pattern = "(.*)_([12][09][09][0-9])$")
byAge18 <- byAge18[(byAge18$CV_AGE_INT_DATE <= 18) & (byAge18$CV_AGE_INT_DATE > 0), ] #keep rows where <= Age 18; drop -5 rows (non-interview)

#Get the max value of # of under-18 kids for each ID, up to age 18 (inclusive). 
#Note that hasSibling counts strict <18, so can have some 0's where youth is 18 and only child. 
byAge18$hasSibling <- ave(byAge18$CV_HH_UNDER_18, byAge18$ID, FUN = max)
byAge18$hasSibling[byAge18$hasSibling <= 1] <- 0 #if max value is 1 (or 0), then only child. 
byAge18$hasSibling[byAge18$hasSibling > 1] <- 1 #if 2 or more, then has a sibling. 

#Keep rows where Ratio non-missing (if data present, this value is >= 0). 
#Cuts # of people from 8984 to 7596 (length(unique(byAge18$ID))) 
byAge18 <- byAge18[!(byAge18$CV_HH_POV_RATIO < 0), ]
byAge18$avgPovertyRatio18 <- ave(byAge18$CV_HH_POV_RATIO, byAge18$ID) #by ID, generate the mean (default "ave()" behavior) of the HH_POV_RATIO
### Note: No issue here with someone being the same age (e.g. 18) across two rounds, because we take average across "survey years"; it evens out.
byAge18$avgPovertyRatio18 <- byAge18$avgPovertyRatio18/100 #codebook says these values have 2 implied decimal places, so /100

# Create logAvgRatioPoverty18 (log of avgRatioPoverty18), replacing values where ratio = 0 with ratio = 0.01 (since we /100 already above)
byAge18$logAvgPovertyRatio18 <- byAge18$avgPovertyRatio18
byAge18$logAvgPovertyRatio18[byAge18$logAvgPovertyRatio18 == 0] <- 0.01
byAge18$logAvgPovertyRatio18 <- log(byAge18$logAvgPovertyRatio18)

# Create inPoverty24, a boolean of whether in poverty at age 24
byAge18$inPoverty18 <- byAge18$avgPovertyRatio18
byAge18$inPoverty18[byAge18$inPoverty18 <= 1] <- 0 #code "wrong way" first for easy subset
byAge18$inPoverty18[byAge18$inPoverty18 > 1] <- 1
byAge18$inPoverty18 <- 1 - byAge18$inPoverty18 #reverse

byAge18 <- subset(byAge18, select = c("ID", "hasSibling", "avgPovertyRatio18", "logAvgPovertyRatio18", "inPoverty18"))
byAge18 <- byAge18[!duplicated(byAge18), ] #drop duplicate rows. byAge18 is ready to merge with nlsy97.

################################################################################
##### PART 2B: CLEAN DATA (OUTCOME VARIABLES)
### Note: These are all "By Age 24" variables (<= Age 24)
################################################################################

idColumn <- grep("^ID$", colnames(nlsy97))
ageColumns <- grep("CV_AGE_INT_DATE_*", colnames(nlsy97))
degreeColumns <- grep("CV_HIGHEST_DEGREE_EVER_EDT_*", colnames(nlsy97))
ratioColumns <- grep("CV_HH_POV_RATIO_*", colnames(nlsy97))

byAge24 <- pivot_longer(nlsy97[, c(idColumn, ageColumns, degreeColumns, ratioColumns)], 
                        cols_vary = "slowest", matches("[12][09][09][0-9]$"), 
                        names_to = c(".value", "year"), names_pattern = "(.*)_([12][09][09][0-9])$")
byAge24$maxAge <- ave(byAge24$CV_AGE_INT_DATE, byAge24$ID, FUN = max) #generate maximum age

# There are some people who do not provide Income information at age 24, but do for age 23. 
# If Ratio is missing at Age 24, then I replace with the value for Age 23 if possible (but only for this case; will not use Age 22 to fill Age 23 to fill Age 24, etc.)
byAge24 <- byAge24[(byAge24$CV_AGE_INT_DATE <= 24) & (byAge24$CV_AGE_INT_DATE >= 23) & (byAge24$maxAge >= 24), ] #maxAge to make sure they are present at least at Age 24
byAge24$maxHHRatio <- ave(byAge24$CV_HH_POV_RATIO, byAge24$ID, FUN = max) #get max Ratio from Age 23 and 24 (by ID), in case non-interview at age 24
byAge24 <- byAge24[byAge24$CV_AGE_INT_DATE == 24, ] #now, only keep when age = 24

# sometimes, because interviews are not at the same time each year, a person is 24 over two successive rounds. Keep the "later" round's responses.
byAge24$maxYear <- ave(byAge24$year, byAge24$ID, FUN = max)
byAge24 <- byAge24[byAge24$year == byAge24$maxYear, ]
byAge24$povertyRatio24 <- byAge24$CV_HH_POV_RATIO #set povertyRatio24 to be the HH_POV_RATIO (at age 24)

# if Ratio is missing at age 24, replace with maxHHRatio (max of Ratio between ages 23-24; if non-missing at age 23, then it will carry forward)
# if missing at age 23 as well, povertyRatio24 will continue to be negative, which we will end up dropping
byAge24$povertyRatio24[byAge24$povertyRatio24 < 0] <- byAge24$maxHHRatio[byAge24$povertyRatio24 < 0]
byAge24 <- byAge24[byAge24$povertyRatio24 >= 0, ] #keep non-missing rows, based on poverty data at age 24
byAge24$povertyRatio24 <- byAge24$povertyRatio24/100 #codebook says these values have 2 implied decimal places, so /100

# Create logPovertyRatio24 (log of povertyRatio24), replacing values where ratio = 0 with ratio = 0.01 (since we /100 already above)
byAge24$logPovertyRatio24 <- byAge24$povertyRatio24
byAge24$logPovertyRatio24[byAge24$logPovertyRatio24 == 0] <- 0.01
byAge24$logPovertyRatio24 <- log(byAge24$logPovertyRatio24)

# Create inPoverty24, a boolean of whether in poverty at age 24
byAge24$inPoverty24 <- byAge24$povertyRatio24 
byAge24$inPoverty24[byAge24$inPoverty24 <= 1] <- 0 #code "wrong way" first for easy subset
byAge24$inPoverty24[byAge24$inPoverty24 > 1] <- 1
byAge24$inPoverty24 <- 1 - byAge24$inPoverty24 #reverse

# Create college24 for whether graduated college with Bachelor's Degree at age 24
# Unlike Income, the Highest_Degree_Ever variable is a running tally, and is maintained even if non-response
byAge24 <- byAge24[byAge24$CV_HIGHEST_DEGREE_EVER_EDT >= 0, ] # First, drop if invalid skip (keep if valid response)
byAge24$college24 <- 0
byAge24$college24[byAge24$CV_HIGHEST_DEGREE_EVER_EDT >= 4] <- 1 #CV_HIGHEST_DEGREE_EVER_EDT >= 4 is Bachelor's or above

# byAge24 is ready to merge with nlsy97. 
byAge24 <- subset(byAge24, select = c("ID", "povertyRatio24", "logPovertyRatio24", "inPoverty24", "college24")) #6493 remaining in dataset

################################################################################
##### PART 2Ci: CLEAN DATA (INDEPENDENT VARIABLES: FAMILY)
### Note: I will interact some of these variables with "Lives with Mom/Dad", so 
###   coding Valid Skips (i.e. no live with Mom and/or Dad) as 0 doesn't matter. 
###   Just don't interpret the "cleaned" data without being aware of this!
################################################################################

##### YSAQ-013, YSAQ-034: Live with Mom, Live with Dad
### Note: This is "Residential Mom/Dad Figure". In other words, "Nurture" > "Nature"

# Replace missing with 0 (if refuse/don't know/invalid skip, likely to be no).
nlsy97$`YSAQ-013_1997`[nlsy97$`YSAQ-013_1997` < 0] <- 0
nlsy97$`YSAQ-034_1997`[nlsy97$`YSAQ-034_1997` < 0] <- 0
colnames(nlsy97)[colnames(nlsy97) == "YSAQ-013_1997"] <- "livesWithMom"
colnames(nlsy97)[colnames(nlsy97) == "YSAQ-034_1997"] <- "livesWithDad"

##### YSAQ-032, YSAQ-053: Supportive Mom, Supportive Dad
### Note: Replace other skips with 2 (middle) by default. 
###   Only ~10 non-valid skips, so not a big deal.
colnames(nlsy97)[colnames(nlsy97) == "YSAQ-032_1997"] <- "momSupport"
nlsy97$momSupport[nlsy97$momSupport == -4] <- 0 
nlsy97$momSupport[nlsy97$momSupport < 0] <- 2
nlsy97$momSupport <- 3 - nlsy97$momSupport #reverse-code so that 0 = Not Supportive, 1 = Somewhat Supportive, 2 = Very Supportive
nlsy97$momSupport[nlsy97$momSupport == 3] <- 0 #fix the 0's from above so that they are back to 0 after reverse-coding

colnames(nlsy97)[colnames(nlsy97) == "YSAQ-053_1997"] <- "dadSupport"
nlsy97$dadSupport[nlsy97$dadSupport == -4] <- 0
nlsy97$dadSupport[nlsy97$dadSupport < 0] <- 2
nlsy97$dadSupport <- 3 - nlsy97$dadSupport 
nlsy97$dadSupport[nlsy97$dadSupport == 3] <- 0 

##### YSAQ-033, YSAQ-054: Strict Mom, Strict Dad
### Note: Replace other skips with 2 (Strict) by default (decline to answer more likely because don't want to say Strict)
###   Only ~30 non-valid skips, so not a big deal.
colnames(nlsy97)[colnames(nlsy97) == "YSAQ-033_1997"] <- "momStrict"
nlsy97$momStrict[nlsy97$momStrict == -4] <- 0
nlsy97$momStrict[nlsy97$momStrict < 0] <- 2 
nlsy97$momStrict <- nlsy97$momStrict - 1 #reverse-code so that 0 = Permissive, 1 = Strict
nlsy97$momStrict[nlsy97$momStrict < 0] <- 0 #old 0's became -1, change back to 0.

colnames(nlsy97)[colnames(nlsy97) == "YSAQ-054_1997"] <- "dadStrict" 
nlsy97$dadStrict[nlsy97$dadStrict == -4] <- 0
nlsy97$dadStrict[nlsy97$dadStrict < 0] <- 2 
nlsy97$dadStrict <- nlsy97$dadStrict - 1 
nlsy97$dadStrict[nlsy97$dadStrict < 0] <- 0 

##### YSAQ-517, YSAQ-518, YSAQ-519: Safe Childhood Environment Variables
### Note: Decide to code that if any of these questions are 1 (True), Childhood Environment is not considered "safe".
### Note: Assume missing means it wasn't safe (otherwise, no reason not to say that it was safe)
nlsy97$safeEnv <- apply(nlsy97[, grep("YSAQ-(517|518|519)_1997", colnames(nlsy97))], 1, max)
nlsy97$safeEnv[nlsy97$safeEnv < 0] <- 1
nlsy97$safeEnv <- 1 - nlsy97$safeEnv #reverse-code so that 1 = Safe Environment, 0 = Unsafe Environment
nlsy97 <- nlsy97[, -grep("YSAQ-(517|518|519)_1997", colnames(nlsy97))] #drop original question variables

################################################################################
##### PART 2Cii: CLEAN DATA (INDEPENDENT VARIABLES: PEERS/SCHOOL)
################################################################################

##### YSCH-35900, YSCH-360000, YSCH-36100: School Violence
### Replace "missing" values with 0. Combine into Boolean "schoolViolence", 1 if any > 0, 0 otherwise.
nlsy97$`YSCH-35900_1997`[nlsy97$`YSCH-35900_1997` < 0] <- 0 
nlsy97$`YSCH-36000_1997`[nlsy97$`YSCH-36000_1997` < 0] <- 0 
nlsy97$`YSCH-36100_1997`[nlsy97$`YSCH-36100_1997` < 0] <- 0
nlsy97$schoolViolence <- nlsy97$`YSCH-35900_1997` + nlsy97$`YSCH-36000_1997` + nlsy97$`YSCH-36100_1997`
nlsy97$schoolViolence[nlsy97$schoolViolence > 0] <- 1
nlsy97 <- nlsy97[, -grep("YSCH-(35900|36000|36100)_1997", colnames(nlsy97))] #drop original question variables

##### YSCH-36200: Late to School
### Replace "missing" values with mean. 
mean <- sum(nlsy97$`YSCH-36200_1997`[nlsy97$`YSCH-36200_1997` >= 0])/length(nlsy97$`YSCH-36200_1997`[nlsy97$`YSCH-36200_1997` >= 0])
nlsy97$`YSCH-36200_1997`[nlsy97$`YSCH-36200_1997` < 0] <- mean 
colnames(nlsy97)[colnames(nlsy97) == "YSCH-36200_1997"] <- "schoolLate"

##### YSCH-36300: Absent to School
### Replace "missing" values with mean. 
mean <- sum(nlsy97$`YSCH-36300_1997`[nlsy97$`YSCH-36300_1997` >= 0])/length(nlsy97$`YSCH-36300_1997`[nlsy97$`YSCH-36300_1997` >= 0])
nlsy97$`YSCH-36300_1997`[nlsy97$`YSCH-36300_1997` < 0] <- mean 
colnames(nlsy97)[colnames(nlsy97) == "YSCH-36300_1997"] <- "schoolAbsent"

##### YSCH-36400, YSCH-36500: Teacher Quality
### Replace "missing" values with 2 (Agree); mode value and close to mean of each question (1.98, 1.93)
### Sum up question response values, scale is 2-8, change to 0-6 for interpreting
nlsy97$`YSCH-36400_1997`[nlsy97$`YSCH-36400_1997` < 0] <- 2
nlsy97$`YSCH-36500_1997`[nlsy97$`YSCH-36500_1997` < 0] <- 2
nlsy97$teacherQuality <- nlsy97$`YSCH-36400_1997` + nlsy97$`YSCH-36500_1997` - 2 #change from 2-8 scale to 0-6
nlsy97$teacherQuality <- 6 - nlsy97$teacherQuality #reverse-code so that higher numbers = better quality
nlsy97 <- nlsy97[, -grep("YSCH-36(400|500)_1997", colnames(nlsy97))] #drop original question variables

##### YSCH-36600, YSCH-36700, YSCH-36800, YSCH-36900, YSCH-37000: School Environment
### Replace "missing" values with 2 (Agree); mode value and close to mean. 
### Reverse-code YSCH-36700, YSCH-36900, YSCH-37000 so that higher numbers = better quality
vars <- c("YSCH-36600_1997", "YSCH-36700_1997", "YSCH-36800_1997", "YSCH-36900_1997", "YSCH-37000_1997")
for (i in vars) {
  nlsy97[[i]][nlsy97[[i]] < 0] <- 2
}
nlsy97$`YSCH-36700_1997` <- 4 - nlsy97$`YSCH-36700_1997`
nlsy97$`YSCH-36900_1997` <- 4 - nlsy97$`YSCH-36900_1997`
nlsy97$`YSCH-37000_1997` <- 4 - nlsy97$`YSCH-37000_1997`
nlsy97$schoolEnvironment <- nlsy97$`YSCH-36600_1997` + nlsy97$`YSCH-36700_1997` + nlsy97$`YSCH-36800_1997` + nlsy97$`YSCH-36900_1997` + nlsy97$`YSCH-37000_1997`
nlsy97$schoolEnvironment <- nlsy97$schoolEnvironment - 5 #change from 5-20 scale to 0-15
nlsy97 <- nlsy97[, -grep("YSCH-3(6600|6700|6800|6900|7000)_1997", colnames(nlsy97))] #drop original question variables

### YPRS-600, YPRS-700, YPRS-800, YPRS-900, YPRS-1000, YPRS-1100, YPRS-1200, YPRS-1300, YPRS-1400: Peers Positive/Negative Influence
# Replace code values with percentages (1 = 0.05, 2 = 0.25, 3 = 0.5, 4 = 0.75, 5 = 0.95)
# Replace missing with mean, converted to percentage proportional to in-between values (e.g. 2.6 = 0.6 between 25% and 50% = 40%)
# Take average percentage of positive and negative peer behavior questions.

vars <- c("YPRS-600_1997", "YPRS-700_1997", "YPRS-800_1997", "YPRS-900_1997", 
          "YPRS-1000_1997", "YPRS-1100_1997", "YPRS-1200_1997", "YPRS-1300_1997", 
          "YPRS-1400_1997")
for (i in vars) {
  nlsy97[[i]][nlsy97[[i]] == 1] <- 0.05
  nlsy97[[i]][nlsy97[[i]] == 2] <- 0.25
  nlsy97[[i]][nlsy97[[i]] == 3] <- 0.5
  nlsy97[[i]][nlsy97[[i]] == 4] <- 0.75
  nlsy97[[i]][nlsy97[[i]] == 5] <- 0.95
}

# Mean Values taken from Codebook for each question (mean is reported)
nlsy97$`YPRS-600_1997`[nlsy97$`YPRS-600_1997` < 0] <- 0.4375
nlsy97$`YPRS-700_1997`[nlsy97$`YPRS-700_1997` < 0] <- 0.4025
nlsy97$`YPRS-800_1997`[nlsy97$`YPRS-800_1997` < 0] <- 0.285
nlsy97$`YPRS-900_1997`[nlsy97$`YPRS-900_1997` < 0] <- 0.675
nlsy97$`YPRS-1000_1997`[nlsy97$`YPRS-1000_1997` < 0] <- 0.168
nlsy97$`YPRS-1100_1997`[nlsy97$`YPRS-1100_1997` < 0] <- 0.6425
nlsy97$`YPRS-1200_1997`[nlsy97$`YPRS-1200_1997` < 0] <- 0.2725
nlsy97$`YPRS-1300_1997`[nlsy97$`YPRS-1300_1997` < 0] <- 0.3275
nlsy97$`YPRS-1400_1997`[nlsy97$`YPRS-1400_1997` < 0] <- 0.3525

nlsy97$pctPeersPositive <- (nlsy97$`YPRS-600_1997` + nlsy97$`YPRS-900_1997` 
                            + nlsy97$`YPRS-1100_1997` + nlsy97$`YPRS-1200_1997`)/4
nlsy97$pctPeersNegative <- (nlsy97$`YPRS-700_1997` + nlsy97$`YPRS-800_1997` 
                            + nlsy97$`YPRS-1000_1997` + nlsy97$`YPRS-1300_1997` 
                            + nlsy97$`YPRS-1400_1997`)/5
nlsy97 <- nlsy97[, -grep("YPRS-(600|700|800|900|1000|1100|1200|1300|1400)_1997", colnames(nlsy97))] #drop original question variables

################################################################################
##### PART 2Ciii: CLEAN DATA (INDEPENDENT VARIABLES: SELF)
### Note: "Self" variables are interacted with "isLessAge14R1", because only youth (Age <= 14) in Round 1 are asked these questions
###   I saw that there was one youth who somehow answered a few <= Age 14 questions
###   but manually confirmed that all youth with -4 in question YSAQ-357_1997 are (Age > 14), 
###   so use that as an indicator (3565 such Age > 15)
### Note: As with 2Ci note, changing "Valid Skip" to 0 won't be an issue since interaction, so be aware of this data quirk.
################################################################################

nlsy97$isLessAge14R1 <- 1
nlsy97$isLessAge14R1[nlsy97$`YSAQ-357_1997` == -4] <- 0

##### YSAQ-343, YSAQ-349: Female Lies/Cheats, Male Lies/Cheats
### Note: Female and Male asked this question separately, so combine. 
nlsy97$liesCheats <- pmax(nlsy97$`YSAQ-343_1997`, nlsy97$`YSAQ-349_1997`)

nlsy97$liesCheats[nlsy97$liesCheats == -4 ] <- 0 #Valid Skip replacement
# If the liesCheats is -1 or -2 or -3, replace with 1 (Sometimes True; middle option). Only a few replaces.
nlsy97$liesCheats[nlsy97$liesCheats < 0] <- 1
nlsy97 <- nlsy97[, -grep("YSAQ-(343|349)_1997", colnames(nlsy97))] #drop original question variables

##### YSAQ-346, YSAQ-350: Female Negative Emotions, Male Negative Emotions
### Note: Female and Male asked this question separately, so combine.
nlsy97$negativeEmotions <- pmax(nlsy97$`YSAQ-346_1997`, nlsy97$`YSAQ-350_1997`)
nlsy97$negativeEmotions[nlsy97$negativeEmotions == -4] <- 0
nlsy97$negativeEmotions[nlsy97$negativeEmotions < 0] <- 1
nlsy97 <- nlsy97[, -grep("YSAQ-(346|350)_1997", colnames(nlsy97))]

##### YSAQ-354, YSAQ-355, YSAQ-356, YSAQ-357: Positive/Optimistic Outlook
### In general, replace missing with 2.5 (middle value). Only a handful (~30-40) missing codes that are not "Valid Skip"
### Reverse-code YSAQ-355 and YSAQ-357 so that higher values = more optimistic/positive disposition
### Sum the scores as a "positiveOutlook" variable
nlsy97$`YSAQ-354_1997`[nlsy97$`YSAQ-354_1997` == -4] <- 0
nlsy97$`YSAQ-354_1997`[nlsy97$`YSAQ-354_1997` < 0] <- 2.5

nlsy97$`YSAQ-355_1997`[nlsy97$`YSAQ-355_1997` == -4] <- 0
nlsy97$`YSAQ-355_1997`[nlsy97$`YSAQ-355_1997` < 0] <- 2.5
nlsy97$`YSAQ-355_1997` <- 5 - nlsy97$`YSAQ-355_1997` #reverse-code
nlsy97$`YSAQ-355_1997`[nlsy97$`YSAQ-355_1997` == 5] <- 0 #reset Valid Skips to 0 value

nlsy97$`YSAQ-356_1997`[nlsy97$`YSAQ-356_1997` == -4] <- 0
nlsy97$`YSAQ-356_1997`[nlsy97$`YSAQ-356_1997` < 0] <- 2.5

nlsy97$`YSAQ-357_1997`[nlsy97$`YSAQ-357_1997` == -4] <- 0
nlsy97$`YSAQ-357_1997`[nlsy97$`YSAQ-357_1997` < 0] <- 2.5
nlsy97$`YSAQ-357_1997` <- 5 - nlsy97$`YSAQ-357_1997` #reverse-code
nlsy97$`YSAQ-357_1997`[nlsy97$`YSAQ-357_1997` == 5] <- 0 #reset Valid Skips to 0 value

nlsy97$positiveOutlook <- nlsy97$`YSAQ-354_1997` + nlsy97$`YSAQ-355_1997` + nlsy97$`YSAQ-356_1997` + nlsy97$`YSAQ-357_1997`
nlsy97$positiveOutlook <- nlsy97$positiveOutlook - 4 #rescale; minimum score = 4 --> minimum score = 0
nlsy97$positiveOutlook[nlsy97$positiveOutlook < 0] <- 0 #reset Valid Skips to 0 value

nlsy97 <- nlsy97[, -grep("YSAQ-35(4|5|6|7)_1997", colnames(nlsy97))] #drop original question variables 

################################################################################
##### PART 3: CLEANUP LEFTOVERS, MERGE nlsy97 WITH byAge18 AND byAge24, SAVE
################################################################################

##### Drop CV_SAMPLE_TYPE_1997, CV_AGE_INT_DATE_YYYY, CV_HH_UNDER_18_YYYY, CV_HH_POV_RATIO_YYYY, and CV_HIGHEST_DEGREE_EVER_EDT_YYYY
### Used in creating other variables in prior sections (except Sample Type; provided by default), but are not needed now
nlsy97 <- nlsy97[, -grep("^CV_(.*)_([12][90][90][0-9])$", colnames(nlsy97))]

##### Merge nlsy97 with byAge18 and byAge24; left join (keep all IDs from main data frame nlsy97)
### Note: We will end up dropping some rows from nlsy97 post-merge, 
###       because some IDs are dropped in byAge18 and/or byAge24 due to missing data
nlsy97 <- merge(x = nlsy97, y = byAge18, by = "ID", all.x = TRUE) #all.x = TRUE = left join
nlsy97 <- merge(x = nlsy97, y = byAge24, by = "ID", all.x = TRUE)

# Re-center Birth Year so coefficients/intercept not super weird.
nlsy97$birthYear <- nlsy97$birthYear - min(nlsy97$birthYear) #minimum BirthYear is 1980

##### Re-Order Columns
colOrder <- c("ID", "povertyRatio24", "logPovertyRatio24", "inPoverty24", "college24", 
              "sex", "birthYear", "isLessAge14R1", "isBlack", "isHispanic", "hasSibling", "maxParentEducation", 
              "avgPovertyRatio18", "logAvgPovertyRatio18", "inPoverty18",
              "livesWithMom", "momSupport", "momStrict", "livesWithDad", "dadSupport", "dadStrict", "safeEnv", 
              "pctPeersPositive", "pctPeersNegative", "schoolAbsent", "schoolLate", "schoolEnvironment", "schoolViolence", "teacherQuality", 
              "liesCheats", "negativeEmotions", "positiveOutlook")
nlsy97 <- nlsy97[, colOrder]

##### Drop if povertyRatio24 + college24 is NA, and if hasSibling is NA
### Note: The only NA we have in the data is due to "non-matches" from Left Join
nlsy97 <- nlsy97[complete.cases(nlsy97), ] #5753 rows left in dataset

##### Write out as a .csv
write.csv(nlsy97, ".\\NLSY97_CleanData.csv", row.names = FALSE)

##### Done!
print("Script Done!")
