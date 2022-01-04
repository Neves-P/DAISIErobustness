# Nonoceanic diversity-independent
# Young

nonoceanic_young <- expand.grid(
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

nonoceanic_old <- expand.grid(
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

nonoceanic_ancient <- expand.grid(
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

# Complete nonoceanic diversity-independent parameter set

nonoceanic_di <- rbind(
  nonoceanic_young,
  nonoceanic_old,
  nonoceanic_ancient
)

save(nonoceanic_di, file = "inst/extdata/nonoceanic_di.rda")
