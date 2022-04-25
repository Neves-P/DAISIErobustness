# Continental island-wide diversity-dependent
## Young

continental_young <- expand.grid(
  time = 2.55,
  M = 1000,
  lac = c(0.25, 0.5),
  mu = c(0.25, 0.5),
  K = c(50, 100),
  gam = c(0.01, 0.02),
  laa = c(0.25, 0.5),
  x_s = c(0.01, 0.05),
  x_nonend = c(0.1, 0.9),
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

## Old

continental_old <- expand.grid(
  time = 6.15,
  M = 1000,
  lac = c(0.25, 0.5),
  mu = c(0.25, 0.5),
  K = c(50, 100),
  gam = c(0.01, 0.02),
  laa = c(0.25, 0.5),
  x_s = c(0.01, 0.05),
  x_nonend = c(0.1, 0.9),
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

## Ancient

continental_ancient <- expand.grid(
  time = 50,
  M = 1000,
  lac = c(0.25, 0.5),
  mu = c(0.25, 0.5),
  K = c(50, 100),
  gam = c(0.01, 0.02),
  laa = c(0.25, 0.5),
  x_s = c(0.01, 0.05),
  x_nonend = c(0.1, 0.9),
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

# Complete continental island-wide diversity-dependent parameter set

continental_iw <- rbind(
  continental_young,
  continental_old,
  continental_ancient
)

save(continental_iw, file = "inst/extdata/continental_iw.rda")
