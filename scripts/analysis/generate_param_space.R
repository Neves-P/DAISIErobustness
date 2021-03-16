# Generate preliminary parameter space for anaysis #
# Oceanic ontogeny --------------------------------------------------------
## Young ---------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.02, 0.04)
mu <- c(0.975, 1.95)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03363, 0.06726)
laa <- c(0.0295, 0.059)
x <- c(0.075, 0.15)
d <- c(0.1108, 0.2216)
island_ontogeny <- "beta"
sea_level <- "const"
max_area <- 13500
current_area <- 3155
peak_time <- 0.53
total_island_age <- 2.864
sea_level_amplitude <- 0
sea_level_frequency <- 0
island_gradient_angle <- 0
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

young_parameter_set <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x = x,
  d = d,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  current_area = current_area,
  peak_time = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)


## Old ------------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.02, 0.04)
mu <- c(0.975, 1.95)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03363, 0.06726)
laa <- c(0.0295, 0.059)
x <- c(0.075, 0.15)
d <- c(0.1108, 0.2216)
island_ontogeny <- "beta"
sea_level <- "const"
max_area <- 3787
current_area <- 1431
peak_time <- 0.27
total_island_age <- 8.473
sea_level_amplitude <- 0
sea_level_frequency <- 0
island_gradient_angle <- 0
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

old_parameter_set <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x = x,
  d = d,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  current_area = current_area,
  peak_time = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete ontogeny parameter set ------------------------------------------

oceanic_ontogeny <- rbind(young_parameter_set, old_parameter_set)
write.csv2(oceanic_ontogeny, "data/oceanic_ontogeny.csv", row.names = FALSE)

# Sea level ---------------------------------------------------------------
## Young ---------------------------------------------------------------
time <- 2.55
M <- 1000
lac <- c(0.02, 0.04)
mu <- c(0.975, 1.95)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03363, 0.06726)
laa <- c(0.0295, 0.059)
x <- c(0.075, 0.15)
d <- c(0.1108, 0.2216)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 13500
current_area <- 3155
peak_time <- 0
total_island_age <- 2.55
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(80, 85)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

young_oceanic_sea_level <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x = x,
  d = d,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  current_area = current_area,
  peak_time = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

## Old ------------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.02, 0.04)
mu <- c(0.975, 1.95)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03363, 0.06726)
laa <- c(0.0295, 0.059)
x <- c(0.075, 0.15)
d <- c(0.1108, 0.2216)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 3787
current_area <- 1431
peak_time <- 0
total_island_age <- 6.15
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(80, 85)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

old_oceanic_sea_level <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x = x,
  d = d,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  current_area = current_area,
  peak_time = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete oceanic sea level parameter set ---------------------------------

oceanic_sea_level <- rbind(young_oceanic_sea_level, old_oceanic_sea_level)
write.csv2(oceanic_sea_level, "data/oceanic_sea_level.csv", row.names = FALSE)


# Oceanic ontogeny sea level ----------------------------------------------
## Young ---------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.02, 0.04)
mu <- c(0.975, 1.95)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03363, 0.06726)
laa <- c(0.0295, 0.059)
x <- c(0.075, 0.15)
d <- c(0.1108, 0.2216)
island_ontogeny <- "beta"
sea_level <- "sine"
max_area <- 13500
current_area <- 3155
peak_time <- 0.53
total_island_age <- 2.864
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(80, 85)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

oceanic_ontogeny_sea_level_young <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x = x,
  d = d,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  current_area = current_area,
  peak_time = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)


## Old -------------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.02, 0.04)
mu <- c(0.975, 1.95)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03363, 0.06726)
laa <- c(0.0295, 0.059)
x <- c(0.075, 0.15)
d <- c(0.1108, 0.2216)
island_ontogeny <- "beta"
sea_level <- "sine"
max_area <- 3787
current_area <- 1431
peak_time <- 0.27
total_island_age <- 8.473
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(80, 85)
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

oceanic_ontogeny_sea_level_old <- expand.grid(
  time = time,
  M = M,
  lac = lac,
  mu = mu,
  K = K,
  gam = gam,
  laa = laa,
  x = x,
  d = d,
  island_ontogeny = island_ontogeny,
  sea_level = sea_level,
  max_area = max_area,
  current_area = current_area,
  peak_time = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle,
  extcutoff = extcutoff,
  x_s = x_s,
  x_nonend = x_nonend,
  stringsAsFactors = FALSE
)

# Complete ontogeny sea level  parameter set -------------------------------

oceanic_ontogeny_sea_level <- rbind(
  oceanic_ontogeny_sea_level_young,
  oceanic_ontogeny_sea_level_old
)

write.csv2(
  oceanic_ontogeny_sea_level,
  "data/oceanic_ontogeny_sea_level.csv",
  row.names = FALSE
)

# Nonoceanic Young -------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.5, 1)
mu <- c(0.5, 1)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05)
laa <- c(1, 2)
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)

nonoceanic_young <- expand.grid(
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

# Nonoceanic Old -------------------------------------------------------------

time <- 6.15
M <- 1000
lac <- c(0.5, 1)
mu <- c(0.5, 1)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05)
laa <- c(1, 2)
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)

nonoceanic_old <- expand.grid(
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

# Nonoceanic Ancient -----------------------------------------------------------

time <- 50
M <- 1000
lac <- c(0.5, 1)
mu <- c(0.5, 1)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05)
laa <- c(1, 2)
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)

nonoceanic_ancient <- expand.grid(
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

# Complete nonoceanic parameter set -------------------------------

nonoceanic <- rbind(
  nonoceanic_young,
  nonoceanic_old,
  nonoceanic_ancient
)

write.csv2(
  nonoceanic,
  "data/nonoceanic.csv",
  row.names = FALSE
)

# Nonoceanic land bridge DI Young --------------------------------------

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.225, 1.325)))

young_lb_di_temp <- expand.grid(time = time,
                                M = M,
                                lac_1 = lac_1,
                                mu_1 = mu_1,
                                K_1 = K_1,
                                gam_1 = gam_1,
                                laa_1 = laa_1,
                                x_s = x_s,
                                x_nonend = x_nonend,
                                shift_times = shift_times)

young_lb_di_2 <- cbind(young_lb_di_temp,
                       lac_2 = young_lb_di_temp[, 3] / 2,
                       mu_2 = young_lb_di_temp[, 4] / 2,
                       K_2 = K_1,
                       gam_2 = young_lb_di_temp[, 6] * 2,
                       laa_2 = 0)

young_lb_di_10 <- cbind(young_lb_di_temp,
                        lac_2 = young_lb_di_temp[, 3] / 2,
                        mu_2 = young_lb_di_temp[, 4] / 2,
                        K_2 = K_1,
                        gam_2 = young_lb_di_temp[, 6] * 10,
                        laa_2 = 0)

young_lb_di <- rbind(young_lb_di_2, young_lb_di_10)


# Nonoceanic land bridge DD Young --------------------------------------

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.225, 1.325)))

young_lb_dd_temp <- expand.grid(time = time,
                                M = M,
                                lac_1 = lac_1,
                                mu_1 = mu_1,
                                K_1 = K_1,
                                gam_1 = gam_1,
                                laa_1 = laa_1,
                                x_s = x_s,
                                x_nonend = x_nonend,
                                shift_times = shift_times)

young_lb_dd_2 <- cbind(young_lb_dd_temp,
                       lac_2 = young_lb_dd_temp[, 3] / 2,
                       mu_2 = young_lb_dd_temp[, 4] / 2,
                       K_2 = K_1,
                       gam_2 = young_lb_dd_temp[, 6] * 2,
                       laa_2 = 0)

young_lb_dd_10 <- cbind(young_lb_dd_temp,
                        lac_2 = young_lb_dd_temp[, 3] / 2,
                        mu_2 = young_lb_dd_temp[, 4] / 2,
                        K_2 = K_1,
                        gam_2 = young_lb_dd_temp[, 6] * 10,
                        laa_2 = 0)

young_lb_dd <- rbind(young_lb_dd_2, young_lb_dd_10)

# Nonoceanic land bridge DI Old ----------------------------------------

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(3.025, 3.125)))

old_lb_di_temp <- expand.grid(time = time,
                              M = M,
                              lac_1 = lac_1,
                              mu_1 = mu_1,
                              K_1 = K_1,
                              gam_1 = gam_1,
                              laa_1 = laa_1,
                              x_s = x_s,
                              x_nonend = x_nonend,
                              shift_times = shift_times)

old_lb_di_2 <- cbind(old_lb_di_temp,
                     lac_2 = old_lb_di_temp[, 3] / 2,
                     mu_2 = old_lb_di_temp[, 4] / 2,
                     K_2 = K_1,
                     gam_2 = old_lb_di_temp[, 6] * 5,
                     laa_2 = 0)

old_lb_di_10 <- cbind(old_lb_di_temp,
                      lac_2 = old_lb_di_temp[, 3] / 2,
                      mu_2 = old_lb_di_temp[, 4] / 2,
                      K_2 = K_1,
                      gam_2 = old_lb_di_temp[, 6] * 10,
                      laa_2 = 0)

old_lb_di <- rbind(old_lb_di_2, old_lb_di_10)

# Nonoceanic land bridge DD Old ----------------------------------------

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.01, 0.05)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(3.025, 3.125)))

old_lb_dd_temp <- expand.grid(time = time,
                         M = M,
                         lac_1 = lac_1,
                         mu_1 = mu_1,
                         K_1 = K_1,
                         gam_1 = gam_1,
                         laa_1 = laa_1,
                         x_s = x_s,
                         x_nonend = x_nonend,
                         shift_times = shift_times)

old_lb_dd_2 <- cbind(old_lb_dd_temp,
                   lac_2 = old_lb_dd_temp[, 3] / 2,
                   mu_2 = old_lb_dd_temp[, 4] / 2,
                   K_2 = K_1,
                   gam_2 = old_lb_dd_temp[, 6] * 5,
                   laa_2 = 0)

old_lb_dd_10 <- cbind(old_lb_dd_temp,
                   lac_2 = old_lb_dd_temp[, 3] / 2,
                   mu_2 = old_lb_dd_temp[, 4] / 2,
                   K_2 = K_1,
                   gam_2 = old_lb_dd_temp[, 6] * 5,
                   laa_2 = 0)

old_lb_dd <- rbind(old_lb_dd_2, old_lb_dd_10)

# Complete nonoceanic land bridge parameter set -------------------------------

nonoceanic_land_bridge <- rbind(
  young_lb_di,
  young_lb_dd,
  old_lb_di,
  old_lb_dd
)

write.csv2(
  nonoceanic_land_bridge,
  "data/nonoceanic_land_bridge.csv",
  row.names = FALSE
)
