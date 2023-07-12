#*******************************************************************************
# This file runs the Analysis, and should be run after running "cleanData.R". 
#*******************************************************************************

################################################################################
##### PART 1: Run Regressions 
################################################################################

library(stargazer)
nlsy97 <- read.csv(".\\NLSY97_CleanData.csv")

############################# COLLEGE REGRESSIONS ##############################
# College: Log: college24 on (All Other Variables; logAvgPovertyRatio18)
college_l <- glm(college24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                 + hasSibling + maxParentEducation + logAvgPovertyRatio18
                 + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                 + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                 + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                 + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                 + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                 data = nlsy97, family = binomial)
#summary(college_l)

# College: Indicator: college24 on (All Other Variables; inPoverty18)
college_i <- glm(college24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                 + hasSibling + maxParentEducation + inPoverty18
                 + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                 + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                 + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                 + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                 + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                 data = nlsy97, family = binomial)
#summary(college_i)

########################## POVERTY RATIO REGRESSIONS ###########################
# Ratio: Log-Log: logPovertyRatio24 on (All Other Variables; logAvgPovertyRatio18)
ratio_ll <- lm(logPovertyRatio24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
               + hasSibling + maxParentEducation + logAvgPovertyRatio18 
               + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
               + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
               + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
               + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
               + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
               data = nlsy97)
#summary(ratio_ll)

# Ratio: Log-Indicator: logPovertyRatio24 on (All Other Variables; inPoverty18)
ratio_li <- lm(logPovertyRatio24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
               + hasSibling + maxParentEducation + inPoverty18 
               + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
               + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
               + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
               + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
               + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
               data = nlsy97)
#summary(ratio_ll)

# Ratio: Indicator-Indicator: inPoverty24 on (All Other Variables; inPoverty18)
ratio_ii <- glm(inPoverty24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                + hasSibling + maxParentEducation + inPoverty18
                + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                data = nlsy97, family = binomial)
#summary(ratio_ii)

# Ratio: Indicator-Log: inPoverty24 on (All Other Variables; logAvgPovertyRatio18)
ratio_il <- glm(inPoverty24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                + hasSibling + maxParentEducation + logAvgPovertyRatio18
                + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                data = nlsy97, family = binomial)
#summary(ratio_ii)

##### Create Latex Code using `stargazer` package
### Long table, use Latex longtable package (manual code adjustments): 
### https://tex.stackexchange.com/questions/424435/help-with-long-table-from-stargazer

sg_ratio <- stargazer(ratio_ll, ratio_li, ratio_ii, ratio_il, title = "Ratio of Household Income to Poverty at Age 24", 
                      dep.var.caption = "", font.size = "small", column.sep.width = "3pt",
                      intercept.top = TRUE, intercept.bottom = FALSE, keep.stat = c("n", "rsq", "adj.rsq"), align = TRUE)

sg_college <- stargazer(college_l, college_i, title = "Results (Bachelor's Degree at Age 24)", 
                        dep.var.caption = "", font.size = "small", column.sep.width = "3pt",
                        intercept.top = TRUE, intercept.bottom = FALSE, model.names = TRUE, multicolumn = FALSE, keep.stat = c("n", "ll"), align = TRUE)

################################################################################
##### PART 4: Prediction
################################################################################

# Run OLS, Ridge, and Lasso for Prediction. 
# I use college24 as my response, and inPoverty18 as the "_poverty18" covariate
# Code inspiration from: 
# https://rforhr.com/kfold.html

library(caret)
set.seed(322)

s <- sample(nrow(nlsy97), size = 0.8 * nrow(nlsy97))
train <- nlsy97[s, ]
test <- nlsy97[-s, ]
train$college24[train$college24 == 1] <- "hasBachelorDegree"
train$college24[train$college24 == 0] <- "noBachelorDegree"
test$college24[test$college24 == 1] <- "hasBachelorDegree"
test$college24[test$college24 == 0] <- "noBachelorDegree"
train$college24 <- factor(train$college24, levels = c("noBachelorDegree", "hasBachelorDegree"))
test$college24 <- factor(test$college24, levels = c("noBachelorDegree", "hasBachelorDegree"))

##### Use college24
### OLS
ctrl <- trainControl(method = "cv", number = 10, classProbs = TRUE, savePredictions = TRUE, 
                     summaryFunction = twoClassSummary) 
train_ols <- train(college24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                   + hasSibling + maxParentEducation + inPoverty18
                   + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                   + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                   + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                   + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                   + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                   data = train, method = "glm", family = binomial, trControl = ctrl, metric = "ROC") #use ROC as loss metric
#print(train_ols)

# We can run a naive prediction without changing the default prediction threshold. 
predictions_ols <- predict(train_ols, newdata = test)
confusionMatrix(data = predictions_ols, test$college24, mode = "everything", positive = "hasBachelorDegree")

#Train the threshold
thrsh_df_ols <- thresholder(train_ols, seq(0.01, 0.99, by = 0.01), final = TRUE) #needs savePredictions = TRUE
thrsh_ols <- thrsh_df_ols$prob_threshold[thrsh_df_ols$F1 == max(thrsh_df_ols$F1)] #pick threshold value by maximizing F1
#Now, we predict using this new threshold. 
predictions_ols_thrsh <- factor(ifelse(predict(train_ols, newdata = test, type = "prob")[, "hasBachelorDegree"] >= thrsh_ols, 
                                       "hasBachelorDegree", "noBachelorDegree"), levels = c("noBachelorDegree", "hasBachelorDegree"))
confusionMatrix(data = predictions_ols_thrsh, test$college24, mode = "everything", positive = "hasBachelorDegree")

### Ridge
train_ridge <- train(college24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                     + hasSibling + maxParentEducation + inPoverty18
                     + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                     + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                     + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                     + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                     + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                     data = train, method = "glmnet", trControl = ctrl, metric = "ROC", 
                     tuneGrid = expand.grid(alpha = 0, lambda = 10^seq(4, -4, length = 50))) #alpha = 0 is Ridge
#print(train_ridge)
#coef(train_ridge$finalModel, train_ridge$bestTune$lambda)

# Naive prediction
predictions_ridge <- predict(train_ridge, newdata = test)
confusionMatrix(data = predictions_ridge, test$college24, mode = "everything", positive = "hasBachelorDegree")
# Doing better with threshold training?
#thrsh_df_ridge <- thresholder(train_ridge, seq(0.01, 0.99, by = 0.01), final = TRUE) #needs savePredictions = TRUE
#thrsh_ridge <- thrsh_df_ridge$prob_threshold[thrsh_df_ridge$F1 == max(thrsh_df_ridge$F1)] #pick threshold value by maximizing F1
#Now, we predict using this new threshold. 
#predictions_ridge_thrsh <- factor(ifelse(predict(train_ridge, newdata = test, type = "prob")[, "hasBachelorDegree"] >= thrsh_ridge, 
#                                         "hasBachelorDegree", "noBachelorDegree"), levels = c("noBachelorDegree", "hasBachelorDegree"))
#confusionMatrix(data = predictions_ridge_thrsh, test$college24, mode = "everything", positive = "hasBachelorDegree")

### LASSO
train_lasso <- train(college24 ~ sex + birthYear + isLessAge14R1 + isBlack + isHispanic
                     + hasSibling + maxParentEducation + inPoverty18
                     + livesWithMom + livesWithMom:momSupport + livesWithMom:momStrict 
                     + livesWithDad + livesWithDad:dadSupport + livesWithDad:dadStrict
                     + safeEnv + pctPeersPositive + pctPeersNegative + schoolAbsent
                     + schoolLate + schoolEnvironment + schoolViolence + teacherQuality
                     + liesCheats:isLessAge14R1 + negativeEmotions:isLessAge14R1 + positiveOutlook:isLessAge14R1, 
                     data = train, method = "glmnet", trControl = ctrl, metric = "ROC", 
                     tuneGrid = expand.grid(alpha = 1, lambda = 10^seq(4, -4, length = 50))) #alpha = 1 is LASSO
#print(train_lasso)
#coef(train_lasso$finalModel, train_lasso$bestTune$lambda)

# Naive prediction
predictions_lasso <- predict(train_lasso, newdata = test)
confusionMatrix(data = predictions_lasso, test$college24, mode = "everything", positive = "hasBachelorDegree")
# Doing better with threshold training?
#thrsh_df_lasso <- thresholder(train_lasso, seq(0.01, 0.99, by = 0.01), final = TRUE) #needs savePredictions = TRUE
#thrsh_lasso <- thrsh_df_lasso$prob_threshold[thrsh_df_lasso$F1 == max(thrsh_df_lasso$F1)] #pick threshold value by maximizing F1
#Now, we predict using this new threshold. 
#predictions_lasso_thrsh <- factor(ifelse(predict(train_lasso, newdata = test, type = "prob")[, "hasBachelorDegree"] >= thrsh_lasso, 
#                                         "hasBachelorDegree", "noBachelorDegree"), levels = c("noBachelorDegree", "hasBachelorDegree"))
#confusionMatrix(data = predictions_lasso_thrsh, test$college24, mode = "everything", positive = "hasBachelorDegree")