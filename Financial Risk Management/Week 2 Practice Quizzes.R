"" Exercise 5 - Estimating Parameters of the Normal Distribution
1. What is the estimated mean of the daily log returns in gold? Enter the answer using eight decimal places, i.e., n.nnnnnnnn (where n is an integer). 
2. What is the estimated standard deviation of the daily log returns in gold? Enter the answer using six decimal places, i.e., n.nnnnnn (where n is an integer). 
""

# Load library & package
library(quantmod)
load("qjzU8SH6Ro-81PEh-maPtg_0c46ff6057ab4ab2a4482e18632530f1_FRED_gold.rda")

# Setting a time-frame and then omitting NAs
gold <- gold["1979-12-31/2017-12-28"]
gold <- na.omit(gold_new)

# Creating the daily log returns, minus the 1 NA that will show up. 
logret <- diff(log(gold))[-1]

# Calculating mean and standard deviation. The number (8 and 6) are the number of decimals places. 
round(mean(logret), 8)
round(sd(logret), 6)

# Answer question 1: 8.776e-05
# Answer question 2: 0.012069
