# Oceanic sea-level diversity-independent
## Young

young_oceanic_sea_level <- expand.grid(
  time = 2.55,
  M = 1000,
  lac = c(0.02, 0.04),
  mu = c(0.975, 1.95),
  K = c(Inf),
  gam = c(0.03363, 0.06726),
  laa = c(0.0295, 0.059),
  x = c(0.075, 0.15),
  d = c(0.1108, 0.2216),
  island_ontogeny = "const",
  sea_level = "sine",
  max_area = 13500,
  current_area = 3155,
  peak_time = 0,
  total_island_age = 2.55,
  sea_level_amplitude = 60,
  sea_level_frequency = 2.55 * 10,
  island_gradient_angle = c(80, 85),
  extcutoff = 1000,
  x_s = 0,
  x_nonend = 0,
  divdepmodel = "CS",
  stringsAsFactors = FALSE
)

## Old

old_oceanic_sea_level <- expand.grid(
  time = 6.15,
  M = 1000,
  lac = c(0.02, 0.04),
  mu = c(0.975, 1.95),
  K = c(Inf),
  gam = c(0.03363, 0.06726),
  laa = c(0.0295, 0.059),
  x = c(0.075, 0.15),
  d = c(0.1108, 0.2216),
  island_ontogeny = "const",
  sea_level = "sine",
  max_area = 3787,
  current_area = 1431,
  peak_time = 0,
  total_island_age = 6.15,
  sea_level_amplitude = 60,
  sea_level_frequency = 6.15 * 10,
  island_gradient_angle = c(80, 85),
  extcutoff = 1000,
  x_s = 0,
  x_nonend = 0,
  divdepmodel = "CS",
  stringsAsFactors = FALSE
)

# Complete oceanic sea-level diversity-independent parameter set

oceanic_sea_level_di <- rbind(young_oceanic_sea_level, old_oceanic_sea_level)

save(oceanic_sea_level_di, file = "inst/extdata/oceanic_sea_level_di.rda")
