# ----
# Week 2 Quiz 1
library(quantmod)
getSymbols("DEXJPUS", src = "FRED")
jpus <- na.omit(DEXJPUS)
names(jpus) <- "TR"
jpus <- jpus["1979-12-31/2017-12-31"]
jpus <- 1 / jpus
View(jpus)

log_jpus <- diff(log(jpus))[-1] #DELET  
round(head(log_jpus, 5), 6) #DELETE

alpha <- 0.01
mu <- mean(log_jpus)
sig <- sd(log_jpus)
RNGkind(sample.kind="Rounding")
set.seed(123789)

rvec <- rnorm(100000, mu, sig)

var1 <- quantile(rvec, alpha)
round(var1, 6)
es1 <- mean(rvec[rvec < var1])
round(es1, 6)

rvec_2 <- sample(as.vector(log_jpus), 100000, replace = TRUE)

var2 <- quantile(rvec_2, alpha)
es2 <- mean(rvec[rvec < var2])

sim2_var <- quantile(rvec_2, alpha)
sim2_es <- mean(rvec_2[rvec_2 < sim2_var])
round(var2, 6)
round(es2, 6)

es_shortfall <- mu-sig*dnorm(qnorm(alpha,0,1),0,1)/alpha
HFvar <- 1000 * ( exp(es_shortfall)-1 )
round(HFvar, 2)

#THIS IS NOT READY TO TURN IN. 

# -----
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
  round(mean(logret), 12) #this is probably the correct then. We have to increase the number of decimals ironically. 
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
# BEGINS AT 7. THIS IS THE DAILY LOG RETURNS ????
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rnorm(100000, mu, sig)
VaR <- round(quantile(rvec, alpha), 10)
ES <- round(mean(rvec[rvec<VaR]),6)
#

#Sim 2 <-  starts at 4. empirical distribution of data
RNGkind(sample.kind="Rounding") # This is to correct an error. You need to use this to get the correct answer if you're using RStudio. 
set.seed(123789)

# <--- THIS ABOVE ENDS HERE. I HAVE NO IDEA IF THIS IS CORRECT. DELET IF CORERCT BELOW


# ----
## NEW!!


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
1 / JPUS #Calculate the inverse here if applicable. 
JPUS <- JPUS["1979-12-31/2017-12-31"]
names(JPUS) <- "TR"

# Daily log returns:
logret <- diff(log(JPUS))[-1]

#Assuming that daily log returns are normally distributed, we use mean and sd
alpha = 0.01 # 99% confidence level
mu <- mean(logret) 
sig <- sd(logret)
round(mean(logret), 6) # I think this should not be @ 15. So then the answer is -3.6e-05. I think that's just the correct now. 
round(sd(logret), 6) 

# VaR at the 99% confidence level. 
var <- qnorm(alpha, mu, sig)
round(qnorm(alpha, mu, sig), 6)                   

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round(mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)

#So, the question now is whether question 5 and onwards is sim 1 or 2. I'm guessing it's in order now. 

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

# Investing $1bn. I'm 99.9% sure it's 'es' since that's in the previous formula and not 'ES'. 
HFvar <- 1000 * (exp(es)-1) 
round(HFvar, 2)

# ----
# Week 2, Quiz 2
library(quantmod)
getSymbols("DEXUSUK", src = "FRED")
USUK <- na.omit(DEXUSUK)
#Calculate the inverse here if applicable. 
USUK <- USUK["1979-12-31/2017-12-31"]
names(USUK) <- "TR"

# Daily log returns:
logret <- diff(log(USUK))[-1]

#Assuming that daily log returns are normally distributed, we use mean and sd
alpha = 0.01 # 99% confidence level
mu <- mean(logret) 
sig <- sd(logret)
round(mean(logret), 6) # I think this should not be @ 15. So then the answer is -3.6e-05. I think that's just the correct now. 
round(sd(logret), 6) 

# VaR at the 99% confidence level. 
var <- qnorm(alpha, mu, sig)
round(qnorm(alpha, mu, sig), 6)                   

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round(mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)

#So, the question now is whether question 5 and onwards is sim 1 or 2. I'm guessing it's in order now. 

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

# Investing $1bn. I'm 99.9% sure it's 'es' since that's in the previous formula and not 'ES'. 
HFvar <- 1000 * (exp(es)-1) 
round(HFvar, 2)


# ----
# Week 2, Quiz 3
library(quantmod)
getSymbols("DEXSZUS", src = "FRED")
SZUS <- na.omit(DEXSZUS)
#Calculate the inverse here if applicable. 
SZUS <- SZUS["1979-12-31/2017-12-31"]
1 / SZUS
names(SZUS) <- "TR"

# Daily log returns:
logret <- diff(log(SZUS))[-1]

#Assuming that daily log returns are normally distributed, we use mean and sd
alpha = 0.01 # 99% confidence level
mu <- mean(logret) 
sig <- sd(logret)
round(mean(logret), 6) # I think this should not be @ 15. So then the answer is -3.6e-05. I think that's just the correct now. 
round(sd(logret), 6) 

# VaR at the 99% confidence level. 
var <- qnorm(alpha, mu, sig)
round(qnorm(alpha, mu, sig), 6)                   

#The ES at the 99% confidence level for the daily log returns
es <- mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha
round(mu - sig * dnorm(qnorm(alpha, 0, 1),0, 1)/alpha, 6)

#So, the question now is whether question 5 and onwards is sim 1 or 2. I'm guessing it's in order now. 

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

# Investing $1bn. I'm 99.9% sure it's 'es' since that's in the previous formula and not 'ES'. 
HFvar <- 1000 * (exp(es)-1) 
round(HFvar, 2)
