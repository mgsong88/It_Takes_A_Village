# It Takes a Village: Impact of Social Groups on Future Outcomes

**Matthew Song**\
UC Berkeley\
May 2023

## Overview

This paper has a two-fold purpose:

1. Focus on investigating the **impacts of various social groups** (family, friends/peers/school, and self-assessments) during childhood on future outcomes, where future outcomes are measured by **income and college graduation rate (graduating with a Bachelor's degree) by age 24**. This is an **inferential approach** to determining what factors are **significantly correlated** with the outcome variables.
2. Generate regression-based **predictive models** to identify at-risk youth. This is a **predictive approach** to building Machine-Learning models in order to **forecast unknown results** and could be used in policymaking in the future.

**The full paper with additional details and explanations can be found in [It Takes a Village.pdf](https://github.com/mgsong88/It_Takes_A_Village/blob/main/It%20Takes%20a%20Village.pdf)**

## Data and Methodology

I utilize data obtained from the [National Longitudinal Survey of Youth 1997 Cohort (NLSY97)](https://www.bls.gov/nls/nlsy97.htm), which is a representative longitudinal survey of American youth ages 12-18 in 1997. Within the data, in addition to standard demographic characteristics, I am also able to obtain survey responses (typically reported on the Likert scale) to determine an individual's assessment of their family and friends/peers/school, as well as self-assessments.

I utilize both **Ordinary Least Squares (OLS)** regression as well as **Logistic Regression** to identify those variables which strongly influence future income and college graduation rate.

Finally, I extend the project to consider various **regression-based machine learning predictive methods** to try and identify at-risk youth (classified as those who would not graduate from college, or have income below the poverty line).

I utilize **OLS, Ridge, and LASSO** along with threshold modification strategies to tune these predictive models. For Ridge and Lasso, I use **10-fold cross validation to tune hyperparameters**. I also implement a threshold adjustment tuning mechanism for classification via grid search to try and improve model performance. This is because for binary classification, typically by default one uses an 0.5 threshold to assign a predictive outcome, but this might not be optimal from a policy perspective. In this scenario, **Type II errors** (false negatives; mis-identifying an at-risk youth to be not-at-risk) are more harmful to society than **Type I errors** (false positives; mis-identifying a not-at-risk youth to be at-risk) for obvious reasons. 

## Headline Results

### Inference 

Inferential results were typically consistent regardless of using College Graduation or Income as the response variable of choice, which makes sense as those two variables are highly correlated. Only a few takeaways are mentioned here; please refer to the paper for more details on other considered variables.

1. **Positive parental support** is highly correlated with better future outcomes, yet parental strictness shows no significance. 
2. Peer effects are noticeably important for future outcomes. A child with a higher percentage of **peers engaging in positive behaviors** ends up with **better future outcomes**, while children with more **delinquent peers** tends to end up with **worse future outcomes**. 
3. There is evidence of a **self-manifestation effect**, in which children who perceive and believe themselves to be successful in the future are significantly more likely to achieve that future success. 
4. Demographic and control variables were typically significantly correlated with future outcomes in directions consistent with the literature. E.g., higher parental education strongly positive effect, growing up poor strongly negative effect, etc.

### Prediction 

Predictive results were similar, in that results typically held regardless of which outcome variable was used. For the following results, I used college graduation as the outcome variable. The **no-information rate** in the dataset is **79.58%**, which means that if we naively predicted the majority class (not having a Bachelor's degree) for each observation, this naive method would have a 79.58% accuracy rate. This is roughly consistent with [historical briefings which state that about 24% of people age 25+ held a Bachelor's Degree or higher in April 2000](https://www.census.gov/library/publications/2003/dec/c2kbr-24.html).

1. OLS prediction results in **83.84% Accuracy** (+4.26% over No-Information) and **95.74% Specificity**
2. Ridge prediction results in **83.49% Accuracy** (+3.91% over No-Information) and **96.40% Specificity**
3. LASSO prediction results in **83.41% Accuracy** (+3.83% over No-Information) and **96.29% Specificity**

A threshold-adjusted model was run for OLS prediction, resulting in **84.19% Accuracy** (+4.61% over No-Information) and **94.32% Specificity**. The results for threshold-adjusted Ridge and LASSO are similarly minor in change, and are not reported. 

## Takeaway

From this paper, one takeaway that combines the inferential and predictive elements comes through a policy lens. By determining important factors that have strong influence on future success (inference), policymakers can use machine-learning methods (prediction) to better identify youth that are at-risk of poor future outcomes and build policies to support them. For instance, policymakers could learn to identify schools or neighborhoods with higher predicted rates of poor future outcomes via Machine Learning, and then work on providing funding to local Boys and Girls clubs or Big Brothers Big Sisters organizations to foster positive peer mentor effects. Ultimately, this sort of dual-targeted approach would hopefully raise the livelihoods of at-risk children, help lift them out of poverty, and provide them with opportunities for future success in life. 

<hr style="border:2px solid gray">

## Instructions for Paper Replication

### Downloading NLSY97 Data

*Instructions valid as of: April 2023*

Note that a copy of the dataset has already been provided based on the following instructions within this repository.
If you would like to re-create the steps to obtain a fresh copy of the raw data, please see the following steps.

1. Tagset list used for this paper is provided in [./Programs/varlist.NLSY97](https://github.com/mgsong88/It_Takes_A_Village/blob/main/Programs/varlist.NLSY97)
2. Go to: https://www.nlsinfo.org/investigator
3. Sign in with account, or enter as a guest
4. Select the "Choose Tagsets" tab --> "Upload Tagset" --> upload "varlist.NLSY97"
5. Go to the "Save/Download" tab --> "Advanced Download" sub-tab
6. Select "Create Download of Data" (default). Check: "R Source Code", "Codebook of selected variables", "Short Description File", "Comma-delimited datafile of selected variables" (use Reference Numbers as Column Headers)
7. Change "Filename" to anything (I use "data")
8. Click Download, wait, and download the file when ready (should take a few seconds to prepare)
9. Unzip to [./Data/](https://github.com/mgsong88/It_Takes_A_Village/tree/main/Data) folder
10. Done!

### Running .R Scripts

*Instructions valid as of: May 2023*

1. Follow the above instructions to download the data (a version as of April 2023 is already provided in the Github repo ./Data/ folder)
2. Run [./Programs/cleanData.R](https://github.com/mgsong88/It_Takes_A_Village/blob/main/Programs/cleanData.R)
3. Run [./Programs/runAnalysis.R](https://github.com/mgsong88/It_Takes_A_Village/blob/main/Programs/runAnalysis.R)
