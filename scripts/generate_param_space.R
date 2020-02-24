
# Generate preliminary paramter space for anaysis #
# Oceanic ontogeny --------------------------------------------------------
## Maui Nui ---------------------------------------------------------------

time <- 2.55
M <- 1000
lac <- c(0.0001, 0.0002, 0.003, 0.004, 0.005)
mu_min <- c(1, 2)
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.005, 0.01, 0.05, Inf)
gam <- c(0.01, 0.02, 0.03, 0.04, 0.05)
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
lac <- c(0.0001, 0.0002, 0.003, 0.004, 0.005)
mu_min <- c(1, 2)
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.005, 0.01, 0.05, Inf)
gam <- c(0.01, 0.02, 0.03, 0.04, 0.05)
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

# Sea level ---------------------------------------------------------------
## Maui Nui ---------------------------------------------------------------
time <- 2.55
M <- 1000
lac <- c(0.0001, 0.0002, 0.003, 0.004, 0.005)
mu_min <- c(1, 2)
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.005, 0.01, 0.05, Inf)
gam <- c(0.01, 0.02, 0.03, 0.04, 0.05)
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
lac <- c(0.0001, 0.0002, 0.003, 0.004, 0.005)
mu_min <- c(1, 2)
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.005, 0.01, 0.05, Inf)
gam <- c(0.01, 0.02, 0.03, 0.04, 0.05)
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
lac <- c(0.0001, 0.0002, 0.003, 0.004, 0.005)
mu_min <- c(1, 2)
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.005, 0.01, 0.05, Inf)
gam <- c(0.01, 0.02, 0.03, 0.04, 0.05)
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
lac <- c(0.0001, 0.0002, 0.003, 0.004, 0.005)
mu_min <- c(1, 2)
mu_p <- c(25, 50, 75)
K <- c(0.001, 0.005, 0.01, 0.05, Inf)
gam <- c(0.01, 0.02, 0.03, 0.04, 0.05)
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
x_s <- c(0.05, 0.1, 0.2)
x_nonend <- c(0.1, 0.5, 0.9)

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
x_s <- c(0.05, 0.1, 0.2)
x_nonend <- c(0.1, 0.5, 0.9)

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

# Nonoceanic land bridge DI Maui Nui

time <- 2.55
M <- 1000
lac_1 <- 1
mu_1 <- 1
K_1 <- Inf
gam_1 <- 0.05
laa_1 <- 1
lac_2 <- 2
mu_2 <- 0.5
K_2 <- Inf
gam_2 <- 1
laa_2 <- 0
x_s <- 0.3
x_nonend <- 0.5
shift_times <- c(2, 4, 6)

nonoceanic_land_bridge_DI_maui <- expand.grid(
  time = time,
  M = M,
  lac_1 = lac_1,
  mu_1 = mu_1,
  K_1 = K_1,
  gam_1 = gam_1,
  laa_1 = laa_1,
  lac_2 = lac_2,
  mu_2 = mu_2,
  K_2 = K_2,
  gam_2 = gam_2,
  laa_2 = laa_2,
  x_s = x_s,
  x_nonend = x_nonend,
  shift_times = shift_times,
  stringsAsFactors = FALSE
)

# Nonoceanic land bridge DD Maui Nui ---------------------------------

time <- 2.55
M <- 1000
lac_1 <- 1
mu_1 <- 1
K_1 <- 10
gam_1 <- 0.05
laa_1 <- 1
lac_2 <- 2
mu_2 <- 0.5
K_2 <- 50
gam_2 <- 1
laa_2 <- 0
x_s <- 0.3
x_nonend <- 0.5
shift_times <- c(2, 4, 6)

nonoceanic_land_bridge_DD_maui <- expand.grid(
  time = time,
  M = M,
  lac_1 = lac_1,
  mu_1 = mu_1,
  K_1 = K_1,
  gam_1 = gam_1,
  laa_1 = laa_1,
  lac_2 = lac_2,
  mu_2 = mu_2,
  K_2 = K_2,
  gam_2 = gam_2,
  laa_2 = laa_2,
  x_s = x_s,
  x_nonend = x_nonend,
  shift_times = shift_times,
  stringsAsFactors = FALSE
)

# Nonoceanic land bridge DI Kauai --------------------------------------------

time <- 6.15
M <- 1000
lac_1 <- 1
mu_1 <- 1
K_1 <- Inf
gam_1 <- 0.05
laa_1 <- 1
lac_2 <- 2
mu_2 <- 0.5
K_2 <- Inf
gam_2 <- 1
laa_2 <- 0
x_s <- 0.3
x_nonend <- 0.5
shift_times <- c(2, 4, 6)

nonoceanic_land_bridge_DI_kauai <- expand.grid(
  time = time,
  M = M,
  lac_1 = lac_1,
  mu_1 = mu_1,
  K_1 = K_1,
  gam_1 = gam_1,
  laa_1 = laa_1,
  lac_2 = lac_2,
  mu_2 = mu_2,
  K_2 = K_2,
  gam_2 = gam_2,
  laa_2 = laa_2,
  x_s = x_s,
  x_nonend = x_nonend,
  shift_times = shift_times,
  stringsAsFactors = FALSE
)

# Nonoceanic land bridge DD Kauai --------------------------------------------

time <- 6.15
M <- 1000
lac_1 <- 1
mu_1 <- 1
K_1 <- 10
gam_1 <- 0.05
laa_1 <- 1
lac_2 <- 2
mu_2 <- 0.5
K_2 <- 50
gam_2 <- 1
laa_2 <- 0
x_s <- 0.3
x_nonend <- 0.5
shift_times <- c(2, 4, 6)

nonoceanic_land_bridge_DD_kauai <- expand.grid(
  time = time,
  M = M,
  lac_1 = lac_1,
  mu_1 = mu_1,
  K_1 = K_1,
  gam_1 = gam_1,
  laa_1 = laa_1,
  lac_2 = lac_2,
  mu_2 = mu_2,
  K_2 = K_2,
  gam_2 = gam_2,
  laa_2 = laa_2,
  x_s = x_s,
  x_nonend = x_nonend,
  shift_times = shift_times,
  stringsAsFactors = FALSE
)

# Complete nonoceanic land bridge paramter set -------------------------------

nonoceanic_land_bridge <- rbind(
  nonoceanic_land_bridge_DI_maui,
  nonoceanic_land_bridge_DD_maui,
  nonoceanic_land_bridge_DI_kauai,
  nonoceanic_land_bridge_DD_kauai
)

write.csv(
  nonoceanic_land_bridge,
  "data/nonoceanic_land_bridge.csv",
  row.names = FALSE
)
