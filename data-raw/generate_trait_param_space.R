## final parameter space for trait study
#### trait_CES
# Low and same transition rates
# G1
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.1
mean_gam <- 0.008
mean_laa <- 0.4
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g1_asym_laa <- cbind(
  g1_asym_laa,
  lac2 = 2*mean_lac - g1_asym_laa[, 4],
  mu2 = 2*mean_mu - g1_asym_laa[, 5],
  gam2 = 2*mean_gam - g1_asym_laa[, 6],
  laa2 = 2*mean_laa - g1_asym_laa[, 7])



#G2
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g2_asym_laa <- cbind(
  g2_asym_laa,
  lac2 = 2*mean_lac - g2_asym_laa[, 4],
  mu2 = 2*mean_mu - g2_asym_laa[, 5],
  gam2 = 2*mean_gam - g2_asym_laa[, 6],
  laa2 = 2*mean_laa - g2_asym_laa[, 7])

# G3
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.1
mean_gam <- 0.008
mean_laa <- 0.4
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g4_asym_laa <- cbind(
  g4_asym_laa,
  lac2 = 2*mean_lac - g4_asym_laa[, 4],
  mu2 = 2*mean_mu - g4_asym_laa[, 5],
  gam2 = 2*mean_gam - g4_asym_laa[, 6],
  laa2 = 2*mean_laa - g4_asym_laa[, 7])

# 5.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.1
mean_gam <- 0.012
mean_laa <- 0.4
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g5_asym_laa <- cbind(
  g5_asym_laa,
  lac2 = 2*mean_lac - g5_asym_laa[, 4],
  mu2 = 2*mean_mu - g5_asym_laa[, 5],
  gam2 = 2*mean_gam - g5_asym_laa[, 6],
  laa2 = 2*mean_laa - g5_asym_laa[, 7])


# 6.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.2
mean_gam <- 0.012
mean_laa <- 0.4


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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g6_asym_laa <- cbind(
  g6_asym_laa,
  lac2 = 2*mean_lac - g6_asym_laa[, 4],
  mu2 = 2*mean_mu - g6_asym_laa[, 5],
  gam2 = 2*mean_gam - g6_asym_laa[, 6],
  laa2 = 2*mean_laa - g6_asym_laa[, 7])


# 7.
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g7_asym_laa <- cbind(
  g7_asym_laa,
  lac2 = 2*mean_lac - g7_asym_laa[, 4],
  mu2 = 2*mean_mu - g7_asym_laa[, 5],
  gam2 = 2*mean_gam - g7_asym_laa[, 6],
  laa2 = 2*mean_laa - g7_asym_laa[, 7])


# 8.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.1
mean_gam <- 0.012
mean_laa <- 0.4
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g8_asym_laa <- cbind(
  g8_asym_laa,
  lac2 = 2*mean_lac - g8_asym_laa[, 4],
  mu2 = 2*mean_mu - g8_asym_laa[, 5],
  gam2 = 2*mean_gam - g8_asym_laa[, 6],
  laa2 = 2*mean_laa - g8_asym_laa[, 7])

# 9.
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
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
  K = K,
  divdepmodel = "CS")
g9_asym_laa <- cbind(
  g9_asym_laa,
  lac2 = 2*mean_lac - g9_asym_laa[, 4],
  mu2 = 2*mean_mu - g9_asym_laa[, 5],
  gam2 = 2*mean_gam - g9_asym_laa[, 6],
  laa2 = 2*mean_laa - g9_asym_laa[, 7])

# 10.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.2
mean_gam <- 0.008
mean_laa <- 0.4
# 10a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g10_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g10_sym <- cbind(
  g10_sym,
  lac2 = 2*mean_lac - g10_sym[, 4],
  mu2 = 2*mean_mu - g10_sym[, 5],
  gam2 = 2*mean_gam - g10_sym[, 6],
  laa2 = 2*mean_laa - g10_sym[, 7])
# 10b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g10_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g10_asym_lac <- cbind(
  g10_asym_lac,
  lac2 = 2*mean_lac - g10_asym_lac[, 4],
  mu2 = 2*mean_mu - g10_asym_lac[, 5],
  gam2 = 2*mean_gam - g10_asym_lac[, 6],
  laa2 = 2*mean_laa - g10_asym_lac[, 7])

# 10c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g10_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g10_asym_mu <- cbind(
  g10_asym_mu,
  lac2 = 2*mean_lac - g10_asym_mu[, 4],
  mu2 = 2*mean_mu - g10_asym_mu[, 5],
  gam2 = 2*mean_gam - g10_asym_mu[, 6],
  laa2 = 2*mean_laa - g10_asym_mu[, 7])
# 10d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g10_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g10_asym_gam <- cbind(
  g10_asym_gam,
  lac2 = 2*mean_lac - g10_asym_gam[, 4],
  mu2 = 2*mean_mu - g10_asym_gam[, 5],
  gam2 = 2*mean_gam - g10_asym_gam[, 6],
  laa2 = 2*mean_laa - g10_asym_gam[, 7])
# 10e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g10_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g10_asym_laa <- cbind(
  g10_asym_laa,
  lac2 = 2*mean_lac - g10_asym_laa[, 4],
  mu2 = 2*mean_mu - g10_asym_laa[, 5],
  gam2 = 2*mean_gam - g10_asym_laa[, 6],
  laa2 = 2*mean_laa - g10_asym_laa[, 7])

# 11.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.1
mean_gam <- 0.008
mean_laa <- 0.2
# 11a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g11_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g11_sym <- cbind(
  g11_sym,
  lac2 = 2*mean_lac - g11_sym[, 4],
  mu2 = 2*mean_mu - g11_sym[, 5],
  gam2 = 2*mean_gam - g11_sym[, 6],
  laa2 = 2*mean_laa - g11_sym[, 7])
# 11b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g11_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g11_asym_lac <- cbind(
  g11_asym_lac,
  lac2 = 2*mean_lac - g11_asym_lac[, 4],
  mu2 = 2*mean_mu - g11_asym_lac[, 5],
  gam2 = 2*mean_gam - g11_asym_lac[, 6],
  laa2 = 2*mean_laa - g11_asym_lac[, 7])

# 11c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g11_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g11_asym_mu <- cbind(
  g11_asym_mu,
  lac2 = 2*mean_lac - g11_asym_mu[, 4],
  mu2 = 2*mean_mu - g11_asym_mu[, 5],
  gam2 = 2*mean_gam - g11_asym_mu[, 6],
  laa2 = 2*mean_laa - g11_asym_mu[, 7])
# 11d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g11_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g11_asym_gam <- cbind(
  g11_asym_gam,
  lac2 = 2*mean_lac - g11_asym_gam[, 4],
  mu2 = 2*mean_mu - g11_asym_gam[, 5],
  gam2 = 2*mean_gam - g11_asym_gam[, 6],
  laa2 = 2*mean_laa - g11_asym_gam[, 7])
# 11e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g11_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g11_asym_laa <- cbind(
  g11_asym_laa,
  lac2 = 2*mean_lac - g11_asym_laa[, 4],
  mu2 = 2*mean_mu - g11_asym_laa[, 5],
  gam2 = 2*mean_gam - g11_asym_laa[, 6],
  laa2 = 2*mean_laa - g11_asym_laa[, 7])


# 12.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.2
mean_gam <- 0.008
mean_laa <- 0.4
# 12a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g12_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g12_sym <- cbind(
  g12_sym,
  lac2 = 2*mean_lac - g12_sym[, 4],
  mu2 = 2*mean_mu - g12_sym[, 5],
  gam2 = 2*mean_gam - g12_sym[, 6],
  laa2 = 2*mean_laa - g12_sym[, 7])
# 12b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g12_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g12_asym_lac <- cbind(
  g12_asym_lac,
  lac2 = 2*mean_lac - g12_asym_lac[, 4],
  mu2 = 2*mean_mu - g12_asym_lac[, 5],
  gam2 = 2*mean_gam - g12_asym_lac[, 6],
  laa2 = 2*mean_laa - g12_asym_lac[, 7])

# 12c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g12_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g12_asym_mu <- cbind(
  g12_asym_mu,
  lac2 = 2*mean_lac - g12_asym_mu[, 4],
  mu2 = 2*mean_mu - g12_asym_mu[, 5],
  gam2 = 2*mean_gam - g12_asym_mu[, 6],
  laa2 = 2*mean_laa - g12_asym_mu[, 7])
# 12d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g12_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g12_asym_gam <- cbind(
  g12_asym_gam,
  lac2 = 2*mean_lac - g12_asym_gam[, 4],
  mu2 = 2*mean_mu - g12_asym_gam[, 5],
  gam2 = 2*mean_gam - g12_asym_gam[, 6],
  laa2 = 2*mean_laa - g12_asym_gam[, 7])
# 12e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g12_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g12_asym_laa <- cbind(
  g12_asym_laa,
  lac2 = 2*mean_lac - g12_asym_laa[, 4],
  mu2 = 2*mean_mu - g12_asym_laa[, 5],
  gam2 = 2*mean_gam - g12_asym_laa[, 6],
  laa2 = 2*mean_laa - g12_asym_laa[, 7])

# 13.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.2
mean_gam <- 0.012
mean_laa <- 0.4
# 13a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g13_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g13_sym <- cbind(
  g13_sym,
  lac2 = 2*mean_lac - g13_sym[, 4],
  mu2 = 2*mean_mu - g13_sym[, 5],
  gam2 = 2*mean_gam - g13_sym[, 6],
  laa2 = 2*mean_laa - g13_sym[, 7])
# 13b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g13_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g13_asym_lac <- cbind(
  g13_asym_lac,
  lac2 = 2*mean_lac - g13_asym_lac[, 4],
  mu2 = 2*mean_mu - g13_asym_lac[, 5],
  gam2 = 2*mean_gam - g13_asym_lac[, 6],
  laa2 = 2*mean_laa - g13_asym_lac[, 7])

# 13c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g13_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g13_asym_mu <- cbind(
  g13_asym_mu,
  lac2 = 2*mean_lac - g13_asym_mu[, 4],
  mu2 = 2*mean_mu - g13_asym_mu[, 5],
  gam2 = 2*mean_gam - g13_asym_mu[, 6],
  laa2 = 2*mean_laa - g13_asym_mu[, 7])
# 13d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g13_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g13_asym_gam <- cbind(
  g13_asym_gam,
  lac2 = 2*mean_lac - g13_asym_gam[, 4],
  mu2 = 2*mean_mu - g13_asym_gam[, 5],
  gam2 = 2*mean_gam - g13_asym_gam[, 6],
  laa2 = 2*mean_laa - g13_asym_gam[, 7])
# 13e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g13_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g13_asym_laa <- cbind(
  g13_asym_laa,
  lac2 = 2*mean_lac - g13_asym_laa[, 4],
  mu2 = 2*mean_mu - g13_asym_laa[, 5],
  gam2 = 2*mean_gam - g13_asym_laa[, 6],
  laa2 = 2*mean_laa - g13_asym_laa[, 7])


# 14.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.2
mean_gam <- 0.008
mean_laa <- 0.2
# 14a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g14_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g14_sym <- cbind(
  g14_sym,
  lac2 = 2*mean_lac - g14_sym[, 4],
  mu2 = 2*mean_mu - g14_sym[, 5],
  gam2 = 2*mean_gam - g14_sym[, 6],
  laa2 = 2*mean_laa - g14_sym[, 7])
# 14b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g14_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g14_asym_lac <- cbind(
  g14_asym_lac,
  lac2 = 2*mean_lac - g14_asym_lac[, 4],
  mu2 = 2*mean_mu - g14_asym_lac[, 5],
  gam2 = 2*mean_gam - g14_asym_lac[, 6],
  laa2 = 2*mean_laa - g14_asym_lac[, 7])

# 14c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g14_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g14_asym_mu <- cbind(
  g14_asym_mu,
  lac2 = 2*mean_lac - g14_asym_mu[, 4],
  mu2 = 2*mean_mu - g14_asym_mu[, 5],
  gam2 = 2*mean_gam - g14_asym_mu[, 6],
  laa2 = 2*mean_laa - g14_asym_mu[, 7])
# 14d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g14_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g14_asym_gam <- cbind(
  g14_asym_gam,
  lac2 = 2*mean_lac - g14_asym_gam[, 4],
  mu2 = 2*mean_mu - g14_asym_gam[, 5],
  gam2 = 2*mean_gam - g14_asym_gam[, 6],
  laa2 = 2*mean_laa - g14_asym_gam[, 7])
# 14e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g14_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g14_asym_laa <- cbind(
  g14_asym_laa,
  lac2 = 2*mean_lac - g14_asym_laa[, 4],
  mu2 = 2*mean_mu - g14_asym_laa[, 5],
  gam2 = 2*mean_gam - g14_asym_laa[, 6],
  laa2 = 2*mean_laa - g14_asym_laa[, 7])

# 15.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.4
mean_mu <- 0.2
mean_gam <- 0.008
mean_laa <- 0.2
# 15a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g15_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g15_sym <- cbind(
  g15_sym,
  lac2 = 2*mean_lac - g15_sym[, 4],
  mu2 = 2*mean_mu - g15_sym[, 5],
  gam2 = 2*mean_gam - g15_sym[, 6],
  laa2 = 2*mean_laa - g15_sym[, 7])
# 15b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g15_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g15_asym_lac <- cbind(
  g15_asym_lac,
  lac2 = 2*mean_lac - g15_asym_lac[, 4],
  mu2 = 2*mean_mu - g15_asym_lac[, 5],
  gam2 = 2*mean_gam - g15_asym_lac[, 6],
  laa2 = 2*mean_laa - g15_asym_lac[, 7])

# 15c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g15_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g15_asym_mu <- cbind(
  g15_asym_mu,
  lac2 = 2*mean_lac - g15_asym_mu[, 4],
  mu2 = 2*mean_mu - g15_asym_mu[, 5],
  gam2 = 2*mean_gam - g15_asym_mu[, 6],
  laa2 = 2*mean_laa - g15_asym_mu[, 7])
# 15d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g15_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g15_asym_gam <- cbind(
  g15_asym_gam,
  lac2 = 2*mean_lac - g15_asym_gam[, 4],
  mu2 = 2*mean_mu - g15_asym_gam[, 5],
  gam2 = 2*mean_gam - g15_asym_gam[, 6],
  laa2 = 2*mean_laa - g15_asym_gam[, 7])
# 15e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g15_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g15_asym_laa <- cbind(
  g15_asym_laa,
  lac2 = 2*mean_lac - g15_asym_laa[, 4],
  mu2 = 2*mean_mu - g15_asym_laa[, 5],
  gam2 = 2*mean_gam - g15_asym_laa[, 6],
  laa2 = 2*mean_laa - g15_asym_laa[, 7])

# 16.
time <- 5
M <- 500
M2 <- 500
mean_lac <- 0.2
mean_mu <- 0.2
mean_gam <- 0.012
mean_laa <- 0.2
# 16a. symmetric for all
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g16_sym <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g16_sym <- cbind(
  g16_sym,
  lac2 = 2*mean_lac - g16_sym[, 4],
  mu2 = 2*mean_mu - g16_sym[, 5],
  gam2 = 2*mean_gam - g16_sym[, 6],
  laa2 = 2*mean_laa - g16_sym[, 7])
# 16b. asymmetric only in lac
lac <- c(0.25*mean_lac,0.5*mean_lac,0.75*mean_lac)
mu <- mean_mu
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g16_asym_lac <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g16_asym_lac <- cbind(
  g16_asym_lac,
  lac2 = 2*mean_lac - g16_asym_lac[, 4],
  mu2 = 2*mean_mu - g16_asym_lac[, 5],
  gam2 = 2*mean_gam - g16_asym_lac[, 6],
  laa2 = 2*mean_laa - g16_asym_lac[, 7])

# 16c. asymmetric only in mu
lac <- mean_lac
mu <- c(0.25*mean_mu,0.5*mean_mu,0.75*mean_mu)
gam <- mean_gam
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g16_asym_mu <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g16_asym_mu <- cbind(
  g16_asym_mu,
  lac2 = 2*mean_lac - g16_asym_mu[, 4],
  mu2 = 2*mean_mu - g16_asym_mu[, 5],
  gam2 = 2*mean_gam - g16_asym_mu[, 6],
  laa2 = 2*mean_laa - g16_asym_mu[, 7])
# 16d. asymmetric only in gam
lac <- mean_lac
mu <- mean_mu
gam <- c(0.25*mean_gam,0.5*mean_gam,0.75*mean_gam)
laa <- mean_laa
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g16_asym_gam <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g16_asym_gam <- cbind(
  g16_asym_gam,
  lac2 = 2*mean_lac - g16_asym_gam[, 4],
  mu2 = 2*mean_mu - g16_asym_gam[, 5],
  gam2 = 2*mean_gam - g16_asym_gam[, 6],
  laa2 = 2*mean_laa - g16_asym_gam[, 7])
# 16e. asymmetric only in laa
lac <- mean_lac
mu <- mean_mu
gam <- mean_gam
laa <- c(0.25*mean_laa,0.5*mean_laa,0.75*mean_laa)
K <- c(20, Inf)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
g16_asym_laa <- expand.grid(
  time = time,
  M = M,
  M2 = M2,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  trans = trans,
  trans2 = trans2,
  K = K,
  divdepmodel = "CS")
g16_asym_laa <- cbind(
  g16_asym_laa,
  lac2 = 2*mean_lac - g16_asym_laa[, 4],
  mu2 = 2*mean_mu - g16_asym_laa[, 5],
  gam2 = 2*mean_gam - g16_asym_laa[, 6],
  laa2 = 2*mean_laa - g16_asym_laa[, 7])

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
  g9_asym_lac,
  g9_asym_mu,
  g9_asym_gam,
  g9_asym_laa,
  g10_sym,
  g10_asym_lac,
  g10_asym_mu,
  g10_asym_gam,
  g10_asym_laa,
  g11_sym,
  g11_asym_lac,
  g11_asym_mu,
  g11_asym_gam,
  g11_asym_laa,
  g12_sym,
  g12_asym_lac,
  g12_asym_mu,
  g12_asym_gam,
  g12_asym_laa,
  g13_sym,
  g13_asym_lac,
  g13_asym_mu,
  g13_asym_gam,
  g13_asym_laa,
  g14_sym,
  g14_asym_lac,
  g14_asym_mu,
  g14_asym_gam,
  g14_asym_laa,
  g15_sym,
  g15_asym_lac,
  g15_asym_mu,
  g15_asym_gam,
  g15_asym_laa,
  g16_sym,
  g16_asym_lac,
  g16_asym_mu,
  g16_asym_gam,
  g16_asym_laa)

# usethis::use_data(trait_CES, overwrite = TRUE)
save(trait_CES, file = "inst/extdata/trait_CES.rda")



### OCEANIC SCENARIO FOR DAISIE check
time <- 5
M <- 1000
lac <- c(0.2, 0.4)
mu <- c(0.1, 0.2)
gam <- c(0.008, 0.012)
laa <- c(0.2, 0.4)
K <- c(20, Inf)
oceanic <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  gam = gam,
  laa = laa,
  K = K,
  divdepmodel = "CS")

save(oceanic, file = "inst/extdata/oceanic.rda")

