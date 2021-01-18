# ### main_part
# ### keep a constant mean of rates,and increasing |rate1 - rate2|
# #### 1.low mean rates for all
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.25, 0.5)   ###mean_lac = 0.5
# mu <- c(0.4, 0.8, 1.2)    ###mean_mu = 0.8
# K <- c(40, Inf)
# gam <- c(0.005, 0.01)  ###mean_gam = 0.01
# laa <- c(0.25, 0.5)   ###mean_laa = 0.5
# trans <- 0.5
# trans2 <- 0.5
# trait_low_rates <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_low_rates <- cbind(
#   trait_low_rates,
#   lac2 = 1 - trait_low_rates[, 4] ,
#   mu2 = 1.6 - trait_low_rates[, 5] ,
#   gam2 = 0.02 - trait_low_rates[, 6],
#   laa2 = 1 - trait_low_rates[, 7])
#
# ####2. high rates for all
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0.5
# trans2 <- 0.5
# trait_high_rates <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_high_rates <- cbind(
#   trait_high_rates,
#   lac2 = 1.6 - trait_high_rates[, 4] ,
#   mu2 = 2.4 - trait_high_rates[, 5] ,
#   gam2 = 0.04 - trait_high_rates[, 6],
#   laa2 = 2 - trait_high_rates[, 7])
#
# ### 3. lambdac/mu+gamma+lambdaa
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.25, 0.5)   ###mean_lac = 0.5
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0.5
# trans2 <- 0.5
# trait_lac <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_lac <- cbind(
#   trait_lac,
#   lac2 = 1.0 - trait_lac[, 4] ,
#   mu2 = 2.4 - trait_lac[, 5] ,
#   gam2 = 0.04 - trait_lac[, 6],
#   laa2 = 2 - trait_lac[, 7])
#
# ### 4. mu/lambdac+gamma+lambdaa
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.4, 0.8, 1.2)    ###mean_mu = 0.8
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0.5
# trans2 <- 0.5
# trait_mu <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_mu <- cbind(
#   trait_mu,
#   lac2 = 1.6 - trait_mu[, 4] ,
#   mu2 = 1.6 - trait_mu[, 5] ,
#   gam2 = 0.04 - trait_mu[, 6],
#   laa2 = 2 - trait_mu[, 7])
#
# ### 5. gamma/lambdac+mu+lambdaa
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.005, 0.01)  ###mean_gam = 0.01
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0.5
# trans2 <- 0.5
# trait_gamma <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_gamma <- cbind(
#   trait_gamma,
#   lac2 = 1.6 - trait_gamma[, 4] ,
#   mu2 = 2.4 - trait_gamma[, 5] ,
#   gam2 = 0.02 - trait_gamma[, 6],
#   laa2 = 2 - trait_gamma[, 7])
#
#
# ### 6. lambdaa/lambdac+mu+gamma
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.25, 0.5)   ###mean_laa = 0.5
# trans <- 0.5
# trans2 <- 0.5
# trait_laa <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_laa <- cbind(
#   trait_laa,
#   lac2 = 1.6 - trait_laa[, 4] ,
#   mu2 = 2.4 - trait_laa[, 5] ,
#   gam2 = 0.04 - trait_laa[, 6],
#   laa2 = 1 - trait_laa[, 7])
#
#
# ### 7. gamma+lambdaa/lambdac+mu
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.25, 0.5)   ###mean_lac = 0.5
# mu <- c(0.4, 0.8, 1.2)    ###mean_mu = 0.8
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0.5
# trans2 <- 0.5
# trait_lac_mu <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_lac_mu <- cbind(
#   trait_lac_mu,
#   lac2 = 1 - trait_lac_mu[, 4] ,
#   mu2 = 1.6 - trait_lac_mu[, 5] ,
#   gam2 = 0.04 - trait_lac_mu[, 6],
#   laa2 = 2 - trait_lac_mu[, 7])
#
#
# ### 8. mu+lambdaa/lambdac+gamma
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.4, 0.8, 1.2)    ###mean_mu = 0.8
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.25, 0.5)   ###mean_laa = 0.5
# trans <- 0.5
# trans2 <- 0.5
# trait_lac_gamma <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_lac_gamma <- cbind(
#   trait_lac_gamma,
#   lac2 = 1.6 - trait_lac_gamma[, 4] ,
#   mu2 = 1.6 - trait_lac_gamma[, 5] ,
#   gam2 = 0.04 - trait_lac_gamma[, 6],
#   laa2 = 1 - trait_lac_gamma[, 7])
#
# ### 9. mu+gamma/lambdac+lambdaa
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.25, 0.5)   ###mean_lac = 0.5
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.25, 0.5)   ###mean_laa = 0.5
# trans <- 0.5
# trans2 <- 0.5
# trait_lac_laa <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_lac_laa <- cbind(
#   trait_lac_laa,
#   lac2 = 1 - trait_lac_laa[, 4] ,
#   mu2 = 2.4 - trait_lac_laa[, 5] ,
#   gam2 = 0.04 - trait_lac_laa[, 6],
#   laa2 = 1 - trait_lac_laa[, 7])
#
# trait_CES <- rbind(
#   trait_low_rates,
#   trait_high_rates,
#   trait_lac,
#   trait_mu,
#   trait_gamma,
#   trait_laa,
#   trait_lac_mu,
#   trait_lac_gamma,
#   trait_lac_laa)
#
# write.csv2(
#   trait_CES,
#   "data/trait_CES.csv",
#   row.names = FALSE
# )
#
#
# ### 10. high rates without transition
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0
# trans2 <- 0
# trait_high_rates_notrans <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_high_rates_notrans <- cbind(
#   trait_high_rates_notrans,
#   lac2 = 1.6 - trait_high_rates_notrans[, 4] ,
#   mu2 = 2.4 - trait_high_rates_notrans[, 5] ,
#   gam2 = 0.04 - trait_high_rates_notrans[, 6],
#   laa2 = 2 - trait_high_rates_notrans[, 7])
#
# ### 11. high rates with asymmetric transition
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 0.5
# trans2 <- 2
# trait_high_rates_trans <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_high_rates_trans <- cbind(
#   trait_high_rates_trans,
#   lac2 = 1.6 - trait_high_rates_trans[, 4] ,
#   mu2 = 2.4 - trait_high_rates_trans[, 5] ,
#   gam2 = 0.04 - trait_high_rates_trans[, 6],
#   laa2 = 2 - trait_high_rates_trans[, 7])
#
# ### 12. high rates with asymmetric transition(exchange)
# time <- c(2.5, 5)
# M <- 500
# M2 <- 500
# lac <- c(0.4, 0.8)   ###mean_lac = 0.8
# mu <- c(0.6, 1.2, 1.8)    ###mean_mu = 1.2
# K <- c(40, Inf)
# gam <- c(0.01, 0.02)  ###mean_gam = 0.02
# laa <- c(0.5, 1)   ###mean_laa = 1
# trans <- 2
# trans2 <- 0.5
# trait_high_rates_trans2 <- expand.grid(
#   time = time,
#   M = M,
#   M2 = M2,
#   lac = lac,
#   mu = mu,
#   gam = gam,
#   laa = laa,
#   trans = trans,
#   trans2 = trans2,
#   K = K)
# trait_high_rates_trans2 <- cbind(
#   trait_high_rates_trans2,
#   lac2 = 1.6 - trait_high_rates_trans2[, 4] ,
#   mu2 = 2.4 - trait_high_rates_trans2[, 5] ,
#   gam2 = 0.04 - trait_high_rates_trans2[, 6],
#   laa2 = 2 - trait_high_rates_trans2[, 7])
#
# trait_trans <- rbind(
#   trait_high_rates_notrans,
#   trait_high_rates_trans,
#   trait_high_rates_trans2)
#
# write.csv2(
#   trait_trans,
#   "data/trait_trans.csv",
#   row.names = FALSE
# )

### higher cladogenetic speciation rates adn lower extinction rate
### main_part
### keep a constant mean of rates,and increasing |rate1 - rate2|
#### 1.low mean rates for all
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.25, 0.5)   ###mean_lac = 0.5
mu <- c(0.25, 0.5, 0.75)    ###mean_mu = 0.5
K <- c(40, Inf)
gam <- c(0.005, 0.01)  ###mean_gam = 0.01
laa <- c(0.25, 0.5)   ###mean_laa = 0.5
trans <- 0.5
trans2 <- 0.5
trait_low_rates <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_low_rates <- cbind(
  trait_low_rates,
  lac2 = 1 - trait_low_rates[, 4] ,
  mu2 = 1 - trait_low_rates[, 5] ,
  gam2 = 0.02 - trait_low_rates[, 6],
  laa2 = 1 - trait_low_rates[, 7])

####2. high rates for all
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1.0
mu <- c(0.5, 1.0, 1.5)    ###mean_mu = 1.0
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.5, 1.0)   ###mean_laa = 1
trans <- 0.5
trans2 <- 0.5
trait_high_rates <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_high_rates <- cbind(
  trait_high_rates,
  lac2 = 2 - trait_high_rates[, 4] ,
  mu2 = 2 - trait_high_rates[, 5] ,
  gam2 = 0.04 - trait_high_rates[, 6],
  laa2 = 2 - trait_high_rates[, 7])

### 3. lambdac/mu+gamma+lambdaa
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1
mu <- c(0.25, 0.5, 0.75)    ###mean_mu = 0.5
K <- c(40, Inf)
gam <- c(0.005, 0.01)  ###mean_gam = 0.01
laa <- c(0.25, 0.5)   ###mean_laa = 0.5
trans <- 0.5
trans2 <- 0.5
trait_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_lac <- cbind(
  trait_lac,
  lac2 = 2.0 - trait_lac[, 4] ,
  mu2 = 1.0 - trait_lac[, 5] ,
  gam2 = 0.02 - trait_lac[, 6],
  laa2 = 1.0 - trait_lac[, 7])

### 4. mu/lambdac+gamma+lambdaa
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1)   ###mean_lac = 1
mu <- c(0.25, 0.5, 0.75)    ###mean_mu = 0.5
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.5, 1)   ###mean_laa = 1
trans <- 0.5
trans2 <- 0.5
trait_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_mu <- cbind(
  trait_mu,
  lac2 = 2.0 - trait_mu[, 4] ,
  mu2 = 1.0 - trait_mu[, 5] ,
  gam2 = 0.04 - trait_mu[, 6],
  laa2 = 2.0 - trait_mu[, 7])

### 5. gamma/lambdac+mu+lambdaa
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1.0
mu <- c(0.5, 1.0, 1.5)    ###mean_mu = 1.0
K <- c(40, Inf)
gam <- c(0.005, 0.01)  ###mean_gam = 0.01
laa <- c(0.5, 1.0)   ###mean_laa = 1
trans <- 0.5
trans2 <- 0.5
trait_gamma <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_gamma <- cbind(
  trait_gamma,
  lac2 = 2.0 - trait_gamma[, 4] ,
  mu2 = 2.0 - trait_gamma[, 5] ,
  gam2 = 0.02 - trait_gamma[, 6],
  laa2 = 2 - trait_gamma[, 7])


### 6. lambdaa/lambdac+mu+gamma
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1
mu <- c(0.5, 1.0, 1.5)    ###mean_mu = 1
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.25, 0.5)   ###mean_laa = 0.5
trans <- 0.5
trans2 <- 0.5
trait_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_laa <- cbind(
  trait_laa,
  lac2 = 2.0 - trait_laa[, 4] ,
  mu2 = 2.0 - trait_laa[, 5] ,
  gam2 = 0.04 - trait_laa[, 6],
  laa2 = 1 - trait_laa[, 7])


### 7. gamma+lambdaa/lambdac+mu
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.25, 0.5)   ###mean_lac = 0.5
mu <- c(0.25, 0.5, 0.75)    ###mean_mu = 0.5
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.5, 1)   ###mean_laa = 1
trans <- 0.5
trans2 <- 0.5
trait_lac_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_lac_mu <- cbind(
  trait_lac_mu,
  lac2 = 1 - trait_lac_mu[, 4] ,
  mu2 = 1 - trait_lac_mu[, 5] ,
  gam2 = 0.04 - trait_lac_mu[, 6],
  laa2 = 2 - trait_lac_mu[, 7])


### 8. mu+lambdaa/lambdac+gamma
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1)   ###mean_lac = 1
mu <- c(0.25, 0.5, 0.75)    ###mean_mu = 0.5
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.25, 0.5)   ###mean_laa = 0.5
trans <- 0.5
trans2 <- 0.5
trait_lac_gamma <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_lac_gamma <- cbind(
  trait_lac_gamma,
  lac2 = 2 - trait_lac_gamma[, 4] ,
  mu2 = 1 - trait_lac_gamma[, 5] ,
  gam2 = 0.04 - trait_lac_gamma[, 6],
  laa2 = 1 - trait_lac_gamma[, 7])

### 9. mu+gamma/lambdac+lambdaa
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1.0
mu <- c(0.25, 0.5, 0.75)    ###mean_mu = 0.5
K <- c(40, Inf)
gam <- c(0.005, 0.01)  ###mean_gam = 0.01
laa <- c(0.5, 1.0)   ###mean_laa = 1
trans <- 0.5
trans2 <- 0.5
trait_lac_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_lac_laa <- cbind(
  trait_lac_laa,
  lac2 = 2 - trait_lac_laa[, 4] ,
  mu2 = 1 - trait_lac_laa[, 5] ,
  gam2 = 0.02 - trait_lac_laa[, 6],
  laa2 = 2 - trait_lac_laa[, 7])

trait_CES <- rbind(
  trait_low_rates,
  trait_high_rates,
  trait_lac,
  trait_mu,
  trait_gamma,
  trait_laa,
  trait_lac_mu,
  trait_lac_gamma,
  trait_lac_laa)

write.csv2(
  trait_CES,
  "data/trait_CES.csv",
  row.names = FALSE
)


### 10. high rates without transition
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1.0
mu <- c(0.5, 1.0, 1.5)    ###mean_mu = 1.0
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.5, 1.0)   ###mean_laa = 1
trans <- 0
trans2 <- 0
trait_high_rates_notrans <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_high_rates_notrans <- cbind(
  trait_high_rates_notrans,
  lac2 = 2 - trait_high_rates_notrans[, 4] ,
  mu2 = 2 - trait_high_rates_notrans[, 5] ,
  gam2 = 0.04 - trait_high_rates_notrans[, 6],
  laa2 = 2 - trait_high_rates_notrans[, 7])

### 11. high rates with asymmetric transition
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1.0
mu <- c(0.5, 1.0, 1.5)    ###mean_mu = 1.0
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.5, 1.0)   ###mean_laa = 1
trans <- 0.5
trans2 <- 2
trait_high_rates_trans <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_high_rates_trans <- cbind(
  trait_high_rates_trans,
  lac2 = 2 - trait_high_rates_trans[, 4] ,
  mu2 = 2 - trait_high_rates_trans[, 5] ,
  gam2 = 0.04 - trait_high_rates_trans[, 6],
  laa2 = 2 - trait_high_rates_trans[, 7])

### 12. high rates with asymmetric transition(exchange)
time <- c(2.5, 5)
M <- 500
M2 <- 500
lac <- c(0.5, 1.0)   ###mean_lac = 1.0
mu <- c(0.5, 1.0, 1.5)    ###mean_mu = 1.0
K <- c(40, Inf)
gam <- c(0.01, 0.02)  ###mean_gam = 0.02
laa <- c(0.5, 1.0)   ###mean_laa = 1
trans <- 2
trans2 <- 0.5
trait_high_rates_trans2 <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K)
trait_high_rates_trans2 <- cbind(
  trait_high_rates_trans2,
  lac2 = 2 - trait_high_rates_trans2[, 4] ,
  mu2 = 2 - trait_high_rates_trans2[, 5] ,
  gam2 = 0.04 - trait_high_rates_trans2[, 6],
  laa2 = 2 - trait_high_rates_trans2[, 7])

trait_trans <- rbind(
  trait_high_rates_notrans,
  trait_high_rates_trans,
  trait_high_rates_trans2)

write.csv2(
  trait_trans,
  "data/trait_trans.csv",
  row.names = FALSE
)
