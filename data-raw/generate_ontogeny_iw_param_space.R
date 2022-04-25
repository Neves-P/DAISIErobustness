# Oceanic ontogeny island-wide diversity-dependent
## Young

young_parameter_set <- expand.grid(
  time = 2.55,
  M = 1000,
  lac = c(0.02, 0.04),
  mu = c(0.975, 1.95),
  K = c(0.01, 0.1),
  gam = c(0.03363, 0.06726),
  laa = c(0.0295, 0.059),
  x = c(0.075, 0.15),
  d = c(0.1108, 0.2216),
  island_ontogeny = "beta",
  sea_level = "const",
  max_area = 13500,
  current_area = 3155,
  peak_time = 0.53,
  total_island_age = 2.864,
  sea_level_amplitude = 0,
  sea_level_frequency = 0,
  island_gradient_angle = 0,
  extcutoff = 1000,
  x_s = 0,
  x_nonend = 0,
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

## Old

old_parameter_set <- expand.grid(
  time = 6.15,
  M = 1000,
  lac = c(0.02, 0.04),
  mu = c(0.975, 1.95),
  K = c(0.01, 0.1),
  gam = c(0.03363, 0.06726),
  laa = c(0.0295, 0.059),
  x = c(0.075, 0.15),
  d = c(0.1108, 0.2216),
  island_ontogeny = "beta",
  sea_level = "const",
  max_area = 3787,
  current_area = 1431,
  peak_time = 0.27,
  total_island_age = 8.473,
  sea_level_amplitude = 0,
  sea_level_frequency = 0,
  island_gradient_angle = 0,
  extcutoff = 1000,
  x_s = 0,
  x_nonend = 0,
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

# Complete oceanic ontogeny island-wide diversity-dependent parameter set

oceanic_ontogeny_iw <- rbind(young_parameter_set, old_parameter_set)

save(oceanic_ontogeny_iw, file = "inst/extdata/oceanic_ontogeny_iw.rda")
