#### trait_CES
# Low and same transition rates
# 1.low mean rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.05
trait_low_rates_low_trans <- expand.grid(
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
trait_low_rates_low_trans <- cbind(
  trait_low_rates_low_trans,
  lac2 = 0.4 - trait_low_rates_low_trans[, 4] ,
  mu2 = 0.2 - trait_low_rates_low_trans[, 5] ,
  gam2 = 0.016 - trait_low_rates_low_trans[, 6],
  laa2 = 0.2 - trait_low_rates_low_trans[, 7])

#2. high rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.05
trait_high_rates_low_trans <- expand.grid(
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
trait_high_rates_low_trans <- cbind(
  trait_high_rates_low_trans,
  lac2 = 0.8 - trait_high_rates_low_trans[, 4] ,
  mu2 = 0.4 - trait_high_rates_low_trans[, 5] ,
  gam2 = 0.024 - trait_high_rates_low_trans[, 6],
  laa2 = 0.4 - trait_high_rates_low_trans[, 7])

# 3. lambdac/mu+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.05
trait_lac_low_trans <- expand.grid(
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
trait_lac_low_trans <- cbind(
  trait_lac_low_trans,
  lac2 = 0.8 - trait_lac_low_trans[, 4] ,
  mu2 = 0.2 - trait_lac_low_trans[, 5] ,
  gam2 = 0.016 - trait_lac_low_trans[, 6],
  laa2 = 0.2 - trait_lac_low_trans[, 7])

# 4. mu/lambdac+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.05
trait_mu_low_trans <- expand.grid(
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
trait_mu_low_trans <- cbind(
  trait_mu_low_trans,
  lac2 = 0.8 - trait_mu_low_trans[, 4] ,
  mu2 = 0.2 - trait_mu_low_trans[, 5] ,
  gam2 = 0.024 - trait_mu_low_trans[, 6],
  laa2 = 0.4 - trait_mu_low_trans[, 7])

# 5. gamma/lambdac+mu+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.05
trait_gamma_low_trans <- expand.grid(
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
trait_gamma_low_trans <- cbind(
  trait_gamma_low_trans,
  lac2 = 0.4 - trait_gamma_low_trans[, 4] ,
  mu2 = 0.2 - trait_gamma_low_trans[, 5] ,
  gam2 = 0.024 - trait_gamma_low_trans[, 6],
  laa2 = 0.2 - trait_gamma_low_trans[, 7])


# 6. lambdaa/lambdac+mu+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.05
trait_laa_low_trans <- expand.grid(
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
trait_laa_low_trans <- cbind(
  trait_laa_low_trans,
  lac2 = 0.8 - trait_laa_low_trans[, 4] ,
  mu2 = 0.4 - trait_laa_low_trans[, 5] ,
  gam2 = 0.024 - trait_laa_low_trans[, 6],
  laa2 = 0.2 - trait_laa_low_trans[, 7])


# 7. gamma+lambdaa/lambdac+mu
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.05
trait_lac_mu_low_trans <- expand.grid(
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
trait_lac_mu_low_trans <- cbind(
  trait_lac_mu_low_trans,
  lac2 = 0.4 - trait_lac_mu_low_trans[, 4] ,
  mu2 = 0.2 - trait_lac_mu_low_trans[, 5] ,
  gam2 = 0.024 - trait_lac_mu_low_trans[, 6],
  laa2 = 0.4 - trait_lac_mu_low_trans[, 7])


# 8. mu+lambdaa/lambdac+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.05
trait_lac_gamma_low_trans <- expand.grid(
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
trait_lac_gamma_low_trans <- cbind(
  trait_lac_gamma_low_trans,
  lac2 = 0.8 - trait_lac_gamma_low_trans[, 4] ,
  mu2 = 0.2 - trait_lac_gamma_low_trans[, 5] ,
  gam2 = 0.024 - trait_lac_gamma_low_trans[, 6],
  laa2 = 0.2 - trait_lac_gamma_low_trans[, 7])

# 9. mu+gamma/lambdac+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.05
trait_lac_laa_low_trans <- expand.grid(
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
trait_lac_laa_low_trans <- cbind(
  trait_lac_laa_low_trans,
  lac2 = 0.8 - trait_lac_laa_low_trans[, 4] ,
  mu2 = 0.2 - trait_lac_laa_low_trans[, 5],
  gam2 = 0.016 - trait_lac_laa_low_trans[, 6],
  laa2 = 0.4 - trait_lac_laa_low_trans[, 7])


## High and same transition rates
# 1.low mean rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.2
trait_low_rates_high_trans <- expand.grid(
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
trait_low_rates_high_trans <- cbind(
  trait_low_rates_high_trans,
  lac2 = 0.4 - trait_low_rates_high_trans[, 4] ,
  mu2 = 0.2 - trait_low_rates_high_trans[, 5] ,
  gam2 = 0.016 - trait_low_rates_high_trans[, 6],
  laa2 = 0.2 - trait_low_rates_high_trans[, 7])

# 2. high rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.2
trait_high_rates_high_trans <- expand.grid(
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
trait_high_rates_high_trans <- cbind(
  trait_high_rates_high_trans,
  lac2 = 0.8 - trait_high_rates_high_trans[, 4] ,
  mu2 = 0.4 - trait_high_rates_high_trans[, 5] ,
  gam2 = 0.024 - trait_high_rates_high_trans[, 6],
  laa2 = 0.4 - trait_high_rates_high_trans[, 7])

# 3. lambdac/mu+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.2
trait_lac_high_trans <- expand.grid(
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
trait_lac_high_trans <- cbind(
  trait_lac_high_trans,
  lac2 = 0.8 - trait_lac_high_trans[, 4] ,
  mu2 = 0.2 - trait_lac_high_trans[, 5] ,
  gam2 = 0.016 - trait_lac_high_trans[, 6],
  laa2 = 0.2 - trait_lac_high_trans[, 7])

# 4. mu/lambdac+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.2
trait_mu_high_trans <- expand.grid(
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
trait_mu_high_trans <- cbind(
  trait_mu_high_trans,
  lac2 = 0.8 - trait_mu_high_trans[, 4] ,
  mu2 = 0.2 - trait_mu_high_trans[, 5] ,
  gam2 = 0.024 - trait_mu_high_trans[, 6],
  laa2 = 0.4 - trait_mu_high_trans[, 7])

### 5. gamma/lambdac+mu+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.2
trait_gamma_high_trans <- expand.grid(
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
trait_gamma_high_trans <- cbind(
  trait_gamma_high_trans,
  lac2 = 0.4 - trait_gamma_high_trans[, 4] ,
  mu2 = 0.2 - trait_gamma_high_trans[, 5] ,
  gam2 = 0.024 - trait_gamma_high_trans[, 6],
  laa2 = 0.2 - trait_gamma_high_trans[, 7])


# 6. lambdaa/lambdac+mu+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.2
trait_laa_high_trans <- expand.grid(
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
trait_laa_high_trans <- cbind(
  trait_laa_high_trans,
  lac2 = 0.8 - trait_laa_high_trans[, 4] ,
  mu2 = 0.4 - trait_laa_high_trans[, 5] ,
  gam2 = 0.024 - trait_laa_high_trans[, 6],
  laa2 = 0.2 - trait_laa_high_trans[, 7])


# 7. gamma+lambdaa/lambdac+mu
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.2
trait_lac_mu_high_trans <- expand.grid(
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
trait_lac_mu_high_trans <- cbind(
  trait_lac_mu_high_trans,
  lac2 = 0.4 - trait_lac_mu_high_trans[, 4] ,
  mu2 = 0.2 - trait_lac_mu_high_trans[, 5] ,
  gam2 = 0.024 - trait_lac_mu_high_trans[, 6],
  laa2 = 0.4 - trait_lac_mu_high_trans[, 7])


# 8. mu+lambdaa/lambdac+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.2
trait_lac_gamma_high_trans <- expand.grid(
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
trait_lac_gamma_high_trans <- cbind(
  trait_lac_gamma_high_trans,
  lac2 = 0.8 - trait_lac_gamma_high_trans[, 4] ,
  mu2 = 0.2 - trait_lac_gamma_high_trans[, 5] ,
  gam2 = 0.024 - trait_lac_gamma_high_trans[, 6],
  laa2 = 0.2 - trait_lac_gamma_high_trans[, 7])

# 9. mu+gamma/lambdac+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.2
trait_lac_laa_high_trans <- expand.grid(
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
trait_lac_laa_high_trans <- cbind(
  trait_lac_laa_high_trans,
  lac2 = 0.8 - trait_lac_laa_high_trans[, 4] ,
  mu2 = 0.2 - trait_lac_laa_high_trans[, 5],
  gam2 = 0.016 - trait_lac_laa_high_trans[, 6],
  laa2 = 0.4 - trait_lac_laa_high_trans[, 7])


trait_CES <- rbind(
  trait_low_rates_low_trans,
  trait_high_rates_low_trans,
  trait_lac_low_trans,
  trait_mu_low_trans,
  trait_gamma_low_trans,
  trait_laa_low_trans,
  trait_lac_mu_low_trans,
  trait_lac_gamma_low_trans,
  trait_lac_laa_low_trans,
  trait_low_rates_high_trans,
  trait_high_rates_high_trans,
  trait_lac_high_trans,
  trait_mu_high_trans,
  trait_gamma_high_trans,
  trait_laa_high_trans,
  trait_lac_mu_high_trans,
  trait_lac_gamma_high_trans,
  trait_lac_laa_high_trans)

write.csv2(
  trait_CES,
  "data/trait_CES.csv",
  row.names = FALSE
)



# ### 1. high rates without transition
# time <- 5
# M <- 500
# M2 <- 500
# lac <- c(0.3, 0.4)   ###mean_lac = 0.4
# mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
# K <- c(40, Inf)
# gam <- c(0.008, 0.012)  ###mean_gam = 0.012
# laa <- c(0.1, 0.2)   ###mean_laa = 0.2
# trans <- 0.01
# trans2 <- 0.01
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
#   lac2 = 0.8 - trait_high_rates_notrans[, 4] ,
#   mu2 = 0.4 - trait_high_rates_notrans[, 5] ,
#   gam2 = 0.024 - trait_high_rates_notrans[, 6],
#   laa2 = 0.4 - trait_high_rates_notrans[, 7])
#
# ### 11. high rates with asymmetric transition
# time <- 5
# M <- 500
# M2 <- 500
# lac <- c(0.3, 0.4)   ###mean_lac = 0.4
# mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
# K <- c(40, Inf)
# gam <- c(0.008, 0.012)  ###mean_gam = 0.012
# laa <- c(0.1, 0.2)   ###mean_laa = 0.2
# trans <- 0.05
# trans2 <- 0.2
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
#   lac2 = 0.8 - trait_high_rates_trans[, 4] ,
#   mu2 = 0.4 - trait_high_rates_trans[, 5] ,
#   gam2 = 0.024 - trait_high_rates_trans[, 6],
#   laa2 = 0.4 - trait_high_rates_trans[, 7])
#
# ### 12. high rates with asymmetric transition(exchange)
# time <- 5
# M <- 500
# M2 <- 500
# lac <- c(0.3, 0.4)   ###mean_lac = 0.4
# mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
# K <- c(40, Inf)
# gam <- c(0.008, 0.012)  ###mean_gam = 0.012
# laa <- c(0.1, 0.2)   ###mean_laa = 0.2
# trans <- 0.2
# trans2 <- 0.05
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
#   lac2 = 0.8 - trait_high_rates_trans2[, 4] ,
#   mu2 = 0.4 - trait_high_rates_trans2[, 5] ,
#   gam2 = 0.024 - trait_high_rates_trans2[, 6],
#   laa2 = 0.4 - trait_high_rates_trans2[, 7])



#### trait_trans
# low q12, high q21
# 1.low mean rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.2
trait_low_rates_low_high <- expand.grid(
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
trait_low_rates_low_high <- cbind(
  trait_low_rates_low_high,
  lac2 = 0.4 - trait_low_rates_low_high[, 4] ,
  mu2 = 0.2 - trait_low_rates_low_high[, 5] ,
  gam2 = 0.016 - trait_low_rates_low_high[, 6],
  laa2 = 0.2 - trait_low_rates_low_high[, 7])

####2. high rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.2
trait_high_rates_low_high <- expand.grid(
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
trait_high_rates_low_high <- cbind(
  trait_high_rates_low_high,
  lac2 = 0.8 - trait_high_rates_low_high[, 4] ,
  mu2 = 0.4 - trait_high_rates_low_high[, 5] ,
  gam2 = 0.024 - trait_high_rates_low_high[, 6],
  laa2 = 0.4 - trait_high_rates_low_high[, 7])

### 3. lambdac/mu+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.2
trait_lac_low_high <- expand.grid(
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
trait_lac_low_high <- cbind(
  trait_lac_low_high,
  lac2 = 0.8 - trait_lac_low_high[, 4] ,
  mu2 = 0.2 - trait_lac_low_high[, 5] ,
  gam2 = 0.016 - trait_lac_low_high[, 6],
  laa2 = 0.2 - trait_lac_low_high[, 7])

### 4. mu/lambdac+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.2
trait_mu_low_high <- expand.grid(
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
trait_mu_low_high <- cbind(
  trait_mu_low_high,
  lac2 = 0.8 - trait_mu_low_high[, 4] ,
  mu2 = 0.2 - trait_mu_low_high[, 5] ,
  gam2 = 0.024 - trait_mu_low_high[, 6],
  laa2 = 0.4 - trait_mu_low_high[, 7])

### 5. gamma/lambdac+mu+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.2
trait_gamma_low_high <- expand.grid(
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
trait_gamma_low_high <- cbind(
  trait_gamma_low_high,
  lac2 = 0.4 - trait_gamma_low_high[, 4] ,
  mu2 = 0.2 - trait_gamma_low_high[, 5] ,
  gam2 = 0.024 - trait_gamma_low_high[, 6],
  laa2 = 0.2 - trait_gamma_low_high[, 7])


### 6. lambdaa/lambdac+mu+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.2
trait_laa_low_high <- expand.grid(
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
trait_laa_low_high <- cbind(
  trait_laa_low_high,
  lac2 = 0.8 - trait_laa_low_high[, 4] ,
  mu2 = 0.4 - trait_laa_low_high[, 5] ,
  gam2 = 0.024 - trait_laa_low_high[, 6],
  laa2 = 0.2 - trait_laa_low_high[, 7])


### 7. gamma+lambdaa/lambdac+mu
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.2
trait_lac_mu_low_high <- expand.grid(
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
trait_lac_mu_low_high <- cbind(
  trait_lac_mu_low_high,
  lac2 = 0.4 - trait_lac_mu_low_high[, 4] ,
  mu2 = 0.2 - trait_lac_mu_low_high[, 5] ,
  gam2 = 0.024 - trait_lac_mu_low_high[, 6],
  laa2 = 0.4 - trait_lac_mu_low_high[, 7])


### 8. mu+lambdaa/lambdac+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.05
trans2 <- 0.2
trait_lac_gamma_low_high <- expand.grid(
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
trait_lac_gamma_low_high <- cbind(
  trait_lac_gamma_low_high,
  lac2 = 0.8 - trait_lac_gamma_low_high[, 4] ,
  mu2 = 0.2 - trait_lac_gamma_low_high[, 5] ,
  gam2 = 0.024 - trait_lac_gamma_low_high[, 6],
  laa2 = 0.2 - trait_lac_gamma_low_high[, 7])

### 9. mu+gamma/lambdac+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.2
trait_lac_laa_low_high <- expand.grid(
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
trait_lac_laa_low_high <- cbind(
  trait_lac_laa_low_high,
  lac2 = 0.8 - trait_lac_laa_low_high[, 4] ,
  mu2 = 0.2 - trait_lac_laa_low_high[, 5],
  gam2 = 0.016 - trait_lac_laa_low_high[, 6],
  laa2 = 0.4 - trait_lac_laa_low_high[, 7])

# high q12, low q21
# 1.low mean rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.05
trait_low_rates_high_low <- expand.grid(
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
trait_low_rates_high_low <- cbind(
  trait_low_rates_high_low,
  lac2 = 0.4 - trait_low_rates_high_low[, 4] ,
  mu2 = 0.2 - trait_low_rates_high_low[, 5] ,
  gam2 = 0.016 - trait_low_rates_high_low[, 6],
  laa2 = 0.2 - trait_low_rates_high_low[, 7])

####2. high rates for all
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.05
trait_high_rates_high_low <- expand.grid(
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
trait_high_rates_high_low <- cbind(
  trait_high_rates_high_low,
  lac2 = 0.8 - trait_high_rates_high_low[, 4] ,
  mu2 = 0.4 - trait_high_rates_high_low[, 5] ,
  gam2 = 0.024 - trait_high_rates_high_low[, 6],
  laa2 = 0.4 - trait_high_rates_high_low[, 7])

### 3. lambdac/mu+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.05
trait_lac_high_low <- expand.grid(
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
trait_lac_high_low <- cbind(
  trait_lac_high_low,
  lac2 = 0.8 - trait_lac_high_low[, 4] ,
  mu2 = 0.2 - trait_lac_high_low[, 5] ,
  gam2 = 0.016 - trait_lac_high_low[, 6],
  laa2 = 0.2 - trait_lac_high_low[, 7])

### 4. mu/lambdac+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.05
trait_mu_high_low <- expand.grid(
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
trait_mu_high_low <- cbind(
  trait_mu_high_low,
  lac2 = 0.8 - trait_mu_high_low[, 4] ,
  mu2 = 0.2 - trait_mu_high_low[, 5] ,
  gam2 = 0.024 - trait_mu_high_low[, 6],
  laa2 = 0.4 - trait_mu_high_low[, 7])

### 5. gamma/lambdac+mu+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.05
trait_gamma_high_low <- expand.grid(
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
trait_gamma_high_low <- cbind(
  trait_gamma_high_low,
  lac2 = 0.4 - trait_gamma_high_low[, 4] ,
  mu2 = 0.2 - trait_gamma_high_low[, 5] ,
  gam2 = 0.024 - trait_gamma_high_low[, 6],
  laa2 = 0.2 - trait_gamma_high_low[, 7])


### 6. lambdaa/lambdac+mu+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.05
trait_laa_high_low <- expand.grid(
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
trait_laa_high_low <- cbind(
  trait_laa_high_low,
  lac2 = 0.8 - trait_laa_high_low[, 4] ,
  mu2 = 0.4 - trait_laa_high_low[, 5] ,
  gam2 = 0.024 - trait_laa_high_low[, 6],
  laa2 = 0.2 - trait_laa_high_low[, 7])


### 7. gamma+lambdaa/lambdac+mu
time <- 5
M <- 500
M2 <- 500
lac <- c(0.15, 0.2)   ###mean_lac = 0.2
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.05
trait_lac_mu_high_low <- expand.grid(
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
trait_lac_mu_high_low <- cbind(
  trait_lac_mu_high_low,
  lac2 = 0.4 - trait_lac_mu_high_low[, 4] ,
  mu2 = 0.2 - trait_lac_mu_high_low[, 5] ,
  gam2 = 0.024 - trait_lac_mu_high_low[, 6],
  laa2 = 0.4 - trait_lac_mu_high_low[, 7])


### 8. mu+lambdaa/lambdac+gamma
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.1)   ###mean_laa = 0.1
trans <- 0.2
trans2 <- 0.05
trait_lac_gamma_high_low <- expand.grid(
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
trait_lac_gamma_high_low <- cbind(
  trait_lac_gamma_high_low,
  lac2 = 0.8 - trait_lac_gamma_high_low[, 4] ,
  mu2 = 0.2 - trait_lac_gamma_high_low[, 5] ,
  gam2 = 0.024 - trait_lac_gamma_high_low[, 6],
  laa2 = 0.2 - trait_lac_gamma_high_low[, 7])

### 9. mu+gamma/lambdac+lambdaa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.08, 0.1, 0.12)    ###mean_mu = 0.1
K <- c(40, Inf)
gam <- c(0.005, 0.008)  ###mean_gam = 0.008
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.05
trait_lac_laa_high_low <- expand.grid(
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
trait_lac_laa_high_low <- cbind(
  trait_lac_laa_high_low,
  lac2 = 0.8 - trait_lac_laa_high_low[, 4] ,
  mu2 = 0.2 - trait_lac_laa_high_low[, 5],
  gam2 = 0.016 - trait_lac_laa_high_low[, 6],
  laa2 = 0.4 - trait_lac_laa_high_low[, 7])

#### based on scenario 2 larger difference between rates with two states
# 10. median differences low q12 and high q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.2, 0.4)   ###mean_lac = 0.4
mu <- c(0.1, 0.2, 0.3)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.006, 0.012)  ###mean_gam = 0.012
laa <- c(0.08, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.2
trait_diff1_low_high <- expand.grid(
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
trait_diff1_low_high <- cbind(
  trait_diff1_low_high,
  lac2 = 0.8 - trait_diff1_low_high[, 4] ,
  mu2 = 0.4 - trait_diff1_low_high[, 5] ,
  gam2 = 0.024 - trait_diff1_low_high[, 6],
  laa2 = 0.4 - trait_diff1_low_high[, 7])

# 11. median differences high q12 and low q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.2, 0.4)   ###mean_lac = 0.4
mu <- c(0.1, 0.2, 0.3)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.006, 0.012)  ###mean_gam = 0.012
laa <- c(0.08, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.05
trait_diff1_high_low <- expand.grid(
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
trait_diff1_high_low <- cbind(
  trait_diff1_high_low,
  lac2 = 0.8 - trait_diff1_high_low[, 4] ,
  mu2 = 0.4 - trait_diff1_high_low[, 5] ,
  gam2 = 0.024 - trait_diff1_high_low[, 6],
  laa2 = 0.4 - trait_diff1_high_low[, 7])


####12. larger differences low q12 and high q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.1, 0.4)   ###mean_lac = 0.4
mu <- c(0.05, 0.2, 0.35)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.004, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.2
trait_diff2_low_high <- expand.grid(
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
trait_diff2_low_high <- cbind(
  trait_diff2_low_high,
  lac2 = 0.8 - trait_diff2_low_high[, 4] ,
  mu2 = 0.4 - trait_diff2_low_high[, 5] ,
  gam2 = 0.024 - trait_diff2_low_high[, 6],
  laa2 = 0.4 - trait_diff2_low_high[, 7])

# 13. larger differences high q12 and low q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.1, 0.4)   ###mean_lac = 0.4
mu <- c(0.05, 0.2, 0.35)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.004, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.05
trait_diff2_high_low <- expand.grid(
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
trait_diff2_high_low <- cbind(
  trait_diff2_high_low,
  lac2 = 0.8 - trait_diff2_high_low[, 4] ,
  mu2 = 0.4 - trait_diff2_high_low[, 5] ,
  gam2 = 0.024 - trait_diff2_high_low[, 6],
  laa2 = 0.4 - trait_diff2_high_low[, 7])


## new add with both low transition rates or both high transition rates
# 14. median differences low q12 and low q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.2, 0.4)   ###mean_lac = 0.4
mu <- c(0.1, 0.2, 0.3)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.006, 0.012)  ###mean_gam = 0.012
laa <- c(0.08, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.05
trait_diff1_low_low <- expand.grid(
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
trait_diff1_low_low <- cbind(
  trait_diff1_low_low,
  lac2 = 0.8 - trait_diff1_low_low[, 4] ,
  mu2 = 0.4 - trait_diff1_low_low[, 5] ,
  gam2 = 0.024 - trait_diff1_low_low[, 6],
  laa2 = 0.4 - trait_diff1_low_low[, 7])

# 15. median differences high q12 and high q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.2, 0.4)   ###mean_lac = 0.4
mu <- c(0.1, 0.2, 0.3)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.006, 0.012)  ###mean_gam = 0.012
laa <- c(0.08, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.2
trait_diff1_high_high <- expand.grid(
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
trait_diff1_high_high <- cbind(
  trait_diff1_high_high,
  lac2 = 0.8 - trait_diff1_high_high[, 4] ,
  mu2 = 0.4 - trait_diff1_high_high[, 5] ,
  gam2 = 0.024 - trait_diff1_high_high[, 6],
  laa2 = 0.4 - trait_diff1_high_high[, 7])

# 16. larger differences low q12 and low q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.1, 0.4)   ###mean_lac = 0.4
mu <- c(0.05, 0.2, 0.35)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.004, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.2)   ###mean_laa = 0.2
trans <- 0.05
trans2 <- 0.05
trait_diff2_low_low <- expand.grid(
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
trait_diff2_low_low <- cbind(
  trait_diff2_low_low,
  lac2 = 0.8 - trait_diff2_low_low[, 4] ,
  mu2 = 0.4 - trait_diff2_low_low[, 5] ,
  gam2 = 0.024 - trait_diff2_low_low[, 6],
  laa2 = 0.4 - trait_diff2_low_low[, 7])

# 17. larger differences high q12 and high q21
time <- 5
M <- 500
M2 <- 500
lac <- c(0.1, 0.4)   ###mean_lac = 0.4
mu <- c(0.05, 0.2, 0.35)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.004, 0.012)  ###mean_gam = 0.012
laa <- c(0.05, 0.2)   ###mean_laa = 0.2
trans <- 0.2
trans2 <- 0.2
trait_diff2_high_high <- expand.grid(
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
trait_diff2_high_high <- cbind(
  trait_diff2_high_high,
  lac2 = 0.8 - trait_diff2_high_high[, 4] ,
  mu2 = 0.4 - trait_diff2_high_high[, 5] ,
  gam2 = 0.024 - trait_diff2_high_high[, 6],
  laa2 = 0.4 - trait_diff2_high_high[, 7])


## change one param at a time and control all the others (scenario2 with all high rates)
# 1. larger diff in lac
time <- 5
M <- 500
M2 <- 500
lac <- c(0.1, 0.2)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- c(0.05, 0.2)
trans2 <- c(0.05, 0.2)
trait_large_diff_lac <- expand.grid(
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
trait_large_diff_lac <- cbind(
  trait_large_diff_lac,
  lac2 = 0.8 - trait_large_diff_lac[, 4] ,
  mu2 = 0.4 - trait_large_diff_lac[, 5] ,
  gam2 = 0.024 - trait_large_diff_lac[, 6],
  laa2 = 0.4 - trait_large_diff_lac[, 7])

# 2. larger diff in mu
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.05, 0.1, 0.3)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- c(0.05, 0.2)
trans2 <- c(0.05, 0.2)
trait_large_diff_mu <- expand.grid(
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
trait_large_diff_mu <- cbind(
  trait_large_diff_mu,
  lac2 = 0.8 - trait_large_diff_mu[, 4] ,
  mu2 = 0.4 - trait_large_diff_mu[, 5] ,
  gam2 = 0.024 - trait_large_diff_mu[, 6],
  laa2 = 0.4 - trait_large_diff_mu[, 7])

# 3. larger diff in gam
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.004, 0.006)  ###mean_gam = 0.012
laa <- c(0.1, 0.2)   ###mean_laa = 0.2
trans <- c(0.05, 0.2)
trans2 <- c(0.05, 0.2)
trait_large_diff_gam <- expand.grid(
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
trait_large_diff_gam <- cbind(
  trait_large_diff_gam,
  lac2 = 0.8 - trait_large_diff_gam[, 4] ,
  mu2 = 0.4 - trait_large_diff_gam[, 5] ,
  gam2 = 0.024 - trait_large_diff_gam[, 6],
  laa2 = 0.4 - trait_large_diff_gam[, 7])

# 4. larger diff in laa
time <- 5
M <- 500
M2 <- 500
lac <- c(0.3, 0.4)   ###mean_lac = 0.4
mu <- c(0.15, 0.2, 0.25)    ###mean_mu = 0.2
K <- c(40, Inf)
gam <- c(0.008, 0.012)  ###mean_gam = 0.012
laa <- c(0.04, 0.08)   ###mean_laa = 0.2
trans <- c(0.05, 0.2)
trans2 <- c(0.05, 0.2)
trait_large_diff_laa <- expand.grid(
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
trait_large_diff_laa <- cbind(
  trait_large_diff_laa,
  lac2 = 0.8 - trait_large_diff_laa[, 4] ,
  mu2 = 0.4 - trait_large_diff_laa[, 5] ,
  gam2 = 0.024 - trait_large_diff_laa[, 6],
  laa2 = 0.4 - trait_large_diff_laa[, 7])



trait_trans <- rbind(
  trait_low_rates_low_high,
  trait_high_rates_low_high,
  trait_lac_low_high,
  trait_mu_low_high,
  trait_gamma_low_high,
  trait_laa_low_high,
  trait_lac_mu_low_high,
  trait_lac_gamma_low_high,
  trait_lac_laa_low_high,
  trait_low_rates_high_low,
  trait_high_rates_high_low,
  trait_lac_high_low,
  trait_mu_high_low,
  trait_gamma_high_low,
  trait_laa_high_low,
  trait_lac_mu_high_low,
  trait_lac_gamma_high_low,
  trait_lac_laa_high_low,
  trait_diff1_low_high,
  trait_diff1_high_low,
  trait_diff2_low_high,
  trait_diff2_high_low,
  trait_diff1_low_low,
  trait_diff1_high_high,
  trait_diff2_low_low,
  trait_diff2_high_high,
  trait_large_diff_lac,
  trait_large_diff_mu,
  trait_large_diff_gam,
  trait_large_diff_laa
  )

write.csv2(
  trait_trans,
  "data/trait_trans.csv",
  row.names = FALSE
)
