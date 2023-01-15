# Week 1, Quiz 1
library(quantmod)
getSymbols("DEXJPUS", src = "FRED")
JPUS <- na.omit(DEXJPUS)
names(JPUS) <- "TR"
JPUS <- JPUS["1979-12-31/2017-12-31"]
JPUS <- 1 / JPUS

logret_jpus <- diff(log(JPUS))[-1]
round(head(logret_jpus, 3), 6)

ret <- exp(logret_jpus)-1
round(head(ret, 3), 6)

# Log returns
logret_jpus_w <- apply.weekly(logret_jpus, sum)
round(head(logret_jpus_w, 3), 6)
round(tail(logret_jpus_w, 3), 6)

logret_jpus_m <- apply.monthly(logret_jpus, sum)
round(head(logret_jpus_m, 3), 6)
round(tail(logret_jpus_m, 3), 6)

logret_jpus_q <- apply.quarterly(logret_jpus, sum)
round(head(logret_jpus_q, 3), 6)
round(tail(logret_jpus_q, 3), 6)

logret_jpus_y <- apply.yearly(logret_jpus, sum)
round(head(logret_jpus_y, 3), 6)
round(tail(logret_jpus_y, 3), 6)

# Discrete returns
ret_jpus_w <- exp(logret_jpus_w)-1
round(head(ret_jpus_w, 3), 6)
round(tail(ret_jpus_w, 3), 6)

ret_jpus_m <- exp(logret_jpus_m)-1
round(head(ret_jpus_m, 3), 6)
round(tail(ret_jpus_m, 3), 6)

ret_jpus_q <- exp(logret_jpus_q)-1
round(head(ret_jpus_q, 3), 6)
round(tail(ret_jpus_q, 3), 6)

ret_jpus_y <- exp(logret_jpus_y)-1
round(head(ret_jpus_y, 3), 6)
round(tail(ret_jpus_y, 3), 6)

# Week 1, Quiz 2
library(quantmod)
getSymbols("DEXUSUK", src = "FRED")
USUK <- na.omit(DEXUSUK)
names(USUK) <- "TR"
USUK <- USUK["1979-12-31/2017-12-31"]

logret_USUK <- diff(log(USUK))[-1]
round(head(logret_USUK, 3), 6)

ret_USUK <- exp(logret_USUK)-1
round(head(ret_USUK, 3), 6) 

# Log returns
logret_USUK_w <- apply.weekly(logret_USUK, sum)
round(head(logret_USUK_w, 3), 6)
round(tail(logret_USUK_w, 3), 6)

logret_USUK_m <- apply.monthly(logret_USUK, sum)
round(head(logret_USUK_m, 3), 6)
round(tail(logret_USUK_m, 3), 6)

logret_USUK_q <- apply.quarterly(logret_USUK, sum)
round(head(logret_USUK_q, 3), 6)
round(tail(logret_USUK_q, 3), 6)

logret_USUK_y <- apply.yearly(logret_USUK, sum)
round(head(logret_USUK_y, 3), 6)
round(tail(logret_USUK_y, 3), 6)

# Discrete returns
ret_USUK_w <- exp(logret_USUK_w)-1
round(head(ret_USUK_w, 3), 6)
round(tail(ret_USUK_w, 3), 6)

ret_USUK_m <- exp(logret_USUK_m)-1
round(head(ret_USUK_m, 3), 6)
round(tail(ret_USUK_m, 3), 6)

ret_USUK_q <- exp(logret_USUK_q)-1
round(head(ret_USUK_q, 3), 6)
round(tail(ret_USUK_q, 3), 6)

ret_USUK_y <- exp(logret_USUK_y)-1
round(head(ret_USUK_y, 3), 6)
round(tail(ret_USUK_y, 3), 6)

# Week 1, Quiz 3

library(quantmod)
getSymbols("DEXSZUS", src = "FRED")
SZUS <- na.omit(DEXSZUS)
names(SZUS) <- "TR"
SZUS <- SZUS["1979-12-31/2017-12-31"]
SZUS <- 1 / SZUS
View(SZUS)

logret_SZUS <- diff(log(SZUS))[-1]
round(head(logret_SZUS, 3), 6)

ret_SZUS <- exp(logret_SZUS)-1
round(head(ret_SZUS, 3), 6) # MAKE SURE THIS IS CORRECT.

# Log returns
logret_SZUS_w <- apply.weekly(logret_SZUS, sum)
round(head(logret_SZUS_w, 3), 6)
round(tail(logret_SZUS_w, 3), 6)

logret_SZUS_m <- apply.monthly(logret_SZUS, sum)
round(head(logret_SZUS_m, 3), 6)
round(tail(logret_SZUS_m, 3), 6)

logret_SZUS_q <- apply.quarterly(logret_SZUS, sum)
round(head(logret_SZUS_q, 3), 6)
round(tail(logret_SZUS_q, 3), 6)

logret_SZUS_y <- apply.yearly(logret_SZUS, sum)
round(head(logret_SZUS_y, 3), 6)
round(tail(logret_SZUS_y, 3), 6)

# Discrete returns
ret_SZUS_w <- exp(logret_SZUS_w)-1
round(head(ret_SZUS_w, 3), 6)
round(tail(ret_SZUS_w, 3), 6)

ret_SZUS_m <- exp(logret_SZUS_m)-1
round(head(ret_SZUS_m, 3), 6)
round(tail(ret_SZUS_m, 3), 6)

ret_SZUS_q <- exp(logret_SZUS_q)-1
round(head(ret_SZUS_q, 3), 6)
round(tail(ret_SZUS_q, 3), 6)

ret_SZUS_y <- exp(logret_SZUS_y)-1
round(head(ret_SZUS_y, 3), 6)
round(tail(ret_SZUS_y, 3), 6)

# Quiz 1, week 4
library(quantmod)
getSymbols("DEXUSAL", src = "FRED")
USAL <- na.omit(DEXUSAL)
names(USAL) <- "TR"
USAL <- USAL["1979-12-31/2017-12-31"]

logret_USAL <- diff(log(USAL))[-1]
round(head(logret_USAL, 3), 6)

ret_USAL <- exp(logret_USAL)-1
round(head(ret_USAL, 3), 6) # MAKE SURE THIS IS CORRECT.

# Log returns
logret_USAL_w <- apply.weekly(logret_USAL, sum)
round(head(logret_USAL_w, 3), 6)
round(tail(logret_USAL_w, 3), 6)

logret_USAL_m <- apply.monthly(logret_USAL, sum)
round(head(logret_USAL_m, 3), 6)
round(tail(logret_USAL_m, 3), 6)

logret_USAL_q <- apply.quarterly(logret_USAL, sum)
round(head(logret_USAL_q, 3), 6)
round(tail(logret_USAL_q, 3), 6)

logret_USAL_y <- apply.yearly(logret_USAL, sum)
round(head(logret_USAL_y, 3), 6)
round(tail(logret_USAL_y, 3), 6)

# Discrete returns
ret_USAL_w <- exp(logret_USAL_w)-1
round(head(ret_USAL_w, 3), 6)
round(tail(ret_USAL_w, 3), 6)

ret_USAL_m <- exp(logret_USAL_m)-1
round(head(ret_USAL_m, 3), 6)
round(tail(ret_USAL_m, 3), 6)

ret_USAL_q <- exp(logret_USAL_q)-1
round(head(ret_USAL_q, 3), 6)
round(tail(ret_USAL_q, 3), 6)

ret_USAL_y <- exp(logret_USAL_y)-1
round(head(ret_USAL_y, 3), 6)
round(tail(ret_USAL_y, 3), 6)
