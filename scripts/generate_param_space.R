
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
# i <- 2
# DAISIE::DAISIE_calc_sumstats_pcrates(
#   pars = c(lac[i], 1, K[i], gam[i], 1),
#   ext_pars = c(mu_min, mu_p[i]),
#   totaltime = 2.55,
#   area_pars = DAISIE::create_area_pars(
#     max_area = 13500,
#     proportional_peak_t = 0.53,
#     peak_sharpness = 1,
#     total_island_age = 2.864,
#     sea_level_amplitude = 0,
#     sea_level_frequency = 0,
#     island_gradient_angle = 0
#   )
# )

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
max_area <- c(3787, 13500)
peak_time <- 0
sharpness <- 0
total_island_age <- 2.55
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(25, 50, 75)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

oceanic_sea_level <- expand.grid(
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
write.csv(oceanic_sea_level, "data/oceanic_sea_level.csv", row.names = FALSE)


# Oceanic ontogeny sea level ----------------------------------------------
#
time <- 2.864
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

