# Exercise 5 - Estimating Parameters of the Normal Distribution
# My code:
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

# ------------------------------------------------------------------------------------------------------------------------
# Exercise 6 - Estimating VaR of the Normal Distribution
# My code:
library(quantmod)
load("qjzU8SH6Ro-81PEh-maPtg_0c46ff6057ab4ab2a4482e18632530f1_FRED_gold.rda")
gold <- gold["1979-12-31/2017-12-28"]
gold <- na.omit(gold)logret <- diff(log(gold))[-1]

round(mean(logret), 8)
round(sd(logret), 6)
mu <- mean(logret)
sig <- sd(logret)

var <- round(qnorm(0.05, mu, sig),6) # at 95% confidence level
HF <- round(1000 * (exp(var)-1),1) # 1000 is the same as 1000 million dollars. 

# ------------------------------------------------------------------------------------------------------------------------

# Exercise 7 - Estimating ES of the Normal Distribution
# My code:
library(quantmod)

load("qjzU8SH6Ro-81PEh-maPtg_0c46ff6057ab4ab2a4482e18632530f1_FRED_gold.rda")

gold <- gold["1979-12-31/2017-12-28"]
gold <- na.omit(gold)

logret <- diff(log(gold))[-1]
round(mean(logret), 8)
round(sd(logret), 6)

mu <- mean(logret)
sig <- sd(logret)
var <- round(qnorm(0.05, mu, sig),6) # at 95% confidence level
HF <- round(1000 * (exp(var)-1),1) # 1000 is the same as 1000 million dollars. 

es <- round(mu-sig*dnorm(qnorm(0.05, 0, 1),0, 1)/0.05, 6)
HFvar <- round(1000 * (exp(es)-1),1)

# ------------------------------------------------------------------------------------------------------------------------
# Exercise 8 - Estimating VaR and ES via Simulation
# My code:
mu <- mean(logret)
sig <- sd(logret)
alpha <- 0.05
set.seed(123789) # This seed value gives us the same 100 000 numbers, i.e. it gives us the same result as the task. 
rvec <- rnorm(100000, mu, sig) #rnorm generates 100 000 variates from the mu and sig. 

sim1_var <- quantile(rvec_1, 0.05) 
sim1_es <- mean(rvec_1[rvec_1 < sim1_var])

round(sim1_var, 6) 
round(sim1_es, 6)  

# Simulation method 2
mu <- mean(logret)
sig <- sd(logret)
RNGkind(sample.kind="Rounding") # This is to correct an error. You need to use this to get the correct answer if you're using RStudio. 
set.seed(123789)
rvec_2 <- sample(as.vector(logret), 100000, replace = TRUE)

sim2_var <- quantile(rvec_2, alpha)
sim2_es <- mean(rvec_2[rvec_2 < sim2_var])
round(sim2_var, 6)
round(sim2_es, 6)
