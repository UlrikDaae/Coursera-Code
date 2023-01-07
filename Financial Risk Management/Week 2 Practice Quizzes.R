# Exercise 5 - Estimating Parameters of the Normal Distribution
# 1. What is the estimated mean of the daily log returns in gold? Enter the answer using eight decimal places, i.e., n.nnnnnnnn (where n is an integer). 
# 2. What is the estimated standard deviation of the daily log returns in gold? Enter the answer using six decimal places, i.e., n.nnnnnn (where n is an integer). 

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

# ------------------------------------------------------------------------------------------------------------------------
# Exercise 6 - Estimating VaR of the Normal Distribution
# 1. What is the value-at-risk (VaR) of the daily log returns in gold, at the 95% confidence level? Enter the answer using six decimal places, i.e., n.nnnnnn (where n is an integer). If this is a negative number, please add a minus (“-“) sign in front. If this is a positive number, there is no need to add a plus sign in front. 

library(quantmod)

load("qjzU8SH6Ro-81PEh-maPtg_0c46ff6057ab4ab2a4482e18632530f1_FRED_gold.rda")

gold <- gold["1979-12-31/2017-12-28"]

gold <- na.omit(gold)logret <- diff(log(gold))[-1]

round(mean(logret), 8)
round(sd(logret), 6)

mu <- mean(logret)
sig <- sd(logret)

var <- round(qnorm(0.05, mu, sig),6) # at 95% confidence level
# Answer question 1: -0.019763. This value can be seen in the environment. Don't need to run a head() or View to see it.

#2 Suppose the hedge fund invested the entire $1000 million in gold instead of US equities. What is the VaR of the daily changes in the assets of the hedge fund, at the 95% confidence level? Enter the answer in terms of millions of US Dollars, using one decimal place, i.e., nnn.n (where n is an integer). If this is a negative number, please add a minus (“-“) sign in front. If this is a positive number, there is no need to add a plus sign in front.

HF <- round(1000 * (exp(var)-1),1) # 1000 is the same as 1000 million dollars. 
# Answer question 2: -19.6
