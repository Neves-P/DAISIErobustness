# Oceanic Maui Nui -------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.5)
mu <- c(0.4)
K <- c(40)
gam <- c(0.01)
laa <- c(1)
x_s <- 0
x_nonend <- 0

oceanic_maui <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Oceanic Kauai -------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.5)
mu <- c(0.4)
K <- c(40)
gam <- c(0.01)
laa <- c(1)
x_s <- 0
x_nonend <- 0

oceanic_kauai <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete nonoceanic  paramter set -------------------------------

oceanic <- rbind(
  oceanic_maui,
  oceanic_kauai
)

write.csv2(
  oceanic,
  "data/oceanic.csv",
  row.names = FALSE
)
