## final parameter space for trait study
### symmetric scenarios for two Ks check
time <- 5
M <- 500
M2 <- 500
lac <- c(0.2, 0.4)
mu <- c(0.1, 0.2)
gam <- c(0.008, 0.012)
laa <- c(0.2, 0.4)
K <- c(2,5,10)
trans <- c(0.02, 0.2)
trans2 <- c(0.02, 0.2)
trait_2K <- expand.grid(
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
trait_CES_2K <- cbind(
  trait_2K,
  lac2 = trait_2K[, 4],
  mu2 = trait_2K[, 5],
  gam2 = trait_2K[, 6],
  laa2 = trait_2K[, 7],
  K2 = 20 - trait_2K[, 10])

save(trait_CES_2K, file = "inst/extdata/trait_CES_2K.rda")

