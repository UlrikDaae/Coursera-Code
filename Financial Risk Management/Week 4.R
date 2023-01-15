# -----
# Week 4, Quiz 1

getSymbols("DEXJPUS", src = "FRED")
JPUS <- na.omit(DEXJPUS)
1 / JPUS #Calculate the inverse here if applicable. 
JPUS <- JPUS["1979-12-31/2017-12-31"]
names(JPUS) <- "TR"

logret <- diff(log(JPUS))[-1]

acf(logret)
acf(abs(logret))

uspec <- ugarchspec( 
  variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
  mean.model = list(armaOrder = c(0, 0), include.mean = TRUE),
  distribution.model = "std"
)
fit.garch <- ugarchfit(spec = uspec, data = logret)
round(fit.garch@fit$coef, 5)

uspec <- ugarchspec( 
  variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
  mean.model = list(armaOrder = c(0, 0), include.mean = TRUE),
  distribution.model = "std"
)
fit.garch <- ugarchfit(spec = uspec, data = logret)
round(fit.garch@fit$coef, 6)

save1 <- cbind( logret[,1], fit.garch@fit$sigma, fit.garch@fit$z ) 
names(save1) <- c("logret", "s", "z" )

RNGkind(sample.kind="Rounding")
set.seed(123789)
boot.garch <- ugarchboot(fit.garch,
                         method = c("Partial", "Full")[1],
                         sampling = "raw",
                         n.ahead = 1,
                         n.bootpred = 100000,
                         solver = "solnp"
)

rvec <- boot.garch@fseries
VaR <- quantile(rvec,0.05) 
ES <- mean(rvec[rvec<VaR])

round(VaR, 5)
round(ES, 5)

# ----
  # Week 4, Quiz 2
  getSymbols("DEXUSUK", src = "FRED")
  JPUS <- na.omit(DEXUSUK)
  #Calculate the inverse here if applicable. 
  JPUS <- JPUS["1979-12-31/2017-12-31"]
  names(JPUS) <- "TR"
  
  logret <- diff(log(JPUS))[-1]
  
  acf(logret)
  acf(abs(logret))
  
  uspec <- ugarchspec( 
    variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
    mean.model = list(armaOrder = c(0, 0), include.mean = TRUE),
    distribution.model = "std"
  )
  fit.garch <- ugarchfit(spec = uspec, data = logret)
  round(fit.garch@fit$coef, 5)
  
  uspec <- ugarchspec( 
    variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
    mean.model = list(armaOrder = c(0, 0), include.mean = TRUE),
    distribution.model = "std"
  )
  fit.garch <- ugarchfit(spec = uspec, data = logret)
  
  save1 <- cbind( logret[,1], fit.garch@fit$sigma, fit.garch@fit$z ) 
  names(save1) <- c("logret", "s", "z" )
  
  RNGkind(sample.kind="Rounding")
  set.seed(123789)
  boot.garch <- ugarchboot(fit.garch,
                           method = c("Partial", "Full")[1],
                           sampling = "raw",
                           n.ahead = 1,
                           n.bootpred = 100000,
                           solver = "solnp"
  )
  
  rvec <- boot.garch@fseries
  VaR <- quantile(rvec,0.05) 
  ES <- mean(rvec[rvec<VaR])
  
  round(VaR, 6)
  round(ES, 6)
