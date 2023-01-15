library(quantmod)
library(moments)
library(MASS)
library(metRology)

# ----
#Week 3 - Non-normal distributions
#manual import
gold <- na.omit(gold)
gold <- gold["1979-12-31/2017-12-31"]
names(gold) <-"TR"
View(gold)

logret <- diff(log(gold))[-1]

# Skewness
rvec <- as.vector(logret)
round(skewness(rvec),2)

# Kurtosis
rvec <- as.vector(logret)
round(kurtosis(rvec), 2)

#JB test
rvec <- as.vector(logret)
jarque.test(rvec)


# ----
# Student t-Distribution
alpha <- 0.05
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, "t") 
round(t.fit$estimate, 6)

RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3]) 
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec<VaR]) 
round(VaR,6)
round(ES,6)

# ---- 
# Estimate VaR and ES at 10-day horizon
rvec <- as.vector(logret)
t.fit <- fitdistr(rvec, 't')
round(t.fit$estimate, 6)

# Simulation 1
alpha <- 0.05
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10) {
  rvec <- rvec+rt.scaled(100000, mean=t.fit$estimate[1], sd=t.fit$estimate[2], df=t.fit$estimate[3])
}
Var <- quantile(rvec, alpha)
ES <- mean(rvec[rvec<VaR])
round(VaR, 6)
round(ES, 6)

# Simulation 2
alpha <- 0.05
RNGkind(sample.kind="Rounding")
set.seed(123789)
rvec <- rep(0, 100000)
for (i in 1:10){
  rvec <- rvec + sample(as.vector(logret), 100000, replace = TRUE)
}
VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec<VaR])
round(VaR, 6)
round(ES, 6)

# Simulation 3
alpha <- 0.05
RNGkind(sample.kind="Rounding")
set.seed(123789)
rdat <- as.vector(logret)
rvec <- rep(0, 100000)
posn <- seq(from = 1, to = length(rdat)-9, by = 1)
rpos <- sample(posn, 100000, replace = TRUE)
for (i in 1:10) {
  rvec <- rvec + rdat[rpos]
  rpos <- rpos + 1
}

VaR <- quantile(rvec, alpha)
ES <- mean(rvec[rvec<VaR])
round(VaR, 6)
round(ES, 6)
