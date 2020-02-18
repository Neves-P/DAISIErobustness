
# Generate paramter space for anaysis #
# Oceanic ontogeny --------------------------------------------------------
## Maui Nui ---------------------------------------------------------------


time <- 2.55
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "beta"
sea_level <- "const"
max_area <- 13500
peak_time <- 0.53
sharpness <- 1
total_island_age <- 2.864
sea_level_amplitude <- 0
sea_level_frequency <- 0
island_gradient_angle <- 0
extcutoff <- 1000
x_s <- 0
x_nonend <- 0
i <- 3
DAISIE::DAISIE_calc_sumstats_pcrates(
  pars = c(lac[i], 1, K[i], gam[i], 1),
  ext_pars = c(mu_min, mu_p[i]),
  totaltime = 2.55,
  area_pars = DAISIE::create_area_pars(
    max_area = 13500,
    proportional_peak_t = 0.53,
    peak_sharpness = 1,
    total_island_age = 2.864,
    sea_level_amplitude = 0,
    sea_level_frequency = 0,
    island_gradient_angle = 0
  )
)

maui_parameter_set <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)


## Kauai ------------------------------------------------------------------


time <- 6.15
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "beta"
sea_level <- "const"
max_area <- 3787
peak_time <- 0.27
sharpness <- 1
total_island_age <- 8.473
sea_level_amplitude <- 0
sea_level_frequency <- 0
island_gradient_angle <- 0
extcutoff <- 1000
x_s <- 0
x_nonend <- 0


kauai_parameter_set <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)


# Complete ontogeny paramter set ------------------------------------------

oceanic_ontogeny <- rbind(maui_parameter_set, kauai_parameter_set)
write.csv(oceanic_ontogeny, "data/oceanic_ontogeny.csv", row.names = FALSE)
# View(oceanic_ontogeny)


# Sea level ---------------------------------------------------------------
## Maui Nui ---------------------------------------------------------------
time <- 2.55
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 13500
peak_time <- 0
sharpness <- 0
total_island_age <- 2.55
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

maui_oceanic_sea_level <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

## Kauai ------------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 3787
peak_time <- 0
sharpness <- 0
total_island_age <- 6.15
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

kauai_oceanic_sea_level <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete oceanic sea level paramter set ---------------------------------

oceanic_sea_level <- rbind(maui_oceanic_sea_level, kauai_oceanic_sea_level)
write.csv(oceanic_sea_level, "data/oceanic_sea_level.csv", row.names = FALSE)


# Oceanic ontogeny sea level ----------------------------------------------
## Maui Nui ---------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "beta"
sea_level <- "sine"
max_area <- 13500
peak_time <- 0.53
sharpness <- 1
total_island_age <- 2.864
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

oceanic_ontogeny_sea_level_maui <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)


## Kauai -------------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "beta"
sea_level <- "sine"
max_area <- 3787
peak_time <- 0.27
sharpness <- 1
total_island_age <- 8.473
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

oceanic_ontogeny_sea_level_kauai <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete ontogeny sea level  paramter set -------------------------------

oceanic_ontogeny_sea_level <- rbind(
  oceanic_ontogeny_sea_level_maui,
  oceanic_ontogeny_sea_level_kauai
)

write.csv(
  oceanic_ontogeny_sea_level,
  "data/oceanic_ontogeny_sea_level.csv",
  row.names = FALSE
)

# Nonoceanic Maui Nui -------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.5, 1, 2)
mu <- c(0.5, 1, 2)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05, 0.1)
laa <- c(1, 2)
x_s <- c(0.1, 0.5)
x_nonend <- c(0.1, 0.9)

nonoceanic_maui <- expand.grid(
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

# Nonoceanic Kauai -------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.5, 1, 2)
mu <- c(0.5, 1, 2)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05, 0.1)
laa <- c(1, 2)
x_s <- c(0.1, 0.5)
x_nonend <- c(0.1, 0.9)

nonoceanic_kauai <- expand.grid(
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

nonoceanic <- rbind(
  nonoceanic_maui,
  nonoceanic_kauai
)

write.csv(
  nonoceanic,
  "data/nonoceanic.csv",
  row.names = FALSE
)



# Nonoceanic sea level Maui Nui -----------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 13500
peak_time <- 0
sharpness <- 0
total_island_age <- 2.55
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- c(0.1, 0.9)
x_nonend <- c(0.1, 0.5)

nonoceanic_sea_level_maui <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Nonoceanic sea level Kauai -----------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.0005, 0.00075, 0.001)
mu_min <- 1
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.01, Inf)
gam <- c(0.00001, 0.00005, 0.0001)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 3787
peak_time <- 0
sharpness <- 0
total_island_age <- 6.15
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- c(0.1, 0.9)
x_nonend <- c(0.1, 0.5)

nonoceanic_sea_level_kauai <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete nonoceanic sea level paramter set -------------------------------

nonoceanic_sea_level <- rbind(
  nonoceanic_sea_level_maui,
  nonoceanic_sea_level_kauai
)

write.csv(
  nonoceanic_sea_level,
  "data/nonoceanic_sea_level.csv",
  row.names = FALSE
)

# Nonoceanic land bridge --------------------------------------------------


# time <- 2.55
# M <- 1000
# lac <- c(0.0005, 0.00075, 0.001)
# mu_min <- 1
# mu_p <- c(25, 50, 75)
# K <- c(0.001, 0.01, Inf)
# gam <- c(0.00001, 0.00005, 0.0001)
# laa <- c(1, 2)
# island_ontogeny <- "const"
# sea_level <- "sine"
# max_area <- c(3787, 13500)
# peak_time <- 0
# sharpness <- 0
# total_island_age <- 2.55
# sea_level_amplitude <- 60
# sea_level_frequency <- 2.55 * 10
# island_gradient_angle <- c(25, 50, 75)
# extcutoff <- 1000
# x_s <- 0
# x_nonend <- 0

nonoceanic_land_bridge <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu_min = mu_min,
  mu_p = mu_p,
  K = K,
  gam = gam,
  laa = laa,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  peak_time = peak_time,
  sharpness = sharpness,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)
write.csv(nonoceanic_land_bridge, "data/nonoceanic_land_bridge.csv", row.names = FALSE)

