# Week 2, Quiz 2
library(quantmod)
getSymbols("DEXUSUK", src = "FRED")
usuk <- na.omit(DEXUSUK)
names(usuk) <- "TR"
usuk <- usuk["1979-12-31/2017-12-31"]
View(usuk)

logret <- diff(log(usuk))[-1]  
View(logret)

# Assuming normality we use mean and sd
alpha <- 0.01
mu <- mean(logret)
  round(mean(logret), 12) 
sig <- sd(logret)
  round(sd(logret), 6)
var <- round(qnorm(alpha, mu, sig), 6)
HFvar <- round(1000 * (exp(var)-1), 6)
HFvar <- 1000 * ( exp(var)-1 )
round(HFvar, 6)
# ---


es <- round(mu-sig*dnorm(qnorm(alpha,0,1),0,1)/alpha, 6)

# ----
#Sim 1 is based on normal distribution. 
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)
VaR <- round(quantile(rvec, alpha), 10)
ES <- round(mean(rvec[rvec<VaR]),6)
#

#Sim 2. Empirical distribution of data
RNGkind(sample.kind="Rounding") # This is to correct an error. You need to use this to get the correct answer if you're using RStudio. 
set.seed(123789)

#Simulation 1 with simulated values and is based on normal distribution.
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- quantile(rvec, alpha)
round(quantile(rvec, alpha), 6)

# if we invest 1000 million as notional
HFvar <- 1000 * ( exp(VaR)-1 )
round(HFvar, 6)

ES <- mean(rvec[rvec<VaR])
round(mean(rvec[rvec<VaR]), 6)

# if we invest 1000 million as notional
HFvar <- 1000 * (exp(ES)-1)
round(HFvar, 6)

#Simulation 2 with real values (logret) and is empirical distribution of data
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- sample(as.vector(logret),100000,replace=TRUE)

VaR <- quantile(rvec, alpha)
round( quantile(rvec, alpha), 8 )

# if we invest 1000 million as notional
HFx <- 1000 * ( exp(VaR)-1 )
round(HFvar, 6)

ES <- mean(rvec[rvec<VaR])
round( mean(rvec[rvec<VaR]), 6)

# if we invest 1000 million as notional
HFx <- 1000 * (exp(ES)-1)
round(HFvar, 2)

# ----
# Week 2, Quiz 3
library(quantmod)
getSymbols("DEXSZUS", src = "FRED")
wilsh <- na.omit(DEXJPUS)
#Calculate the inverse
wilsh <- 1 / wilsh

wilsh <- wilsh["1979-12-31/2017-12-31"]
names(wilsh) <- "TR"


# Next, we calculated its daily log returns:
logret <- diff(log(wilsh))[-1]

#Assuming that daily log returns are normally distributed, we use mean and sd
mu <- mean(logret)
sig <- sd(logret)
alpha = 0.01
round(mean(logret), 15) #repetition
round(sd(logret), 6) #repetition

# The VaR at the 99% confidence level
var <- qnorm(alpha, mu, sig)
round( qnorm(alpha, mu, sig), 6)                   

# if we invest 1000 million as notional
HFvar <- 1000 * ( exp(var)-1 )
round(HFvar, 6)

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round( mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)
# if we invest 1000 million as notional
HFvar <- 1000 * (exp(es)-1)
round(HFvar, 6)

#Simulation method 1 (with simulated values)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- quantile(rvec, alpha)
round( quantile(rvec, alpha), 6)
# if we invest 1000 million as notional
HFvar <- 1000 * (exp(var)-1)
round( HFvar, 6)

ES <- mean(rvec[rvec<VaR])
round( mean(rvec[rvec<VaR]), 6)

# if we invest 1000 million as notional
HFvar <- 1000 * (exp(es)-1)
round(HFvar, 6)

#Simulation method 2 (with real values (logret))
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace = TRUE)

VaR <- quantile(rvec, alpha)
round( quantile(rvec, alpha), 6)

# if we invest 1000 million as notional
HFx <- 1000 * (exp(var)-1)
round(HFvar, 6)

ES <- mean(rvec[rvec<VaR])
round( mean(rvec[rvec<VaR]), 6)

# if we invest 1000 million as notional
HFx <- 1000 * (exp(es)-1)
round( HFvar, 2)

#----
# Week 2, Quiz 1
library(quantmod)
getSymbols("DEXJPUS", src = "FRED")
JPUS <- na.omit(DEXJPUS)
1 / JPUS 
JPUS <- JPUS["1979-12-31/2017-12-31"]
names(JPUS) <- "TR"

# Daily log returns:
logret <- diff(log(JPUS))[-1]

#Assuming that daily log returns are normally distributed, we use mean and sd
alpha = 0.01 # 99% confidence level
mu <- mean(logret) 
sig <- sd(logret)
round(mean(logret), 6) 
round(sd(logret), 6) 

# VaR at the 99% confidence level. 
var <- qnorm(alpha, mu, sig)
round(qnorm(alpha, mu, sig), 6)                   

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round(mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)

#Simulation method 1 (with simulated values)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- quantile(rvec, alpha)
round( quantile(rvec, alpha), 6)

ES <- mean(rvec[rvec<VaR])
round( mean(rvec[rvec<VaR]), 6)

#Simulation method 2 (with real values (logret)/empirical distributiuon)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace = TRUE)

VaR <- quantile(rvec, alpha)
round(quantile(rvec, alpha), 6)

ES <- mean(rvec[rvec<VaR]) 
round(mean(rvec[rvec<VaR]), 6) 

HFvar <- 1000 * (exp(es)-1) 
round(HFvar, 2)

# ----
# Week 2, Quiz 2
library(quantmod)
getSymbols("DEXUSUK", src = "FRED")
USUK <- na.omit(DEXUSUK)
USUK <- USUK["1979-12-31/2017-12-31"]
names(USUK) <- "TR"

# Daily log returns:
logret <- diff(log(USUK))[-1]

#Assuming that daily log returns are normally distributed, we use mean and sd
alpha = 0.01 # 99% confidence level
mu <- mean(logret) 
sig <- sd(logret)
round(mean(logret), 6) 
round(sd(logret), 6) 

# VaR at the 99% confidence level. 
var <- qnorm(alpha, mu, sig)
round(qnorm(alpha, mu, sig), 6)                   

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round(mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)

#Simulation method 1 (with simulated values)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- quantile(rvec, alpha)
round( quantile(rvec, alpha), 6)

ES <- mean(rvec[rvec<VaR])
round( mean(rvec[rvec<VaR]), 6)

#Simulation method 2 (with real values (logret)/empirical distributiuon)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace = TRUE)

VaR <- quantile(rvec, alpha)
round(quantile(rvec, alpha), 6)

ES <- mean(rvec[rvec<VaR]) 
round(mean(rvec[rvec<VaR]), 6) 

HFvar <- 1000 * (exp(es)-1) 
round(HFvar, 2)


# ----
# Week 2, Quiz 3
library(quantmod)
getSymbols("DEXSZUS", src = "FRED")
SZUS <- na.omit(DEXSZUS)
SZUS <- SZUS["1979-12-31/2017-12-31"]
1 / SZUS
names(SZUS) <- "TR"

# Daily log returns:
logret <- diff(log(SZUS))[-1]

alpha = 0.01 # 99% confidence level
mu <- mean(logret) 
sig <- sd(logret)
round(mean(logret), 6) #
round(sd(logret), 6) 

# VaR at the 99% confidence level. 
var <- qnorm(alpha, mu, sig)
round(qnorm(alpha, mu, sig), 6)                   

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round(mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)

#Simulation method 1 (with simulated values)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)

VaR <- quantile(rvec, alpha)
round( quantile(rvec, alpha), 6)

ES <- mean(rvec[rvec<VaR])
round( mean(rvec[rvec<VaR]), 6)

#Simulation method 2 (with real values (logret)/empirical distributiuon)
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- sample(as.vector(logret), 100000, replace = TRUE)

VaR <- quantile(rvec, alpha)
round(quantile(rvec, alpha), 6)

ES <- mean(rvec[rvec<VaR]) 
round(mean(rvec[rvec<VaR]), 6) 

HFvar <- 1000 * (exp(es)-1) 
round(HFvar, 2)
