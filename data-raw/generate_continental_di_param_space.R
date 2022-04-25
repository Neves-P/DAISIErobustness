# Continental diversity-independent
# Young

continental_young <- expand.grid(
  time = 2.55,
  M = 1000,
  lac = c(0.25, 0.5),
  mu = c(0.25, 0.5),
  K = c(Inf),
  gam = c(0.01, 0.02),
  laa = c(0.25, 0.5),
  x_s = c(0.01, 0.05),
  x_nonend = c(0.1, 0.9),
  divdepmodel = "CS",
  stringsAsFactors = FALSE
)

## Old

continental_old <- expand.grid(
  time = 6.15,
  M = 1000,
  lac = c(0.25, 0.5),
  mu = c(0.25, 0.5),
  K = c(Inf),
  gam = c(0.01, 0.02),
  laa = c(0.25, 0.5),
  x_s = c(0.01, 0.05),
  x_nonend = c(0.1, 0.9),
  divdepmodel = "CS",
  stringsAsFactors = FALSE
)

## Ancient

continental_ancient <- expand.grid(
  time = 50,
  M = 1000,
  lac = c(0.25, 0.5),
  mu = c(0.25, 0.5),
  K = c(Inf),
  gam = c(0.01, 0.02),
  laa = c(0.25, 0.5),
  x_s = c(0.01, 0.05),
  x_nonend = c(0.1, 0.9),
  divdepmodel = "CS",
  stringsAsFactors = FALSE
)

# Complete continental diversity-independent parameter set

continental_di <- rbind(
  continental_young,
  continental_old,
  continental_ancient
)

save(continental_di, file = "inst/extdata/continental_di.rda")
