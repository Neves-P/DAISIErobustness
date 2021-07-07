## final parameter space for trait study
#### trait_CES
# Low and same transition rates
# 1.low mean rates for all
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.1
mean_gam <- 0.008
mean_laa <- 0.1
# 1a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g1_sym <- expand.grid(
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
g1_sym <- cbind(
  g1_sym,
  lac2 = 2*mean_lac - g1_sym[, 4],
  mu2 = 2*mean_mu - g1_sym[, 5],
  gam2 = 2*mean_gam - g1_sym[, 6],
  laa2 = 2*mean_laa - g1_sym[, 7])
# 1b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g1_asym_lac <- expand.grid(
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
g1_asym_lac <- cbind(
  g1_asym_lac,
  lac2 = 2*mean_lac - g1_asym_lac[, 4],
  mu2 = 2*mean_mu - g1_asym_lac[, 5],
  gam2 = 2*mean_gam - g1_asym_lac[, 6],
  laa2 = 2*mean_laa - g1_asym_lac[, 7])

# 1c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g1_asym_mu <- expand.grid(
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
g1_asym_mu <- cbind(
  g1_asym_mu,
  lac2 = 2*mean_lac - g1_asym_mu[, 4],
  mu2 = 2*mean_mu - g1_asym_mu[, 5],
  gam2 = 2*mean_gam - g1_asym_mu[, 6],
  laa2 = 2*mean_laa - g1_asym_mu[, 7])
# 1d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g1_asym_gam <- expand.grid(
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
g1_asym_gam <- cbind(
  g1_asym_gam,
  lac2 = 2*mean_lac - g1_asym_gam[, 4],
  mu2 = 2*mean_mu - g1_asym_gam[, 5],
  gam2 = 2*mean_gam - g1_asym_gam[, 6],
  laa2 = 2*mean_laa - g1_asym_gam[, 7])
# 1e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g1_asym_laa <- expand.grid(
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
g1_asym_laa <- cbind(
  g1_asym_laa,
  lac2 = 2*mean_lac - g1_asym_laa[, 4],
  mu2 = 2*mean_mu - g1_asym_laa[, 5],
  gam2 = 2*mean_gam - g1_asym_laa[, 6],
  laa2 = 2*mean_laa - g1_asym_laa[, 7])



#2. high rates for all
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.2
mean_gam <- 0.012
mean_laa <- 0.2
# 2a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g2_sym <- expand.grid(
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
g2_sym <- cbind(
  g2_sym,
  lac2 = 2*mean_lac - g2_sym[, 4],
  mu2 = 2*mean_mu - g2_sym[, 5],
  gam2 = 2*mean_gam - g2_sym[, 6],
  laa2 = 2*mean_laa - g2_sym[, 7])
# 2b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g2_asym_lac <- expand.grid(
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
g2_asym_lac <- cbind(
  g2_asym_lac,
  lac2 = 2*mean_lac - g2_asym_lac[, 4],
  mu2 = 2*mean_mu - g2_asym_lac[, 5],
  gam2 = 2*mean_gam - g2_asym_lac[, 6],
  laa2 = 2*mean_laa - g2_asym_lac[, 7])

# 2c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g2_asym_mu <- expand.grid(
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
g2_asym_mu <- cbind(
  g2_asym_mu,
  lac2 = 2*mean_lac - g2_asym_mu[, 4],
  mu2 = 2*mean_mu - g2_asym_mu[, 5],
  gam2 = 2*mean_gam - g2_asym_mu[, 6],
  laa2 = 2*mean_laa - g2_asym_mu[, 7])

# 2d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g2_asym_gam <- expand.grid(
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
g2_asym_gam <- cbind(
  g2_asym_gam,
  lac2 = 2*mean_lac - g2_asym_gam[, 4],
  mu2 = 2*mean_mu - g2_asym_gam[, 5],
  gam2 = 2*mean_gam - g2_asym_gam[, 6],
  laa2 = 2*mean_laa - g2_asym_gam[, 7])

# 2e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g2_asym_laa <- expand.grid(
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
g2_asym_laa <- cbind(
  g2_asym_laa,
  lac2 = 2*mean_lac - g2_asym_laa[, 4],
  mu2 = 2*mean_mu - g2_asym_laa[, 5],
  gam2 = 2*mean_gam - g2_asym_laa[, 6],
  laa2 = 2*mean_laa - g2_asym_laa[, 7])

# 3. lambdac/mu+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.1
mean_gam <- 0.008
mean_laa <- 0.1
# 3a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g3_sym <- expand.grid(
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
g3_sym <- cbind(
  g3_sym,
  lac2 = 2*mean_lac - g3_sym[, 4],
  mu2 = 2*mean_mu - g3_sym[, 5],
  gam2 = 2*mean_gam - g3_sym[, 6],
  laa2 = 2*mean_laa - g3_sym[, 7])
# 3b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g3_asym_lac <- expand.grid(
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
g3_asym_lac <- cbind(
  g3_asym_lac,
  lac2 = 2*mean_lac - g3_asym_lac[, 4],
  mu2 = 2*mean_mu - g3_asym_lac[, 5],
  gam2 = 2*mean_gam - g3_asym_lac[, 6],
  laa2 = 2*mean_laa - g3_asym_lac[, 7])

# 3c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g3_asym_mu <- expand.grid(
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
g3_asym_mu <- cbind(
  g3_asym_mu,
  lac2 = 2*mean_lac - g3_asym_mu[, 4],
  mu2 = 2*mean_mu - g3_asym_mu[, 5],
  gam2 = 2*mean_gam - g3_asym_mu[, 6],
  laa2 = 2*mean_laa - g3_asym_mu[, 7])

# 3d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g3_asym_gam <- expand.grid(
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
g3_asym_gam <- cbind(
  g3_asym_gam,
  lac2 = 2*mean_lac - g3_asym_gam[, 4],
  mu2 = 2*mean_mu - g3_asym_gam[, 5],
  gam2 = 2*mean_gam - g3_asym_gam[, 6],
  laa2 = 2*mean_laa - g3_asym_gam[, 7])

# 3e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g3_asym_laa <- expand.grid(
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
g3_asym_laa <- cbind(
  g3_asym_laa,
  lac2 = 2*mean_lac - g3_asym_laa[, 4],
  mu2 = 2*mean_mu - g3_asym_laa[, 5],
  gam2 = 2*mean_gam - g3_asym_laa[, 6],
  laa2 = 2*mean_laa - g3_asym_laa[, 7])

# 4. mu/lambdac+gamma+lambdaa
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.1
mean_gam <- 0.012
mean_laa <- 0.2

# 4a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g4_sym <- expand.grid(
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
g4_sym <- cbind(
  g4_sym,
  lac2 = 2*mean_lac - g4_sym[, 4],
  mu2 = 2*mean_mu - g4_sym[, 5],
  gam2 = 2*mean_gam - g4_sym[, 6],
  laa2 = 2*mean_laa - g4_sym[, 7])
# 4b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g4_asym_lac <- expand.grid(
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
g4_asym_lac <- cbind(
  g4_asym_lac,
  lac2 = 2*mean_lac - g4_asym_lac[, 4],
  mu2 = 2*mean_mu - g4_asym_lac[, 5],
  gam2 = 2*mean_gam - g4_asym_lac[, 6],
  laa2 = 2*mean_laa - g4_asym_lac[, 7])

# 4c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g4_asym_mu <- expand.grid(
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
g4_asym_mu <- cbind(
  g4_asym_mu,
  lac2 = 2*mean_lac - g4_asym_mu[, 4],
  mu2 = 2*mean_mu - g4_asym_mu[, 5],
  gam2 = 2*mean_gam - g4_asym_mu[, 6],
  laa2 = 2*mean_laa - g4_asym_mu[, 7])

# 4d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g4_asym_gam <- expand.grid(
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
g4_asym_gam <- cbind(
  g4_asym_gam,
  lac2 = 2*mean_lac - g4_asym_gam[, 4],
  mu2 = 2*mean_mu - g4_asym_gam[, 5],
  gam2 = 2*mean_gam - g4_asym_gam[, 6],
  laa2 = 2*mean_laa - g4_asym_gam[, 7])

# 4e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g4_asym_laa <- expand.grid(
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
g4_asym_laa <- cbind(
  g4_asym_laa,
  lac2 = 2*mean_lac - g4_asym_laa[, 4],
  mu2 = 2*mean_mu - g4_asym_laa[, 5],
  gam2 = 2*mean_gam - g4_asym_laa[, 6],
  laa2 = 2*mean_laa - g4_asym_laa[, 7])

# 5. gamma/lambdac+mu+lambdaa
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.1
mean_gam <- 0.012
mean_laa <- 0.1
# 5a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g5_sym <- expand.grid(
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
g5_sym <- cbind(
  g5_sym,
  lac2 = 2*mean_lac - g5_sym[, 4],
  mu2 = 2*mean_mu - g5_sym[, 5],
  gam2 = 2*mean_gam - g5_sym[, 6],
  laa2 = 2*mean_laa - g5_sym[, 7])
# 5b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g5_asym_lac <- expand.grid(
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
g5_asym_lac <- cbind(
  g5_asym_lac,
  lac2 = 2*mean_lac - g5_asym_lac[, 4],
  mu2 = 2*mean_mu - g5_asym_lac[, 5],
  gam2 = 2*mean_gam - g5_asym_lac[, 6],
  laa2 = 2*mean_laa - g5_asym_lac[, 7])

# 5c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g5_asym_mu <- expand.grid(
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
g5_asym_mu <- cbind(
  g5_asym_mu,
  lac2 = 2*mean_lac - g5_asym_mu[, 4],
  mu2 = 2*mean_mu - g5_asym_mu[, 5],
  gam2 = 2*mean_gam - g5_asym_mu[, 6],
  laa2 = 2*mean_laa - g5_asym_mu[, 7])

# 5d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g5_asym_gam <- expand.grid(
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
g5_asym_gam <- cbind(
  g5_asym_gam,
  lac2 = 2*mean_lac - g5_asym_gam[, 4],
  mu2 = 2*mean_mu - g5_asym_gam[, 5],
  gam2 = 2*mean_gam - g5_asym_gam[, 6],
  laa2 = 2*mean_laa - g5_asym_gam[, 7])

# 5e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g5_asym_laa <- expand.grid(
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
g5_asym_laa <- cbind(
  g5_asym_laa,
  lac2 = 2*mean_lac - g5_asym_laa[, 4],
  mu2 = 2*mean_mu - g5_asym_laa[, 5],
  gam2 = 2*mean_gam - g5_asym_laa[, 6],
  laa2 = 2*mean_laa - g5_asym_laa[, 7])


# 6. lambdaa/lambdac+mu+gamma
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.2
mean_gam <- 0.012
mean_laa <- 0.1


# 6a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g6_sym <- expand.grid(
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
g6_sym <- cbind(
  g6_sym,
  lac2 = 2*mean_lac - g6_sym[, 4],
  mu2 = 2*mean_mu - g6_sym[, 5],
  gam2 = 2*mean_gam - g6_sym[, 6],
  laa2 = 2*mean_laa - g6_sym[, 7])
# 6b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g6_asym_lac <- expand.grid(
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
g6_asym_lac <- cbind(
  g6_asym_lac,
  lac2 = 2*mean_lac - g6_asym_lac[, 4],
  mu2 = 2*mean_mu - g6_asym_lac[, 5],
  gam2 = 2*mean_gam - g6_asym_lac[, 6],
  laa2 = 2*mean_laa - g6_asym_lac[, 7])

# 6c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g6_asym_mu <- expand.grid(
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
g6_asym_mu <- cbind(
  g6_asym_mu,
  lac2 = 2*mean_lac - g6_asym_mu[, 4],
  mu2 = 2*mean_mu - g6_asym_mu[, 5],
  gam2 = 2*mean_gam - g6_asym_mu[, 6],
  laa2 = 2*mean_laa - g6_asym_mu[, 7])

# 6d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g6_asym_gam <- expand.grid(
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
g6_asym_gam <- cbind(
  g6_asym_gam,
  lac2 = 2*mean_lac - g6_asym_gam[, 4],
  mu2 = 2*mean_mu - g6_asym_gam[, 5],
  gam2 = 2*mean_gam - g6_asym_gam[, 6],
  laa2 = 2*mean_laa - g6_asym_gam[, 7])

# 6e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g6_asym_laa <- expand.grid(
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
g6_asym_laa <- cbind(
  g6_asym_laa,
  lac2 = 2*mean_lac - g6_asym_laa[, 4],
  mu2 = 2*mean_mu - g6_asym_laa[, 5],
  gam2 = 2*mean_gam - g6_asym_laa[, 6],
  laa2 = 2*mean_laa - g6_asym_laa[, 7])


# 7. gamma+lambdaa/lambdac+mu
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.1
mean_gam <- 0.012
mean_laa <- 0.2
# 7a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g7_sym <- expand.grid(
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
g7_sym <- cbind(
  g7_sym,
  lac2 = 2*mean_lac - g7_sym[, 4],
  mu2 = 2*mean_mu - g7_sym[, 5],
  gam2 = 2*mean_gam - g7_sym[, 6],
  laa2 = 2*mean_laa - g7_sym[, 7])
# 7b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g7_asym_lac <- expand.grid(
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
g7_asym_lac <- cbind(
  g7_asym_lac,
  lac2 = 2*mean_lac - g7_asym_lac[, 4],
  mu2 = 2*mean_mu - g7_asym_lac[, 5],
  gam2 = 2*mean_gam - g7_asym_lac[, 6],
  laa2 = 2*mean_laa - g7_asym_lac[, 7])

# 7c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g7_asym_mu <- expand.grid(
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
g7_asym_mu <- cbind(
  g7_asym_mu,
  lac2 = 2*mean_lac - g7_asym_mu[, 4],
  mu2 = 2*mean_mu - g7_asym_mu[, 5],
  gam2 = 2*mean_gam - g7_asym_mu[, 6],
  laa2 = 2*mean_laa - g7_asym_mu[, 7])

# 7d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g7_asym_gam <- expand.grid(
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
g7_asym_gam <- cbind(
  g7_asym_gam,
  lac2 = 2*mean_lac - g7_asym_gam[, 4],
  mu2 = 2*mean_mu - g7_asym_gam[, 5],
  gam2 = 2*mean_gam - g7_asym_gam[, 6],
  laa2 = 2*mean_laa - g7_asym_gam[, 7])

# 7e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g7_asym_laa <- expand.grid(
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
g7_asym_laa <- cbind(
  g7_asym_laa,
  lac2 = 2*mean_lac - g7_asym_laa[, 4],
  mu2 = 2*mean_mu - g7_asym_laa[, 5],
  gam2 = 2*mean_gam - g7_asym_laa[, 6],
  laa2 = 2*mean_laa - g7_asym_laa[, 7])


# 8. mu+lambdaa/lambdac+gamma
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.1
mean_gam <- 0.012
mean_laa <- 0.1
# 8a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g8_sym <- expand.grid(
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
g8_sym <- cbind(
  g8_sym,
  lac2 = 2*mean_lac - g8_sym[, 4],
  mu2 = 2*mean_mu - g8_sym[, 5],
  gam2 = 2*mean_gam - g8_sym[, 6],
  laa2 = 2*mean_laa - g8_sym[, 7])
# 8b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g8_asym_lac <- expand.grid(
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
g8_asym_lac <- cbind(
  g8_asym_lac,
  lac2 = 2*mean_lac - g8_asym_lac[, 4],
  mu2 = 2*mean_mu - g8_asym_lac[, 5],
  gam2 = 2*mean_gam - g8_asym_lac[, 6],
  laa2 = 2*mean_laa - g8_asym_lac[, 7])

# 8c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g8_asym_mu <- expand.grid(
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
g8_asym_mu <- cbind(
  g8_asym_mu,
  lac2 = 2*mean_lac - g8_asym_mu[, 4],
  mu2 = 2*mean_mu - g8_asym_mu[, 5],
  gam2 = 2*mean_gam - g8_asym_mu[, 6],
  laa2 = 2*mean_laa - g8_asym_mu[, 7])

# 8d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g8_asym_gam <- expand.grid(
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
g8_asym_gam <- cbind(
  g8_asym_gam,
  lac2 = 2*mean_lac - g8_asym_gam[, 4],
  mu2 = 2*mean_mu - g8_asym_gam[, 5],
  gam2 = 2*mean_gam - g8_asym_gam[, 6],
  laa2 = 2*mean_laa - g8_asym_gam[, 7])

# 8e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g8_asym_laa <- expand.grid(
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
g8_asym_laa <- cbind(
  g8_asym_laa,
  lac2 = 2*mean_lac - g8_asym_laa[, 4],
  mu2 = 2*mean_mu - g8_asym_laa[, 5],
  gam2 = 2*mean_gam - g8_asym_laa[, 6],
  laa2 = 2*mean_laa - g8_asym_laa[, 7])

# 9. mu+gamma/lambdac+lambdaa
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.1
mean_gam <- 0.008
mean_laa <- 0.2
# 9a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g9_sym <- expand.grid(
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
g9_sym <- cbind(
  g9_sym,
  lac2 = 2*mean_lac - g9_sym[, 4],
  mu2 = 2*mean_mu - g9_sym[, 5],
  gam2 = 2*mean_gam - g9_sym[, 6],
  laa2 = 2*mean_laa - g9_sym[, 7])
# 9b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g9_asym_lac <- expand.grid(
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
g9_asym_lac <- cbind(
  g9_asym_lac,
  lac2 = 2*mean_lac - g9_asym_lac[, 4],
  mu2 = 2*mean_mu - g9_asym_lac[, 5],
  gam2 = 2*mean_gam - g9_asym_lac[, 6],
  laa2 = 2*mean_laa - g9_asym_lac[, 7])

# 9c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g9_asym_mu <- expand.grid(
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
g9_asym_mu <- cbind(
  g9_asym_mu,
  lac2 = 2*mean_lac - g9_asym_mu[, 4],
  mu2 = 2*mean_mu - g9_asym_mu[, 5],
  gam2 = 2*mean_gam - g9_asym_mu[, 6],
  laa2 = 2*mean_laa - g9_asym_mu[, 7])

# 9d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g9_asym_gam <- expand.grid(
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
g9_asym_gam <- cbind(
  g9_asym_gam,
  lac2 = 2*mean_lac - g9_asym_gam[, 4],
  mu2 = 2*mean_mu - g9_asym_gam[, 5],
  gam2 = 2*mean_gam - g9_asym_gam[, 6],
  laa2 = 2*mean_laa - g9_asym_gam[, 7])

# 9e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g9_asym_laa <- expand.grid(
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
g9_asym_laa <- cbind(
  g9_asym_laa,
  lac2 = 2*mean_lac - g9_asym_laa[, 4],
  mu2 = 2*mean_mu - g9_asym_laa[, 5],
  gam2 = 2*mean_gam - g9_asym_laa[, 6],
  laa2 = 2*mean_laa - g9_asym_laa[, 7])



trait_CES <- rbind(
  g1_sym,
  g1_asym_lac,
  g1_asym_mu,
  g1_asym_gam,
  g1_asym_laa,
  g2_sym,
  g2_asym_lac,
  g2_asym_mu,
  g2_asym_gam,
  g2_asym_laa,
  g3_sym,
  g3_asym_lac,
  g3_asym_mu,
  g3_asym_gam,
  g3_asym_laa,
  g4_sym,
  g4_asym_lac,
  g4_asym_mu,
  g4_asym_gam,
  g4_asym_laa,
  g5_sym,
  g5_asym_lac,
  g5_asym_mu,
  g5_asym_gam,
  g5_asym_laa,
  g6_sym,
  g6_asym_lac,
  g6_asym_mu,
  g6_asym_gam,
  g6_asym_laa,
  g7_sym,
  g7_asym_lac,
  g7_asym_mu,
  g7_asym_gam,
  g7_asym_laa,
  g8_sym,
  g8_asym_lac,
  g8_asym_mu,
  g8_asym_gam,
  g8_asym_laa,
  g9_sym,
  g1_asym_lac,
  g9_asym_mu,
  g9_asym_gam,
  g9_asym_laa)

write.csv2(
  trait_CES,
  "data/trait_CES.csv",
  row.names = FALSE
)



