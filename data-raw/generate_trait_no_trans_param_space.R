## final parameter space for trait study
### symmetric scenarios for two Ks check
time <- 5
M <- 500
M2 <- 500
lac <- c(0.2, 0.4)
mu <- c(0.1, 0.2)
gam <- c(0.008, 0.012)
laa <- c(0.2, 0.4)
K <- c(20, Inf)
trans <- 0
trans2<-0
trait_no_trans <- expand.grid(
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
trait_no_trans <- cbind(
  trait_no_trans,
  lac2 = trait_no_trans[, 4],
  mu2 = trait_no_trans[, 5],
  gam2 = trait_no_trans[, 6],
  laa2 = trait_no_trans[, 7])

save(trait_no_trans, file = "inst/extdata/trait_no_trans.rda")
