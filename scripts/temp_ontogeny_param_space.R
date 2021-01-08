time <- 5
M <- 1000
lac <- 0.04
mu <- 1.95
K <- 0.01
gam <- 0.06726
laa <- 0.059
x <- 0.15
d <- 0.2216
island_ontogeny <- "beta"
sea_level <- "const"
max_area <- 10000
current_area <- c(2500)
peak_time <- 0.2
total_island_age <- 6
sea_level_amplitude <- 0
sea_level_frequency <- 0
island_gradient_angle <- 0
extcutoff <- 1000
x_s <- 0
x_nonend <- 0

area_pars <- DAISIE::create_area_pars(
  max_area = max_area,
  current_area = current_area,
  proportional_peak_t = peak_time,
  total_island_age = total_island_age,
  sea_level_amplitude = sea_level_amplitude,
  sea_level_frequency = sea_level_frequency,
  island_gradient_angle = island_gradient_angle
)


# DAISIE::DAISIE_sim_time_dependent(
#   time = time,
#   M = M,
#   pars = pars,
#   replicates = 20,
#   area_pars = area_pars
# )
