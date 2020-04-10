# Generate preliminary paramter space for anaysis #
# Oceanic ontogeny --------------------------------------------------------
## Maui Nui ---------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
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
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
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
write.csv2(oceanic_ontogeny, "data/oceanic_ontogeny.csv", row.names = FALSE)

# Sea level ---------------------------------------------------------------
## Maui Nui ---------------------------------------------------------------
time <- 2.55
M <- 1000
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 13500
peak_time <- 0
sharpness <- 0
total_island_age <- 2.55
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(75, 85)
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
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 3787
peak_time <- 0
sharpness <- 0
total_island_age <- 6.15
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(75, 85)
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
write.csv2(oceanic_sea_level, "data/oceanic_sea_level.csv", row.names = FALSE)


# Oceanic ontogeny sea level ----------------------------------------------
## Maui Nui ---------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
laa <- c(1, 2)
island_ontogeny <- "beta"
sea_level <- "sine"
max_area <- 13500
peak_time <- 0.53
sharpness <- 1
total_island_age <- 2.864
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(75, 85)
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
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
laa <- c(1, 2)
island_ontogeny <- "beta"
sea_level <- "sine"
max_area <- 3787
peak_time <- 0.27
sharpness <- 1
total_island_age <- 8.473
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(75, 85)
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

write.csv2(
  oceanic_ontogeny_sea_level,
  "data/oceanic_ontogeny_sea_level.csv",
  row.names = FALSE
)

# Nonoceanic Maui Nui -------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.5, 1)
mu <- c(0.5, 1)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05)
laa <- c(1, 2)
x_s <- c(0.05, 0.1)
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
lac <- c(0.5, 1)
mu <- c(0.5, 1)
K <- c(10, 40, Inf)
gam <- c(0.01, 0.05)
laa <- c(1, 2)
x_s <- c(0.05, 0.1)
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

write.csv2(
  nonoceanic,
  "data/nonoceanic.csv",
  row.names = FALSE
)



# Nonoceanic sea level Maui Nui -----------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 13500
peak_time <- 0
sharpness <- 0
total_island_age <- 2.55
sea_level_amplitude <- 60
sea_level_frequency <- 2.55 * 10
island_gradient_angle <- c(75, 85)
extcutoff <- 1000
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)

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
lac <- c(0.0001, 0.0002)
mu_min <- c(0.5, 1)
mu_p <- c(50, 100)
K <- c(0.001, 0.01, Inf)
gam <- c(0.03, 0.06)
laa <- c(1, 2)
island_ontogeny <- "const"
sea_level <- "sine"
max_area <- 3787
peak_time <- 0
sharpness <- 0
total_island_age <- 6.15
sea_level_amplitude <- 60
sea_level_frequency <- 6.15 * 10
island_gradient_angle <- c(75, 85)
extcutoff <- 1000
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)

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

write.csv2(
  nonoceanic_sea_level,
  "data/nonoceanic_sea_level.csv",
  row.names = FALSE
)

# Nonoceanic 1 short land bridge DI Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.225, 1.325)))

maui_nui_1_short_lb_di <- expand.grid(time = time,
                                      M = M,
                                      lac_1 = lac_1,
                                      mu_1 = mu_1,
                                      K_1 = K_1,
                                      gam_1 = gam_1,
                                      laa_1 = laa_1,
                                      x_s = x_s,
                                      x_nonend = x_nonend,
                                      shift_times = shift_times)

maui_nui_1_short_lb_di <- cbind(maui_nui_1_short_lb_di,
                                lac_2 = maui_nui_1_short_lb_di[, 3] / 2,
                                mu_2 = maui_nui_1_short_lb_di[, 4] / 2,
                                K_2 = K_1,
                                gam_2 = maui_nui_1_short_lb_di[, 6] * 2,
                                laa_2 = 0)

# Nonoceanic 1 long land bridge DI Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.175, 1.375)))

maui_nui_1_long_lb_di <- expand.grid(time = time,
                                     M = M,
                                     lac_1 = lac_1,
                                     mu_1 = mu_1,
                                     K_1 = K_1,
                                     gam_1 = gam_1,
                                     laa_1 = laa_1,
                                     x_s = x_s,
                                     x_nonend = x_nonend,
                                     shift_times = shift_times)

maui_nui_1_long_lb_di <- cbind(maui_nui_1_long_lb_di,
                               lac_2 = maui_nui_1_long_lb_di[, 3] / 2,
                               mu_2 = maui_nui_1_long_lb_di[, 4] / 2,
                               K_2 = K_1,
                               gam_2 = maui_nui_1_long_lb_di[, 6] * 2,
                               laa_2 = 0)

# Nonoceanic 3 short land bridge DI Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(0.5875, 0.6875, 1.225, 1.325, 1.8625, 1.9625)))

maui_nui_3_short_lb_di <- expand.grid(time = time,
                                      M = M,
                                      lac_1 = lac_1,
                                      mu_1 = mu_1,
                                      K_1 = K_1,
                                      gam_1 = gam_1,
                                      laa_1 = laa_1,
                                      x_s = x_s,
                                      x_nonend = x_nonend,
                                      shift_times = shift_times)

maui_nui_3_short_lb_di <- cbind(maui_nui_3_short_lb_di,
                                lac_2 = maui_nui_3_short_lb_di[, 3] / 2,
                                mu_2 = maui_nui_3_short_lb_di[, 4] / 2,
                                K_2 = K_1,
                                gam_2 = maui_nui_3_short_lb_di[, 6] * 2,
                                laa_2 = 0)

# Nonoceanic 3 long land bridge DI Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(0.5375, 0.7375, 1.175, 1.375, 1.8125, 2.0125)))

maui_nui_3_long_lb_di <- expand.grid(time = time,
                                     M = M,
                                     lac_1 = lac_1,
                                     mu_1 = mu_1,
                                     K_1 = K_1,
                                     gam_1 = gam_1,
                                     laa_1 = laa_1,
                                     x_s = x_s,
                                     x_nonend = x_nonend,
                                     shift_times = shift_times)

maui_nui_3_long_lb_di <- cbind(maui_nui_3_long_lb_di,
                               lac_2 = maui_nui_3_long_lb_di[, 3] / 2,
                               mu_2 = maui_nui_3_long_lb_di[, 4] / 2,
                               K_2 = K_1,
                               gam_2 = maui_nui_3_long_lb_di[, 6] * 2,
                               laa_2 = 0)

# Nonoceanic 1 short land bridge DD Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.225, 1.325)))

maui_nui_1_short_lb_dd <- expand.grid(time = time,
                                      M = M,
                                      lac_1 = lac_1,
                                      mu_1 = mu_1,
                                      K_1 = K_1,
                                      gam_1 = gam_1,
                                      laa_1 = laa_1,
                                      x_s = x_s,
                                      x_nonend = x_nonend,
                                      shift_times = shift_times)

maui_nui_1_short_lb_dd <- cbind(maui_nui_1_short_lb_dd,
                                lac_2 = maui_nui_1_short_lb_dd[, 3] / 2,
                                mu_2 = maui_nui_1_short_lb_dd[, 4] / 2,
                                K_2 = K_1,
                                gam_2 = maui_nui_1_short_lb_dd[, 6] * 2,
                                laa_2 = 0)


# Nonoceanic 1 long land bridge DD Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.175, 1.375)))

maui_nui_1_long_lb_dd <- expand.grid(time = time,
                                     M = M,
                                     lac_1 = lac_1,
                                     mu_1 = mu_1,
                                     K_1 = K_1,
                                     gam_1 = gam_1,
                                     laa_1 = laa_1,
                                     x_s = x_s,
                                     x_nonend = x_nonend,
                                     shift_times = shift_times)

maui_nui_1_long_lb_dd <- cbind(maui_nui_1_long_lb_dd,
                               lac_2 = maui_nui_1_long_lb_dd[, 3] / 2,
                               mu_2 = maui_nui_1_long_lb_dd[, 4] / 2,
                               K_2 = K_1,
                               gam_2 = maui_nui_1_long_lb_dd[, 6] * 2,
                               laa_2 = 0)

# Nonoceanic 3 short land bridge DD Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(0.5875, 0.6875, 1.225, 1.325, 1.8625, 1.9625)))

maui_nui_3_short_lb_dd <- expand.grid(time = time,
                                      M = M,
                                      lac_1 = lac_1,
                                      mu_1 = mu_1,
                                      K_1 = K_1,
                                      gam_1 = gam_1,
                                      laa_1 = laa_1,
                                      x_s = x_s,
                                      x_nonend = x_nonend,
                                      shift_times = shift_times)

maui_nui_3_short_lb_dd <- cbind(maui_nui_3_short_lb_dd,
                                lac_2 = maui_nui_3_short_lb_dd[, 3] / 2,
                                mu_2 = maui_nui_3_short_lb_dd[, 4] / 2,
                                K_2 = K_1,
                                gam_2 = maui_nui_3_short_lb_dd[, 6] * 2,
                                laa_2 = 0)

# Nonoceanic 3 long land bridge DD Maui Nui

time <- 2.55
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(0.5375, 0.7375, 1.175, 1.375, 1.8125, 2.0125)))

maui_nui_3_long_lb_dd <- expand.grid(time = time,
                                     M = M,
                                     lac_1 = lac_1,
                                     mu_1 = mu_1,
                                     K_1 = K_1,
                                     gam_1 = gam_1,
                                     laa_1 = laa_1,
                                     x_s = x_s,
                                     x_nonend = x_nonend,
                                     shift_times = shift_times)

maui_nui_3_long_lb_dd <- cbind(maui_nui_3_long_lb_dd,
                               lac_2 = maui_nui_3_long_lb_dd[, 3] / 2,
                               mu_2 = maui_nui_3_long_lb_dd[, 4] / 2,
                               K_2 = K_1,
                               gam_2 = maui_nui_3_long_lb_dd[, 6] * 2,
                               laa_2 = 0)

# Nonoceanic 1 short land bridge DI Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(3.025, 3.125)))

kauai_1_short_lb_di <- expand.grid(time = time,
                                   M = M,
                                   lac_1 = lac_1,
                                   mu_1 = mu_1,
                                   K_1 = K_1,
                                   gam_1 = gam_1,
                                   laa_1 = laa_1,
                                   x_s = x_s,
                                   x_nonend = x_nonend,
                                   shift_times = shift_times)

kauai_1_short_lb_di <- cbind(kauai_1_short_lb_di,
                             lac_2 = kauai_1_short_lb_di[, 3] / 2,
                             mu_2 = kauai_1_short_lb_di[, 4] / 2,
                             K_2 = K_1,
                             gam_2 = kauai_1_short_lb_di[, 6] * 2,
                             laa_2 = 0)

# Nonoceanic 1 long land bridge DI Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(2.975, 3.175)))

kauai_1_long_lb_di <- expand.grid(time = time,
                                  M = M,
                                  lac_1 = lac_1,
                                  mu_1 = mu_1,
                                  K_1 = K_1,
                                  gam_1 = gam_1,
                                  laa_1 = laa_1,
                                  x_s = x_s,
                                  x_nonend = x_nonend,
                                  shift_times = shift_times)

kauai_1_long_lb_di <- cbind(kauai_1_long_lb_di,
                            lac_2 = kauai_1_long_lb_di[, 3] / 2,
                            mu_2 = kauai_1_long_lb_di[, 4] / 2,
                            K_2 = K_1,
                            gam_2 = kauai_1_long_lb_di[, 6] * 2,
                            laa_2 = 0)

# Nonoceanic 3 short land bridge DI Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.4875, 1.5875, 3.025, 3.125, 4.5625, 4.6625)))

kauai_3_short_lb_di <- expand.grid(time = time,
                                   M = M,
                                   lac_1 = lac_1,
                                   mu_1 = mu_1,
                                   K_1 = K_1,
                                   gam_1 = gam_1,
                                   laa_1 = laa_1,
                                   x_s = x_s,
                                   x_nonend = x_nonend,
                                   shift_times = shift_times)

kauai_3_short_lb_di <- cbind(kauai_3_short_lb_di,
                             lac_2 = kauai_3_short_lb_di[, 3] / 2,
                             mu_2 = kauai_3_short_lb_di[, 4] / 2,
                             K_2 = K_1,
                             gam_2 = kauai_3_short_lb_di[, 6] * 2,
                             laa_2 = 0)

# Nonoceanic 3 long land bridge DI Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- Inf
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.4375, 1.6375, 2.975, 3.175, 4.5125, 4.7125)))

kauai_3_long_lb_di <- expand.grid(time = time,
                                  M = M,
                                  lac_1 = lac_1,
                                  mu_1 = mu_1,
                                  K_1 = K_1,
                                  gam_1 = gam_1,
                                  laa_1 = laa_1,
                                  x_s = x_s,
                                  x_nonend = x_nonend,
                                  shift_times = shift_times)

kauai_3_long_lb_di <- cbind(kauai_3_long_lb_di,
                            lac_2 = kauai_3_long_lb_di[, 3] / 2,
                            mu_2 = kauai_3_long_lb_di[, 4] / 2,
                            K_2 = K_1,
                            gam_2 = kauai_3_long_lb_di[, 6] * 2,
                            laa_2 = 0)

# Nonoceanic 1 short land bridge DD Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(3.025, 3.125)))

kauai_1_short_lb_dd <- expand.grid(time = time,
                                   M = M,
                                   lac_1 = lac_1,
                                   mu_1 = mu_1,
                                   K_1 = K_1,
                                   gam_1 = gam_1,
                                   laa_1 = laa_1,
                                   x_s = x_s,
                                   x_nonend = x_nonend,
                                   shift_times = shift_times)

kauai_1_short_lb_dd <- cbind(kauai_1_short_lb_dd,
                             lac_2 = kauai_1_short_lb_dd[, 3] / 2,
                             mu_2 = kauai_1_short_lb_dd[, 4] / 2,
                             K_2 = K_1,
                             gam_2 = kauai_1_short_lb_dd[, 6] * 2,
                             laa_2 = 0)

# Nonoceanic 1 long land bridge DD Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(2.975, 3.175)))

kauai_1_long_lb_dd <- expand.grid(time = time,
                                  M = M,
                                  lac_1 = lac_1,
                                  mu_1 = mu_1,
                                  K_1 = K_1,
                                  gam_1 = gam_1,
                                  laa_1 = laa_1,
                                  x_s = x_s,
                                  x_nonend = x_nonend,
                                  shift_times = shift_times)

kauai_1_long_lb_dd <- cbind(kauai_1_long_lb_dd,
                            lac_2 = kauai_1_long_lb_dd[, 3] / 2,
                            mu_2 = kauai_1_long_lb_dd[, 4] / 2,
                            K_2 = K_1,
                            gam_2 = kauai_1_long_lb_dd[, 6] * 2,
                            laa_2 = 0)


# Nonoceanic 3 short land bridge DD Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.4875, 1.5875, 3.025, 3.125, 4.5625, 4.6625)))

kauai_3_short_lb_dd <- expand.grid(time = time,
                                   M = M,
                                   lac_1 = lac_1,
                                   mu_1 = mu_1,
                                   K_1 = K_1,
                                   gam_1 = gam_1,
                                   laa_1 = laa_1,
                                   x_s = x_s,
                                   x_nonend = x_nonend,
                                   shift_times = shift_times)

kauai_3_short_lb_dd <- cbind(kauai_3_short_lb_dd,
                             lac_2 = kauai_3_short_lb_dd[, 3] / 2,
                             mu_2 = kauai_3_short_lb_dd[, 4] / 2,
                             K_2 = K_1,
                             gam_2 = kauai_3_short_lb_dd[, 6] * 2,
                             laa_2 = 0)

# Nonoceanic 3 long land bridge DD Kauai

time <- 6.15
M <- 1000
lac_1 <- c(0.5, 1)
mu_1 <- c(0.5, 1)
K_1 <- 10
gam_1 <- c(0.01, 0.05)
laa_1 <- 1
x_s <- c(0.05, 0.1)
x_nonend <- c(0.1, 0.9)
shift_times <- I(list(c(1.4375, 1.6375, 2.975, 3.175, 4.5125, 4.7125)))

kauai_3_long_lb_dd <- expand.grid(time = time,
                                  M = M,
                                  lac_1 = lac_1,
                                  mu_1 = mu_1,
                                  K_1 = K_1,
                                  gam_1 = gam_1,
                                  laa_1 = laa_1,
                                  x_s = x_s,
                                  x_nonend = x_nonend,
                                  shift_times = shift_times)

kauai_3_long_lb_dd <- cbind(kauai_3_long_lb_dd,
                            lac_2 = kauai_3_long_lb_dd[, 3] / 2,
                            mu_2 = kauai_3_long_lb_dd[, 4] / 2,
                            K_2 = K_1,
                            gam_2 = kauai_3_long_lb_dd[, 6] * 2,
                            laa_2 = 0)

# Complete nonoceanic land bridge paramter set -------------------------------

nonoceanic_land_bridge <- rbind(
  maui_nui_1_short_lb_di,
  maui_nui_1_long_lb_di,
  maui_nui_3_short_lb_di,
  maui_nui_3_long_lb_di,
  maui_nui_1_short_lb_dd,
  maui_nui_1_long_lb_dd,
  maui_nui_3_short_lb_dd,
  maui_nui_3_long_lb_dd,
  kauai_1_short_lb_di,
  kauai_1_long_lb_di,
  kauai_3_short_lb_di,
  kauai_3_long_lb_di,
  kauai_1_short_lb_dd,
  kauai_1_long_lb_dd,
  kauai_3_short_lb_dd,
  kauai_3_long_lb_dd
)

write.csv2(
  nonoceanic_land_bridge,
  "data/nonoceanic_land_bridge.csv",
  row.names = FALSE
)

