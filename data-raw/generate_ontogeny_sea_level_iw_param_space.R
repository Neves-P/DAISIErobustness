# Oceanic ontogeny sea-level island-wide diversity-dependent
## Young

oceanic_ontogeny_sea_level_young <- expand.grid(
  time = 2.55,
  M = 1000,
  lac = c(0.02, 0.04),
  mu = c(0.975, 1.95),
  K = c(0.001, 0.01),
  gam = c(0.03363, 0.06726),
  laa = c(0.0295, 0.059),
  x = c(0.075, 0.15),
  d = c(0.1108, 0.2216),
  island_ontogeny = "beta",
  sea_level = "sine",
  max_area = 13500,
  current_area = 3155,
  peak_time = 0.53,
  total_island_age = 2.864,
  sea_level_amplitude = 60,
  sea_level_frequency = 2.55 * 10,
  island_gradient_angle = c(80, 85),
  extcutoff = 1000,
  x_s = 0,
  x_nonend = 0,
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

## Old

oceanic_ontogeny_sea_level_old <- expand.grid(
  time = 6.15,
  M = 1000,
  lac = c(0.02, 0.04),
  mu = c(0.975, 1.95),
  K = c(0.001, 0.01),
  gam = c(0.03363, 0.06726),
  laa = c(0.0295, 0.059),
  x = c(0.075, 0.15),
  d = c(0.1108, 0.2216),
  island_ontogeny = "beta",
  sea_level = "sine",
  max_area = 3787,
  current_area = 1431,
  peak_time = 0.27,
  total_island_age = 8.473,
  sea_level_amplitude = 60,
  sea_level_frequency = 6.15 * 10,
  island_gradient_angle = c(80, 85),
  extcutoff = 1000,
  x_s = 0,
  x_nonend = 0,
  divdepmodel = "IW",
  stringsAsFactors = FALSE
)

# Complete oceanic ontogeny sea-level island-wide diversity-dependent parameter
# set

oceanic_ontogeny_sea_level_iw <- rbind(
  oceanic_ontogeny_sea_level_young,
  oceanic_ontogeny_sea_level_old
)

usethis::use_data(oceanic_ontogeny_sea_level_iw, overwrite = TRUE)
